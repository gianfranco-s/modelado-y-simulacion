clear all;
clc;

su = tf(10,[1 3 8]);

Ts = 0.1;

zu1 = c2d(su,Ts); % zero order hold

% Respuesta al escalón:
T = 0: Ts : 25;

% Respuesta de sist. continuo
ys = step(su,T);

% Respuesta del sist discreto
yz1 = step(zu1,T);

plot(T,ys,T,yz1)


pole(su) % polos del sist continuo
pole(zu1) % polos del sist discreto

% El método zoh preserva los polos:
exp(pole(su)*Ts)

% Vuelta de discreto a continuo:
% d2c(zu1)

% Otro método:
zu2 = c2d(su,Ts,'tustin') % 
yz2 = step(zu2,T);

plot(T,ys,T,yz1,T,yz2)

% Los polos se han modificado ligeramente:
pole(zu2)


% d2c(zu2) % devuelve la forma continua correspondiente a zoh
% para evitarlo:

d2c(zu2,'tustin')

% Otro
zu3 = c2d(su,Ts,'matched')

% Preserva la ganancia, polos y ceros
pole(zu3)


% pasado a SS
ssu = ss(su);


% ss en tiempo discreto
zz1 = c2d(ssu,Ts)

% otra manera de hacerlo
zz1 = ss(zu1)

% 
% transferencia discreta
% transferencia continua
% modelo de estados continuo
% modelo de estados discreto

% Se busca introducir una demora:
% sería: exp(s*Ts)
z = tf('z',Ts)

zu1d = series(zu1,z^-5)

yz1d =step(zu1d,T);

% hold on
plot(T+3,ys,T,yz1,T,yz2,T,yz1d)
% para mover el gráfico lo único que hace falta es sumarle
% un numerito a l tiempo del plot

% 
% el gráfico se movió en y unidades de z. En este caso,
% 5*Ts = 0.5


% Para generar retardo en tiempo continuo:
su1d = d2c(zu1d,'tustin')

% tira una banana con orden 7

s = tf('s');
co = 1+1/(5*s); % Control PI

close
suc = feedback(series(co,su),1)
ys = step(suc,T);
plot(T,ys)

% se agrega una variable de estados, dado que se agrega un polo
% po efecto del control PI

ssuc = ss(suc)

[a,b,c,d] = ssdata(ssu)