%% Copyright (c) 2009-2010 Beijing RYTong Information Technologies, Ltd.
%% All rights reserved.
%%
%% No part of this source code may be copied, used, or modified
%% without the express written consent of RYTong.
%%


-record(ota_phone, {user_agent,
                    brand,
                    model,
                    target,
                    supported = true}).