% This function calculates eigen values and eigen vectors of given tensor
% Name: Senthamilaruvi Moorthy Date: 10/12/2015
function [eigval,eigvec] = eige(A)
[~,eigval,eigvec] = svd(A);
end


