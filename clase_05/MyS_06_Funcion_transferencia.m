% Un método para armar una FT:

s = tf('s');

G = 1/(s+3);
H = (s+1)/(s^2+2*s+5);
B = 5/s;
% Para definir una serie:
G*H




% Para realizar una suma en paralelo:
%              +------+
% U1 --------->|  G   |-----+
%              +------+     |
%                           +--> Y
%              +------+     |
% U2 --------->|  H   |-----+
%              +------+
% Y = G*U1+H*U2
% Se puede definir entones el producto
% Y = [G  H][ U1 
%             U2 ]
% Entonces
P = [ G  H ];

% Las entradas al sistema P deberán ser dos columnas con igual cantidad
% de filas como elementos tenga el vector de tiempo.


% --------------
% Para hacer un sistema de la siguiente forma
% Y1 = H11*U1+H12*U2
% Y2 = H21*U1+H22*U2

M = [H11 H12 ; H12  H22]



t = 0:3;
u1 = [1 2 3 4]';
u2 = [1 2 3 4]';


% Dibujar todas las salidas con lsim

para1 = tf(10,[1 7]);
para2 = [H;G];

y = lsim(para1,[u1 u2],t)

y2 = lsim(para2,u1,t)

step(para2)

A = 10/(s^2+.1*s+5);

step(A)