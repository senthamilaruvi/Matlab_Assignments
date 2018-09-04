% Detecting region of flow using Reynolds number
Re = input('Enter the reynolds number Re:');
if Re <= 2300
    display('The flow is laminar');
elseif Re > 2300 && Re <= 4000
    display('The flow is transient')
else
    display('The flow is turbulent')
end

   
    
