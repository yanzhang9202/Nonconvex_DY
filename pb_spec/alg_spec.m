%% Algorithm parameters
iter_max = 1e2;
alpha = 2e-1;   % stepsize for local multiplier update
epsilon = 1e-2;
% Decide rho to make the local (and global) subproblem strongly convex
dmin = min(diag(graph.lap1));
gamma = 1;  % bound of the multiplier during iterations
% rho = (ds.Lf + ds.Lh*gamma)/2/dmin;
rho = 5;

%% Asign variable space
x = zeros(ni,N,iter_max);
lambda = zeros(mi,N,iter_max);
mu = zeros(ni, graph.num_edge, iter_max);

% Initialization
x(:,:,1) = zeros(ni,N);
lambda(:,:,1) = zeros(mi,N);
mu(:,:,1) = zeros(ni, graph.num_edge);