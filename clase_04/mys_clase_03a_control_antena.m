% Modelos y Simulación
% Tema: Control de posición de una antena
% Autor: Gianfranco Salomone
 
clc;
clear all;

% Constantes del motor
Ra = 1; La = 0.05;
kb = 0.9; kt = kb;

Jm = 0.4; bm = 0.005;
JL = 4; bL = 0.5;
N = 1/333;  % tren de engranajes
Jeq = Jm+N^2*JL;
beq = bm+N^2*bL;

s = tf("s");
vel_antena = N*kt/ ((Jeq*s + beq)*(La*s + Ra) + kt*kb);
pos_antena = (1/s) * vel_antena;


kp = 1;
ki = 1;
control_integral = tf(ki, [1 0]);
control_proporcional = kp;

control_pi = parallel(control_integral, control_proporcional);
cadena_directa = series(control_pi, pos_antena);
lazo_cerrado = feedback(cadena_directa, 1)

step(lazo_cerrado)


% En menos pasos:
MM = feedback(tf([kp ki], [1 0]) * pos_antena, 1)
