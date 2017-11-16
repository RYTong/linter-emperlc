%% Copyright (c) 20012-2013 Beijing RYTong Information Technologies, Ltd.
%% All rights reserved.
%%
%% No part of this source code may be copied, used, or modified
%% without the express written consent of RYTong.
%%
%% @doc This file contains default configurations and other common
%% macros across the entire ewp app.

%% Various trace macros

-record(trace_sock, {mnode = [], 
                     node  = [],
                     callback = []}).

-record(log_level, {name  = [], 
                    level = [], 
                    dest  = [],
                    type  = [],
                    io    = [],
                    pat   = [], 
                    ws    = [], 
                    socket = #trace_sock{}}).



%% 用于显示日志信息，当前显示以下四项
-define(LOG_RECORD_OPTION, [name, level, dest, type]).

%% define the log name
-define(SERVICE_CHANNEL, 'channel').
-define(SERVICE_APP, 'app').

%% if you want to show the log list in the admin_log choic list,
%% you should add you defined log into the service list.
%% service_list 用于在管理平台的日志管理模块展示日志列表
-define(SERVICE_LIST, [?SERVICE_CHANNEL, ?SERVICE_APP]).

%% the MACRO of ewp websocket 
-define(EWP_WEBSOCKET, 'ewp_websocket').
-define(EWP_LOGGER, 'ewp_logger').
-define(ws_init(Type, Sock, Node), ?EWP_WEBSOCKET:ws_init(Type, Sock, Node)).
-define(ws_close(Sock), ?EWP_WEBSOCKET:ws_close(Sock)).

-define(WS_ETS, 'websocket').
-define(WSMSG_TRACE, 'trace_log').
-define(WSMSG_ERROR, 'error_log').

-define(WSERROR_LOGGER, 'error_logger').
-define(WSEVENT_HANDLER, 'ewp_log_h').

%% trace log priorities
-define(TRACE_LEVEL_MIN,   'min').
-define(TRACE_LEVEL_ERROR,   20).
-define(TRACE_LEVEL_WARNING, 30).
-define(TRACE_LEVEL_INFO,    40).
-define(TRACE_LEVEL_DEBUG,   60).
-define(TRACE_LEVEL_TRACE,   80).
-define(TRACE_LEVEL_MAX,   'max').

%% define the log event
-define(report(Severity, Label, Service, Content),
        ewp_tracer:report_event(Severity, Label, Service,
                                [{module, ?MODULE}, {line, ?LINE} | Content])).


-define(report_error(Label, Service, Content),  ewp_levellog:report_error(Service, Label,  [{module, ?MODULE}, {line, ?LINE}| Content])).
-define(report_info (Label, Service, Content),  ewp_levellog:report_info(Service, Label,  [{module, ?MODULE}, {line, ?LINE}| Content])).
-define(report_debug(Label, Service, Content),  ewp_levellog:report_debug(Service, Label,  [{module, ?MODULE},{line, ?LINE}| Content])).
-define(report_trace(Label, Service, Content),  ewp_levellog:report_trace(Service, Label,  [{module, ?MODULE}, {line, ?LINE}| Content])).


%% ---------------- Basic Trace Log------------------------------------
-ifdef(ewp_enable_syslog).
-define(SYSLOG_FLAG, 'true'). 
-else.
-define(SYSLOG_FLAG, 'false'). 
-endif.



%% ---------------- Switch of Trace Log------------------------------------
-define (enable_trace(Level, Service), ewp_levellog:enable_trace(Level, Service)).
-define (enable_trace(Level, Service, Type), ewp_levellog:enable_trace(Level, Service, Type)).
-define (enable_trace(Level, Service, Type, Callback), ewp_levellog:enable_trace(Level, Service, Type, Callback)).
-define (enable_trace(Level, Service, Type, Callback, Mnode), ewp_levellog:enable_trace(Level, Service, Type, Callback, Mnode)).
-define (disable_trace(), ewp_levellog:disable_trace()).
-define (disable_trace(Service), ewp_levellog:disable_trace(Service)).




%% ---------------- channel Trace Log------------------------------------
-define(channel_error(Label, Content), ?report_error(Label, ?SERVICE_CHANNEL, Content)).
-define(channel_info (Label, Content), ?report_info(Label, ?SERVICE_CHANNEL, Content)).
-define(channel_debug(Label, Content), ?report_debug(Label, ?SERVICE_CHANNEL, Content)).
-define(channel_trace(Label, Content), ?report_trace(Label, ?SERVICE_CHANNEL, Content)).

%% ---------------- app Trace Log------------------------------------
-define(app_error (Label, Content), ?report_error(Label, ?SERVICE_APP, Content)).
-define(app_info  (Label, Content), ?report_info(Label, ?SERVICE_APP, Content)).
-define(app_debug (Label, Content), ?report_debug(Label, ?SERVICE_APP, Content)).
-define(app_trace (Label, Content), ?report_trace(Label, ?SERVICE_APP, Content)).

%% ---------------- Module Trace Log------------------------------------
-define(module_error(Label, Content), ?report_error(Label, ?MODULE, Content)).
-define(module_info (Label, Content), ?report_info(Label, ?MODULE, Content)).
-define(module_debug(Label, Content), ?report_debug(Label, ?MODULE, Content)).
-define(module_trace(Label, Content), ?report_trace(Label, ?MODULE, Content)).

%% ---------------- Trace Log example------------------------------------
-define(modti(Label, Content), ?report_error(Label, ?MODULE, Content)).
-define(modtv(Label, Content), ?report_info(Label, ?MODULE, Content)).
-define(modtd(Label, Content), ?report_debug(Label, ?MODULE, Content)).
-define(modtt(Label, Content), ?report_trace(Label, ?MODULE, Content)).
-define(test_tracer(Label, Content), ?report_debug(Label,    test,  Content)).
%% ---------------- Trace Log example------------------------------------


%% ---------------- Other Trace Log ------------------------------------
-define(report_user_trace(SessionId, TranCode, Content),
        ?report_trace(SessionId, user_action, [{trancode, TranCode} |Content])).


%% ---------------- addchannel Trace Log------------------------------------
-define(addchannel_error(Label, Content), ?report_error(Label, ?SERVICE_CHANNEL, Content)).
-define(addchannel_info (Label, Content), ?report_info(Label, ?SERVICE_CHANNEL, Content)).
-define(addchannel_debug(Label, Content), ?report_debug(Label, ?SERVICE_CHANNEL, Content)).
-define(addchannel_trace(Label, Content), ?report_trace(Label, ?SERVICE_CHANNEL, Content)).
