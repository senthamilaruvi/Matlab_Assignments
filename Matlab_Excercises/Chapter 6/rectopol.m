%Function to convert rectangular to polar co ordinates
function [r ,theta] = rectopol(x,y)
r = sqrt(x^2 + y^2);
theta = atan(y/x);
fprintf('The polar  co-ordinates are %3.3f and %3.3f\n',r,theta);
end

