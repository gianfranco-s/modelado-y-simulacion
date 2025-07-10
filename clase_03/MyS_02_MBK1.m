function [t,X] = MyS_02_MBK1(k,b,tfinal,u)

masa = 1;
M = [    0       1    ;
     -k/masa  -b/masa ]

 Q = [  0  ;
        1  ]

dX = @(t,X)  M*X + Q*u;

[t,X] = ode23(dX,[0,tfinal],[0,0]);