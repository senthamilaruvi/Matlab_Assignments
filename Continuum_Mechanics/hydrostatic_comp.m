%This function is to seperate hydrostatic component from a stress tensor
% Name: Senthamilaruvi Moorthy Date: 10/12/2015
function [sigma_hydrostatic] = hydrostatic_comp(sigma)
tr_sigma = (sigma(1,1) + sigma(2,2) +sigma(3,3));
sigma_hydrostatic = (1/3)*(tr_sigma*eye(3,3));
disp(sigma_hydrostatic);
end


