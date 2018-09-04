% This function is for permutation symbol in a cross product
% Name: Senthamilaruvi Moorthy Date: 09/14/2015
function En = E(ii,jj,kk)
p =  [ii jj kk];
I = eye(3,3);
En = det(I(p,:));
disp(En);
end
