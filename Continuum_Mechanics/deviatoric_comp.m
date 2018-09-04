%This function is to calculate deviatoric part of sigma
% Name: Senthamilaruvi Moorthy Date: 10/12/2015
function [sigma_deviatoric] = deviatoric_comp(sigma)
tr_sigma = (sigma(1,1) + sigma(2,2) +sigma(3,3));
sigma_hydrostatic = (1/3)*(tr_sigma*eye(3,3));
sigma_deviatoric = sigma - sigma_hydrostatic;
disp(sigma_deviatoric);
end
