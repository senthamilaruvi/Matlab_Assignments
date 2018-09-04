%part struct
part(3) = struct('partno',106,'quantity',20,'costper',7.5000);
part(2) = struct('partno',142,'quantity',1,'costper',150);
part(1) = struct('partno',123,'quantity',4,'costper',33);
for i = 1:length(part)
    disp(part(i))
end
