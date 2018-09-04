%calculating unit vector
x = input('Enter the value of x: ');
y = input('Enter the value of y: ');
z = input('Enter the value of z: ');
a = sqrt(x^2+y^2+z^2);
b = [(x/a) (y/a) (z/a)];
c = sprintf('%d',b);
fprintf('The unit vector u is [%s]\n',c)
