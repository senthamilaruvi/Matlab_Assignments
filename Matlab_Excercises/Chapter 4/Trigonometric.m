%Trigonometric function
x = input('Enter the value of x :');
choice = menu('Trigonometric function','Sin(x)','cos(x)','tan(x)');
if choice == 1
    fprintf('The sin(x) is %-4.3f\n',sin(x));
end
if choice == 2
    fprintf('The cos(x) is %-4.3f\n',cos(x));
end
if choice == 3
    fprintf('The tan(x) is %-4.3f\n',tan(x));
end
