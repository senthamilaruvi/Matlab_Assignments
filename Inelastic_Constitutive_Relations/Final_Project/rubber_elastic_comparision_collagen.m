% Final Project
% Comparrision of Arruda-Boyce Model with other hyperelastic models for
% uniaxial extension of collagen
% Senthamilaruvi Moorthy 4/27/2016
clc
clear fig
A = xlsread('hw2.xlsx');
Strain = A(:,1);
Stress = A(:,2);
Stressm = smooth(Stress);
j = length(Stressm);
Stress1 = zeros(j,1);
Stress2 = zeros(j,1);
Stress3 = zeros(j,1);
Stress4 = zeros(j,1);
Strain1 = zeros(j,1);
Strain2 = zeros(j,1);
Strain3 = zeros(j,1);
Error1 = zeros(j,1);
Error2 = zeros(j,1);
Error3 = zeros(j,1);
Error4 = zeros(j,1);
c = zeros(j,1);
d = zeros(j,1);
e = zeros(j,1);
f = zeros(j,1);
L = Strain +1;
N = 1;

% Linear Elastic
for i = 1:j
    Strain1(i,1) = L(i,1) - 1;
end
G_lin = polyfit(Strain1,Stressm,1);
for i = 1:j
Stress1(i,1) = G_lin(1)*(L(i,1)-1) + G_lin(2);
Error1(i,j) = (Stress1(i,1) - Stressm(i,1))^2;
end
RSQ1 = sum(sum(Error1));

% Neo Hookean
for i = 1:j
c(i,1)  = (1/L(i,1)^2);
Strain2(i,1) = L(i,1) - c(i,1);
end
G_neo = polyfit(Strain2,Stressm,1);
for i = 1:j
Stress2(i,1) = G_neo(1)*Strain2(i,1) + G_neo(2);
Error2(i,j) = (Stress2(i,1) - Stressm(i,1))^2;
end
RSQ2 = sum(sum(Error2));

% Mooney Rivlin Model
for i = 1:j
    d(i,1) = (L(i,1) - (1/L(i,1)^2));
    e(i,1) = (1 - (1/L(i,1)^3));
end

A = horzcat(d,e);
G_raw = Stressm\A;
G_mooney = pinv(G_raw);


for i = 1:j
    Stress3(i,1) = 3.6*G_mooney(1)*d(i,1) - 7.8*G_mooney(2)*e(i,1);
    Error3(i,j) = (Stress3(i,1) - Stressm(i,1))^2;
end
RSQ3 = sum(sum(Error3));

% Arruda and Boyce
for i = 1:j
  Strain3(i,1) = (L(i,1) - 1/(L(i,1)^2)) + (1/(5*N))*((L(i,1)^3) -(2/(L(i,1)^3)) + 1) + (66/(1050*N^2))*(L(i,1)^5 + (3*L(i,1)^2) - (4/(L(i,1)^4)));
end
G_Arruda = polyfit(Strain3,Stressm,1);
for i = 1:j
    Stress4(i,1) = 0.95*G_Arruda(1)*Strain3(i,1);
    Error4(i,j) = (Stress4(i,1) - Stressm(i,1))^2;
end

%Plotting


plot(Strain,Stressm,'r-','linewidth',2)
hold on
plot(Strain,Stress1,'b-','linewidth',2)
hold on
plot(Strain,Stress2,'c-','linewidth',2)
hold on
plot(Strain,Stress3,'g-','linewidth',2)
hold on
plot(Strain,Stress4,'k-','linewidth',2)
xlabel('Engineering Strain','fontsize',18);
ylabel('Engineering Stress(Mpa)','fontsize',18);
title('COMPARATIVE STUDY','fontsize',18);
AX = legend('Experimental','Linear','Neo-Hookean','Mooney-Rivlin','Arruda-Boyce');
LEG = findobj(AX,'type','text');
set(LEG,'fontsize',16)
