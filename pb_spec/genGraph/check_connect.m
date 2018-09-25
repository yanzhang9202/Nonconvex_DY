function [ flag ] = check_connect( mat )
flag = 0;
tst = zeros(size(mat));
for ii = 1 : size(mat,1)
    tst = tst * mat + mat;
    if isempty(find(tst == 0))
        flag = 1;
        break;
    end
end
end