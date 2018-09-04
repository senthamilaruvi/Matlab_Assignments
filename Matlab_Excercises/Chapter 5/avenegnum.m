% Average negative number
inputnum = input('Enter the negative number:');
counter = 0;
i =0;
if inputnum >= 0
    display('You have entered a non negative number');
else
while inputnum < 0
inputnum = i + inputnum;
counter = counter+1;
avg = (inputnum/counter);
inputnum = input('Enter the negative number:');
end
fprintf('You have entered %d negative numbers and their average is %d\n',counter,avg);
end



    

   
    


