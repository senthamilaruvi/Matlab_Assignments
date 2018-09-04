% looping until desired approximation 
n = 1;
b = ((1-(1/n))^n);
c = (1/exp(1));
a = (c - b);
while a > 0.0001
    n = n +1;
    b = ((1-(1/n))^n);
    a = (c - b);
end
fprintf('Approx is %1.4f and built in is %1.4f\n',b,c);

    