% wind chill factor
T = input('Enter the temperature of the wind:');
V = input('Velocity of the wind:');
WCF = (35.7 + 0.6*T - 35.7*(V^(0.16)) + 0.43*T*(V^(0.16)));
fprintf('The WCF for given input is %-3.3f\n',WCF);
for T = -20:5:55
    for V = 0:5:55
        WCF = (35.7 + 0.6*T - 35.7*(V^(0.16)) + 0.43*T*(V^(0.16)));
        fprintf('%d %d %-3.3f\n',T,V,WCF);
        fprintf('\n');
    end
end
