%This function calculates eigen value of a matrix
%Name: Senthamilaruvi Moorthy Date: 09/29/2015
function [eigval]=eigen(A)
for i=1:100
    [L, U] = lu(A);
    A = U*L;
end
eigval = [A(1,1); A(2,2); A(3,3)];
end
