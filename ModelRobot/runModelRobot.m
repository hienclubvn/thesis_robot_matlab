close all
%clear all
addpath(genpath('D:\STUDY\LVTHS_NEW\mobile-robotics-simulation-toolbox-master'))

R = 0.0625;
L = 0.37;
sampleTime = 0.005;

%sim ModelRobot.slx

pose = out1.simout.Data';   %col2row
pose1 = out1.simout1.Data';
%% Display results

figure
hold on
plot(pose(1,1),pose(2,1),'ro', ...
     pose(1,end),pose(2,end),'go', ...
     pose(1,:),pose(2,:),'b-');
pose = pose1;
plot(pose(1,1),pose(2,1),'ro', ...
     pose(1,end),pose(2,end),'go', ...
     pose(1,:),pose(2,:),'b-');
axis equal
title('Vehicle Trajectory');
xlabel('X [m]')
ylabel('Y [m]')
legend('Start','End','Trajectory','Start1','End1','Trajectory1')
hold off
%%

