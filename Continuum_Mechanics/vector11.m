% This function calculates the cross product of two vectors
% Name: Senthamilaruvi Moorthy Date: 09/12/2015
function [c] =  vector11(a,b)
c = zeros(1,3);
    for ii = 1:3 
        sum = 0;
        for jj = 1:3
            for kk = 1:3
                p =  [ii jj kk];
                I = eye(3,3);
                E = det(I(p,:));
                sum = sum + E*a(jj)*b(kk);
            end
        end
        c(1,ii) = sum;    
    end
end

    
        