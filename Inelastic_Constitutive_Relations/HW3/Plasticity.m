% Homework 3 Plasticity in 1D
% Senthamilaruvi Moorthy 3/1/2016

% Initializing
S = xlsread('Tensile data1.xlsx');
Stress = S(:,2);
Strain = S(:,1);

sle = S(1:20,2); % elastic stress experimental
ele = S(1:20,1); % elastic strain experimental
spe = S(21:36,2); % plastic stress experimental
epe = S(21:36,1); % plastic strain experimental

slm = zeros(20,1); % elastic stress model
spm = zeros(16,1); %  Plastic stress model
elm = 0.0001:0.0001:0.002; % elastic strain model
elm = transpose(elm);
sy = 357.1; %From 0.2% offset yield
epm = 0.002:0.001:0.017; % Plastic strain model
epm = transpose(epm); 

%Calibrating E
E = polyfit(elm,sle,1);

for i = 1:20
    slm(i,1) = E(1)*elm(i,1);
end

H = polyfit(epm,spe,1);

for i = 1:16
    spm(i,1) = H(1)*(E/(E+H(1)))*epm(i,1) + H(2);
end

sm = [slm;spm];
%Plot stress and strain
plot(Strain,Stress,'r-');
hold on
plot(Strain,sm,'g-');
    
    






