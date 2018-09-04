% plotting aviation data altitude and temperature
load aviation.dat;
x = aviation(1,:);
y = aviation(2,:);
plot(x,y,'g-')
xlabel('altitude');
ylabel('temperature');
title('Altitude vs Temperature');

