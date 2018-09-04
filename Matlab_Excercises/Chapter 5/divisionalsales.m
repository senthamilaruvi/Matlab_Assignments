%script for divisional sales
div(1,:) = [4.2 3.8 3.7 3.8];
div(2,:) = [2.5 2.7 3.1 3.3];
x = 1:1:4;
for i = 1:2
y = (div(i,:));
subplot(1,2,i);
plot(x,y,'ko');
xlabel('Quarters')
ylabel('Sales')
title('Divisonal sales')
end