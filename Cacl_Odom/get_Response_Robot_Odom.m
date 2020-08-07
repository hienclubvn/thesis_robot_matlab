poseX   = out.ScopeData.signals(1).values;
poseY   = out.ScopeData.signals(2).values;
poseYaw = out.ScopeData.signals(3).values;
yaw_IMU = out.ScopeData.signals(4).values;

v_robot = out.ScopeData1.signals(1).values;
w_robot = out.ScopeData1.signals(2).values;

tout = out.tout;
N = length(tout);   %6001

%kiem tra phan phoi Gauss
fd = fitdist(poseYaw,'Normal')
histogram(poseYaw,'Normalization','probability');
histogram(poseYaw)

%xem toc do cua Robot
mean(v_robot)
fd = fitdist(v_robot,'Normal')

figure
plot(v_robot)
figure
normplot(v_robot)
figure
histfit(v_robot)
figure
histogram(v_robot)

figure;
plot(poseX)
plot(poseY)
plot(poseYaw)
plot(yaw_IMU)
