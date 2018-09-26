%% For linear equality constrained problem
for jj = 1 : N
    % Update local multiplier
    lambda(:,jj,ii+1) = lambda(:,jj,ii) + alpha * ...
        (ds.A(:,:,jj)*x(:,jj,ii) - ds.b(:,jj));
    
    % Build and solve local problem
    lambda_j = lambda(:,jj,ii+1);
    mu_j = mu(:,:,ii)*graph.nodedge(jj,:)';
    x_j = x(:,:,ii) * graph.lap2(jj,:)';
    
    H_j = ds.H(:,:,jj) + 2*rho*graph.lap2(jj,jj)*eye(ni);                                          
    f_j = ds.f(:,jj) + ds.A(:,:,jj)'*lambda_j + mu_j - rho*x_j;
    
    [x(:,jj,ii+1), ~, flagexit] = quadprog(...
        H_j, f_j, [], [], [], [], [], [], [], options);
    if flagexit ~= 1
        error('Local problem cannot be solved by Matlab!\n')
    end        
end

clear x_j lambda_j mu_j H_j f_j flagexit