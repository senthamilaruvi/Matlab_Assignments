%Function to receive matrix as input argument and print the matrix in table
%format
function printrow(mat)
[r c] = size(mat);
n = randi([1 r],1);
a = zeros(1,c);
a(1:c) = mat(n,:);
disp(a);
end
