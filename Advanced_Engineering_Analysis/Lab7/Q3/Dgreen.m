function DG = Dgreen(x,y,x1,y1,nx,ny)

%Thsi function calculates partial differential of Green funtion with
% respect to normal unit vector

r = sqrt((x-x1)^2 + (y-y1)^2);

DG = ((-1/(2*pi*r^2)*((x-x1)*nx+(y-y1)*ny)));
end

