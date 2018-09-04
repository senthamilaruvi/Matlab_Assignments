% This program gives dot product of a vector and a tensor
% Name : Senthamilaruvi Moorthy Date: 09/12/2015
function out = dot12(b,B)
out = zeros(1,3);
s = 0;
for ii = 1:3
    for jj = 1:3
        s = s + b(1,jj)*B(jj,ii);
    end
    out(1,ii) = s;
    s = 0;
end
disp(out)
end
