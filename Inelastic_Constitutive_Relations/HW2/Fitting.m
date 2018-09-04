A = xlsread('hw2.xlsx');
Strain = A(:,1);
Stress = A(:,2);
Stress2 = zeros(427,1);
Stress3 = zeros(427,1);
Stress4 = zeros(427,1);
G = 0.04;
M1 = 0.03;
M2 = 0.03;
L = 1;
Stress1 = smooth(Stress);
for i = 1:427
    Stress2(i,1) = G * (L-1);
    L = L+0.0028;
end
L = 1;
for i = 1:427
    Stress3(i,1) = G*(L- (1/L^2));
    L = L+0.0028;
end
L = 1;
for i = 1:427
    Stress4(i,1) = M1*(L - (1/L^2)) + M2*(1 - (1/L^3));
    L = L+0.0028;
end
plot(Strain,Stress1)
hold on
plot(Strain,Stress2)
hold on
plot(Strain,Stress3)
hold on
plot(Strain,Stress4)