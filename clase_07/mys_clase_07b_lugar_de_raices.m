clc;
clearvars;

K = .1;

% roots([1 3 2 K])

M = tf(K, [1 3 2 K]);


G = K * tf(1, [1 3 2 0]);
MM = feedback(G, 1);

% pole(M)
pole(MM)


G_ldr = tf(1, [1 3 2 0]);
rlocus(G_ldr)