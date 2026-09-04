% Modelos y Simulación
% Tema: utilización de funciones -- func
% Autor: Gianfranco Salomone

function [z, y, dy] = mys_clase_01b_func(t_start, t_end, t_step)

  z = t_start : t_step : t_end;
  y = z + sin(z);
  dy = gradient(y, t_step);
 
end
