% Modelos y Simulación
% Tema: Simulación MBK 2GDL
% Autor: Gianfranco Salomone
 
clc;
clear all;
 
k2 = 3;
m2 = 5;

b12 = 6;
k12 = 2;

k1 = 7;
m1 = 4;

AA = [      0           1         0          0      ;
       -(k12+k1)/m1  -b12/m1  k12/m1      b12/m1   ;
           0           0         0          1      ;
        k12/m2    b12/m2   -(k2+k12)/m2  -b12/m2 ] ;

BB = [  0  ; 
        0  ;
        0  ;
      1/m2];

CC = [ 1  0  0  0 ;
      0  0  1  0 ];

DD = 0;

tt = 0:0.1:100;
sys = ss(AA, BB, CC, DD);
u = sin(tt);

[Y,t,X] = lsim(sys,u,tt);
plot(t,Y)
