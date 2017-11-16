%% Copyright (c) 2009-2010 Beijing RYTong Information Technologies, Ltd.
%% All rights reserved.
%%
%% No part of this source code may be copied, used, or modified
%% without the express written consent of RYTong.
%%
%% @doc This file contains default configurations and other common
%% macros across the entire ewp app.

-ifndef(EWP_HEADER).
-define(EWP_HEADER, true).
-include_lib("eunit/include/eunit.hrl").

-include("model.hrl").
-include("statistic.hrl").
-include("getter.hrl").
-include("logger.hrl").

%% include trace log
-include_lib("ewp_tracer.hrl").

%% macro for admin channel
-define(CHANNEL_ADAPTER, 'channel_adapter').
-define(NEW_CALLBACK, 'new_callback').
-define(CHANNEL_CALLBACK, 'channel_callback').
-define(CHANNEL_PROXY, 'channel_proxy').
-define(CALLBACK_LIST, ['before_request', 'after_request']).

-define(APP_UPGRADING(Content), {callback, ?EWP_UPGRADE_ERROR, Content}).

%% timeout flag for session verification.
-define(SESSION_TIMEOUT, {session_missing, timeout}).

%% Default session expiration time for login users is 10 minutes.
-define(LOGIN_SESSION_EXPIRATION, 600).

%% Session expiration time for visitors.
-define(SESSION_EXPIRATION, 7200).

-define(ADMIN_SESSION_EXPIRATION, 7200).

-define(CUSTOM_LOG, custom_log).

-define(MNESIA_SCHEMA_TABLE, ewp_mnesia_schema).
-define(EWP_STATUS, ewp_status).
-define(EWP_VERSION, "5.0").

%% Channel Step Flag
-define(CHANNEL_STEP, "tranCode").

-define(Param_Tag, res).

%% WAP https tag, convenient for test.
-define(WAP_HTTPS_TAG, "http://").

%% XML headers
-define(XML_HEADER, ["<?xml version='1.0' encoding='utf-8'?>\n"]).
-define(GeorssNS, "http://www.georss.org/georss").
-define(GmlNS, "http://www.opengis.net/gml").

%% Internationalization.
-define(txt(Str), ewp_gettext:txt(Str)).
-define(txt(Str, Lan), ewp_gettext:txt(Str, Lan)).

%% CPUUSAGE, for profiling applications.
-ifdef(ewp_enable_cpuusage).
-define(cpu_begin(Tag), cpu_usage:start(Tag)).
-define(cpu_end(Tag), cpu_usage:stop(Tag)).
-else.
-define(cpu_begin(Tag), undefined).
-define(cpu_end(Tag), undefined).
-endif.

-define(EMP_SIGNATURE, "X-Emp-Signature").

-define(EMP_ENCRYPTED, "X-Emp-Encrypted").


%% Marcos for statistic
-ifdef(ewp_enable_statistic).
-define(stat(Args), ewp_stat:log(Args)).
-else.
-define(stat(Args), undefined).
-endif.

%% Mnesia Nodes Marco

-define(mnesia_nodes(), [node()]).

%% ETS tables for push
-define(IOSPROVIDERS, ios_providers).
-define(TOKEN, ewp_push_tokens).
-define(PUSHLOG, ewp_push_logs).
-define(APPCONFS, app_push_confs).

%% Channel props type.
-define(TYPE_STRING, 1).
-define(TYPE_ATOM, 2).
-define(TYPE_INTEGER, 3).
-define(TYPE_FLOAT, 4).
-define(TYPE_TUPLE, 5).
-define(TYPE_LIST, 6).

%% Collection type.
-define(COLLECTION_TYPE, 0).
-define(CHANNEL_TYPE, 1).

%% Virtual root collection node.
-define(VIRTUAL_COLLECTION, "virtual_collection").

%% Channel templates dir
-define(CHANNEL_CS_DIR, "public/cs/channels").

%% Channel adapter templates dirs.
-define(CHANNEL_TEMPLATE_DIR_LIST, ["xhtml", "css", "lua", "images", "json"]).
-define(CHANNEL_MODULE_DESTINATION, "src/channels/").
-define(CHANNEL_TEMPLATE_DESTINATION, "public/www/resource_dev/").
-define(CHANNEL_TEMPLATE, "templates/channel_adapter_template.tmp").
%% dirs for adapter channel
%% Dir common should always be set up on the last location.
-define(COMMON_ROOT_DIR, ["wp", "iphone", "android", "qt", "common"]).
-define(COMMON_BASE_DIR, ["default"]).
-define(COMMON_CHANNEL_DIR, ["images", "css", "lua", "xhtml","channels"]).
-define(COMMON_CHANNELS, "channels").


%% Apps Install dir
-define(APP_INSTALL_DEFAULT_DIR, "/var/www/apps").

%% Upload dir.
-define(RESOURCE, "resources").
-define(RESOURCE_DIR, "public/" ++ ?RESOURCE).
-define(H5RESOURCE, "h5_resources").
-define(H5RESOURCE_DIR, "public/" ++ ?H5RESOURCE).
-define(SEPARATOR, "-").
-define(PROPERTY_EXT, ".property").
-define(DOWNLOAD_FORCE, 0).
-define(DOWNLOAD_OPTIONAL, 1).
-define(UPDATE_NOTHING, -1).
-define(PLUGIN_RESOURCE_PATH, plugin_resource_path).
-define(REDIRECT_MOD_DEFAULT, ewp_offline_redirect).
-define(RES_LOCAL_PATH, local_path).
-define(MULTI_H5_PATH, multi_h5_path).


%% APP record user in app_manger and startup.

-record(appl, {name, dir, start_mod, env, descr, vsn, controllers,
    plugins, menu, cs_files, databases, migrate_version, callbacks}).

-define(EWP_ADDON_DIR, "addon").

%%----------------------------------------------------------------------
%% This should be the last line of this file.
%%----------------------------------------------------------------------
-import(evo, [o/2, ot/2, o/3]).

-endif.
