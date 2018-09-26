%% Algorithm parameters
iter_max = 1e2;
rho = 1;
alpha = 3e-1;   % stepsize for local multiplier update
epsilon = 1e-2;

%% Asign variable space
x = zeros(ni,N,iter_max);
lambda = zeros(mi,N,iter_max);
mu = zeros(ni, graph.num_edge, iter_max);

% Initialization
x(:,:,1) = zeros(ni,N);
lambda(:,:,1) = zeros(mi,N);
mu(:,:,1) = zeros(ni, graph.num_edge);