% Modelos y Simulación
% Tema: Control de posición de una antena
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


% Determinación de función transferencia
% ------------- Método 1: uso de `s` como símbolo -------------
s = tf("s");
vel_antena_tf = N*kt/ ((Jeq*s + beq)*(La*s + Ra) + kt*kb);
pos_antena_tf = (1/s) * vel_antena_tf;


% ------------- Método 2: reducción usando comandos -------------
% Para reducir el diagrama en bloques, es necesario "saltar" el puntode realimentación
% Reducción usando instrucciones de bloques
tf_mec_mot = tf(1, [Jm bm]) * N;
tf_mec_L = N * tf([JL bL], 1);
tf_mec_eq = feedback(tf_mec_mot, tf_mec_L);

tf_elec = tf(1, [La Ra]);
tf_cadena_directa = series(series(tf_elec, kt), tf_mec_eq);

retroalim_interna = kb/N;

vel_antena_tf_metodo2 = feedback(tf_cadena_directa, retroalim_interna);
pos_antena_tf_metodo2 = tf(1, [1 0]) * vel_antena_tf_metodo2;

vel_antena_tf
pos_antena_tf
vel_antena_tf_metodo2
pos_antena_tf_metodo2


t = 0:.01:5;

vel_antena = step(vel_antena_tf, t)
pos_antena = step(pos_antena_tf, t)

figure(1)
subplot(2, 1, 1)
plot(t, vel_antena)
ylabel("Velocidad angular (rad)")

subplot(2, 1, 2)
plot(t, pos_antena)
ylabel("Posición angular (rad)")
xlabel("tiempo (seg)")
