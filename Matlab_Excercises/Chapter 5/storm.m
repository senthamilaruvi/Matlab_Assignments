%Checking whether blizard conditions are met in a particular day
load stormtrack.dat
day = input('Enter the day to check stormtrack:');
    while stormtrack(day,1) > 30 && stormtrack(day,2) < 0.5 && stormtrack(day,3)
        display('There was a blizard on that day');
        day = input('Enter the day to check stormtrack:');
    end
display('There is no blizard');

        