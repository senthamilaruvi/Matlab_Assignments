% This function is to calculate J2invariant of a tensor
% Name: Senthamilaruvi Moorthy Date 10/12/2015
function [J2] = J2invariant(sigma)
tr_sigma = (sigma(1,1) + sigma(2,2) +sigma(3,3));
sigma_hydrostatic = (1/3)*(tr_sigma*eye(3,3));
sigma_deviatoric = sigma - sigma_hydrostatic;
sigma1 = (sigma_deviatoric*sigma_deviatoric);        %temporary variable
J2 = (0.5)*((sigma1(1,1)+sigma1(2,2)+sigma1(3,3)));
end
