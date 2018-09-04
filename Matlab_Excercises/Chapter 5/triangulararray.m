%Printing triangular array of numbers
a = zeros(1,5);
for i = 1:5
    for j = 1:i
        a(1,j) = i*j;
        fprintf('%d ',a(1,j));
    end   
    fprintf('\n');
end
