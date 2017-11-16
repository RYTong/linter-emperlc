
%% operations for 'transaction' field
-define(get_transaction(), session_service:get_field(transaction)).
-define(clear_transaction(), session_service:clear_field(transaction)).
-define(update_transaction(PropList), session_service:update_field(transaction, PropList)).
-define(lookup_from_transaction(Key), session_service:lookup_from_field(transaction, Key)).
-define(insert_into_transaction(Key, Value), session_service:insert_into_field(transaction, Key, Value)).
-define(delete_from_transaction(Key), session_service:delete_from_field(transaction, Key)).
-define(update_value_from_transaction(Key, Value), session_service:update_value_from_field(transaction, Key, Value)).

%% operations for 'log' field
-define(get_log(), session_service:get_field(log)).
-define(clear_log(), session_service:clear_field(log)).
-define(update_log(PropList), session_service:update_field(log, PropList)).
-define(lookup_from_log(Key), session_service:lookup_from_field(log, Key)).
-define(insert_into_log(Key, Value), session_service:insert_into_field(log, Key, Value)).
-define(delete_from_log(Key), session_service:delete_from_field(log, Key)).
-define(update_value_from_log(Key, Value), session_service:update_value_from_field(log, Key, Value)).

%% operations for 'userinfo' field
-define(get_userinfo(), session_service:get_field(user_info)).
-define(clear_userinfo(), session_service:clear_field(user_info)).
-define(update_userinfo(PropList), session_service:update_field(user_info, PropList)).
-define(lookup_from_userinfo(Key), session_service:lookup_from_field(user_info, Key)).
-define(insert_into_userinfo(Key, Value), session_service:insert_into_field(user_info, Key, Value)).
-define(delete_from_userinfo(Key), session_service:delete_from_field(user_info, Key)).
-define(update_value_from_userinfo(Key, Value), session_service:update_value_from_field(user_info, Key, Value)).

%% operations for 'user_id'
-define(get_user_id(), session_service:get_field(user_id)).
-define(clear_user_id(), session_service:update_field(user_id, undefined)).
-define(update_user_id(Uid), session_service:update_field(user_id, Uid)).
