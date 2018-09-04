% Finding argument type
a = input('Enter the argument:');
[r c] = size(a);
if r == 1 && c == 1
    display('The iput argument is scalar');
end
if r == 1 && c ~= 1
    display('The input argument is row vector');
end
if r ~= 1 && c == 1
    display('The input argument is column vector');
end
if r ~= 1 && c ~=1
    display('The input agrument is matrix');
end
