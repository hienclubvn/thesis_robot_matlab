%hiennd: 01/08/2020
%KF: ref: https://github.com/hienclubvn/Kalman-and-Bayesian-Filters-in-Python/blob/master/04-One-Dimensional-Kalman-Filters.ipynb
%    ref:: https://github.com/philbooks/Kalman-Filter-for-Beginners    
% One Dimensional Kalman Filters

function y = OneKalmanFilter(z)    
    %Init
    persistent x P Q R firstRun
    if isempty(firstRun)  
      Q = 0.1^2;    % variance of system (process)
      R = 1^2;    %variance of measurement
      x = 0.0;  %ax,ay,az,gx,gy,gx of IMU
      P =  1e4;   %variance of prior
      firstRun = 1;  
    end
    %--------For Kalman ------------------
    %----------predict
    x_ = x;     % mean of posterior
    P_ = P + Q; %variance of posterior
    %----------Update
    K = P_./(P_+R);          %Kalman Gain
    %K = Pp*H'*inv(H*Pp*H' + R);
    x = x_ + K*(z - x_);    % x = posterior;  (z - x_): residual
    P = (1-K)*P_;           % posterior variance
    
    %result
    y = x;
end