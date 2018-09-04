%This script is for finding approximate solution for a PDE 
% using deterministic approach
clc
clear
%source points
s = [ 1  -1/4; 2/3 -1/4; 5/4 1/3; 5/4 2/3; 2/3 5/4 ; 1/3 5/4; -1/4 2/3; -1/4 1/3 ];
%field points
f = [ 1/3 0; 2/3 0; 1 1/3; 1 2/3; 2/3 1; 1/3 1; 0 2/3; 0 1/3];
% Boundary condition matrix
bc = [10 10 45 45 -15 -15 -20 -20]';
%initializing gmat
gmat = zeros(length(f), length(s));
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
syms u x y u_exact
u(x,y) = 0;
for i =1: length(s)
    u(x,y) = u(x,y) + A(i)*green(x,y,s(i,1),s(i,2));
end
yplot=(0:0.01:1);
plot(yplot,eval(u(0.5,yplot)))
xlabel('y')
ylabel('u')



        