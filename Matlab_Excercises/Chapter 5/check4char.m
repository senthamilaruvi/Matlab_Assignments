% Getting input from user and check whether it is a letter
in = input('Enter the input:','s');
while in >= int32('a') && in <= int32('z')
    in = input('Enter the input:','s');
end
fprintf('%s is not a letter:',in)
