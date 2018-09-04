% time testing if else
mypick = menu('food items','Pizza','Burger','sandwich');
tic
if mypick == 1
    display('Pizza is ready')
elseif mypick == 2
    display('Burger is ready')
elseif mypick == 3
    display('Sandwich is ready')
end
toc
