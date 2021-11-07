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
