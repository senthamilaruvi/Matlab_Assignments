% Plotting Y +-0.25
x = 1:10;
y = x;
y2 = zeros(1,10);
y3 = zeros(1,10);
for i = 1:10
y2(1,i)=y(i) + 0.25;
end
for j = 1:10
y3(1,j) = y(j) - 0.25;
end
plot(x,y,'ko',x,y2,'go',x,y3,'ro');
legend('y', 'y2','y3');





       
