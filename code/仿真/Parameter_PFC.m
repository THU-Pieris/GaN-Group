clc,clear;
%% basic parameter
Vac = 220;
Vdc_trgt = 400;
V = 0;
f_ac = 50;
P = 400;
f_ctrl = 50000;
eita = 1;
%% L & C
I_peak = 1.414*P/Vac/eita;
delta_I = 0.3 * I_peak;
Duty = 0.7;
L = Duty*(1-Duty)*Vdc_trgt/delta_I/f_ctrl;
V_rpple = Vdc_trgt * 0.05;
C = I_peak/1.414*Vac*eita/(2*pi*f_ac*Vdc_trgt*V_rpple/2);
R_l = Vdc_trgt^2 / P/eita;
%%
%P_u = 0.5;
%I_u = 1;
P_u = 0.1;
I_u = 10;
%%
clear;
L = 3e-3;
T = 20000/150e6;
Ton = 5000/150e6;
D = Ton/T;
R = 1000;
R_dis = L*2/(D*(1-D)^2*T);
L_dis = R/2*D*(1-D)^2*T;
Continue = sign(L - R/2*D*(1-D)^2*T);
Vin = 2.7;
I_peak = Vin * Ton / L;
Gain = T/(T-Ton);
%% 
clear;
L = 3e-3;
Ton = 5000;
R = 1000;
V_in = 22*1.414;
V_out = 64;
Toff = V_in * Ton / (V_out - V_in); 
T = Toff + Ton;
D = Ton / T;
I_peak = V_in * Ton / L;
P_in = V_in * I_peak / 2;
P_out = V_out * I_peak / 2 * Toff / T;
%%
Rup = 4.3e6/2;
Rdown = 20e3/2;
Uin = 400;
Uout = Uin*Rdown/(Rup + Rdown);
R_filter = 100e3;
C_filter = 10e-9;
f = 1/(2*pi*R_filter * C_filter);
P = Uin^2 / Rup;
%%
clear;
L = 3e-3;
C = 30e-12*2*12;
Tao = sqrt(L*C)*150e6;  
add = 0;
t = linspace(pi/12,pi*5/12,100);
Uo = 50;
Uin = 22*1.414*sin(t);
I_peak = (Uo - Uin)*sqrt(C/L);
for i = 1:100
    if Uo > 2*Uin(i)
        temp(i) = acos(-Uin(i) / (Uo - Uin(i)));
        Tneg(i) = temp(i) * Tao+ add;
    else
        temp(i) = pi;
        Tneg(i) = temp(i) * Tao +add; 
    end
end
T = 2*pi*sqrt(L*C);
Udown = Uin - Uo + Uin;
figure(1);
plot(t,Tneg);