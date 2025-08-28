% Modelos y Simulación
% Tema: Respuesta discreta desde G y Gd (sin espacio de estados)
% Ecuación: dy/dt + 2 y = u(t),  u(t)=1,  y(0)=10

clc; clearvars; clf;

% --- Parámetros de simulación
y0 = 10;
t_end = 5;          % horizonte
muestras = 21;      % cantidad de muestras (>=2)
Ts = t_end/(muestras-1);
t  = 0:Ts:t_end;    % tiempos discretos
u  = ones(size(t)); % escalón unitario

% --- Modelo continuo y su versión discreta (ZOH)
G  = tf(1,[1 2]);          % Y(s)/U(s) = 1/(s+2)
Gd = c2d(G, Ts, 'zoh');    % Discretización ZOH

% --- Respuesta forzada DISCRETA (CI = 0) con el Gd
y_forzada_d = lsim(Gd, u, t);

% --- Respuesta libre DISCRETA (u=0) sin usar estados
Ad = exp(-2*Ts);                   % e^{-2 Ts}
k  = 0:numel(t)-1;
y_libre_d = y0 * (Ad.^k);          % y[k] = y0 * (e^{-2Ts})^k

% --- Respuesta total por superposición
y_total_d = y_forzada_d(:) + y_libre_d(:);

% --- (Opcional) referencia continua analítica para visualizar
t_cont = linspace(0, t_end, 1000);
y_cont = y0*exp(-2*t_cont) + 0.5*(1 - exp(-2*t_cont));  % solución exacta

% --- Gráfica
stem(t, y_total_d, 'filled', 'DisplayName','Discreto (Gd): y_f + y_l'); hold on;
plot(t_cont, y_cont, 'k--', 'LineWidth',1.2, 'DisplayName','Continuo exacto');
grid on; box off;
xlabel('t [s]'); ylabel('y');
title(sprintf('Respuesta discreta (Ts=%.3g s) por superposición desde Gd', Ts));
legend('Location','Best');
