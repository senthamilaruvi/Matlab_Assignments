% This script is for finding approximat solution for differential equation
% using Crank- Nicolson (Implicit) finite difference method and compare it
% with Analytical solution
clear 
clc
r = 1.0;
h = 0.1;
L = 0.5; % length of the space domain
t_total = 1.0;
k = r*h^2;
x = 0:h:L;
t = 0:k:t_total;
clear figure;


A = zeros(length(x),length(x)); % co-efficient matrix
B = zeros(length(x),length(t)); % RHS
Y = zeros(length(x)-2,1);
Uac = zeros(length(x),length(t)); % Anlytical

%Initializing U
Ufd = zeros(length(x),length(t));

Ufd(:,1) = 0.0; % initial condition

% Coefficient Matrix
    for j = 1:length(x)
        for i = 2:length(x)-1
            
        if i == j
            A(i,j) = 2*(1+r);
        elseif i == j-1 || i == j+1
            A(i,j) = -r;
        else
            A(i,j) = 0;
        end
        end
    end
    A(1,1) =  2 + 2*r;
    A(1,2) = -2*r;
    A(length(x),length(x)-1) = -2*r;
    A(length(x),length(x)) = 2+2*r;
      
   % RHS Matrix & Solution calculation
    for j = 1:length(t)-1
        for i = 1:length(x)
            if i==1
                B(i,j+1) = (2-2*r)*Ufd(1,j) + 2*r*Ufd(1,j);
            elseif i== length(x)
                B(i,j+1) = 2*r*Ufd(length(x)-1,j)+(2-2*r)*Ufd(length(x),j) + 4*h*r;
            else
                B(i,j+1) = r*Ufd(i-1,j) + 2*(1-r)*Ufd(i,j) + r*Ufd(i+1,j);
            end % end of if loop
            
            Y(i,1) = B(i,j+1);
        end
        X = A\Y;
        for v = 1:length(x)
            Ufd(v,j+1) = X(v,1);
        end      
    end
 
    
 % Analytical solution
  sum = 0;
 for i = 1:length(x)
     for j = 1:length(t)
         sum = 0;
         for n = 1:50
             sum = sum + (((-1)^n)/(n^2))*(exp(-4*(pi^2)*(n^2)*t(1,j)))*cos(2*pi*n*x(1,i));
         end
             Uac(i,j) = 2*t(1,j)+0.5*(((12*(x(1,i)^2)-1)/6)-(2/pi^2)*sum);
     end
 end

% Printing the Output

t1 = [1 2 6 11 51 101];

for i = 1:length(x)
fprintf('At x = %1.2f\n t            Ufd          Uac\n',x(1,i))
fprintf('\n')
for j = 1:6
    fprintf('%1.4f       %1.4f       %1.4f\n',t(1,t1(1,j)), Ufd(i,t1(1,j)), Uac(i,t1(1,j)));
end
end

% Plotting the results

x1 = 0:0.1:0.5;
m = 1:6;

% t=0.0075
plot(x1,Ufd(m,t1(1,1)),'r-','markersize',6,'MarkerFaceColor','k','MarkerEdgeColor','k')
hold on
plot(x1,Uac(m,t1(1,1)),'o','markersize',6,'MarkerFaceColor','r','MarkerEdgeColor','k')
%legend('Ufd t=0.0075','Uac');
hold on
%t=0.01
plot(x1,Ufd(m,t1(1,2)),'g-','markersize',6,'MarkerFaceColor','k','MarkerEdgeColor','k')
hold on
plot(x1,Uac(m,t1(1,2)),'o','markersize',6,'MarkerFaceColor','g','MarkerEdgeColor','k')

%t=0.05
plot(x1,Ufd(m,t1(1,3)),'b-','markersize',6,'MarkerFaceColor','k','MarkerEdgeColor','k')
hold on
plot(x1,Uac(m,t1(1,3)),'o','markersize',6,'MarkerFaceColor','b','MarkerEdgeColor','k')

%t=0.1
plot(x1,Ufd(m,t1(1,4)),'c-','markersize',6,'MarkerFaceColor','k','MarkerEdgeColor','k')
hold on
plot(x1,Uac(m,t1(1,4)),'o','markersize',6,'MarkerFaceColor','c','MarkerEdgeColor','k')

%legend('U(Explicit) at t=0.01','U(Analytical) at t=0.01');

%t=0.5
plot(x1,Ufd(m,t1(1,5)),'m-','markersize',6,'MarkerFaceColor','k','MarkerEdgeColor','k')
hold on
plot(x1,Uac(m,t1(1,5)),'o','markersize',6,'MarkerFaceColor','m','MarkerEdgeColor','k')

%legend('U(Explicit) at t=0.01','U(Analytical) at t=0.01');

%t=1.0
plot(x1,Ufd(m,t1(1,6)),'k-','markersize',6,'MarkerFaceColor','k','MarkerEdgeColor','k')
hold on
plot(x1,Uac(m,t1(1,6)),'o','markersize',6,'MarkerFaceColor','k','MarkerEdgeColor','k')

%legend('U(Explicit) at t=0.01','U(Analytical) at t=0.01');
axis([0 0.5 -0.1 3.0]) 
set(gca, 'box'      ,'on'    ...                             % draw a box around the figure
       ,'LineWidth', 2      ...                             % increase the line width
       ,'FontSize' ,15);

xlabel('Distance (x)');
ylabel('u(x,t)');

fid4=sprintf('figure_1c.png');
print (gcf,'-dpng', fid4)







         
        
        