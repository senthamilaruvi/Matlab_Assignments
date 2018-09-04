%Script the user to input a number to generate random integer
%Calculate and print the sum of entered numbers with one decimal place
n = randi([2 5]);
b = zeros(1,n);
for i = 1:n
a = input('Enter a number:');
b(i) = a;
c = sum(b);
end
fprintf('The sum is %1.1f\n',c);



