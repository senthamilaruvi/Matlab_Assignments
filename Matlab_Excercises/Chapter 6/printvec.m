%Receive and print the elements in vector
function printvec(a)
b = length(a);
for i = 1:b
    fprintf('The element number %d is %2.2f\n',i,a(1,i));
end
