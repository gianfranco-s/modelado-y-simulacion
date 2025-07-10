
function [t,y] = MyS_02_tank1_func(u,tfinal,y0)
% Modelos y Simulación
% Clase 02
% Ejemplo de función

% Argumentos:
% u:       control
% tfinal:  tiempo final
% y0:      nivel inicial



clf  % Limpia la figura abierta
k = 0.3;
A = 1;

% Defino la función, primero la var indep, luego la dependiente.
dy = @(t,y) -k*y/A + u/A;

% Se guarda en las variables t e y los valores de la resolución numérica de
% la ecuación diferencial.
[t,y] = ode23(dy,[0,tfinal],y0);
plot(t,y)
title('Respuesta de y(t)');
xlabel('Tiempo [seg]');
ylabel('Nivel del tanque [m]');
grid

end

 