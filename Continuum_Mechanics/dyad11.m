%This function calculates the dyad of two vectors
% Name: Senthamilaruvi Moorthy Date: 09/12/2015
function out = dyad11(a,b)
out = zeros(3,3);
for ii = 1:3
    for jj = 1:3
            out(ii,jj) = a(ii)*b(jj);
    end
end
end



    