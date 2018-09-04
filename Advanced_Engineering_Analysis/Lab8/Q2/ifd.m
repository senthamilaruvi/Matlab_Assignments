% This script is for finding approximat solution for differential equation
% using Crank- Nicolson (Implicit) finite difference method
clear 
clc
r = 0.1;
k = 0.001;
h = sqrt(k/(r));
x = 0:h:1;
t = 0:k:0.200;

% First and last row of finite difference matrix and the first column
% are known from given boundary conditions so remaining 9 rows and 200
% columns of finite difference matrix should be populated and hence
% the other required matrix are initialized correspondingly

A = zeros(length(x)-2,length(x)-2);
B = zeros(length(x)-2,length(t)-1);
Y = zeros(length(x)-2,1);
Uac = zeros(length(x),length(t));

%Initializing U
Ufd = zeros(length(x),length(t));
Ufd(:,1) = 1;
Ufd(1,:) = 0;
Ufd(11,:) = 0;


    for j = 1:9
        for i = 1:9
        if i == j
            A(i,j) = 2*(1+r);
        elseif i == j-1 || i == j+1
            A(i,j) = -r;
        else
            A(i,j) = 0;
        end
        end
    end
    
% First and last row of finite difference matrix and the first column
% are known from given boundary conditions so remaining 9 rows and 200
% columns of finite difference matrix is populated
    
    for j = 1:200
        for i = 1:9
            B(i,j) = r*Ufd(i,j) + 2*(1-r)*Ufd(i+1,j) + r*Ufd(i+2,j);
            Y(i,1) = B(i,j);
        end
        X = A\Y;
        for v = 1:9
            Ufd(v+1,j+1) = X(v,1);
        end
            
    end
    
 % Analytical solution
 sum = 0;
 for i = 1:6
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
%Plotting x and Ufd
x1 = 0:0.1:0.5;
u = 1:6;
for m = 1:20:201;
plot(x1,Ufd(u,m))
hold on
end
xlabel('x');
ylabel('Ufd(Implicit Finite difference)')

%plotting x and Uac
figure(02)
x1 = 0:0.1:0.5;
u = 1:6;
for m = 1:20:201;
plot(x1,Uac(u,m))
hold on
end
xlabel('x');
ylabel('Uac(analytical)')

figure(03)
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


         
        
        