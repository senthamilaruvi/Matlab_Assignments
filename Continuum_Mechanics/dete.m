% This program calculates determinant of a matrix 
% Name: Senthamilaruvi Moorthy Date: 09/29/2015
function M = dete(A)
M = 0;
for ii = 1:3
    for jj = 1:3
        for kk = 1:3
            p =  [ii jj kk];
            I = eye(3,3);
            En = det(I(p,:));
            M = M + En*A(1,ii)*A(2,jj)*A(3,kk);
        end
    end
end
M = abs(M);
end

            
