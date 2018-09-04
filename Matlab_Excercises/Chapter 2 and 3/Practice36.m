%Plotting exp(x) and log(x)
x = 0:3.5;
y1 = exp(x);
y2 = log(x);
%Plotting
plot(x,y1,'ro',x,y2,'b+');
legend('y1','y2');

