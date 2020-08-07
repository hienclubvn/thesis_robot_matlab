% continuously display updating images from  for a 20 second duration
sub = rossubscriber('/odom');

tic;
i = 0;
while toc < 2
  img = receive(sub);
  i = i + 1;
end
i
 