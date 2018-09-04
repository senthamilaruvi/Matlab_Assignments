%Length of string
str = input('Enter the string:','s');
l = length(str);
a = str(1,1);
b = str(1,l);
fprintf('The length of string is %d,\n First letter is %c,\n last letter is %c\n',l,a,b);
