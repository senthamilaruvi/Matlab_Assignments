%This script is for finding approximate solution for a PDE 
% using deterministic approach
clc
clear
%source points
s = [ 1  -1/4; 2/3 -1/4; 5/4 1/3; 5/4 2/3; 2/3 5/4 ; 1/3 5/4; -1/4 2/3; -1/4 1/3 ];
%field points
xf = (linspace(0.2,0.8,20))';
yf = zeros(20,1);
a = [xf yf];
xs = ones(20,1);
ys = (linspace(0.2,0.8,20))';
b = [xs ys];
yt = ones(20,1);
d = [xf yt];
xl = zeros(20,1);
e = [xl ys];
f =[ a; b; d; e];
% Boundary condition matrix
bc = [10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 -15 -15 -15 -15 -15 -15 -15 -15 -15 -15 -15 -15 -15 -15 -15 -15 -15 -15 -15 -15 -20 -20 -20 -20 -20 -20 -20 -20 -20 -20 -20 -20 -20 -20 -20 -20 -20 -20 -20 -20 ]';
%initializing gmat
gmat = zeros(length(f), length(s));
%initializing percerror matrix
percerror = zeros(100,1);
%Populating gmat
for i = 1:length(f)
    for j = 1:length(s)
        x = f(i,1);
        y = f(i,2);
        x1 = s(j,1);
        y1 = s(j,2);
    if y == 0 || y == 1
        gmat(i,j) = green(x,y,x1,y1);
    elseif x == 1
        gmat(i,j) = Dgreen(x,y,x1,y1,1,0);
    elseif x == 0
        gmat(i,j) = Dgreen(x,y,x1,y1,-1,0);
    end
    end
end
[Q,R]=qr(gmat);
c=Q'*bc;
A = R\c;

% approximate solution of u(x,y) and q(x,y)
syms u q1 q2 x y 
u(x,y) = 0;
q1(x,y) = 0;
q2(x,y) = 0;

for i =1: length(s)
    u(x,y) = u(x,y) + A(i)*green(x,y,s(i,1),s(i,2));
end

for i = 1: length(s)
    q1(x,y) = q1(x,y) + A(i)*Dgreen(x,y,s(i,1),s(i,2),1,0);
end

for i = 1: length(s)
    q2(x,y) = q2(x,y) + A(i)*Dgreen(x,y,s(i,1),s(i,2),-1,0);
end

%Estimating error at bc 1
xplot = (linspace(0,1,100))';
for i = 1 :100   
u_approx = eval(u(xplot(i,1),0));
percerror(i,1) = abs(((u_approx -10)/10)*100);
end
percenterror = ((sum(percerror))/length(percerror));
fprintf('The percentage error at u(x,0) = 10 is %3.3f\n',percenterror);
subplot(2,2,1);
plot(xplot,eval(u(xplot,0)))
xlabel('x')
ylabel('u')
title('u vs x at u(x,0) = 10')

%Estimating error at bc 2
yplot = (linspace(0,1,100))';
for i = 1 :100   
q1_approx = eval(q1(1,yplot(i,1)));
percerror(i,1) = abs(((q1_approx - 45)/45)*100);
end
percenterror = (sum(percerror))/length(percerror);
fprintf('The percentage error at q(1,y)= 45 is %3.2f\n',percenterror);  
subplot(2,2,2)
plot(yplot,eval(q1(1,yplot)))
xlabel('y')
ylabel('q')
title('q vs y at BC q(1,y) = 45')

%Estimating error at bc 3
xplot = (linspace(0,1,100))';
for i = 1 :100   
u_approx = eval(u(xplot(i,1),1));
percerror(i,1) = abs(((u_approx +15)/(-15))*100);
end
percenterror = (sum(percerror))/length(percerror);
fprintf('The percentage error at BC u(x,1) = 10 is %3.2f\n', percenterror);
subplot(2,2,3)
plot(xplot,eval(u(xplot,1)))
xlabel('x')
ylabel('u')
title('u vs x at BC u(x,1) = -15')

%Estimating error at bc 4
yplot = (linspace(0,1,100))';
for i = 1 :100   
q2_approx = eval(q2(0,yplot(i,1)));
percerror(i,1) = abs(((q2_approx + 20)/(-20))*100);
end
percenterror = (sum(percerror))/length(percerror);
fprintf('The percentage error at BC q(0,y) = -20 is %3.2f\n',percenterror);
subplot(2,2,4)
plot(yplot,eval(q2(0,yplot)))
xlabel('y')
ylabel('q')
title('q vs y at BC q(0,y)= -20')






        