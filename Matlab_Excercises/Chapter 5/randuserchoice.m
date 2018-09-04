% Generate random integers to match users choice
mi = input('Enter the minimum value:');
ma = input('Enter the maximum value:');
n = input ('Enter the user choice:');
r = randi([mi ma],1);
count = 0;
while n ~= r
    count = count + 1;
    r = randi([mi ma],1);
end
fprintf('%d number of interations are required to reach user choice\n',count);
    