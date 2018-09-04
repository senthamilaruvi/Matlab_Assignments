% This function is to calculate J2invariant of a tensor
% Name: Senthamilaruvi Moorthy Date 10/12/2015
function J2 = J2invariant1(sigma)
tr_sigma = (sigma(1,1) + sigma(2,2) +sigma(3,3));
sigma_hydrostatic = (1/3)*(tr_sigma*eye(3,3));
sigma_deviatoric = sigma - sigma_hydrostatic;
sum = 0;
for ii = 1:3
    for jj = 1:3
        sum = sum + 0.5*((sigma_deviatoric(ii,jj)*sigma_deviatoric(jj,ii)));
    end
end        
J2 = sum;
end
