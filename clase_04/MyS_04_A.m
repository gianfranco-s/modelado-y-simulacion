clc;
clear all;

su1 = tf([1],[1 3])

su2 = tf([2 5],[1 6 3])


s=tf('s')

su3 = (s+4)/(s^2+3*s+10)

su4 = zpk([],[-1 -3],10)

su5 = tf(su4)

pole(su3)
pole(su4)

su6 = zpk(su2)

po = [i -i -3 -4 0];

su7 = zpk([1],po,10)

whos

si12 = series(su1,su2)

sup12 = parallel(su1,su2)

ss2 = ss(su2)

ser = series(su1,ss2) % pone en serie una transferencia con un modelo de estados
tf(ser)

% Si hay realimentación unitaria:
scon = feedback((series(su1,su2)),1)


t = 0:.1:10;
u = sin(3*pi*t);
plot(t,u)

ys = lsim(su2,u,t);
plot(t,u,t,ys)