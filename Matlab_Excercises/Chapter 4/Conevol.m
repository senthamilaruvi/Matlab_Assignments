%Calculating the volume of a cone and print
%the results in cm or inch
dimension = input('Enter the unit of the dimension cm/in:','s');
length = input('Enter the lenght of the cone:');
width = input('Enter the width of the cone:');
height = input('Enter th height of the cone;');
base = width*length;
volume = (1/3)*base*height;
if dimension == 'c'
    fprintf('The volume of the cone is %3.3f cubic centimeter\n',volume)
else
    fprintf('The volume of the cone is %3.3f cubic inches\n',volume)
end
 
    