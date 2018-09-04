%The following function calculates the magnitude of rank 2 tensor
%Name: Senthamilaruvi Moorthy Date: 09/12/2015
function out = mag2(A)
sum = 0;
for ii = 1:3
    for jj = 1:3
        sum = (sum + A(ii,jj)^2);
        out = sqrt(sum);
    end
end
