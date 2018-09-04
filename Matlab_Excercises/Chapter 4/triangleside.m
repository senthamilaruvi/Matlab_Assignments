%script for finding opposite side in triangle
c = input('Enter the length of hypotenuse:');
a = input('Enter the length of adjacent side:');
if a <= 0 || c <= 0
    display('The input is invalid')
else
    calc(a,c);
end

  