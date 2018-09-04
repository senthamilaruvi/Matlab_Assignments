% This program calculates the scalar product of two second order tensors
% Name: Senthamilaruvi Moorthy Date: 09/12/2015
function out = scalar22(A,B)
out = zeros(3,3);
for ii = 1:3
    for jj = 1:3
        out(ii,jj) = A(ii,jj)*B(ii,jj);
    end
end
out = sum(sum(out));
disp(out);
end
