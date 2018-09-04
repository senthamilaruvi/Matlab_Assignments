%Beaufort wind theory
B = input('Enter the Beaufort number:');
if B == 0
    display('There is no wind');
elseif B > 0 && B <= 6
    display('There is a breeze');
elseif B > 6 && B <= 9
    display('This is a gale');
elseif B >= 10 && B <= 11
    display('It is a storm');
else
    display('Hello, Hurricane');
end
      


       
    
   