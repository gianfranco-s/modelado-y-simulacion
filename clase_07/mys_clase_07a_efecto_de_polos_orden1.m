G1 = tf(1, [1 2]);
G2 = tf(3, [1 4]);
G3 = tf(5, [1 6]);


figure(1)
hold on;
step(G1)
step(G1*G2)
step(G1*G2*G3)
hold off;
legend()


%% Ejercicios adicionales (Mateo)
G4 = tf(1, [1 1 1]);
G5 = tf(1, [1 0]);  % Emmanuel


figure(2)
hold on;
step(G1)
step(G1*G4)
hold off;

%% Ejercicios adicionales (Emmanuel)
G5 = tf(1, [1 0]);  % Emmanuel

G123 = G1*G2*G3;
figure(3)
hold on;
step(G123)
step(G123 * G5)
hold off;

