%Studying the effect of time constant
tow1 = input('Enter the value of tow1 ');
tow2 = input('Enter the value of tow2 ');
t = input ('Enter the value of time range ');
y1 = exp(-tow1*t);
y2 = exp(-tow2*t);
plot(t,y1,'k+',t,y2,'r+')
xlabel('time');
ylabel('effect');
title('Time constant effect')
legend('y1','y2')

