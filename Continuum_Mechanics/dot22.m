% This program gives dot product of a vector and a tensor
% Name : Senthamilaruvi Moorthy Date: 09/12/2015
function out = dot22(A,B)
out = zeros(3,3);
for ii = 1:3
    for jj = 1:3
        for kk = 1:3
        out(ii,jj) = out(ii,jj)+A(ii,kk)*B(kk,jj);     
        end
    end
end
disp(out)
end
