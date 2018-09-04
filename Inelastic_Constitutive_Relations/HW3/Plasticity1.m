% Homework 3 Plasticity in 1D
% Senthamilaruvi Moorthy 3/1/2016

% Initializing
clc
clear fig
S = xlsread('Tensile data1.xlsx');
Stress = S(:,2);
Strain = S(:,1);

sle = S(1:20,2); % elastic stress experimental
ele = S(1:20,1); % elastic strain experimental
spe = S(20:36,2); % plastic stress experimental
epe = S(20:36,1); % plastic strain experimental

sm = zeros(36,1); % elastic stress model
em = zeros(36,1); % elastuc strain model
de = 0.0001;
sy = 357.1; %From 0.2% offset yield

%Calibrating E & H
E = polyfit(ele,sle,1);
H = polyfit(epe,spe,1);

for i = 2:35
    sm(i+1,1) = sm (i,1) +E(1)*de;
    em(i,1) = em(i-1)+ de;
    if sm(i+1,1) > sy
        L = (sm(i+1,1) - sy)/(E(1)+H(1));
        sm(i+1,1) = (sm(i+1,1) - E(1)*L);
        sy = sy + H(1)*L + H(2);
    end 
end     

% plot
plot(Strain,Stress,'r-')
hold on
plot(Strain,sm,'g-')
xlabel('Strain');
ylabel('Stress(Mpa)')
title('Plasticity Modelling')
legend('Experimental','Model')


    
    






