%Creating two figures simultaneously
a = input('Enter the x value: ');
x = a;
b = input('Enter the y1 value: ');
y1 = b;
c = input('Enter the y2 value: ');
y2 = c;
disp('axis')
input(prompt)
% Plot figure x and y1
figure(1)
bar(x,y1)
hold on
% Plot figure x y1 and y2 in the same graph
figure(2)
plot(x,y1,'cd')
hold on
plot(x,y2,'b--')
grid on
legend('y1','y2')


