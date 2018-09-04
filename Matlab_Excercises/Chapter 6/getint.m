%To get an integer and returns a vector
function out = getint
n = input('Enter the positive integer:');
a = int32(n);
if n ~= a
    subfun;
else
out = 1:n;
end
end
function subfun
disp('This is not an integer')
end

