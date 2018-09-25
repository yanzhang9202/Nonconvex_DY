%% Generate graph matrices
switch graph_type
    case 1
        gen_random_graph;
    case 2
        
    otherwise
        error('Undefined graph type!')
end