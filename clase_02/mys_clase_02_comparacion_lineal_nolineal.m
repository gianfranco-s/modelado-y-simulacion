% Modelos y Simulación
% Tema: comparación lineal vs no-lineal
% Autor: Gianfranco Salomone
 
clc;
clear all;
clf;
 
% Inicialización de variables:
R = 1;
C = 1;
r = 1;

% Valores iniciales:
theta_0 = 10;
theta_amb_0 = 20;
e_0 = 1;
e_t = 1;  % si e_t es aproximadamente igual a e_0, el modelo linealizado es válido

% -------------------------------- Modelo linealizado --------------------------------
AA = [-1/(R*C)];
BB = [1/(R*C) 2*e_0/(C*r) -e_0^2/(r*C) ];
CC = [1];
DD = 0;

sys = ss(AA, BB, CC, DD);

% Respuesta al escalón
% step(sys);
% Respuesta a CI
% initial(sys, [theta_0]);

% Análisis con condiciones iniciales
t  = 0:0.1:5;                            % time vector
u1 = theta_amb_0 * ones(size(t));        % constant ambient
u2 = e_0     * ones(size(t));            % constant e
u3 = ones(size(t));                      % the bias‑augment “1”
U  = [u1; u2; u3]';                      % size: length(t)×3

x0 = [theta_0];             % your actual initial state
y = lsim(sys, U, t, x0);
plot(t, y, 'b-', 'LineWidth', 0.5);
xlabel('t (s)'); ylabel('y(t)');
title('Response with custom inputs and nonzero bias');


% -------------------------------- Modelo no-lineal --------------------------------
AA_nl = [-1/(R*C)];
BB_nl = [1/(R*C) 1/(C*r)];
CC_nl = [1];
DD_nl = 0;

sys_nl = ss(AA_nl, BB_nl, CC_nl, DD_nl);

% Análisis con condiciones iniciales
t  = 0:0.1:5;                            % time vector
u1 = theta_amb_0 * ones(size(t));        % constant ambient
u2 = e_t^2     * ones(size(t));          % constant e
U  = [u1; u2]';                          % size: length(t)×2

x0 = [theta_0];             % your actual initial state
y_nl = lsim(sys_nl, U, t, x0);
hold on;
plot(t, y_nl, 'k-', 'LineWidth', 0.5);
xlabel('t (s)'); ylabel('y(t)');
title('Response with custom inputs and nonzero bias');
hold off;