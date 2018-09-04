%Creating vector M to N m and n are integers
M = input('Enter the integer M:');
N = input('Enter the integer N:');
if M > N
    temp = M;
    M = N;
    N = temp;
    vec = M:N;
    disp(vec);
else
    vec = M:N;
    disp(vec);
end

