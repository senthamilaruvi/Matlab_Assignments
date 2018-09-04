%Product of odd numbers from 1 to n
function b = prodby2(n)
b = 1;
for i = 1:2:n
    b = b*i;
end
fprintf('The product of oddnumbers is %d\n',b);
end
