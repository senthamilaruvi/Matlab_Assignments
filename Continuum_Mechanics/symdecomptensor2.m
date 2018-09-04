% The function splits the tensor into symmetric and skewsymmetric tensor
% Name: Senthamilaruvi Moorthy Date: 09/12/2015
function [symtens2,skewsymtens2] = symdecomptensor2(tens2in)
symtens2 = zeros(3,3);
skewsymtens2 = zeros(3,3);
tens2int = tens2in';
for ii = 1:3
    for jj = 1:3
        symtens2(ii,jj) = 0.5*(tens2in(ii,jj) + tens2int(ii,jj));
        skewsymtens2(ii,jj) = 0.5*(tens2in(ii,jj) - tens2int(ii,jj));
    end
end
disp(symtens2);
disp(skewsymtens2);
end
