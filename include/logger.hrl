%% Copyright (c) 2009-2010 Beijing RYTong Information Technologies, Ltd.
%% All rights reserved.
%%
%% No part of this source code may be copied, used, or modified
%% without the express written consent of RYTong.
%%

%% Debugging macros
-ifdef(ewp_debug_flag).
-define(write_file(File, Content), file:write_file(File, Content)).
-else.
-define(write_file(File, Content), undefined).
-endif.

-ifdef(ewp_enable_syslog).

-ifdef(ewp_debug_flag).
-define(ewp_log(Format, Args), catch syslog_drv:debug("~p:~p " ++ Format, [?MODULE,?LINE]++Args)).
-define(ewp_debug(Format, Args), catch syslog_drv:debug("~p:~p " ++ Format, [?MODULE,?LINE]++Args)).
-else.
-define(ewp_log(Format, Args), undefined).
-define(ewp_debug(Format, Args), undefined).
-endif.

-define(ewp_info(Format, Args), catch syslog_drv:info("~p:~p " ++ Format, [?MODULE,?LINE]++Args)).
-define(ewp_msg(Format, Args), catch syslog_drv:info("~p:~p " ++ Format, [?MODULE,?LINE]++Args)).
-define(ewp_notice(Format, Args), catch syslog_drv:notice("~p:~p " ++ Format, [?MODULE,?LINE]++Args)).
-define(ewp_warning(Format, Args), catch syslog_drv:warning("~p:~p " ++ Format, [?MODULE,?LINE]++Args)).
-define(ewp_err(Format, Args), catch syslog_drv:ewp_err(?MODULE, ?LINE, Format, Args)).
-define(ewp_crit(Format, Args), catch syslog_drv:crit("~p:~p " ++ Format, [?MODULE,?LINE]++Args)).
-define(ewp_alert(Format, Args), catch syslog_drv:alert("~p:~p " ++ Format, [?MODULE,?LINE]++Args)).
-define(ewp_emerg(Format, Args), catch syslog_drv:emerg("~p:~p " ++ Format, [?MODULE,?LINE]++Args)).
-else.

-ifdef(ewp_enable_lager).

-compile([{parse_transform, lager_transform}]).
-ifdef(ewp_debug_flag).
-define(ewp_log(Format, Args), catch lager:debug(Format, Args)).
-define(ewp_debug(Format, Args), catch lager:debug(Format, Args)).
-else.
-define(ewp_log(Format, Args), undefined).
-define(ewp_debug(Format, Args), undefined).
-endif.

-define(ewp_info(Format, Args), catch lager:info(Format, Args)).
-define(ewp_msg(Format, Args), catch lager:info(Format, Args)).
-define(ewp_notice(Format, Args), catch lager:notice(Format, Args)).
-define(ewp_warning(Format, Args), catch lager:warning(Format, Args)).
-define(ewp_err(Format, Args), catch lager:error(Format, Args)).
-define(ewp_crit(Format, Args), catch lager:critical(Format, Args)).
-define(ewp_alert(Format, Args), catch lager:alert(Format, Args)).
-define(ewp_emerg(Format, Args), catch lager:emergency(Format, Args)).

-else.

-ifdef(ewp_debug_flag).
-define(ewp_log(Format, Args), catch error_logger:info_msg("~p:~p " ++ Format, [?MODULE,?LINE]++Args)).
-define(ewp_debug(Format, Args), catch error_logger:info_msg("~p:~p " ++ Format, [?MODULE,?LINE]++Args)).
-else.
-define(ewp_log(Format, Args), undefined).
-define(ewp_debug(Format, Args), undefined).
-endif.

-define(ewp_info(Format, Args), catch error_logger:info_msg("~p:~p " ++ Format, [?MODULE,?LINE]++Args)).
-define(ewp_msg(Format, Args), catch error_logger:info_msg("~p:~p " ++ Format, [?MODULE,?LINE]++Args)).
-define(ewp_notice(Format, Args), catch error_logger:info_msg("~p:~p " ++ Format, [?MODULE,?LINE]++Args)).
-define(ewp_warning(Format, Args), catch error_logger:info_msg("~p:~p " ++ Format, [?MODULE,?LINE]++Args)).
-define(ewp_err(Format, Args), catch elog:err(?MODULE, ?LINE, Format, Args)).
-define(ewp_crit(Format, Args), catch elog:err(?MODULE, ?LINE, Format, Args)).
-define(ewp_alert(Format, Args), catch elog:err(?MODULE, ?LINE, Format, Args)).
-define(ewp_emerg(Format, Args), catch elog:err(?MODULE, ?LINE, Format, Args)).

-endif.
-endif.
