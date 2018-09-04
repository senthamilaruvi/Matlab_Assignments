%Calculates perimeter and area of rectangle
function [perimeter,area] = recprop(length , width)
perimeter = 2*(length + width);
area = length*width;
fprintf('The area of the rectangle is %-3.3f\n',area);
fprintf('The perimeter of the rectangle is %-3.3f\n',perimeter);
