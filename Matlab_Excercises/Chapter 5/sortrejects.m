% counting number of rejects
load pipedata.dat
[r c] = size(pipedata);
count = 0;
    for j = 1:c
        if  ((pipedata(1,j)  <= 10.3) || (pipedata(1,j) >= 10.4));
            count = count+1;
        elseif ((pipedata(2,j) <= 2.1) || (pipedata(2,j) >= 2.3));
            count = count+1;
        end
    end
  if count >= 1
  fprintf('The number of rejects is %d\n',count);
  else
  display('No rejects');
  end
  
    
    