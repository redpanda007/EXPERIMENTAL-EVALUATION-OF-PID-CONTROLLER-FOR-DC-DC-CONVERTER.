clear all
clc
Vg = 48;
R = 10;
L = 97.5e-6;
C = 100e-6;
D = 0.375;

% PLANT
Np = [0 0 Vg/C*L];
Dp = [1 1/R*C 1/L*C];

Gp = tf(Np,Dp);
subplot(3,1,1),rlocus(Gp);

%PI CONTROLLER
Kp = 1.89;
Ki = 1.26;
Kd = 0.7;
Nc = [Kd Kp Ki];
Dc = [0 1 0];

Gc = tf(Nc,Dc);

Ns = [(Vg*Kd)/(L*C) (Vg*Kp)/(L*C) (Vg*Ki)/(L*C)];
Ds = [1 1/R*C 1/L*C 0];
Gsol = tf(Ns,Ds);
%subplot(3,1,1),rlocus(Gsol);
% Closed loop TF

ns = [(Vg*Kd)/(L*C) (Vg*Kp)/(L*C) (Vg*Ki)/(L*C)];
ds = [1 (L+(R*Vg*Kd))/(R*L*C) (1+Vg*Kp)/(L*C) (Vg*Ki)/(L*C)];


Gscl = tf(ns,ds);
subplot(3,1,2),rlocus(Gscl);
subplot(3,1,3),step(Gscl);

