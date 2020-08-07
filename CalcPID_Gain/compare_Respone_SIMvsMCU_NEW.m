%ref: Symbol: https://www.mathworks.com/matlabcentral/answers/14751-greek-alphabet-and-latex-commands-not-a-question
% close all;
% clear all;
%load getResponePIDGain_setpoit_10_RADs_NEW2_Origin.mat

wL_MCU = out.ScopeData.signals(2).values; %wL Left (MCU)
wR_MCU = out.ScopeData.signals(3).values; %wR Right (MCU)

out1 = sim ('CalcPID_Gain_MotorDC.slx')  %chay Simulink

wL_SIM = out1.ScopeData.signals(1).values(:,1); %wL Simulink
wR_SIM = out1.ScopeData.signals(1).values(:,1); %wR Simulink
tout = out1.tout;
% Tim` diem 0, de 2 data trung nhau ....
%-----------------------norm-LEFT----------------------------
for i=1:length(tout)
    if wL_MCU(i) > 0
        break
    end
end
% temp = wL_MCU(1:i-2) % lay den i-2
% wL_MCU_ = [wL_MCU(i-1:end); temp]
%fix-new
temp = wL_MCU(1:i-1) % lay den i-2
wL_MCU_ = [wL_MCU(i:end); temp]
%-----------------------norm-RIGHT----------------------------
for i=1:length(tout)
    if wR_MCU(i) > 0
        break
    end
end
%fix-new
% temp = wR_MCU(1:i-2) % lay den i-2
% wR_MCU_ = [wR_MCU(i-1:end); temp]
temp = wR_MCU(1:i-1) % lay den i-2
wR_MCU_ = [wR_MCU(i:end); temp]
%
figure('Name', 'Compare Response- angular velocity (rad/s) MCU vs SIMULINK');
subplot(321)
hold on
plot(tout,wL_SIM,'b-');
plot(tout,wL_MCU_,'r');
title('Compare w_LSIM vs w_LMCU');
legend('w_LSIM','w_LMCU')

subplot(323)
hold on
plot(tout,wR_SIM,'b-');
plot(tout,wR_MCU_,'r');
title('Compare w_RSIM vs w_RMCU');
legend('w_RSIM','w_RMCU')
subplot(325)
hold on
plot(tout,wL_MCU_,'b-');
plot(tout,wR_MCU_,'r');
title('Compare w_LMCU vs w_RMCU');
legend('w_LMCU','w_RMCU')
% tinh toan phan Error
subplot(322)
hold on
plot(tout,wL_SIM-wL_MCU_,'b-');
title('Error (w_LSIM - w_LMCU)');
subplot(324)
plot(tout,wR_SIM-wR_MCU_,'b-');
title('Error (w_RSIM - w_RMCU)');
hold on
subplot(326)
plot(tout,wL_MCU_-wR_MCU_,'b-');
title('Error (w_LMCU - w_RMCU)');
hold off


