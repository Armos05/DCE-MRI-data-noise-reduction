
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Variation in C_t values with changes in parameters:

%% orignal parameters K-trans, K_ep, v_p = [0.1,0.9,0.01]

% Change in K_trans
for k = 1:10
	plot(T, ctfun_ori_RD([0.02 + 2*(k-1)/100, 0.9, 0.01],T)), hold on;
	end
legend('0.02','0.04','0.06', '0.08', '0.1', '0.12', '0.14', '0.16', '0.18','0.2');
title('Variation in the C_t at different K_{trans} when K_{ep}, v_p = [0.9,0.01]');
xlabel('Time intervals'); 
ylabel('Concentration curve (C_t)'); 


%% Variation in K_ep
for k = 1:10
	plot(T, ctfun_ori_RD([0.1, 0.4 + (k-1)/10, 0.01],T)), hold on;
	end
legend('0.4','0.5','0.6', '0.7', '0.8', '0.9', '0.10', '0.11', '0.12','0.14');
title('Variation in the C_t at different K_{ep} when K_{trans}, v_p = [0.1,0.01]');
xlabel('Time intervals'); 
ylabel('Concentration curve (C_t)'); 


%% Variation in V_p
for k = 1:10
	plot(T, ctfun_ori_RD([0.1, 0.9, 0.004 + 2*(k-1)/1000 ],T)), hold on;
	end
legend('0.004','0.006','0.008', '0.01', '0.012', '0.014', '0.016', '0.018', '0.02','0.022');
title('Variation in the C_t at different v_{p} when K_{trans}, K_{ep} = [0.1,0.9]');
xlabel('Time intervals'); 
ylabel('Concentration curve (C_t)'); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CT curves for Gm and WM
figure, plot(T, Ct, T, 0.29.*ctfun_ori_RD([0.3,0.9,0.018],T));
legend('GM curve', 'WM curve');
title('Difference in the C_t curves between GM and WM region');
xlabel('Time intervals'); 
ylabel('Concentration curve (C_t)'); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot to show simulations of noise curves

% 5% Noise
for k = 1:5
	plot(T, Ct_noise_005(:,k)), hold on;
	end
title('5 Simulation of C_t with 5% noise');
xlabel('Time intervals'); 
ylabel('Concentration curve (C_t)'); 

% 10% Noise
for k = 1:5
	plot(T, Ct_noise_01(:,k)), hold on;
	end
title('5 Simulation of C_t with 10% noise');
xlabel('Time intervals'); 
ylabel('Concentration curve (C_t)'); 

% 20% Noise
for k = 1:5
	plot(T, Ct_noise_02(:,k)), hold on;
	end
title('5 Simulation of C_t with 20% noise');
xlabel('Time intervals'); 
ylabel('Concentration curve (C_t)'); 

% 30% Noise
for k = 1:5
	plot(T, Ct_noise_30(:,k)), hold on;
	end
title('5 Simulation of C_t with 30% noise');
xlabel('Time intervals'); 
ylabel('Concentration curve (C_t)'); 

% 35% Noise
for k = 1:5
	plot(T, Ct_noise_35(:,k)), hold on;
	end
title('5 Simulation of C_t with 35% noise');
xlabel('Time intervals'); 
ylabel('Concentration curve (C_t)'); 

% 40% Noise
for k = 1:5
	plot(T, Ct_noise_40(:,k)), hold on;
	end
title('5 Simulation of C_t with 40% noise');
xlabel('Time intervals'); 
ylabel('Concentration curve (C_t)'); 

% 50% Noise
for k = 1:5
	plot(T, Ct_noise_50(:,k)), hold on;
	end
title('5 Simulation of C_t with 50% noise');
xlabel('Time intervals'); 
ylabel('Concentration curve (C_t)'); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure, plot(T, Ct, T, ctfun_ori_RD(transpose(p_Noise_02(:,1)),T), T, ctfun_ori_RD([0.09354,0.816159,0.011993],T));
legend('True curve', 'Fitted noise curve', 'Fitted denoised curve');
title('Impact of denoising');
xlabel('Time intervals'); 
ylabel('Concentration curve (C_t)'); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PYTHON
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Saving Data from python into matlab

Tt10 = readtable('Tsmoothie_10_n.csv');
At10 = table2array(Tt10);

Tw10 = readtable('Wavelet_10_n.csv');
Aw10 = table2array(Tw10);

Tt20 = readtable('Tsmoothie_20_n.csv');
At20 = table2array(Tt20);

Tw20 = readtable('Wavelet_20_n.csv');
Aw20 = table2array(Tw20);

Tt30 = readtable('Tsmoothie_30_n.csv');
At30 = table2array(Tt30);

Tw30 = readtable('Wavelet_30_n.csv');
Aw30 = table2array(Tw30);

Tt35 = readtable('Tsmoothie_35_n.csv');
At35 = table2array(Tt35);

Tw35 = readtable('Wavelet_35_n.csv');
Aw35 = table2array(Tw35);

Tt40 = readtable('Tsmoothie_40_n.csv');
At40 = table2array(Tt40);

Tw40 = readtable('Wavelet_40_n.csv');
Aw40 = table2array(Tw40);

Tt50 = readtable('Tsmoothie_50_n.csv');
At50 = table2array(Tt50);

Tw50 = readtable('Wavelet_50_n.csv');
Aw50 = table2array(Tw50);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calclating the sum of squred errors:

err_n_10 = 0;
err_n_20 = 0;
err_n_30 = 0;
err_n_35 = 0;
err_n_40 = 0;
err_n_50 = 0;

err_t_10 = 0;
err_t_20 = 0;
err_t_30 = 0;
err_t_35 = 0;
err_t_40 = 0;
err_t_50 = 0;

err_w_10 = 0;
err_w_20 = 0;
err_w_30 = 0;
err_w_35 = 0;
err_w_40 = 0;
err_w_50 = 0;


for k = 1:100

av = immse(Ct, Ct_noise_01(:,k));
bv = immse(Ct, Ct_noise_02(:,k));
cv = immse(Ct, Ct_noise_30(:,k));
dv = immse(Ct, Ct_noise_35(:,k));
ev = immse(Ct, Ct_noise_40(:,k));
fv = immse(Ct, Ct_noise_50(:,k));

gv = immse(Ct, At10(2:158,k+1));
hv = immse(Ct, At20(2:158,k+1));
iv = immse(Ct, At30(2:158,k+1));
jv = immse(Ct, At35(2:158,k+1));
kv = immse(Ct, At40(2:158,k+1));
lv = immse(Ct, At50(2:158,k+1));

mv = immse(Ct, Aw10(2:158,k+1));
nv = immse(Ct, Aw20(2:158,k+1));
ov = immse(Ct, Aw30(2:158,k+1));
pv = immse(Ct, Aw35(2:158,k+1));
qv = immse(Ct, Aw40(2:158,k+1));
rv = immse(Ct, Aw50(2:158,k+1));

err_n_10 = err_n_10 + av;
err_n_20 = err_n_20 + bv;
err_n_30 = err_n_30 + cv;
err_n_35 = err_n_35 + dv;
err_n_40 = err_n_40 + ev;
err_n_50 = err_n_50 + fv;

err_t_10 = err_t_10 +gv;
err_t_20 = err_t_20 +hv;
err_t_30 = err_t_30 +iv;
err_t_35 = err_t_35 +jv;
err_t_40 = err_t_40 +kv;
err_t_50 = err_t_50 +lv;

err_w_10 = err_w_10 +mv;
err_w_20 = err_w_20 +nv;
err_w_30 = err_w_30 +ov;
err_w_35 = err_w_35 +pv;
err_w_40 = err_w_40 +qv;
err_w_50 = err_w_50 +rv;

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 5 curve average of Tsmoothie and Wavelet Denoised to further reduce noise
	

%% Fitting Parameters in our Denoised Curves:
 p_Denoise_10 = zeros(3,100);
 p_Denoise_20 = zeros(3,100);
p_Denoise_30 = zeros(3,100);
 p_Denoise_35 = zeros(3,100);
 p_Denoise_40 = zeros(3,100);
p_Denoise_50 = zeros(3,100);
 
 T = squeeze(T);
 for k = 1:100
	p_Denoise_10(:,k) = lsqcurvefit(@ctfun_ori_RD,p0,T,Tsmoothie_10_n_avg(:,k),LB,UB);
	p_Denoise_20(:,k) = lsqcurvefit(@ctfun_ori_RD,p0,T,Tsmoothie_20_n_avg(:,k),LB,UB);
	p_Denoise_30(:,k) = lsqcurvefit(@ctfun_ori_RD,p0,T,Tsmoothie_30_n_avg(:,k),LB,UB);
	p_Denoise_35(:,k) = lsqcurvefit(@ctfun_ori_RD,p0,T,Tsmoothie_35_n_avg(:,k),LB,UB);
	p_Denoise_40(:,k) = lsqcurvefit(@ctfun_ori_RD,p0,T,Tsmoothie_40_n_avg(:,k),LB,UB);
	p_Denoise_50(:,k) = lsqcurvefit(@ctfun_ori_RD,p0,T,Tsmoothie_50_n_avg(:,k),LB,UB);

end

writematrix(transpose(p_Denoise_10),'p_Denoise_10.csv'); 
writematrix(transpose(p_Denoise_20),'p_Denoise_20.csv'); 
writematrix(transpose(p_Denoise_30),'p_Denoise_30.csv');
writematrix(transpose(p_Denoise_35),'p_Denoise_35.csv'); 
writematrix(transpose(p_Denoise_40),'p_Denoise_40.csv'); 
writematrix(transpose(p_Denoise_50),'p_Denoise_50.csv');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Variation in the parameters at different noise levels

X = 1:100;
Ktrans_array = 0.1.*ones(1,100);
Kep_array = 0.9.*ones(1,100);
vp_array = 0.01.*ones(1,100);

% 10% noise
figure, plot(X, Ktrans_array , X, transpose(p_Noise_01(1,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on K_{trans} at 10% Noise');
xlabel('Instances'); 
ylabel('k_{trans} value');
 
saveas(gcf,'Variation ktrans 10% noise.png')

% 20% noise
figure, plot(X, Ktrans_array , X, transpose(p_Noise_02(1,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on K_{trans} at 20% Noise');
xlabel('Instances'); 
ylabel('k_{trans} value'); 
saveas(gcf,'Variation ktrans 20% noise.png')

% 30% noise
figure, plot(X, Ktrans_array , X, transpose(p_Noise_30(1,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on K_{trans} at 30% Noise');
xlabel('Instances'); 
ylabel('k_{trans} value'); 
saveas(gcf,'Variation ktrans 30% noise.png')

% 35% noise
figure, plot(X, Ktrans_array , X, transpose(p_Noise_35(1,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on K_{trans} at 35% Noise');
xlabel('Instances'); 
ylabel('k_{trans} value'); 
saveas(gcf,'Variation ktrans 35% noise.png')

% 40% noise
figure, plot(X, Ktrans_array , X, transpose(p_Noise_40(1,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on K_{trans} at 40% Noise');
xlabel('Instances'); 
ylabel('k_{trans} value'); 
saveas(gcf,'Variation ktrans 40% noise.png')

% 50% noise
figure, plot(X, Ktrans_array , X, transpose(p_Noise_50(1,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on K_{trans} at 50% Noise');
xlabel('Instances'); 
ylabel('k_{trans} value'); 
saveas(gcf,'Variation ktrans 50% noise.png')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Variation on Kep

% 10% noise
figure, plot(X, Kep_array , X, transpose(p_Noise_01(2,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on K_{ep} at 10% Noise');
xlabel('Instances'); 
ylabel('k_{ep} value');
 
saveas(gcf,'Variation kep 10% noise.png')

% 20% noise
figure, plot(X, Kep_array , X, transpose(p_Noise_02(2,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on K_{ep} at 20% Noise');
xlabel('Instances'); 
ylabel('k_{ep} value'); 
saveas(gcf,'Variation kep 20% noise.png')

% 30% noise
figure, plot(X, Kep_array , X, transpose(p_Noise_30(2,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on K_{ep} at 30% Noise');
xlabel('Instances'); 
ylabel('k_{ep} value'); 
saveas(gcf,'Variation kep 30% noise.png')

% 35% noise
figure, plot(X, Kep_array , X, transpose(p_Noise_35(2,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on K_{ep} at 35% Noise');
xlabel('Instances'); 
ylabel('k_{ep} value'); 
saveas(gcf,'Variation kep 35% noise.png')

% 40% noise
figure, plot(X, Kep_array , X, transpose(p_Noise_40(2,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on K_{ep} at 40% Noise');
xlabel('Instances'); 
ylabel('k_{ep} value'); 
saveas(gcf,'Variation kep 40% noise.png')

% 50% noise
figure, plot(X, Kep_array , X, transpose(p_Noise_50(2,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on K_{ep} at 50% Noise');
xlabel('Instances'); 
ylabel('k_{ep} value'); 
saveas(gcf,'Variation kep 50% noise.png')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variation in vp_arraay


% 10% noise
figure, plot(X, vp_array , X, transpose(p_Noise_01(3,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on v_{p} at 10% Noise');
xlabel('Instances'); 
ylabel('v_{p} value');
 
saveas(gcf,'Variation vp 10% noise.png')

% 20% noise
figure, plot(X, vp_array , X, transpose(p_Noise_02(3,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on v_{p} at 20% Noise');
xlabel('Instances'); 
ylabel('v_{p} value'); 
saveas(gcf,'Variation vp 20% noise.png')

% 30% noise
figure, plot(X, vp_array , X, transpose(p_Noise_30(3,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on v_{p} at 30% Noise');
xlabel('Instances'); 
ylabel('v_{p} value'); 
saveas(gcf,'Variation vp 30% noise.png')

% 35% noise
figure, plot(X, vp_array , X, transpose(p_Noise_35(3,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on v_{p} at 35% Noise');
xlabel('Instances'); 
ylabel('v_{p} value'); 
saveas(gcf,'Variation vp 35% noise.png')

% 40% noise
figure, plot(X, vp_array , X, transpose(p_Noise_40(3,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on v_{p} at 40% Noise');
xlabel('Instances'); 
ylabel('v_{p} value'); 
saveas(gcf,'Variation vp 40% noise.png')

% 50% noise
figure, plot(X, vp_array , X, transpose(p_Noise_50(3,:)));
legend('True parameter value', 'Noise parameter Value');
title('Impact on v_{p} at 50% Noise');
xlabel('Instances'); 
ylabel('v_{p} value'); 
saveas(gcf,'Variation vp 50% noise.png')
