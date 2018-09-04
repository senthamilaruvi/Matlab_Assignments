% Finding argument type
a = input('Enter the argument:');
[r c] = size(a);
if r == 1 && c == 1
    display('The iput argument is scalar');
elseif r == 1 && c ~= 1
    display('The input argument is row vector');
elseif r ~= 1 && c == 1
    display('The input argument is column vector');
else
    display('The input agrument is matrix');
end
