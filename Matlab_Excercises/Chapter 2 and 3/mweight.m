%Calculating Molecular weight of Hydrogen peroxide
%input the arguments in the format molweight(atomic weight of hydrogen,....
%atomic weight of oxygen)
function molweight = mweight(atweightH,atweightO)
molweight = (2*atweightH + 2*atweightO);
fprintf('Molecular weight of Hydrogen peroxide is %3.3f\n', molweight);


