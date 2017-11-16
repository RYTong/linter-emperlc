%% Mnesia table definition
%% Device tokens for push
-record(token, {id, %% id = {App, Os, Token} 
                user_id, 
                phone}).

-record(push_log, {timestamp,
                   app,
                   os,
                   type,
                   payload,
                   tokens,
                   result,
                   remark}).

-record(ios_payload, {alert,
                      badge,
                      sound,
                      async=false,
                      format=simple,
                      expiry,
                      extra}).

-record(ios_payload_alert, {body,
                            'action-loc-key',
                            'loc-key',
                            'loc-args',
                            'launch-image'}).

-record(android_payload, {alert,
                          title,
                          message_type}).

-record(winphone_payload, {alert,
                           type=toast}).

%% record for winphone alert 
-record(wp_title_alert, {text_box_background_image=[],
                         text_box_count=[],
                         text_box_title=[],
                         text_box_backbackground_image=[],
                         text_box_back_title=[],
                         text_box_back_content=[]
                        }).

-record(wp_toast_alert, {title=[], 
                         subtitle=[]}).

-record(wp_row_alert, {value1=[], 
                       value2=[]}).


%% IOS push confifguration definition
-record(ios_conf, {certfile,
                   keyfile,
                   cafile,
                   password,
                   pool_size,       %% The size of providers.
                   env,             %% Type of APNS service. development | production.
                   ssl_restart,     %% ssl socket restart interval.
                   feedback         %% Interval of requesting feedback service, in hour unit.
        }).

%% ANDROID push configuration definition
-record(android_conf, {xmpp_host}).

%% ANDROID push configuration definition
-record(winphone_conf, {client_id,
                        client_secret}).
