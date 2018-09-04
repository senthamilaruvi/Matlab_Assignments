% script that reads datas from a file and plot it in graph
load datafile.dat;
y = zeros(size(datafile));
[r c] = size(datafile);
x = 1:c;
for i = 1:r
    for j = 1:c
    y(i,j) = datafile(i,j);
    subplot(1,c,i);
    plot(x,y,'g-');
    xlabel('row');
    ylabel('y');
    title('Ploting from datafile');
    end
end

