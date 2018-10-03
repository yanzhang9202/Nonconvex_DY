% Generate the data
ds.H = zeros(ni,ni,N);
ds.f = zeros(ni,N);
ds.A = zeros(mi,ni,N);
ds.b = zeros(mi,N);

trial = 1e2;
for tt = 1 : trial
    for ii = 1 : N
        % H matrices
        vec = (rand(ni,1)-1/2)*2;
        mtx = orth(rand(ni));
        temp = mtx'*diag(vec)*mtx;
        ds.H(:,:,ii) = (temp+temp')/2;
        % f vectors
        ds.f = rand(ni,N);
        % A matrices
        if mi*N >= ni
            error('Too many constraints!')
        end
        ds.A(:,:,ii) = rand(mi,ni);
        ds.b(:,ii) = rand(mi, 1)*0;
    end

    % Solve using Matlab
    H = sum(ds.H, 3)/N;
    f = sum(ds.f, 2)/N;
    temp = permute(ds.A, [1,3,2]);
    A = reshape(temp, [], ni);
    b = reshape(ds.b, [], 1);

    options = optimoptions('quadprog',...
    'Algorithm','trust-region-reflective','Display','off');
    [sol.x, sol.fval, sol.exitflag, sol.output, sol.lambda] = quadprog(...
        H, f, [], [], A, b, [], [], [], options);
    % if sol.exitflag ~= 1
    %     error(['The exit flag is ', num2str(sol.exitflag), ...
    %         '. Generated problem cannot be solved by Matlab!\n'])
    % end
    if sol.exitflag == 1
        fprintf('A feasible nonconvex problem is generated!\n')
        break;
    end
end

% Get the Lipschtiz constant for the problem
ds.Lf = 0;
ds.Lh = 0;  % For linear constrained problem, Lh = 0.
for ii = 1 : N
    temp = norm(ds.H(:,:,ii));
    if temp > ds.Lf,    ds.Lf = temp;   end
end

clear vec mtx H f temp A b trial tt