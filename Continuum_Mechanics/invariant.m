% This function is to calculate invariants of a tensor
% Name: Senthamilaruvi Moorthy Date: 10/12/2015
function [I1, I2, I3] = invariant(sigma)
I1 = sigma(1,1) + sigma(2,2) + sigma(3,3);
sum = 0;
for ii = 1:3
    for jj = 1:3
        sum = (sum + 0.5*((sigma(ii,ii)*sigma(jj,jj)) - (sigma(ii,jj)*sigma(jj,ii))));
    end
end
I2 = sum;
I3 = det(sigma);
end
