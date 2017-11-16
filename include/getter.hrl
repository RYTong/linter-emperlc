
%% Marco to get parameters in ewp conf files.

-define(ewp_conf(Key), ?ewp_conf(Key, undefined)).
-define(ewp_conf(Key, Default), ewp_conf_util:get_ewp_conf_value(Key,Default)).

%% Get parameters from yaws request.

-define(param(Key), ?param(Key, undefined)).
-define(param(Key, Default), ewp_params:param(Key, Default)).


%% Get parameters from session.

-define(session(Key), ?session(Key, undefined)).
-define(session(Key, Default), ewp_params:session(Key, Default)).


%% Get parameters from yaws_arg record.

-define(arg(Key), ?arg(Key, undefined)).
-define(arg(Key, Default), ewp_params:arg(Key, Default)).

%% Get parameters from xml term.
-define(ewp_xpath(Path, Term), xml_eng:xpath_term_value(Path, Term)).
