'use babel';

import { CompositeDisposable } from 'atom';
import path from 'path';
import fs from 'fs-plus';
import tmp from 'tmp';

const default_include = "include"

export default {

  subscriptions: null,

  activate(state) {
      require('atom-package-deps').install('linter-emperlc');
      this.subscriptions = new CompositeDisposable();

      this.subscriptions.add(
        atom.config.observe('linter-emperlc.executablePath', (value) => {
          this.executablePath = value;
        }),
      );

      this.subscriptions.add(
        atom.config.observe('linter-emperlc.pa', (value) => {
          this.erlcPa = value;
        }),
      );

      this.subscriptions.add(
        atom.config.observe('linter-emperlc.includeDirs', (value) => {
          this.erlcIncludeDirs = value;
        }),
      );

      this.get_project_include();

  },

  deactivate() {
    this.subscriptions.dispose();
  },

  get_project_include(){
      this.defaultIncludeDir = [path.join(__dirname, "..", default_include)];
      aProjcetPaths = atom.project.getPaths();
      aProjcetPaths.forEach((sProjectPath) => {
          this.do_get_project_include(sProjectPath, 2);
      });
      console.log(this.defaultIncludeDir);
  },

  do_get_project_include(sProjectPath, iIndex){
      if (iIndex != 0) {
          sProjectInclude = path.join(sProjectPath, default_include);
          if (fs.existsSync(sProjectInclude)) {
              this.defaultIncludeDir.push(sProjectInclude);
          } else {
              aNextDirs = fs.readdirSync(sProjectPath);
              aNextDirs.forEach((tmpDir) => {
                  sTmpDirs = path.join(sProjectPath, tmpDir)
                  if (fs.isDirectorySync(sTmpDirs)) {
                    this.do_get_project_include(sTmpDirs, iIndex-1)
                  }
              })
          }
      }
  },

  provideLinter() {
    const helpers = require('atom-linter');
    return {
      name: 'emperlc',
      grammarScopes: ['source.erlang'],
      scope: 'file',
      lintsOnChange: true,
      lint: (textEditor) => {
        const filePath = textEditor.getPath();
        if (!filePath.match(/\.erl$/)) {
          return [];
        }
        const fileDir = path.dirname(filePath);

        const tmpPathObj = tmp.dirSync({ unsafeCleanup: true });
        const args = ['-Wall', '-v', '-o', tmpPathObj.name];
        let projectPath;


        this.erlcPa.forEach((paPath) => {
          args.push('-pa');
          args.push(paPath);
        });

        const dirName = path.basename(fileDir);
        if (dirName === 'src' || dirName === 'test') {
          projectPath = path.dirname(fileDir);
        }

        // 添加默认的 include
        // console.log(" default include:", path.join(__dirname, default_include));
        // args.push('-I');
        // args.push(path.join(__dirname, default_include));
        // console.log("--------------------------------------");
        // console.log(this.defaultIncludeDir);
        this.defaultIncludeDir.forEach((includePath) => {
            args.push('-I');
            args.push(includePath);
        });
        // args.push('-I');
        // args.push(path.join(__dirname, default_include));
        this.erlcIncludeDirs.forEach((includePath) => {
          args.push('-I');
          if (projectPath && !includePath.match(/^\//)) {
            args.push(path.join(projectPath, includePath));
          } else {
            args.push(includePath);
          }
        });

        args.push(filePath);

        return helpers.exec(this.executablePath, args, { ignoreExitCode: true }).then((result) => {
          const sourceLines = textEditor.getBuffer().getLines();
          const patterns = [
            {
              regex: /(.+):(\d+):\s(.+)/,
              cb: m => ({ lineNo: m[2], text: m[3] }),
            },
            {
              regex: /(.+): (.+)/,
              cb: m => ({ lineNo: 1, text: m[2] }),
            },
          ];
          const lines = result.split('\n');
          const matches = lines.map((line) => {
            const lineMatches = patterns.map((x) => {
              const match = line.match(x.regex);
              return match ? x.cb(match) : null;
            });
            if (lineMatches[0] === null && lineMatches[1] !== null) {
              return lineMatches[1];
            }
            return lineMatches[0];
          });
          const toReturn = matches.reduce((results, match) => {
            if (!match) {
              return results;
            }
            const lineNo = Number.parseInt(match.lineNo, 10) - 1;
            let message = match.text;
            let type;
            if (message.match(/Warning:/)) {
              message = message.replace(/Warning: (.+)/, '$1');
              type = 'warn';
            } else {
              type = 'error';
            }

            const beforeMatch = message.match(/before: '?(.+?)'?/);
            const unUsedMatch = message.match(/variable '(.+)' is unused/);
            const sourceLine = sourceLines[lineNo];
            let column1 = 0;
            let column2 = sourceLine.length;
            if (beforeMatch) {
              column2 = sourceLine.lastIndexOf(beforeMatch[1]);
            } else if (unUsedMatch) {
              column1 = sourceLine.indexOf(unUsedMatch[1]);
              column2 = column1 + unUsedMatch[1].length;
            }

            results.push({
              severity: type,
              location: {
                file: filePath,
                position: [[lineNo, column1], [lineNo, column2]],
              },
              excerpt: message,
              description: ""
            });
            return results;
          }, []);

          tmpPathObj.removeCallback();
          return toReturn;
        });
      },
    };
  }

};
