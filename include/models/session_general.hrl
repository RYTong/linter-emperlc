%% Copyright (c) 2009-2010 Beijing RYTong Information Technologies, Ltd.
%% All rights reserved.
%%
%% No part of this source code may be copied, used, or modified
%% without the express written consent of RYTong.
%%

-define(HASH_NODE_TABLE, ewp_node_hash).
-define(SESSION_SHARED, session_shared).

-record(ewp_node_hash, {
    id,
    node
    }).

-define(no_session_in_cluster(Id), 
    ?ewp_err("cannot find session ~p in cluster~n", [Id])).
-define(no_session(Id),
    ?ewp_err("cannot find session ~p at this node~n", [Id])).
-define(no_session_at_node(Id, Node), 
    ?ewp_err("cannot find session ~p at node~p~n", [Id, Node])).
-define(bad_rpc(Func, Id, Node, Reason), 
    ?ewp_err("failed to call ~p with session ~p at node ~p, "
             "the Reason is: ~p~n", [Func, Id, Node, Reason])).
