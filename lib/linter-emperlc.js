'use babel';

import LinterEmperlcView from './linter-emperlc-view';
import { CompositeDisposable } from 'atom';

export default {

  linterEmperlcView: null,
  modalPanel: null,
  subscriptions: null,

  activate(state) {
    this.linterEmperlcView = new LinterEmperlcView(state.linterEmperlcViewState);
    this.modalPanel = atom.workspace.addModalPanel({
      item: this.linterEmperlcView.getElement(),
      visible: false
    });

    // Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    this.subscriptions = new CompositeDisposable();

    // Register command that toggles this view
    this.subscriptions.add(atom.commands.add('atom-workspace', {
      'linter-emperlc:toggle': () => this.toggle()
    }));
  },

  deactivate() {
    this.modalPanel.destroy();
    this.subscriptions.dispose();
    this.linterEmperlcView.destroy();
  },

  serialize() {
    return {
      linterEmperlcViewState: this.linterEmperlcView.serialize()
    };
  },

  toggle() {
    console.log('LinterEmperlc was toggled!');
    return (
      this.modalPanel.isVisible() ?
      this.modalPanel.hide() :
      this.modalPanel.show()
    );
  }

};
