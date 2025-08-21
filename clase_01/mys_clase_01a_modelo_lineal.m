% Modelos y Simulación
% Tema: modelo lineal de nivel
% Autor: Gianfranco Salomone
 
clc;
clear all;

% U0:      acción externa  [m^3/s]
% tfinal:  tiempo final    [s]
% h0:      nivel inicial   [m]

% k:       cte de prop     [m^2/s] (se deduce!)
% C:       sección tanque  [m^2]

% Inicialización de variables:
U0 = 10;
tfinal = 50;
h0 = 4;

% Constantes del sistema:
k = 0.3;
C = 1;

% ---------------- Simulación con expresión analítica ----------------
t_analitica = 0:.1:50;

% Expresión analítica de la solución de la ecuación diferencial.
h_analitica = U0/k + (h0 - U0/k) * exp(-k*t_analitica/C);

figure(1);
plot(t_analitica, h_analitica);
title('Respuesta de h(t) (solución analítica)');
xlabel('Tiempo (s)');
ylabel('Nivel del tanque (m)');
 
grid;

% ---------------- Simulación numérica ----------------
% Se define la ecuación diferencial
% primero la var indep, luego la dependiente
dh = @(t,h) -k*h/C + U0/C  % Es una función paramétrica
 
% Es posible evaluar la función paramétrica
% para t = 3, h = 4
dh(3,4)

% Array de puntos que cumplen con la condición de la función paramétrica
tspan = [0, tfinal]
[t, h] = ode23(dh, tspan, h0);

% Gráfica de la función y, una vez resuelta la ecuación diferencial:
figure(2);
plot(t, h);
title('Respuesta de h(t) (solución numérica)');
xlabel('Tiempo (s)');
ylabel('Nivel del tanque (m)');
 
grid;
