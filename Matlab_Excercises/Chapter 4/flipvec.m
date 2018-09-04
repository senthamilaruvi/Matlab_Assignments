% function flipvector reverses and print if it is row vector
% reverses and print if it is column vector
% Prints as it is if it is a scalar or matrix
function vec = flipvec(argument)
[r c] = size(argument);
if r == 1 
    vec = fliplr(argument);
    disp(vec);
elseif c == 1
    vec = flipud(argument);
    disp(vec);
elseif r == 1 && c == 1
    disp(argument);
else
    disp(argument);
end
 

