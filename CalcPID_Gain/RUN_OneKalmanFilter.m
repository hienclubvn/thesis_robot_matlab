close all;
load getResponePIDGain_setpoit_10_RADs_NEW.mat
%du lieu tu mo phong
wL = out.ScopeData2.signals(1).values(:,1);
wR = out.ScopeData2.signals(1).values(:,1);
%
Nsamples = length(tout);

Xsaved = zeros(Nsamples, 1);
Zsaved = zeros(Nsamples, 1);

XRsaved = zeros(Nsamples, 1);
ZRsaved = zeros(Nsamples, 1);

for k=1:Nsamples
  zL = wL_R(k);
  xL = OneKalmanFilter(zL);
  Xsaved(k) = xL;
  Zsaved(k) = zL;
  %
  zR= wR_R(k);
  xR = OneKalmanFilter(zR);
  Xsaved(k) = xR;
  ZRsaved(k) = zR;
end

figure('Name', 'Compare Angular velocity (rad/s)');
axis(1) = subplot(211);
hold on
plot(tout, Zsaved,'r')% 'r:*') 
plot(tout, Xsaved, 'b')%'o-')
plot(tout,wL,'g.-');
title('Compare Angular velocity (rad/s)');
xlabel('Time (s)');
ylabel('w - Angular velocity (rad/s)');
legend('w_L-MCU ', 'w_L-MCU+KF', 'w_L-SIM');
axis(1) = subplot(212);
hold on
plot(tout,wL-Xsaved,'b');%'g.-');
title('Error wL-SIM vs wL-MCU (wL-wL-SIM)');
xlabel('Time (s)');
ylabel('Error (rad/s)');
hold off;

%------------------New KF---------------------
temp1 = wL_R(1:300);
temp2 = wR_R(1:300);

Nsamples = length(temp1);
xL = zeros(Nsamples, 1);
xR = xL;

for k=1:Nsamples
  z = temp1(k);
  x = OneKalmanFilter(z);
  xL(k) = x;
  %
  z = temp2(k);
  x_ = OneKalmanFilter(z);
  xR(k) = x_;
end

figure('Name', 'Kalman Filter Angular velocity (rad/s)');
axis(2) = subplot(211);
hold on
plot(temp1,'r')
plot(xL, 'b')
title('Motor LEFT, Angular velocity (rad/s)');
xlabel('Time (s)');
ylabel('w - Angular velocity (rad/s)');
legend('no-KF', '+KF');
%
axis(2) = subplot(212);
hold on
plot(temp2,'r')
plot(xR, 'b')
title('Motor RIGHT, Angular velocity (rad/s)');
xlabel('Time (s)');
ylabel('w - Angular velocity (rad/s)');
legend('no-KF', '+KF');
hold off
