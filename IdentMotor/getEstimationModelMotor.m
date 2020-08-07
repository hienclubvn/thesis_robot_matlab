%hiennd: CN, 02/08/2020
% Estimation Model System for DC Motor (Left + Right)

close all;
clear all;

%load getEstimation_Pwm_250
%load getEstimation_Pwm_900.mat
%load getEstimation_Pwm_Neg900.mat
%load getENCODER_PWM_500.mat  %v_Robot = 1.1m/s at pwm = 500
load getENCODER_PWM_250.mat   %v_Robot = 0.5m/s && wL = 7 rad/s && wR = 9 rad/s at pwm = 250
%load getENCODER_PWM_200.mat
%load getENCODER_PWM_150.mat
pwm = double(out.ScopeData.signals(1).values);  %pwm
wL  = double(out.ScopeData.signals(2).values);  %rad/s
wR  = double(out.ScopeData.signals(3).values);  %rad/s
tout = out.tout;
% ident
%----------------------------------------
figure('Name', ' Normal probability plot comparing the distribution of the data');
hold on;
axis(1) = subplot(2,2,1);
%histogram(wL)
histogram(wL,'Normalization','probability')
pdL = fitdist(wL,'Normal')
title('Histograms wL');
axis(1) = subplot(2,2,2);
normplot(wL)
title('Normal probability wL');


axis(1) = subplot(2,2,3);
%histogram(wR)
histogram(wR,'Normalization','probability')
pdR = fitdist(wR,'Normal')
title('Histograms wR');
axis(1) = subplot(2,2,4);
normplot(wR)
title('Normal probability wR');
hold off;

%Note PWM: 250 == 0.5m/s
    % LEFT:       mu =   7.10129 || sigma = 0.0205832
    % RIGHT:      mu =   8.86238 || sigma = 0.0847669
%Note PWM: 500
%    LEFT:    mu =   16.9378        [16.9361, 16.9394]
%             sigma = 0.0537814     [0.0526284, 0.0549865]
%    RIGHT:   mu =  18.6253         [18.6215, 18.6291]
%             sigma = 0.123034      [0.120397, 0.125791]
%Note PWM: 900
% pdL =  mu = 17.1164         [16.5951, 17.6377]
%        sigma = 16.8187      [16.4581, 17.1956]
% pdR =  mu = 17.7591         [17.2182, 18.3]
%        sigma = 17.4511      [17.077, 17.8422]

figure('Name', 'w - angular velocity (rad/s) LEFT vs RIGHT');
hold on;
axis(2) = subplot(2,2,1);
plot(tout,wL,'r')
title('wL - angular velocity (rad/s)');
axis(2) = subplot(2,2,2);
plot(tout,wR,'b')
title('wR - angular velocity (rad/s)');
axis(2) = subplot(2,2,[3,4]);
plot(tout,wL,'r', tout,wR,'b')
title('Compare Angular velocity wL vs wR');
legend('wL','wR')
hold off;


