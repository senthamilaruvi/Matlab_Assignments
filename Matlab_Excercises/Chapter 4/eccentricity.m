%Eccentricity of an elipse
a = input('Enter the value of semi major axis:');
b = input('Enter the value of semi minor axis:');
if a == 0
    display('The input is invalid');
else
    findecc(a,b);
end