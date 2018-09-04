% This function calculates inverse of a matrix
% Name: Senthamilaruvi Moorthy Date: 09/29/2015
function [inve] = inver(A)
cof = zeros(3,3);
for ll = 1:3
    for ii = 1:3
        sum = 0;
        for mm = 1:3
            for nn = 1:3
                for jj = 1:3
                    for kk = 1:3
                        p =  [ii jj kk];
                        I = eye(3,3);
                        En = det(I(p,:));
                        q = [ll mm nn];
                        Eq = det(I(q,:));
                        sum = sum + (0.5*En*Eq*A(mm,jj)*A(nn,kk));
                    end
                end
            end
        end
        cof(ll,ii) = sum;
    end
    adju = cof';
    inve = ((1/det(A))*adju);
end

            