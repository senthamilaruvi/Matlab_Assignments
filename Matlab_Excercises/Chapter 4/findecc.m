%Function for calculating eccentricity of elipse
function ecc = findecc(a,b)
ecc = sqrt(1-(b/a)^2);
fprintf('The eccentricity of an elipse is %-3.2f\n',ecc);
