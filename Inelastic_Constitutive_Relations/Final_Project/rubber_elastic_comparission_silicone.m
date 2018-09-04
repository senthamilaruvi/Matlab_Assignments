% Final Project
% Comparrision of Arruda-Boyce Model with other hyperelastic models for
% Uniaxial compression and Plane strain compression of silicone rubber
% Senthamilaruvi Moorthy 4/27/2016
clc
clear fig
A = xlsread('Silicone_rubber.xlsx');
Strain = A(2:248,4);
Stress = A(2:248,5);
Stressm = smooth(Stress);
j = length(Stressm);
Stress1 = zeros(j,1);
Stress2 = zeros(j,1);
Stress3 = zeros(j,1);
Stress4 = zeros(j,1);
Stress5 = zeros(j,1);
Stress6 = zeros(j,1);
Stress7 = zeros(j,1);
Strain1 = zeros(j,1);
Strain2 = zeros(j,1);
Strain3 = zeros(j,1);
Strain4 = zeros(j,1);
Error1 = zeros(j,1);
Error2 = zeros(j,1);
Error3 = zeros(j,1);
Error4 = zeros(j,1);
c = zeros(j,1);
d = zeros(j,1);
e = zeros(j,1);
f = zeros(j,1);
L = Strain +1;
N = 7.9;

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
G_mooney = Stressm\A;


for i = 1:j
    Stress3(i,1) = 2.2*G_mooney(1)*d(i,1) - 0.28*G_mooney(2)*e(i,1);
    Error3(i,j) = (Stress3(i,1) - Stressm(i,1))^2;
end
RSQ3 = sum(sum(Error3));

% Arruda and Boyce
for i = 1:j
    Strain3(i,1) = (L(i,1) - 1/(L(i,1)^2)) + (1/(5*N))*((L(i,1)^3) -(2/(L(i,1)^3)) + 1) + (66/(1050*N^2))*(L(i,1)^5 + 3*L(i,1)^2 - (4/(L(i,1)^4)));
end
G_Arruda = polyfit(Strain3,Stressm,1);
for i = 1:j
    Stress4(i,1) = 0.97*G_Arruda(1)*Strain3(i,1);
    Error4(i,j) = (Stress4(i,1) - Stressm(i,1))^2;
end

% Plane strain compression - Neo - Hookean

for i = 1:j
Strain4(i,1) = (L(i,1) -  (1/(L(i,1))^3));
end
for i = 1:j
Stress5(i,1) = G_neo(1)*Strain4(i,1) + G_neo(2);
end

% Plane strain compression - Mooney - Rivlin

for i = 1:j
    Stress6(i,1) = 2.2*G_mooney(1)*(L(i,1) -(1/L(i,1)^3)) - 0.28*G_mooney(2)*(L(i,1) -(1/L(i,1)^3));
end

% Plane strain compression - Arruda- Boyce

for i = 1:j
    Stress7(i,1) = 0.97*G_Arruda(1)*((L(i,1) - (1/(L(i,1)^3)))+ (1/(5*N))*((-1/(L(i,1)^5)) + L(i,1)^3 - (1/(L(i,1)^3)) + L(i,1)) + ...
    (66/(1050*N^2))*((-1/(L(i,1)^7)) + L(i,1)^5 - (2/(L(i,1)^5)) + 2*L(i,1)^3 - (2/(L(i,1)^3)) +2*L(i,1)));
end

%Plotting uniaxial compression
figure(01)
plot(-Strain,-Stressm,'r-','linewidth',2)
hold on
plot(-Strain,-Stress1,'b-','linewidth',2)
hold on
plot(-Strain,-Stress2,'c-','linewidth',2)
hold on
plot(-Strain,-Stress3,'g-','linewidth',2)
hold on
plot(-Strain,-Stress4,'k-','linewidth',2)
xlabel('Engineering Strain','fontsize',18);
ylabel('Engineering Stress(Mpa)','fontsize',18);
title('COMPARATIVE STUDY','fontsize',18);
AX = legend('Experimental','Linear','Neo-Hookean','Mooney-Rivlin','Arruda-Boyce');
LEG = findobj(AX,'type','text');
set(LEG,'fontsize',16)
%Plotting compressive Plane strain
figure(02)
plot(-Strain,-Stress2,'r-','linewidth',2)
hold on 
plot(-Strain,-Stress5,'g-','linewidth',2)
xlabel('Engineering Strain','fontsize',18);
ylabel('Engineering Stress(Mpa)','fontsize',18);
title('Neo-Hookean','fontsize',18);
AX = legend('Uniaxial','Plane Strain');
LEG = findobj(AX,'type','text');
set(LEG,'fontsize',16)
figure(03)
plot(-Strain,-Stress3,'r-','linewidth',2)
hold on
plot(-Strain,-Stress6,'g-','linewidth',2)
xlabel('Engineering Strain','fontsize',18);
ylabel('Engineering Stress(Mpa)','fontsize',18);
title('Mooney-Rivlin','fontsize',18);
AX = legend('Uniaxial','Plane Strain');
LEG = findobj(AX,'type','text');
set(LEG,'fontsize',16)
figure(04)
plot(-Strain,-Stress4,'r-','linewidth',2)
hold on
plot(-Strain,-Stress7,'g-','linewidth',2)
xlabel('Engineering Strain','fontsize',18);
ylabel('Engineering Stress(Mpa)','fontsize',18);
title('Arruda-Boyce','fontsize',18);
AX = legend('Uniaxial','Plane Strain');
LEG = findobj(AX,'type','text');
set(LEG,'fontsize',16)
