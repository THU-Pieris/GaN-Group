clc,clear;
%%
V_in = 400;
V_out = 48;
C = 470e-6;
L = 50*1e-4;
P = 400;
ratio = 0.8;
R_load = V_out*V_out/ratio/P;
% Cr = 43.5e-9;
% Lr = 6.47e-6;
% Lm = 97e-6;
Cr = 66e-9;
Lr = 10e-6;
Lm = 100e-6;
C_oss = 270e-12;
fm = 1/2/pi/sqrt((Lr+Lm)*Cr);
fr = 1/2/pi/sqrt(Lr*Cr);
f = fr;
n = floor(400/48);
Req = n * n * R_load;
Q_present = sqrt(Lr / Cr) / Req;
%%
U_trgt = 48;
P_u = 5;
I_u = 10;
Uo = 1/n*1*0.3*V_in;
%%
lamda = Lm / Lr;
Req = n * n * R_load;
%Q = sqrt(Lr / Cr) / Req;
Q = [0.1,0.2,0.3,0.5,1,2];
f_plot = linspace(0,2*fr,1000)./fr;
figure(1);
hold on
for i = 1:6
    M = 1./sqrt((1+1/lamda*(1-1./f_plot.^2)).^2 + (Q(i)*(f_plot-1./f_plot)).^2);
    plot(f_plot,M);
end
ylabel('ֱ������M(f_n)');
xlabel('��һ��Ƶ�� f_n');
legend('Q = 0.1','Q = 0.4','Q = 1','Q = 2','Q = 10');
title('ȫ��LLCг��任����������','FontSize',12);
hold off;
%%
Curr = voltage.Data;
Time = voltage.Time;
Vol = tri.Data;%3e-6~12e-6
yyaxis left
bgn = 44001;
stp = 45501;
plot(voltage.Time(bgn:stp),Curr(bgn:stp),'b');
axis([voltage.Time(bgn),Time(stp),-50,450]);
%legend('���عܳ��ܵ�ѹ��V��');
ylabel('��ѹ��V��')
yyaxis right
bgn = 45057;
stp = 46593;
plot(tri.Time(bgn:stp),Vol(bgn:stp),'r');
axis([tri.Time(bgn),tri.Time(stp),-0.5,1.5]);
legend('���عܳ��ܵ�ѹ','�����ź�','FontSize',12);
ylabel('�����ź�');
title('���ع�ZVS����','FontSize',12);
xlabel('ʱ�䣨s��');
%%
Curr = current_s.Data;
Vol = voltage_s.Data;%3e-6~12e-6
yyaxis left
bgn = 53501;
stp = 55001;
plot(current_s.Time(bgn:stp),Curr(bgn:stp),'b');
axis([current_s.Time(bgn),current_s.Time(stp),-2,12]);
%legend('���عܳ��ܵ�ѹ��V��');
ylabel('��ѹ��V��')
yyaxis right
bgn = 53501;
stp = 55001;
plot(voltage_s.Time(bgn:stp),Vol(bgn:stp),'r');
axis([voltage_s.Time(bgn),voltage_s.Time(stp),-55,5]);
legend('�����ܳ��ܵ�ѹ','�����ź�','FontSize',12);
ylabel('�����ź�');
title('PFC������ZCS����','FontSize',12);
xlabel('ʱ�䣨s��');