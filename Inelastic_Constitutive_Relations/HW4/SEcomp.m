% 1D Phenomenological model for superelasticity
% Name: Senthamilaruvi Moorthy
% Date: 4/3/2015

% Definition of material properties

E = 40000; % Young's Modulus of the material
Tas = 280; % Austenite transformation temperature K
Tms = 220; % Martensitic transormation temperature K
Tt = (Tas + Tms)/2; % Equillibrium temperature K
T = 323; % Test temperature K
L = 80; % Latent heat Mj/m^3
la_dot_0 = 20; % Kinetic coefficient in martensite volume evolution
d_la_c = L*(Tas - Tms)/(Tas + Tms); % Critical driving force for phase transformation

% Initializin3
n = 10000;
s = zeros(n,1); % Tensile Stress
la = zeros(n,1); % Volume fraction of Martensitic transformation
d_la = zeros(n,1); % driving force
e = zeros(n,1); % Strain
em = zeros(n,1); % Martensitic strain
de = 0.000014;
emc = -0.043; % Martensitic compressive
emt = 0.05; % Martensitic tensile
t = (0.00014*n); % total time in seconds
dt = t/n; % time steps


% Program

% compression 

% Elastic predictor
for i = 1:n
    if i == floor(n/2)
        de = -1*de;
    end
    e(i+1) = (e(i)- de);
    s(i+1) = (E*(e(i+1) - la(i)*em(i)));
    % em based on tension/Compression
    if  s(i+1) > 0;
        em(i+1) = emt;
    else
        em(i+1) = emc;
    end
    
    % Calculating driving force
    d_la(i+1) =  s(i+1)*em(i+1) - (L/Tt)*(T - Tt);
    
    % Calculate Martensite volume fraction
    
    % Forward transformation
    
    if d_la(i+1) > d_la_c && la(i) < 1
        la(i+1) = la(i) + la_dot_0*(d_la(i) - d_la_c)*dt;
        
    % Reverse transformation
    
    elseif d_la(i+1) < -d_la_c && la(i) > 0
        la(i+1) = la(i) + la_dot_0*(d_la(i) + d_la_c)*dt;
        
    % No transformation
     
    else 
        la(i+1) = la(i);
    end
    
    % Transformation corrector
    
    s(i+1) = E*(e(i+1) - la(i+1)*em(i+1));
end



% Plotting

plot(-e,-s,'r');
hold on
xlabel('Strain');
ylabel('Stress');
title('Superelasticity');



    
    



