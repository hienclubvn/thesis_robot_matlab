pwm = double(out.ScopeData.signals(1).values); %pwm
enc_left = double(out.ScopeData.signals(2).values(:,1));   %enc_left
enc_right = double(out.ScopeData.signals(2).values(:,2));   %enc_right
% plot(out.tout,pwm,'r',out.tout,enc_left,'b');
% legend('pwm','enc-left')
%ident