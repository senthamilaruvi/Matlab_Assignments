function out = nexthour(time)
out = time +1;
if out < 12
display('next hour is out')
else
    out = 1;
    fprintf('The next hour is %-5d',out);
end

      
        
        