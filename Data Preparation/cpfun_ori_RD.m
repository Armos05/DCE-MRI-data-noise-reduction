%% Function for generating GTKM data
%%% Developer: Anup and Rakshit@MedImg-IITD
%%% Ref: Parker G, MRM 2006. 'Experimentally-Derived Functional Form for a Population-Averaged....'

function [ Cp ] = cpfun_ori_RD(T)
 
global B tc a1 a2 m1 m2 sgm1 sgm2 mu1 mu2 
  Cp = B*exp(-m1*T)./(1+exp(-m2*(T-tc))) + ...
     (a1/(sgm1*sqrt(2*pi)))*exp(-((T-mu1)./(sgm1*sqrt(2))).^2) + ...
     (a2/(sgm2*sqrt(2*pi)))*exp(-((T-mu2)./(sgm2*sqrt(2))).^2);
end
