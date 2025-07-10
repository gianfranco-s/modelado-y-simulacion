clc;
clear all;

% Parámetros del motor
R  = 1     ;
L  = 0.05  ;
J  = 0.4   ;
B  = 0.005 ;
Kb = 0.9   ;


tren_engranajes = 1/500;
Amplif = 100;

% Parámetro del control
kp = 1;



s1 = tf(1,[L R]);
s2 = Kb;
s3 = tf(1,[J B]);

s123 = series(series(s1,s2),s3);

motor = feedback(s123,s2);


s4 = Amplif*kp*tren_engranajes;
s5 = tf(1,[1 0]);

ser = series(series(s4,s5),motor);

% Sistema total
sistema_antena = feedback(ser,1)
% O bien:
cadena_directa = Amplif*tren_engranajes*series(s5,motor);
sistema_antena = feedback(kp*cadena_directa,1);


% Prueba para varios valores de kp:
kp = [1  30  70  100];
M1 = feedback(kp(1)*cadena_directa,1);
M2 = feedback(kp(2)*cadena_directa,1);
M3 = feedback(kp(3)*cadena_directa,1);
M4 = feedback(kp(4)*cadena_directa,1);

t = 0:.01:10;
Y1 = step(M1,t);
Y2 = step(M2,t);
Y3 = step(M3,t);
Y4 = step(M4,t);

plot(t,Y1,t,Y2,t,Y3,t,Y4);