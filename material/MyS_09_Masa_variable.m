%%
fa = @(t) 10*(1+exp(-.1*t)); % ecuación de masa variable
dfa = @(t) -exp(-.1*t); % derivada de la masa variable
fu = @(t) sin(pi*t/16); % excitación del sistema
tfinal = 250;

%%

ro = 0.3;% coef de amortiguamiento
kr = .2;
Ts = 0.01;

B = [0 
     1];
 
xo = [0 ; 
      0];

%%  
dx = @(t,x) [0    1 ;-kr/fa(t)  -(dfa(t)+ro)/fa(t)]*x+B*fu(t)/fa(t);
[t,x] = ode23(dx,[0:Ts:tfinal],xo);

%%
clf;

plot(t,x);grid
legend('posición','velocidad')
pause
close
plot(t,fa(t))
pause
close