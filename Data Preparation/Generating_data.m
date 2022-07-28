% GENERATING DATA

BigtrainXn = zeros(32,1152032);
BigtrainY = zeros(32,1152032);

BigtestXn = zeros(32, 213056);
BigtestY = zeros(32,213056);

ktrans_list = [];
kep_list = [];
vp_list = [];

for i = 1:41
	ktrans_list(i) = 0.02 + (i-1)*0.005;
	kep_list(i) = 0.2 + (i-1)*0.05;
	vp_list(i) = 0.002 + (i-1)*0.0005;
end

% Training Data

q = 1;
for i = 1: itr
	noise_level = noise_list(randi(length(noise_list)));
	ktrans_level = ktrans_list(randi(length(ktrans_list)));
	kep_level = kep_list(randi(length(kep_list)));
	vp_level = vp_list(randi(length(vp_list)));
	BigtrainY(:,i) = ctfun_ori_RD([ktrans_level, kep_level, vp_level],T);
	noise = mean(BigtrainY(:,i))*noise_level*randn(length(T),1);
	BigtrainXn(:,i) = BigtrainY(:,i) + noise;
	
end
	
% Testing Data
	
q = 1;

for i = 1: 213056
	noise_level = noise_list(randi(length(noise_list)));
	ktrans_level = ktrans_list(randi(length(ktrans_list)));
	kep_level = kep_list(randi(length(kep_list)));
	vp_level = vp_list(randi(length(vp_list)));
	
	BigtestY(:,i) = ctfun_ori_RD([ktrans_level, kep_level, vp_level],T);
	noise = mean(BigtestY(:,i))*noise_level*randn(length(T),1);
	BigtestXn(:,i) = BigtestY(:,i) + noise;
	
end

%% Splitting according to needs
n_BigtrainXn = zeros(512,72002);
n_BigtrainY = zeros(512,72002);

n_BigtestXn = zeros(512, 13316);
n_BigtestY = zeros(512,13316);

k = 1;
for i = 1:72002
	for j = 1:16
		n_BigtrainXn(32*(j-1)+1 : 32*j, i) = BigtrainXn(:,(k-1)+j);
		n_BigtrainY(32*(j-1)+1 : 32*j, i) = BigtrainY(:,(k-1)+j);
	end
	k = k + 16;
end	

k = 1;
for i = 1:13316
	for j = 1:16
		n_BigtestXn(32*(j-1)+1 : 32*j, i) = BigtestXn(:,(k-1)+j);
		n_BigtestY(32*(j-1)+1 : 32*j, i) = BigtestY(:,(k-1)+j);
	end
	k = k + 16;
end

writematrix(n_BigtrainXn,'TrainXn.csv'); 
writematrix(n_BigtrainY,'TrainY.csv');
writematrix(n_BigtestXn,'TestXn.csv');
writematrix(n_BigtestY,'TestY.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:50
	for j = 1:50
		for k = 1:50
		     BigX(:, q) = ctfun_ori_RD([0.01 + 0.006*k , 0.1 + 0.04*j, 0.001 + 0.006*i],T);
			 noise_level = noise_list(randi(length(noise_list)));
			 noise = maxConc*noise_level*randn(length(T),1); % random noise with normal distribution (u=0, sd=1)  
			 BigNX(:,q) = BigX(:,q) + noise;
			 q = q+1;
		end
		
	end
end

plot(BigX(:,1)), hold on;
plot(BigX(:,34)), hold on;
plot(BigX(:,17)), hold on;
plot(BigNX(:,1)), hold on;
plot(BigNX(:,34)), hold on;
plot(BigNX(:,17));
legend('Denoised Data', 'Noised Values');
title('Comparison between noised and denoised data')
xlabel('Time intervals')
ylabel('Concentration value (C_t)');

% how to shuffle

BigNX_train = BigNX(:,1:100000);
BigNX_test = BigNX(:,100001:125000);
Bigy_train = BigX(:,1:100000);
Bigy_test = BigX(:,100001:125000);


plot(BigNX_test(:,131)), hold on;
plot(Bigy_test(:,131)), hold on;
plot(BigY_pred_poland(:,131));
legend('Denoised Data', 'Noised Values', 'Predicted Denoised');
title('Comparison between noised and denoised data')
xlabel('Time intervals')
ylabel('Concentration value (C_t)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sum(sqrt(mean((Y_train-X_train).^2)))
ans = 221.6130

sum(sqrt(mean((Y_test-X_test).^2)))
ans = 108.6578

X_train_f = X_train(:,1:17825);
X_test_f = X_test(:,1:8775);
Y_train_f = Y_train(:,1:17825);
Y_test_f = Y_test(:,1:8775);

X_train_fe = zeros(800,713);
X_test_fe = zeros(800,351);
Y_train_fe = zeros(800,713);
Y_test_fe = zeros(800,351);


for i = 1:713
	for j = 1:25
		X_train_fe(32*(j-1)+1:32*j,i) = X_train_f(:,j);
		Y_train_fe(32*(j-1)+1:32*j,i) = Y_train_f(:,j); 
	end
end	

for i = 1:351
	for j = 1:25
		X_test_fe(32*(j-1)+1:32*j,i) = X_test_f(:,j);
		Y_test_fe(32*(j-1)+1:32*j,i) = Y_test_f(:,j); 
	end
end	

X_train_fee = zeros(800,713);
X_test_fee = zeros(800,315);

for i = 1:713
	noise_level = noise_list(randi(length(noise_list)));
    noise = noise_level*randn(800,1); % random noise with normal distribution (u=0, sd=1)  
    X_train_fee(:, i) = X_train_fe(:,i) + noise;
end

for i = 1:351
	noise_level = noise_list(randi(length(noise_list)));
    noise = noise_level*randn(800,1); % random noise with normal distribution (u=0, sd=1)  
    X_test_fee(:, i) = X_test_fe(:,i) + noise;
end

%
sum(sqrt(mean((Y_train_fe-X_train_fee).^2)))

