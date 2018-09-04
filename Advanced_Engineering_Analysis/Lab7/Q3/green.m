function G  = green( x,y,x1,y1 )

%The function calculates green function values for the given two points

r = sqrt((x - x1)^2 + (y - y1)^2);
G = -(log(r)/(2*pi));

end

