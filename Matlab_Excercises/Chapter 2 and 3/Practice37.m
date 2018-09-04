% Getting number of rows and columns from user
% generating a matrix with that rows and columns
% storing the matrix in dat file
a = input('Enter the number of rows:');
b = input('Enter the number of columns:');
mat  = randi([-100 100],a,b);
save mat.dat mat -ascii