%% Run
for ii = 1 : iter_max
    x_itr = x(:,:,ii);
    lambda_itr = lambda(:,:,ii);
    mu_itr = mu(:,:,ii);
    % local problem solver
    local_solver;
    % global multiplier update
    for jj = 1 : graph.num_edge
       mu(:,jj,ii+1) =  mu(:,jj,ii) + rho*x(:,:,ii+1)*graph.edgenode(jj,:)';
    end 
    % Stopping condition
    check_feasibility;
end