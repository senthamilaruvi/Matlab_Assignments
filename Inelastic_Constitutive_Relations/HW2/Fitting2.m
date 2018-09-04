A = xlsread('hw2.xlsx');
Strain = A(:,1);
Stress = A(:,2);
Stress1 = zeros(407,1);
Stress2 = zeros(407,1);
Stress3 = zeros(407,1);
Error = zeros(407,1);
Rsq = zeros(10,1);
Rsq1 = zeros(10,1);
RMSQ = zeros(100,1);
L = 1;
Glin = 0.01:0.01:0.10;
Gneo = 0.01:0.01:0.10;
M1 = 0.01:0.01:0.10;
M2 = 0.01:0.01:0.10;
Stressm = smooth(Stress);
for j = 1:10
for i = 1:407
    Stress1(i,1) = Glin(j) * (L-1);
    L = L+0.0027;
end
for i = 1:407
Error(i,1) = (Stress1(i,1) - Stressm(i,1))^2;
end
Rsq(j,1) = sum(Error);
end
L = 1;
for j = 1:10
for i = 1:407
    Stress2(i,1) = Gneo(j)*(L- (1/L^2));
    L = L+0.0028;
end
for i = 1:407
Error(i,1) = (Stress2(i,1) - Stressm(i,1))^2;
end
Rsq1(j,1) = sum(Error);
end
L = 1;
for j = 1:10
    for k = 1:10
for i = 1:407
    Stress3(i,1) = M1(j)*(L - (1/L^2)) + M2(k)*(1 - (1/L^3));
    L = L+0.0028;
end
for i = 1:407
    Error(i,1) = (Stress3(i,1) - Stressm(i,1))^2;
end
m = 10*(j-1)+k;
RMSQ(m,1) = sqrt(sum(Error)/407);
    end
end
%Error plot
figure(01)
plot(Glin,Rsq)
figure(02)
plot(Gneo,Rsq1)
figure(03)
plot(1:100,RMSQ)

%Finding Stress, Strain value for best G

% Linear elastic
L = 1;
for i = 1:407
    Stress1(i,1) = Glin(2)*(L-1);
    L = L+0.0027;
end

% Neo Hookean
L = 1;
for i = 1:407
    Stress2(i,1) = Gneo(2)*(L- (1/L^2));
    L = L+0.0027;
end


% Mooney Rivlin
L =1;
for i = 1:407
    Stress3(i,1) = M1(1)*(L - (1/L^2)) + M2(2)*(1- (1/L^3));
    L = L+0.0027;
end

figure(04)
plot(Strain,Stressm,'b-')
hold on
plot(Strain,Stress1,'g-')

figure(05)
plot(Strain,Stressm,'b-')
hold on
plot(Strain,Stress2,'g-')

figure(06)
plot(Strain,Stressm,'b-')
hold on
plot(Strain,Stress3,'g-')
