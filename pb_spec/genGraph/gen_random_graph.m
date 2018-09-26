imax = N*(N-1)/2-(N-2);
% num_edge = randi(imax)+N-2; % Number of edges that is possible to be connected
num_edge = N;

%% Generate adjacency matrix
tmax = 1e2;
for kk = 1 : tmax
    % Generate adjacency matrix
    A = triu(ones(N), 1);
    ind = find(A);
    ind = ind(randperm(N*(N-1)/2));
    mat = zeros(N);
    mat(ind(1:num_edge)) = 1;
    [row, col] = find(mat > 0);
    mat = mat + mat';
    flag = check_connect(mat);
    if flag
        break
    end
end
if ~flag
    error('Fail to generate a connected graph!')
else
    % Generate node-edge incidence matrix
    ne = zeros(N, num_edge);
    for ii = 1 : num_edge
        ne(row(ii),ii) = 1;
        ne(col(ii),ii) = -1;
    end
    % Generate laplacian matrix
    lap1 = ne*ne';  % L-
    lap2 = 2*diag(diag(lap1)) - lap1;   % L+
end

graph.adjacency = mat;  graph.nodedge = ne;    
graph.lap1 = lap1;      graph.lap2 = lap2;
graph.num_edge = num_edge;
graph.edgenode = ne';

clear row col A flag ii imax ind kk mat ne num_edge tmax lap1 lap2

