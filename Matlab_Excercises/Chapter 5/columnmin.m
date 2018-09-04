%Program to find column minimum
function outmat = columnmin(mat)
[r c] = size(mat);
outmat = zeros(1,c);
for j = 1:c
    for i = 1:r
        outmat(1,j) = min(mat(:,j));
    end     
end






