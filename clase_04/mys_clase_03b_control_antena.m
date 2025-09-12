% Modelos y Simulación
% Tema: Respuesta a lazo cerrado
% Autor: Gianfranco Salomone
 
clc;
clearvars;

% Constantes del motor
Ra = 1; La = 0.05;
kb = 0.9; kt = kb;

Jm = 0.4; bm = 0.005;
JL = 4; bL = 0.5;

% N < 1 indica que el torque realizado por la antena ejerce menor
%       efecto sobre el torque que realiza el motor
N = 1/333;  % tren de engranajes
Jeq = Jm+N^2*JL;
beq = bm+N^2*bL;

s = tf("s");
vel_antena = N*kt/ ((Jeq*s + beq)*(La*s + Ra) + kt*kb);
pos_antena = (1/s) * vel_antena;

%------------------- Realimentación -----------------

% Prueba para varios valores de kp:
kp = [1  30  70  100];
M1 = feedback(kp(1) * pos_antena, 1);
M2 = feedback(kp(2) * pos_antena, 1);
M3 = feedback(kp(3) * pos_antena, 1);
M4 = feedback(kp(4) * pos_antena, 1);

t = 0:.01:50;
Y1 = step(M1, t);
Y2 = step(M2, t);
Y3 = step(M3, t);
Y4 = step(M4, t);

figure(1)
subplot(2,1,1)
plot(t, Y1, t, Y2, t, Y3, t, Y4);

subplot(2,1,2)
hold on;
pzmap(M1)
pzmap(M2)
pzmap(M3)
pzmap(M4)
hold off;
