% This script is to find the approximate solution for differential
% equation using explicit finite difference method and compare the 
% solution with actual solution

% Defining r,k,h,x,t and n
clear 
clc
r = 0.25;
h = 0.1;
k = r*h^2;
x = 0:h:1;
t = 0:k:1;
Uac = zeros(length(x),9);

% Initializing U
Ufd = zeros(length(x),length(t));
Ufd(:,1) = 1;


% Explicit finite difference solution
% The solution differs at boundaries

for j = 1:400
    for i = 1:11
        if i == 1
            Ufd(i,j+1) = Ufd(i,j) + 2*r*(Ufd(i+1,j)-(1+h)*Ufd(i,j));
        elseif i == 11
            Ufd(i,j+1) = Ufd(i,j) + 2*r*(Ufd(i-1,j)-(1+h)*Ufd(i,j));
        else
        Ufd(i,(j+1)) = (r*(Ufd((i+1),j)) + r*(Ufd((i-1),j)) + (1-(2*r))*Ufd(i,j));
        end
    end
end

%Reporting solution
for i = 1:6
fprintf('At x = %1.2f\n t            U\n',x(1,i))
fprintf('\n')
for j = 1:9
    fprintf('%1.4f       %1.4f\n',t(1,j),Ufd(i,j))
end
    fprintf('%1.4f        %1.4f\n',t(1,401),Ufd(i,401))
    fprintf('\n')
end

%defining coefficient alpha for analytical solution
a = [0.65327 3.2923 6.3616 9.477 12.606 15.7397];

%Analytical solution
sum =0;
for i = 1:11
    for j = 1:9
        sum = 0;
        for n = 1:6
            sum  = sum + ((1/(3+4*(a(1,n))^2))*sec(a(1,n))*(exp(-4*((a(1,n))^2)*t(1,j)))*cos(2*a(1,n)*(x(1,i)-0.5)));
        end
        Uac(i,j) = 4*sum;
    end
end

%Reporting comparision

fprintf('At x = %1.2f\n t           Uac               Ufd\n',x(1,3))
for j = 1:9
    fprintf('%1.4f      %1.4f            %1.4f\n',t(1,j),Uac(3,j),Ufd(3,j));
end

       
%Plotting Ufd at different given values of x at t = 0 - 0.020
figure(01)
x1 = 0:0.1:0.5;
j = 1:6;
for m = 1:1:9
plot(x1,Ufd(j,m))
hold on
end
xlabel('x')
ylabel('U(finite difference)')
title('Explicit finite difference solution')

%Plotting Uac at different given values of x at t = 0 - 0.020
figure(02)
for m = 1:1:9
plot(x1,Uac(j,m))
hold on
end
xlabel('x')
ylabel('U(analytical)')
title('Analytical solution')

