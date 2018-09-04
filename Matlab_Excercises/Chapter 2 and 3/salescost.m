%Sales cost
mat = [1100 800; 1233 650; 1111 1001; 1222 1300; 999 1221];
Quarters = 1:0.25:2;
cost = mat(:,1);
sales = mat(:,2);
plot(Quarters,cost,'ko',Quarters,sales,'r*')
newmat = rot90(mat);
legend('cost','sales');
save newfile.dat newmat -ascii

