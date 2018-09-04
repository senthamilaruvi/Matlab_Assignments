% Converting Degeree to DMS(Degeree, minute and seconds
function [deg, min, sec] = dms(degeree)
deg = fix((degeree));
min = fix(((degeree - deg))* 60);
sec = ceil((degeree -(deg + (min/60)))*3600);
end

