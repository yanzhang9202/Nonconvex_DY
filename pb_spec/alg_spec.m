%% Algorithm parameters
iter_max = 1e2;
rho = 1;

%% Asign variable space
x = zeros(ni,N,iter_max);
lambda = zeros(mi,N,iter_max);
mu = zeros(graph.num_edge, iter_max);

x_itr = zeros(ni,N);
lambda_itr = lambda(:,:,1);
mu_itr = mu(:,1);