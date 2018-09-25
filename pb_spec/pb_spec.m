N = 5;
ni = 10;
mi = 1;

%% Generate the data
switch pb_type
    case 1
        qpac_spec;
    otherwise
        error('Undefined problem type!')
end

%% Generate the graph
gen_graph;
