%% Record definition for EWP Adapters.
-record(adapter,{name, %% string()
		 host, %% string()
		 protocol, %% atom() | {socket, PacketGenerator::{Mod, Fun} } | {extend, {Mod, Fun}}
		 port,     %% integer()
		 res_convertor}). %% xml2term | xml2json | {Mod, Fun}. Mod:Fun(Type::atom(), Data::any())

-record(procedure, {id, %% {Adapter::string(), string()}
		    data, %% file_path()
		    use_sample_data = false, %% true | false
		    gen_log = false,  %% true | fasle
		    params, %% proplist()
		    gen_code = false, %% true |false
		    path = "",    %% string()
		    res_convertor  %% xml2term | xml2json | {Mod, Fun}. Types: {atom(), atom()}
		   }).
