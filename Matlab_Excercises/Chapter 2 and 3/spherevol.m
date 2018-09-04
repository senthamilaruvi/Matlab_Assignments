%Volume of the sphere
function volume = spherevol(ri,ro)
volume =(4/3)*pi*(ro^3-ri^3);
fprintf('volume of the hollow sphere is %5.2f\n',volume);
end




