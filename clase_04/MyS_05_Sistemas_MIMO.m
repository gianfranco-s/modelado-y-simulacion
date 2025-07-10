clear all;
clc;


s1 = tf(1,[1 2]);
s2 = tf(3,[1 4]);
s3 = tf(5,[1 6]);
s4 = tf(7,[1 8]);

% Simulación
t = 0:.1:10;
t = t';
u1 = exp(-t/5);
u2 = sin(pi*t).*u1;
u12 = [u1,u2];

'Serie de dos SISO:';
S12 = series(s1,s2)
figure(1)
% Salida del sistema S12 ante la entrada u1:
y1 = lsim(S12,u1,t);

% Salida del sistema S12 ante la entrada u2:
y2 = lsim(S12,u2,t);
plot(t,y1,t,y2);
title('Sistema SISO');


% clc;
'Dos entradas y una salida (MISO)';
Sist_2ent_1sal = tf({[1] [3]},{[1 2] [1 4]})
% produce un sistema cuya salida es
% Y = s1*U1 + s2*U2
% Es la salida de un sumador.

figure(2)
y3 = lsim(Sist_2ent_1sal,u12,t);
plot(t,y3);
title('Sistema MISO');
% pause;


% clc;
'Una entrada y dos salidas';
Sist_1ent_2sal = tf({[5];[7]},{[1 6];[1 8]})
% produce un sistema cuya salida es
% Y1 = s3*U
% Y2 = s4*U
% Son dos bloques en paralelo.
% pause;

figure(3)
title('Sistema SIMO');
% Salida del SIMO frente a u1
y4 = lsim(Sist_1ent_2sal,u1,t);
subplot(2,1,1)
plot(t,y4)

% Salida del SIMO frente a u2
y5 = lsim(Sist_1ent_2sal,u2,t);
subplot(2,1,2)
plot(t,y5)


