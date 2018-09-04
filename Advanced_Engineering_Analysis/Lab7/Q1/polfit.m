% Program for fitting a performing a least square fit to a given set of 
% data using an Mth ordr polynamial

function polfit(B)

% Getting order of polynomial as input from user

k = input('Please enter the order of the polynomial:');
r = length(B);
X = zeros(r,1);
Y = zeros(r,1);
F = zeros(r,k);
error = zeros(r,1);
% Store the values of dependant and independent variables 
for i = 1: r
   X(i,1) = B(i,1);
   Y(i,1) = B(i,2);
end
% creating matrix of values of x x^2 and x^3 .. depending on order of
% polynomial
for i = 1: r
    for p = 1:k
        F(i,p) = (X(i,1)).^p;
    end
end
%finding coefficient matrix
D = ones(r,1);
A = [D F];
C = A\Y;
y = zeros(r,1);

% Finding the curve

for i = 1:r
    for j = 1:k+1
        y(i,1) = y(i,1)+ C(j,1)*(X(i,1))^(j-1);
    end
end

% Plotting the curve

plot(X,y,'b-')
xlabel('Date')
ylabel('sunrise time')
hold on 
plot(X,Y,'g-')
legend('Predicted','Given')

%Calculating percentage error
for i = 1: r
    error(i,1) = (((Y(i)-y(i))*100)/Y(i));
    avgpererr = (sum(error(i,1))/length(error)); 
end
fprintf('The average percentage error is %3.5f\n',avgpererr);
end



        
