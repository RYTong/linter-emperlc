%% Copyright (c) 2009-2010 Beijing RYTong Information Technologies, Ltd.
%% All rights reserved.
%%
%% No part of this source code may be copied, used, or modified
%% without the express written consent of RYTong.
%%
%% @doc This file contains marco and record definitions.

-define(MATCH_RULE, ewp_stat_rules).
-record(stat, {app,
               from,
               action,
               module,
               function,
               yaws_arg,
               client_ip,
               path, 
               session_id, 
               user_type, 
               user_id, 
               user_agent,
               client_id,
               advertise,
               platform, 
               target,
               version,
               start_time,
               end_time,
               params
              }).

