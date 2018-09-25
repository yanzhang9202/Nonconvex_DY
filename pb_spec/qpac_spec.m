% Generate the data
ds.H = zeros(ni,ni,N);
ds.f = zeros(ni,N);
ds.A = zeros(mi,ni,N);
ds.b = zeros(mi,N);
for ii = 1 : N
    % H matrices
    vec = (rand(ni,1)-1/2)*2;
    mtx = orth(rand(ni));
    ds.H(:,:,ii) = mtx'*diag(vec)*mtx;
    % f vectors
    ds.f = rand(ni,N);
    % A matrices
    if mi*N >= ni
        error('Too many constraints!')
    end
    ds.A(:,:,ii) = rand(mi,ni);
    ds.b(:,ii) = rand(1)*0;
end

clear vec mtx