-define(PERSISTENT_SESSION, persistent_session).
-define(PERSISTENT_USER, persistent_user).

-record(persistent_data, {session_id,
                          user_id,
                          user_info,
                          log}).

-record(persistent_session, {id_with_type,
                             visited_at}).

-record(persistent_user, {user_id,
                          user_info,
                          log,
                          visited_at}).
