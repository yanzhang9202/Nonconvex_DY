%% Check feasibility of the current solution
x_itr = x(:,:,ii+1);
% Check consensus error
err_consensus = 0;
for jj = 1 : graph.num_edge
    temp = norm(x_itr*graph.edgenode(jj,:)');
    if temp > err_consensus
        err_consensus = temp;
    end
end
% Check local infeasibility
err_feas = 0;
for jj = 1 : N
    switch pb_type
        case 1
            temp = norm(ds.A(:,:,jj)*x_itr(:,jj) - ds.b(:,jj)); 
    end
    if temp > err_feas
        err_feas = temp;
    end    
end
% Check the max error
if max(err_consensus, err_feas) < epsilon
    fprintf(['Algorithm succeeds with ', num2str(ii), ' iters.', ...
        ' and accuracy ', num2str(max(err_consensus, err_feas)), '.\n'])
    break;
else
    if mod(ii,20) == 1
        fprintf(['Current itr.', num2str(ii), ' and accuracy ', ...
            num2str(max(err_consensus, err_feas)), '...\n'])
    end
end
clear x_itr temp