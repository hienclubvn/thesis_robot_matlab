load getResponePIDGain_setpoit_10_RADs_NEW.mat
wL = out.ScopeData2.signals(1).values(:,1);
wR = out.ScopeData2.signals(1).values(:,1);

figure
subplot(211)
hold on
plot(tout,wL_R,'r');
plot(tout,wL,'b.-');
hold off
subplot(212)
hold on
plot(tout,wR_R,'r');
plot(tout,wR,'b.-');
hold off

figure
temp1 = wL_R(1:300);
plot(temp1);

figure
temp2 = wL_R(200:498)
mu = mean(temp2)*ones(length(temp2),1);
hold on
plot(temp2)
plot(mu)
hold off

pd = fitdist(temp2,'Normal')