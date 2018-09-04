syms s a b c g C N1 N2 N3 Ro 'real'
s = a/sqrt(a^2+1);
c = 1/sqrt(a^2 +1);
a = sqrt((g/2)^2 +1) + (g/2);
C = [1 g 0; g (g^2 +1) 0; 0 0 1];
N1 = [c s 0];
N2 = [-s c 0];
N3 = [ 0 0 1];
Ro = [N1' N2' N3'];
Ro*C*Ro'