close all
tout = out.tout;
N = length(tout);
M = length(out1.tout)
M == N % Check length
poseX = out.ScopeData.signals(1).values;
poseY = out.ScopeData.signals(2).values;  
poseTheta = out.ScopeData.signals(3).values;
% v,w current of Robot 
v = out.ScopeData1.signals(1).values;
w = out.ScopeData1.signals(2).values;

%wL, wR
wL = out.ScopeData2.signals(1).values;
wR = out.ScopeData2.signals(2).values;

pose =[poseX poseY]';%col2row

%Load Mo phong
%1. Vong tron: Ts = 12.5665
pose_sim = out1.simout2.Data(:,1:3)';
%pose_sim = [[0;0;0] pose_'];
%%
figure('Name','Compare Trajectory Robot vs Simulink')
hold on
plot(pose(1,1),pose(2,1),'go', ...
     pose(1,end),pose(2,end),'ro', ...
     pose(1,:),pose(2,:),'r-');
%phan mo phong
plot(pose_sim(1,1),pose_sim(2,1),'go', ...
     pose_sim(1,end),pose_sim(2,end),'bo', ...
     pose_sim(1,:),pose_sim(2,:),'b-');
%axis equal
title('Compare Trajectory Robot vs Simulink');
xlabel('X [m]')
ylabel('Y [m]')
legend('Start','End','RobotAGV','Start1','End1','ModelSIM')
hold off


figure('Name', 'Measurements Signal Response from Robtot');
subplot(3,1,1);
hold on;
plot(tout, wL, 'r');
plot(tout, wR, 'b');
title('\omega  Wheel velocity angular of Robot');
ylabel('[rad/s]');
legend('w_L', 'w_R')

subplot(3,1,2);
hold on;
plot(tout, v, 'r');
plot(tout, w, 'b');
title('Velocity of Robot');
ylabel('[m/s],[rad/s]');
legend('v [m/s]', 'w [rad/s]')
subplot(3,1,3);
hold on;
plot(tout, poseTheta, 'r');
title('\theta Theta (Yaw) of Robot');
%xlabel('\theta Theta')
ylabel('[rad/s]')
legend('\theta Robot')
%%

%So sanh toc do dap ung cua Robot va` Yaw

theta_sim = out1.simout2.Data(:,3)';
v_sim = out1.simout2.Data(:,4)';
w_sim = out1.simout2.Data(:,5)';
wL_sim = out1.simout2.Data(:,6)';
wR_sim = out1.simout2.Data(:,7)';
%%
figure ('Name', 'Response Velocity angular of Wheel [rad/s] vs Simulink');
subplot(2,1,1);
hold on;
plot(tout, wL_sim, 'b');
plot(tout, wL, 'r');
title('Compare wL [rad/s] Robot vs Simulink');
ylabel('[rad/s]');
legend('w_LSIM','w_LRobot')

subplot(2,1,2);
hold on;
plot(tout, wR_sim, 'b');
plot(tout, wR, 'r');
title('Compare wR [rad/s] Robot vs Simulink');
ylabel('[rad/s]');
legend('w_RSIM','w_RRobot')
%%
figure ('Name', 'Compare Response beetwen Robot vs Simulink');
subplot(311);
hold on;
plot(tout, v_sim, 'b');
plot(tout, v, 'r');
title('Compare v - velocity of Robot [m/s] vs Simulink');
ylabel('[m/s]');
legend('v SIM','v Robot')

subplot(312);
hold on;
plot(tout, w_sim, 'b');
plot(tout, w, 'r');
title('Compare w - velocity Angular of Robot [rad/s] vs Simulink');
ylabel('[rad/s]')
legend('w SIM','w Robot')

subplot(313);
hold on;
plot(tout, theta_sim, 'b');
plot(tout, poseTheta, 'r');
title('Compare \theta Theta angular (Yaw) of Robot vs Simulink');
%xlabel('\theta Theta')
ylabel('[rad]')
legend('\theta SIM', '\theta Robot')
%%
%kiem tra cac diem cuoi
%x | y | theta
endPoint        = [poseX(end) poseY(end) poseTheta(end)]
endPointSim     = [pose_sim(1,end) pose_sim(2,end) pose_sim(3,end)]
endPointError   = abs(endPoint - endPointSim)
