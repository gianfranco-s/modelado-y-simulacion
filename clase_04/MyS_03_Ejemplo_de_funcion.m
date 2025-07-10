
function [t,y] = tank2(tfinal,yo,ye);
% tfinal:  tiempo final
% yo:      nivel inicial
% ye:      objetivo o referencia


clf
k = 0.3;
A = 1;

% u = @(y)   .1*(ye-y)
dy = @(t,y) -k*y/A + .1*(ye-y)/A;

[t,y] = ode23(dy,[0,tfinal],0);
plot(t,y)
grid

 