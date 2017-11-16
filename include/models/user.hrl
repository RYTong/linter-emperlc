%% Copyright (c) 2009-2010 Beijing RYTong Information Technologies, Ltd.
%% All rights reserved.
%%
%% No part of this source code may be copied, used, or modified
%% without the express written consent of RYTong.
%%


-record(user, {id, 
               login, 
               logged_in_at, 
               pin, 
               favorite_collection_id, 
               phone_number, 
               name, 
               code, 
               exp_date}).

-record(admin, {user=[],
                 password=[],
                 power=[],
                 open_interface=""}).
