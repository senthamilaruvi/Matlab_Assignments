% This program gives dot product of a vector and a tensor
% Name : Senthamilaruvi Moorthy Date: 09/12/2015
function out = dot21(B,b)
out = zeros(1,3);
s = 0;
for ii = 1:3
    for jj = 1:3
        s = s + B(ii,jj)*b(1,jj);
    end
    out(1,ii) = s;
    s = 0;
end
disp(out)
end
