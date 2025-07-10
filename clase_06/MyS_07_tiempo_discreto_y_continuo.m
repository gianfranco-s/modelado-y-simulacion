clc;
clear all;

su = tf(1,[1 3]);



Ts = 0.01;
zu = c2d(su,Ts,'matched')
% el tercer argumento es el modo de conversión:
% zoh
% tustin
% matched
su2 = d2c(zu,'matched')

zu2 = tf(1,[1 3],Ts)

