%load getEstimation_Pwm_250
%v_Robot = 0.5m/s && wL = 7 rad/s && wR = 9 rad/s at pwm = 250
%---------------------wLEFT---------------------------
tf1 = From input "pwm(udk)" to output "wLEFT":                                                                         
                             
  0.005571 (+/- 7.995e-05) z^-1                                             
  ------------------------------                                            
  1 - 0.8037 (+/- 0.002868) z^-1 
  
  [0.005571] [1 -0.8037]
  
 Sample time: 0.005 seconds    
 Fit to estimation data: 96.44% (stability enforced)                         
 FPE: 0.01465, MSE: 0.01459   
%---------------------wRIGHT---------------------------
 tf2 = From input "pwm(udk)" to output "wRIGHT":                                 
   0.007311 (+/- 0.00013) z^-1                                              
  ------------------------------                                            
  1 - 0.7937 (+/- 0.003738) z^-1 
  
  [0.007311] [1 -0.7937]
  Sample time: 0.005 seconds 
  Fit to estimation data: 95.63% (stability enforced)                         
  FPE: 0.03452, MSE: 0.03438     
  %---------------------End: getEstimation_Pwm_250---------------------------