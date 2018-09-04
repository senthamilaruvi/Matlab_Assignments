% This function creates scalar product of two vectors
% Name: Senthamilaruvi Moorthy; Date: 09/12/2015;
function out = scalar11(a,b)
out = zeros(1,3);
for ii = 1:3
    out(1,ii) = a(ii)*b(ii);
    out = sum(out);
end
display(out);
end

    
