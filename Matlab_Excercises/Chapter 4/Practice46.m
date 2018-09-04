%to check whether the argument is string
mystring = input('Enter the string: ','s');
a = ischar(mystring);
if a == 1
fprintf('The string is %-10c\n',mystring)
else 
    display('This is not a string');
end
