%getting user choice and execute the operation for a random number
mypick = menu('operations','fix','floor','ceil');
while mypick < 1 || mypick > 3
    display('wrong input');
    mypick = menu('operations','fix','floor','ceil');
end
a = randi([-100 100],1,1);
switch mypick
    case(1)
        mypick = fix(a);
        display(mypick);
    case(2)
        mypick = floor(a);
        display(mypick)
    case(3)
        mypick = ceil(a);
        display(mypick)
end
