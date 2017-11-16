%% Copyright (c) 2009-2010 Beijing RYTong Information Technologies, Ltd.
%% All rights reserved.
%%
%% No part of this source code may be copied, used, or modified
%% without the express written consent of RYTong.
%%


-record(ewp_mnesia_schema, {
    name,
    database_version = 0 %% mnesia version ??Maybe we should change the name to mnesia_version
}).
