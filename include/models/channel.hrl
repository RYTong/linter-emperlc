%% Copyright (c) 2009-2010 Beijing RYTong Information Technologies, Ltd.
%% All rights reserved.
%%
%% No part of this source code may be copied, used, or modified
%% without the express written consent of RYTong.
%%

-define(channel_type, channel_storagre_type).

-record(channel,
        {id, app, name, entry, views, props, state}).

-record(collection,
        {id, app, name, url, user_id, type, state}).

-record(collection_item,
        {id, item_id, item_type, menu_order}).