%% Algorithm parameters
iter_max = 2e2;
% alpha = 2e-1;   % stepsize for local multiplier update
epsilon = 1e-2;

% Decide rho to make the local (and global) subproblem strongly convex
dmin = min(diag(graph.lap1));
gamma = 20;  % bound of the multiplier during iterations, decided by trial and error

% rho = (ds.Lf + ds.Lh*gamma)/2/dmin;   % The bound to make the local
% problem strongly convex

temp = svd(graph.lap1);
s1 = temp(N-1); % Smallest nonzero singular value of A^TA
temp = permute(ds.A, [1,3,2]);
A = reshape(temp, [], ni);
s2 = max(svd(A));
s3 = 0;
for ii = 1 : N
    temp = max(svd(ds.H(:,:,ii)));
    if temp > s3, s3 = temp; end
end
eta = 3*norm(graph.lap2)^2/s1;
b = s3/2+gamma^2*s2^2+2*eta*s2;
c = 3*s3^2/s1;
rho = b/2 + sqrt(b^2+4*c)/2;
alpha = rho*s1/6/s2^2+1/eta/s2^2;

clear A b c temp eta

%% Asign variable space
x = zeros(ni,N,iter_max);
lambda = zeros(mi,N,iter_max);
mu = zeros(ni, graph.num_edge, iter_max);

% Initialization
x(:,:,1) = zeros(ni,N);
lambda(:,:,1) = zeros(mi,N);
mu(:,:,1) = zeros(ni, graph.num_edge);