% wind chill factor
T = input('Enter the temperature of the wind:');
V = input('Velocity of the wind:');
WCF = (35.7 + 0.6*T - 35.7*(V^(0.16)) + 0.43*T*(V^(0.16)));
mat = zeros(16,12);
fprintf('The WCF for given input is %-3.3f\n',WCF);
T(1:16) = -20:5:55;
V(1:12) = 0:5:55;
for i = 1:16
    for j = 1:12
        WCF = (35.7 + 0.6*T(1,i) - 35.7*(V(1,j)^(0.16)) + 0.43*T(1,i)*(V(1,j)^(0.16)));
        mat(i,j) = WCF;
    end
end
disp(mat)

