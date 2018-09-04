%Exponential decaying sinusoidal
F = input('Enter the value of force: ');
x = input('Enter the range of x: ');
constmat = [0.246 0.806; 0.250 1.000; 0.643 1.213];
n = 1;3;
a = constmat(1,1);
b = constmat(1,2);
y1 = F*(exp(-a*x)).*(sin(b*x));
a = constmat(2,1);
b = constmat(2,2);
y2 = F*(exp(-a*x)).*(sin(b*x));
a = constmat(3,1);
b = constmat(3,2);
y3 = F*(exp(-a*x)).*(sin(b*x));
plot(x,y1,'r-',x,y2,'g-',x,y3,'k-');
xlabel('distance from source')
ylabel('decay')
legend('y1','y2','y3')

