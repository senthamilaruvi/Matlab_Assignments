%Solving differential equation using subdomain collocation
clear
clc
syms R x a0 a1 a2 a3 a4 a5 u
%Elimiating constants with boundary conditions
a0 = 0;
a1 = -(a2 + a3 + a4 + a5);
u = -a2*x - a3*x - a4*x - a5*x + a2*x^2 + a3*x^3 +a4*x^4 +a5*x^5;
% Residual
R(x) = diff(diff(u,x))-u-x;
%subdomain collocation
sb1 = int(R(x),x,0.1,0.3);
sb2 = int(R(x),x,0.3,0.5);
sb3 = int(R(x),x,0.5,0.7);
sb4 = int(R(x),x,0.7,0.9);
%Solving for constants
c = solve(sb1 == 0,sb2 == 0, sb3 == 0, sb4 == 0);
af2 = eval(c.a2);
af3 = eval(c.a3);
af4 = eval(c.a4);
af5 = eval(c.a5);
af1 = -(af2 + af3 + af4 + af5);
fprintf('The coeffecient matrix is')
A = [a0 af1 af2 af3 af4 af5]