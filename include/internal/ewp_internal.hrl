%% Copyright (c) 2009-2010 Beijing RYTong Information Technologies, Ltd.
%% All rights reserved.
%%
%% No part of this source code may be copied, used, or modified
%% without the express written consent of RYTong.
%%
%% @doc This file contains internal definitions for EWP.

%% app path in development mode.
-define(APP_PATH, "./apps").

%% app tmp file path.
-define(APP_TMP_PATH, "./apps/tmp").

-define(PRODUCTION_APP_PATH, "/var/www/apps").

%% app backup path.
-define(APP_BACKUP_PATH, "/tmp/appbak").

%% global tmp dir.
-define(TMP_PATH, "/tmp").



%% For XML parser driver.
-record(xml_handle,
        {port,
         parser,
         document}).

-define(RETURN_XMERL,   0).
-define(RETURN_TERM,    1).
-define(RETURN_JSON,    2).

-define(LEGACY_STYLE,   0).
-define(DISTINCT_STYLE, 1).

%% views' path (cs src files)
-define(VIEWS_PATH, "views").
