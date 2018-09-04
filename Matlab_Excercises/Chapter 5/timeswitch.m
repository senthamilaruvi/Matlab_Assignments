% time testing switch
mypick = menu('food items','Pizza','Burger','sandwich');
tic
switch mypick
    case(1) 
    display('Pizza is ready')
    case(2) 
    display('Burger is ready')
    case(3)
    display('Sandwich is ready')
end
toc