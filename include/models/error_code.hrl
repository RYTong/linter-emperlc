%% Copyright (c) 2009-2010 Beijing RYTong Information Technologies, Ltd.
%% All rights reserved.
%%
%% No part of this source code may be copied, used, or modified
%% without the express written consent of RYTong.
%%



%% @type err() = #err{code = atom() | string(),
%%                    type = undefined | atom() | string(),
%%                    cust_msg = string(),
%%                    dev_msg = undefined | string(),
%%                    handler = undefined | {page, string()} | {callback, {atom(), atom()}}}
%% @doc Internal error data representation.
-record(err, {code,             %% error code that identify one error entity
              type,             %% error type 
              cust_msg,         %% error msg delivered for customers
              dev_msg,          %% error msg delivered for developers
              handler}).        %% setup error handler

%% @type err_conf() = #err_conf{app = atom(),
%%                              tab = string(),
%%                              search_fun = function(),
%%                              default_handlers = default_handlers()}
%% @doc App error conf stored in ets.
-record(err_conf, {app, 
                   tab,
                   search_fun,
                   default_handlers}).

%% @type default_handlers() = #default_handlers{page = undefined | string(),
%%                                              callback = undefined | {atom(), atom()}}
-record(default_handlers, {page,
                           callback,
                           exit}).

%% @type err_app() = #err_app{name = atom(),
%%                            o = string()}
-record(err_app, {name, o}).


-define(EWP_UNKNOWN_ERROR, "EP0000").
-define(EWP_TIMEOUT_ERROR, 'timeout').
-define(EWP_UPGRADE_ERROR, 'app_upgrade').
-define(EWP_SESSION_ERROR, session_error).
