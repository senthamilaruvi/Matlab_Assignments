% To get input from user and compare with threshold value
% Find th average for values above threshold
t = input('Enter the threshold value:');
n = input('Enter the number of values:');
value = 0;
count =0;
for i = 1:n
    volt = input('Enter the voltage:');
    if volt > t
        value = value + volt;
        count = count + 1;
    end
end
avg = value/count;
fprintf('The average of %d values is %-4.2f volts\n',count,avg);
