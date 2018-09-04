% Enter the angle in degeree or radians
a = input('Enter the angle:');
b = input('You want the answer in degeree d or radians r:','s');
if b == 'd'
    fprintf('The sin is %0.2f\n',sind(a));
else
    fprintf('The sin is %0.2f\n',sin(a));
end

    
