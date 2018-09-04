%prints the opposite and adjacent sides of triangle
function printtri(h,theta)
adj = adjacent(h,theta);
opp = Opposite(h,theta);
fprintf('The adjacent side is %-3.2f and opposite side is %3.2f\n',adj,opp);
end
function adj = adjacent(h,theta)
adj = h*cos(theta);
end
function opp = Opposite(h,theta)
opp = h*sin(theta);
end