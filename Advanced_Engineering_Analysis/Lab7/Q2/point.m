%Solving differential equation using point collocation
clear
clc
syms R x a0 a1 a2 a3 a4 a5 u
%Elimiating constants with boundary conditions
a0 = 0;
a1 = -(a2 + a3 + a4 + a5);
u = -a2*x - a3*x - a4*x - a5*x + a2*x^2 + a3*x^3 +a4*x^4 +a5*x^5;
% Residual
R(x) = diff(diff(u,x))-u-x;
%choosing collocation
p1 = 0.2;
p2 = 0.4;
p3 = 0.6;
p4 = 0.8;
%Solving for constants
c = solve(R(p1)== 0,R(p2) == 0, R(p3) == 0, R(p4) == 0);
af2 = eval(c.a2);
af3 = eval(c.a3);
af4 = eval(c.a4);
af5 = eval(c.a5);
af1 = -(af2 + af3 + af4 + af5);
fprintf('The coefficient matrix is')
A = [a0 af1 af2 af3 af4 af5]