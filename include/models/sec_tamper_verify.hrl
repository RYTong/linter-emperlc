%% Copyright (c) 2009-2010 Beijing RYTong Information Technologies, Ltd.
%% All rights reserved.
%%
%% No part of this source code may be copied, used, or modified
%% without the express written consent of RYTong.
%%


-define(VERIFY_HASH_TABLE,client_info).
-define(RES_DIR , sec_tamper_verify:get_client_verify_conf(client_verify_file)).
-define(VERIFY_FLAG , sec_tamper_verify:get_client_verify_conf(flag,false)).
-record(client_info, {
    platfrom_version,
    hash,
    update_time
    }).
