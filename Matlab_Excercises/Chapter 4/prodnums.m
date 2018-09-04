% function prodnums gives product of n numbers
function product = prodnums(n)
product = 1;
for i = 1:n
    inputnum = input('Enter the number:');
    product = product*inputnum;
end
fprintf('The product of numbers is %-4.3f',product);
end


