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
%Weighting fuction
W2(x) = (x^2)*(1-x);
W3(x) = (x^3)*(1-x);
W4(x) = (x^4)*(1-x);
W5(x) = (x^5)*(1-x);
%Integrating with weighting function
Ga1 = int((R(x)*W2(x)),x,0,1);
Ga2 = int(R(x)*W3(x),x,0,1);
Ga3 = int(R(x)*W4(x),x,0,1);
Ga4 = int(R(x)*W5(x),x,0,1);
%Solving for constants
c = solve(Ga1 == 0,Ga2 == 0, Ga3 == 0, Ga4 == 0);
af2 = eval(c.a2);
af3 = eval(c.a3);
af4 = eval(c.a4);
af5 = eval(c.a5);
af1 = -(af2 + af3 + af4 + af5);
fprintf('The coefficient matrix is')
A = [a0 af1 af2 af3 af4 af5]