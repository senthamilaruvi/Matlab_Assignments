% This script is to find the approximate solution for differential
% equation using explicit finite difference method and compare the 
% solution with actual solution

% Defining r,k,h,x,t and n
clear 
clc
r = 0.1;
k = 0.001;
h = sqrt(k/(r));
x = 0:h:1;
t = 0:k:0.200;
c = zeros(1,100);
d = zeros(1,100);
e = zeros(1,100);
Uac = zeros(length(x),length(t));

% Initializing U
Ufd = zeros(length(x),length(t));
Ufd(:,1) = 1;
Ufd(1,:) = 0;
Ufd(11,:) = 0;

%Explicit finite difference solution
for j = 1:200
    for i = 2:10
        Ufd(i,(j+1)) = (r*(Ufd((i+1),j)) + r*(Ufd((i-1),j)) + (1-(2*r))*Ufd(i,j)); 
    end
end

 % Analytical solution
 sum = 0;
 for i = 1:7
     for j = 1:201
         sum = 0;
         for n = 0:50
             c = (2*n +1);
             sum = sum + (4/pi)*(1/c)*exp(-c^2*(pi^2)*t(1,j))*sin(c*(pi)*x(1,i));
         end
         Uac(i,j) = sum;
     end
 end
 
figure(01)
%Plotting Ufd and Uac vs t at x = 0
subplot(2,3,1)
j = 1:201;
plot(t,Ufd(1,j),'r-')
hold on
plot(t,Uac(1,j),'g-')
xlabel('t')
ylabel('Ufd and Uac')
legend('Ufd','Uac')
title('t vs Ufd and Uac at x = 0')

%Plotting Ufd and Uac vs t at x = 0.1
subplot(2,3,2)
j = 1:201;
plot(t,Ufd(2,j),'r-')
hold on
plot(t,Uac(2,j),'g-')
xlabel('t')
ylabel('Ufd and Uac')
title('t vs Ufd and Uac at x = 0.1')
legend('Ufd','Uac')

%Plotting Ufd and Uac vs t at x = 0.2
subplot(2,3,3)
j = 1:201;
plot(t,Ufd(3,j),'r-')
hold on
plot(t,Uac(3,j),'g-')
xlabel('t')
ylabel('Ufd and Uac')
title('t vs Ufd and Uac at x = 0.2')
legend('Ufd','Uac')

%Plotting Ufd and Uac vs t at x = 0.3
subplot(2,3,4)
j = 1:201;
plot(t,Ufd(4,j),'r-')
hold on
plot(t,Uac(4,j),'g-')
xlabel('t')
ylabel('Ufd and Uac')
title('t vs Ufd and Uac at x = 0.3')
legend('Ufd','Uac')

%Plotting Ufd and Uac vs t at x = 0.4
subplot(2,3,5)
j = 1:201;
plot(t,Ufd(5,j),'r-')
hold on
plot(t,Uac(5,j),'g-')
xlabel('t')
ylabel('Ufd and Uac')
title('t vs Ufd and Uac at x = 0.4')
legend('Ufd','Uac')

%Plotting Ufd and Uac vs t at x = 0.5
subplot(2,3,6)
j = 1:201;
plot(t,Ufd(6,j),'r-')
hold on
plot(t,Uac(6,j),'g-')
xlabel('t')
ylabel('Ufd and Uac')
title('t vs Ufd and Uac at x = 0.5')
legend('Ufd','Uac')

%Plotting Ufd at different given values of x at different time
figure(02)
x1 = 0:0.1:0.6;
j = 1:7;
for m = 1:20:200
plot(x1,Ufd(j,m))
hold on
end
xlabel('x')
ylabel('U(finite difference)')
figure(03)
for t1 = 1:20:200
    plot(x1,Uac(j,t1))
    hold on
end
xlabel('x')
ylabel('U(analytical)')









 
    

