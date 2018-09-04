% To make user select whether to display absolute, fix or floor value
% of the number
a = input('Enther the argument:');
mypick = menu('choose an option','fix','floor','abs');
switch mypick
    case 1
        fix(a)
    case 2
        floor(a)
    case 3
        abs(a)
    otherwise
        display('No input from user')
end


    