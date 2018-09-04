%Get row vector as input and print a matrix
a = input('Enter the first row vector:');
b = input('Enter the second row vector:');
[r c] = size(a);
[d e] = size(b);
f = abs(c-e);
g = zeros(1,f);
if c > e
    mat1 = a;
    mat2 = [b g];
    mat = [mat1;mat2];
    disp(mat);
elseif c == e
    mat1 = a;
    mat2 = b;
    mat = a;b;
    disp(mat);
else
    mat1 = [a g];
    mat2 = b;
    mat = [mat1;mat2];
    disp(mat);
end


