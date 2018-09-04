%calculates sum of 1 to n numbers in steps of 2
function b = sumsteps2(n)
b = 0;
for i = n:-2:0
    b = b+i;
end
disp(b);
end
