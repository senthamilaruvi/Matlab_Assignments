%Carnot efficiency
Tc = input('Enter the cold temperature of carnot engine:');
Th = input('Enter the hot temperature of carnot engine:');
if Tc <= 0 || Th <=0
    display('Input is invalid')
elseif Tc > Th
    temp = Tc;
    Tc = Th;
    Th = temp;
else
    Eff = (1- (Tc/Th));
    fprintf ('The carnot efficiency is %-2.3f\n',Eff);
end

