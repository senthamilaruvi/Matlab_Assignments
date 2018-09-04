% To get matrix as input and calculate the sum
mat = input('Enter the input matrix:');
[r c] = size(mat);
value = 0;
for i = 1:r
    for j = 1:c
        value = value + mat(i,j);
    end
end
fprintf('The total sum is %3.3f\n',value);