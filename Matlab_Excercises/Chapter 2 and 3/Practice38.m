load salesfig.dat;
y1 = salesfig(1,:);
y2 = salesfig(2,:);
x = 1.000:4.000;
xlabel('Quarter');
ylabel('sale')
title('Quarterly sales');
plot(x,y1,'ko',x,y2,'r*');

