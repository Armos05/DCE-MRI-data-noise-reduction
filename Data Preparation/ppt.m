%t1 map slices
%1100 gray matter t1
%1200 1300 t1 map
%ve map.... tumor map... salt and pepper...
%tumor beta distribution
%mean value ...... healthy to tumor mein 2x ka difference.
%Code for extracting Ct curves corresponding to White Matter, Grey Matter and Tumour region

%20 image display of Tumor region from T1 map, as the value of t1 is more than 12000 in this region
fig2 = figure();
tlo = tiledlayout(fig2,'flow','TileSpacing','compact','Padding','compact');
for i = 1:20
    ax = nexttile(tlo);
    imagesc(ax,T1map(:,:,i), [0,3000]), colormap(jet)
end

%20 image display of Tumor region from ve values, ranging from 0 to 0.1
fig3 = figure();
tlo = tiledlayout(fig3,'flow','TileSpacing','compact','Padding','compact');
for i = 1:20
    ax = nexttile(tlo);
    imagesc(ax,Ve(:,:,i), [0,0.1]), colormap(jet)
end

%20 image display of White and Gray Matter
subplot(4,5,1);
imshow(WhiteMatter(:,:,1));
subplot(4,5,2);
imshow(WhiteMatter(:,:,2));
subplot(4,5,3);
imshow(WhiteMatter(:,:,3));
subplot(4,5,4);
imshow(WhiteMatter(:,:,4));
subplot(4,5,5);
imshow(WhiteMatter(:,:,5));
subplot(4,5,6);
imshow(WhiteMatter(:,:,6));
subplot(4,5,7);
imshow(WhiteMatter(:,:,7));
subplot(4,5,8);
imshow(WhiteMatter(:,:,8));
subplot(4,5,9);
imshow(WhiteMatter(:,:,9));
subplot(4,5,10);
imshow(WhiteMatter(:,:,10));
subplot(4,5,11);
imshow(WhiteMatter(:,:,11));
subplot(4,5,12);
imshow(WhiteMatter(:,:,12));
subplot(4,5,13);
imshow(WhiteMatter(:,:,13));
subplot(4,5,14);
imshow(WhiteMatter(:,:,14));
subplot(4,5,15);
imshow(WhiteMatter(:,:,15));
subplot(4,5,16);
imshow(WhiteMatter(:,:,16));
subplot(4,5,17);
imshow(WhiteMatter(:,:,17));
subplot(4,5,18);
imshow(WhiteMatter(:,:,18));
subplot(4,5,19);
imshow(WhiteMatter(:,:,19));
subplot(4,5,20);
imshow(WhiteMatter(:,:,20));

% For GrayMatter

subplot(4,5,1);
imshow(GrayMatter(:,:,1));
subplot(4,5,2);
imshow(GrayMatter(:,:,2));
subplot(4,5,3);
imshow(GrayMatter(:,:,3));
subplot(4,5,4);
imshow(GrayMatter(:,:,4));
subplot(4,5,5);
imshow(GrayMatter(:,:,5));
subplot(4,5,6);
imshow(GrayMatter(:,:,6));
subplot(4,5,7);
imshow(GrayMatter(:,:,7));
subplot(4,5,8);
imshow(GrayMatter(:,:,8));
subplot(4,5,9);
imshow(GrayMatter(:,:,9));
subplot(4,5,10);
imshow(GrayMatter(:,:,10));
subplot(4,5,11);
imshow(GrayMatter(:,:,11));
subplot(4,5,12);
imshow(GrayMatter(:,:,12));
subplot(4,5,13);
imshow(GrayMatter(:,:,13));
subplot(4,5,14);
imshow(GrayMatter(:,:,14));
subplot(4,5,15);
imshow(GrayMatter(:,:,15));
subplot(4,5,16);
imshow(GrayMatter(:,:,16));
subplot(4,5,17);
imshow(GrayMatter(:,:,17));
subplot(4,5,18);
imshow(GrayMatter(:,:,18));
subplot(4,5,19);
imshow(GrayMatter(:,:,19));
subplot(4,5,20);
imshow(GrayMatter(:,:,20));

%%Extracting Ct curves from White matter
%which pixels has the white matter value
%GrayMatter      169865    217182   93826
%WhiteMatter     106084    73877    149111
Gray_parameters = zeros(1310720,4);
Gray_Ct_sub1 = zeros(1310720, 32);
White_parameters = zeros(1310720, 4);
White_Ct_sub1 = zeros(1310720, 32);
count_gr = 0;
count_wt = 0;
for i = 6:16
	for x = 1:256
		for y = 1:256
			if GrayMatter(x,y,i) == 1
				count_gr = count_gr +1;
				Gray_Ct_sub1(count_gr, :) = Con0(x,y,i,:);
				Gray_parameters(count_gr,1) = Ktrans(x,y,i);
				Gray_parameters(count_gr,2) = Kep(x,y,i);
				Gray_parameters(count_gr,3) = Vp(x,y,i);
				Gray_parameters(count_gr,4) = Ve(x,y,i);
			end
			
			if WhiteMatter(x,y,i) == 1
				count_wt = count_wt +1;
				White_Ct_sub1(count_wt, :) = Con0(x,y,i,:);
				White_parameters(count_gr,1) = Ktrans(x,y,i);
				White_parameters(count_gr,2) = Kep(x,y,i);
				White_parameters(count_gr,3) = Vp(x,y,i);
				White_parameters(count_gr,4) = Ve(x,y,i);
			end
		end	
	end
end	
Gray_Ct_sub1 = Gray_Ct_sub1(1:count_gr, :);
White_Ct_sub1 = White_Ct_sub1(1:count_wt, :);
Gray_parameters = Gray_parameters(1:count_gr, :);
White_parameters = White_parameters(1:count_wt,:);
count_gr, count_wt

%PLot image histogram
imhist(Ve(128:165, 103:128, 9))

%%Extracting Ct curves from tumor dataset
%slice6  42
Tum_Ct_sub1 = zeros(75000,32);
Tum_parameters = zeros(75000,4);
count_tm = 0
for x = 135:160
	for y = 170:200
		if Ve(x,y,6) > 0.11
			count_tm = count_tm + 1;
			Tum_Ct_sub1(count_tm, :) = Con0(x,y,6,:);
			Tum_parameters(count_tm,1) = Ktrans(x,y,6);
			Tum_parameters(count_tm,2) = Kep(x,y,6);
			Tum_parameters(count_tm,3) = Vp(x,y,6);
			Tum_parameters(count_tm,4) = Ve(x,y,6);
		end
	end
end

%slice7 37
for x = 135:160
	for y = 165:200
		if Ve(x,y,7) > 0.115
			count_tm = count_tm + 1;
			Tum_Ct_sub1(count_tm, :) = Con0(x,y,7,:);
			Tum_parameters(count_tm,1) = Ktrans(x,y,7);
			Tum_parameters(count_tm,2) = Kep(x,y,7);    %change
			Tum_parameters(count_tm,3) = Vp(x,y,7);
			Tum_parameters(count_tm,4) = Ve(x,y,7);
		end
	end
end

%slice8 44
for x = 135:160
	for y = 165:200
		if Ve(x,y,8) > 0.105
			count_tm = count_tm + 1;
			Tum_Ct_sub1(count_tm, :) = Con0(x,y,8,:);
			Tum_parameters(count_tm,1) = Ktrans(x,y,8);
			Tum_parameters(count_tm,2) = Kep(x,y,8);
			Tum_parameters(count_tm,3) = Vp(x,y,8);   %change
			Tum_parameters(count_tm,4) = Ve(x,y,8);
		end
	end
end

Tum_Ct_sub1 = Tum_Ct_sub1(1:123,:);
Tum_parameters = Tum_parameters(1:123,:);

%Subject 2, slice 9
Tum_Ct_sub1 = zeros(75000,32);
Tum_parameters = zeros(75000,4);
count_tm = 0
for x = 128:165
	for y = 103:128
		if Ve(x,y,9) > 0.089
			count_tm = count_tm + 1;
			Tum_Ct_sub1(count_tm, :) = Con0(x,y,9,:);
			Tum_parameters(count_tm,1) = Ktrans(x,y,9);
			Tum_parameters(count_tm,2) = Kep(x,y,9);
			Tum_parameters(count_tm,3) = Vp(x,y,9);
			Tum_parameters(count_tm,4) = Ve(x,y,9);
		end
	end
end
Tum_Ct_sub1 = Tum_Ct_sub1(1:count_tm,:);
Tum_parameters = Tum_parameters(1:count_tm,:);   %126

%IMG HIST
imhist(Ve(170:210,155:190,6))
%Sub 3 tumor data
%slice 6  42
Tum_Ct_sub1 = zeros(75000,32);
Tum_parameters = zeros(75000,4);
count_tm = 0
for x = 170:210
	for y = 155:190
		if Ve(x,y,6) > 0.06
			count_tm = count_tm + 1;
			Tum_Ct_sub1(count_tm, :) = Con0(x,y,6,:);
			Tum_parameters(count_tm,1) = Ktrans(x,y,6);
			Tum_parameters(count_tm,2) = Kep(x,y,6);
			Tum_parameters(count_tm,3) = Vp(x,y,6);
			Tum_parameters(count_tm,4) = Ve(x,y,6);
		end
	end
end

%slice7 37
for x = 170:210
	for y = 155:190
		if Ve(x,y,7) > 0.09
			count_tm = count_tm + 1;
			Tum_Ct_sub1(count_tm, :) = Con0(x,y,7,:);
			Tum_parameters(count_tm,1) = Ktrans(x,y,7);
			Tum_parameters(count_tm,2) = Kep(x,y,7);    
			Tum_parameters(count_tm,3) = Vp(x,y,7);
			Tum_parameters(count_tm,4) = Ve(x,y,7);
		end
	end
end

%slice8 44
for x = 170:210
	for y = 155:190
		if Ve(x,y,8) > 0.1
			count_tm = count_tm + 1;
			Tum_Ct_sub1(count_tm, :) = Con0(x,y,8,:);
			Tum_parameters(count_tm,1) = Ktrans(x,y,8);
			Tum_parameters(count_tm,2) = Kep(x,y,8);
			Tum_parameters(count_tm,3) = Vp(x,y,8);   
			Tum_parameters(count_tm,4) = Ve(x,y,8);
		end
	end
end

%slice 9 
for x = 170:210
	for y = 155:190
		if Ve(x,y,9) > 0.11
			count_tm = count_tm + 1;
			Tum_Ct_sub1(count_tm, :) = Con0(x,y,9,:);
			Tum_parameters(count_tm,1) = Ktrans(x,y,9);
			Tum_parameters(count_tm,2) = Kep(x,y,9);
			Tum_parameters(count_tm,3) = Vp(x,y,9);
			Tum_parameters(count_tm,4) = Ve(x,y,9);
		end
	end
end

%slice10 37
for x = 170:210
	for y = 140:190
		if Ve(x,y,10) > 0.1
			count_tm = count_tm + 1;
			Tum_Ct_sub1(count_tm, :) = Con0(x,y,10,:);
			Tum_parameters(count_tm,1) = Ktrans(x,y,10);
			Tum_parameters(count_tm,2) = Kep(x,y,10);    
			Tum_parameters(count_tm,3) = Vp(x,y,10);
			Tum_parameters(count_tm,4) = Ve(x,y,10);
		end
	end
end

%slice11 44
for x = 167:210
	for y = 140:175
		if Ve(x,y,11) > 0.11
			count_tm = count_tm + 1;
			Tum_Ct_sub1(count_tm, :) = Con0(x,y,11,:);
			Tum_parameters(count_tm,1) = Ktrans(x,y,11);
			Tum_parameters(count_tm,2) = Kep(x,y,11);
			Tum_parameters(count_tm,3) = Vp(x,y,11);   
			Tum_parameters(count_tm,4) = Ve(x,y,11);
		end
	end
end

Tum_Ct_sub1 = Tum_Ct_sub1(1:count_tm,:);
Tum_parameters = Tum_parameters(1:count_tm,:);   
%868

boxplot(Gray_parameters,'Labels',{'K_trans','K_ep','V_p','V_e'})
boxplot(White_parameters,'Labels',{'K_trans','K_ep','V_p','V_e'})
boxplot(Gray_parms,'Labels',{'K_trans','K_ep','V_p','V_e'})
%DATA PARAMS VALUES
mean(Gray_parameters)
ans =0.0126    1.9904    0.0040    0.0141

mean(White_parameters)
ans =0.0023    0.3709    0.0006    0.0026

mean(Tum_parms)
ans = 0.0586    0.4606    0.0093    0.1549

std(Gray_parameters)
ans =0.0518    2.3628    0.0065    0.0537

std(White_parameters)
ans =0.0202    1.3168    0.0026    0.0227

std(Tum_parms)
ans =0.0295    0.2339    0.0053    0.1139

%Error bars for all ve values
x = 1:3;
data = [0.0141 0.0026 0.1549]';
errhigh = [0.0678  0.0253 0.2688];
errlow  = [0 0 0];

bar(x,data)                

hold on

er = errorbar(x,data,errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
set(gca,'xticklabel',{'GM','WM','Tum'})

hold off

%Error bars for all vp values
x = 1:3;
data = [0.0040 0.0006 0.0093]';
errhigh = [0.0105  0.0032 0.0146];
errlow  = [0 0 0];

bar(x,data)                

hold on

er = errorbar(x,data,errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
set(gca,'xticklabel',{'GM','WM','Tum'})

hold off

%Error Graph for ktrans all regions
x = 1:3;
data = [0.0126 0.0023 0.00586]';
errhigh = [0.0644 0.0225 0.0876];
errlow  = [0 0 0];

bar(x,data)                

hold on

er = errorbar(x,data,errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
set(gca,'xticklabel',{'GM','WM','Tum'})

hold off

%Error Graph for kep all regions
x = 1:3;
data = [0.19904 0.3709 0.4606]';
errhigh = [4.3532  1.6877 0.6945];
errlow  = [0 0 0];

bar(x,data)                

hold on

er = errorbar(x,data,errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
set(gca,'xticklabel',{'GM','WM','Tum'})

hold off

%converting real dataset of WM, GM, TM into shape (x, 512)
Gray_Ct_sub1 = Gray_Ct_sub1(1:169856, :);
Gray_parameters = Gray_parameters(1:169856, :);

White_Ct_sub1 = White_Ct_sub1(1:106080, :);
White_parameters = White_parameters(1:106080, :);


n_Gray_Ct_sub1 = zeros(10616, 512);
n_Gray_parameters = zeros(10616:64);

n_White_Ct_sub1 = zeros(6630, 512);
n_White_parameters = zeros(6630:64);

n_Tum_Ct_sub1 = zeros(69, 512);
n_Tum_parameters = zeros(69:64);

k = 1;
for i = 1:10616
	for j = 1:16
		n_Gray_Ct_sub1(i, 32*(j-1)+1:32*j) = Gray_Ct_sub1((k-1)+j,:);
		n_Gray_parameters(i, 4*(j-1)+1:4*j) = Gray_parameters((k-1)+j,:);
	end
	k = k + 16;
end	

k = 1;
for i = 1:6630
	for j = 1:16
		n_White_Ct_sub1(i, 32*(j-1)+1:32*j) = White_Ct_sub1((k-1)+j,:);
		n_White_parameters(i, 4*(j-1)+1:4*j) = White_parameters((k-1)+j,:);
	end
	k = k + 16;
end

k = 1;
for i = 1:69
	for j = 1:16
		n_Tum_Ct_sub1(i, 32*(j-1)+1:32*j) = Tum_Ct((k-1)+j,:);
		n_Tum_parameters(i, 4*(j-1)+1:4*j) = Tum_parms((k-1)+j,:);
	end
	k = k + 16;
end

writematrix(n_Gray_Ct_sub1,'Gray_Ct.csv'); 
writematrix(n_Gray_parameters,'Gray_params.csv');
writematrix(n_White_Ct_sub1,'White_Ct.csv');
writematrix(n_White_parameters,'White_params.csv');
writematrix(n_Tum_Ct_sub1,'Tum_Ct.csv'); 
writematrix(n_Tum_parameters,'Tum_params.csv');

>> TestXn = table2array(TestXn);
>> TestY = table2array(TestY);
>> n_TestXn = zeros(32,213056);
>> n_TestY = zeros(32,213056);
>> for i = 1:13316
      for j = 1:16
	n_TestXn(:, (i-1)*16 + j) =TestXn(32*(j-1)+1 : 32*j,i);
	n_TestY(:, (i-1)*16 + j) =TestY(32*(j-1)+1 : 32*j,i);
	end
end

for i = 1:213056
  p_TestXn(:,i) = lsqcurvefit(@ctfun_ori_RD,p0,T,n_TestXn(:,i),LB,UB);
  p_TestY(:,i) = lsqcurvefit(@ctfun_ori_RD,p0,T,n_TestY(:,i),LB,UB);      
end

writematrix(p_TestXn,'p_TestXn.csv'); 
writematrix(p_TestY,'p_TestY.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
writematrix(n_Gray_Ct_sub1(5308:5408,:),'sGray_Ct.csv'); 
writematrix(n_Gray_parameters(5308:5408,:),'sGray_params.csv');
writematrix(n_White_Ct_sub1(3315:3415,:),'sWhite_Ct.csv');
writematrix(n_White_parameters(3315:3415,:),'sWhite_params.csv');
writematrix(Tum_Ct(552:652,:),'sTum_Ct.csv'); 
writematrix(Tum_parms(552:652,:),'sTum_params.csv'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Processing the CSV Files from the denoised Deep Models DRNN, LSTM, Vanilla, ResCNN only
%% Converting imported tables to array
ssGrayCt = table2array(ssGrayCt);
ssGrayparams = table2array(ssGrayparams);
ssWhiteCt = table2array(ssWhiteCt);
ssWhiteparams = table2array(ssWhiteparams);
ssTumCt = table2array(ssTumCt);
ssTumparams = table2array(ssTumparams);

TestDRNNGM = table2array(TestDRNNGM);
TestDRNNWM = table2array(TestDRNNWM);
TestDRNNTM = table2array(TestDRNNTM);
TestLSTMGM = table2array(TestLSTMGM);
TestLSTMWM = table2array(TestLSTMWM);
TestLSTMTM = table2array(TestLSTMTM);
TestResGM = table2array(TestResGM);
TestResWM = table2array(TestResWM);
TestResTM = table2array(TestResTM);
TestVanillaGM = table2array(TestVanillaGM);
TestVanillaWM = table2array(TestVanillaWM);
TestVanillaTM = table2array(TestVanillaTM);

%Since we need to correct the shape of the dataset
zzGrayCt = zeros(1616,32);
zzGrayparams = zeros(1616,4);
zzWhiteCt = zeros(1616, 32);
zzWhiteparams = zeros(1616,4);
zzTumCt = zeros(1104, 32);
zzTumparams = zeros(1104,4);

zzTestDRNNGM = zeros(1616,32);
zzTestDRNNGM_p = zeros(1616,3);
zzTestDRNNWM = zeros(1616,32);
zzTestDRNNWM_p = zeros(1616,3);
zzTestDRNNTM = zeros(1104, 32);
zzTestDRNNTM_p = zeros(1104,3);
zzTestLSTMGM = zeros(1616,32);
zzTestLSTMGM_p = zeros(1616,3);
zzTestLSTMWM = zeros(1616,32);
zzTestLSTMWM_p = zeros(1616, 3);
zzTestLSTMTM = zeros(1104, 32);
zzTestLSTMTM_p = zeros(1104,3);
zzTestResGM = zeros(1616,32);
zzTestResGM_p = zeros(1616,3);
zzTestResWM = zeros(1616,32);
zzTestResWM_p = zeros(1616, 3);
zzTestResTM = zeros(1104, 32);
zzTestResTM_p = zeros(1103, 3);
zzTestVanillaGM = zeros(1616,32);
zzTestVanillaGM_p = zeros(1616,3);
zzTestVanillaWM = zeros(1616,32);
zzTestVanillaWM_p = zeros(1616,3);
zzTestVanillaTM = zeros(1104, 32);
zzTestVanillaTM_p = zeros(1104,3);

%Converting all GM and WM from X512 to X32
>> for i = 1:101
      for j = 1:16
	zzGrayCt((i-1)*16 + j,:) = ssGrayCt(i, 32*(j-1)+1 : 32*j);
	zzGrayparams((i-1)*16 + j,:) = ssGrayparams(i, 4*(j-1)+1 : 4*j);
	zzWhiteCt((i-1)*16 + j,:) = ssWhiteCt(i, 32*(j-1)+1 : 32*j);
	zzWhiteparams((i-1)*16 + j,:) = ssWhiteparams(i, 4*(j-1)+1 : 4*j);
	
    zzTestDRNNGM((i-1)*16 + j,:) = TestDRNNGM(i, 32*(j-1)+1 : 32*j);
	zzTestDRNNWM((i-1)*16 + j,:) = TestDRNNWM(i, 32*(j-1)+1 : 32*j);
	
	zzTestLSTMGM((i-1)*16 + j,:) = TestLSTMGM(i, 32*(j-1)+1 : 32*j);
	zzTestLSTMWM((i-1)*16 + j,:) = TestLSTMWM(i, 32*(j-1)+1 : 32*j);
	
	zzTestResGM((i-1)*16 + j,:) = TestResGM(i, 32*(j-1)+1 : 32*j);
	zzTestResWM((i-1)*16 + j,:) = TestResWM(i, 32*(j-1)+1 : 32*j);
	
	zzTestVanillaGM((i-1)*16 + j,:) = TestVanillaGM(i, 32*(j-1)+1 : 32*j);
	zzTestVanillaWM((i-1)*16 + j,:) = TestVanillaWM(i, 32*(j-1)+1 : 32*j);
	end
end

%Converting all GM and WM from X512 to X32
>> for i = 1:69
      for j = 1:16
	zzTumCt((i-1)*16 + j,:) = ssTumCt(i, 32*(j-1)+1 : 32*j);
	zzTumparams((i-1)*16 + j,:) = ssTumparams(i, 4*(j-1)+1 : 4*j);
	
    zzTestDRNNTM((i-1)*16 + j,:) = TestDRNNTM(i, 32*(j-1)+1 : 32*j);
	
	zzTestLSTMTM((i-1)*16 + j,:) = TestLSTMTM(i, 32*(j-1)+1 : 32*j);
	
	zzTestResTM((i-1)*16 + j,:) = TestResTM(i, 32*(j-1)+1 : 32*j);
	
	zzTestVanillaTM((i-1)*16 + j,:) = TestVanillaTM(i, 32*(j-1)+1 : 32*j);
	end
end

%Evenif the data is of shape (1616, 3)
%do Arr(i,4) = value, this will add a whole column
% ktrans / kep = ve

%% LSQ Curvefitting
for i = 1:1616
	zzTestDRNNGM_p(i,:) = lsqcurvefit(@ctfun_ori_RD,p0,T,zzTestDRNNGM(i,:).',LB,UB);
	zzTestDRNNWM_p(i,:) = lsqcurvefit(@ctfun_ori_RD,p0,T,zzTestDRNNWM(i,:).',LB,UB);

	zzTestLSTMGM_p(i,:) = lsqcurvefit(@ctfun_ori_RD,p0,T,zzTestLSTMGM(i,:).',LB,UB);
	zzTestLSTMWM_p(i,:) = lsqcurvefit(@ctfun_ori_RD,p0,T,zzTestLSTMWM(i,:).',LB,UB);
	
	zzTestResGM_p(i,:) = lsqcurvefit(@ctfun_ori_RD,p0,T,zzTestResGM(i,:).',LB,UB);
	zzTestResWM_p(i,:) = lsqcurvefit(@ctfun_ori_RD,p0,T,zzTestResWM(i,:).',LB,UB);
	
	zzTestVanillaGM_p(i,:) = lsqcurvefit(@ctfun_ori_RD,p0,T,zzTestVanillaGM(i,:).',LB,UB);
	zzTestVanillaWM_p(i,:) = lsqcurvefit(@ctfun_ori_RD,p0,T,zzTestVanillaWM(i,:).',LB,UB);
	i
end

for i = 1:1104
	zzTestDRNNTM_p(i,:) = lsqcurvefit(@ctfun_ori_RD,p0,T,zzTestDRNNTM(i,:).',LB,UB);
	
	zzTestLSTMTM_p(i,:) = lsqcurvefit(@ctfun_ori_RD,p0,T,zzTestLSTMTM(i,:).',LB,UB);
	
	zzTestResTM_p(i,:) = lsqcurvefit(@ctfun_ori_RD,p0,T,zzTestResTM(i,:).',LB,UB);
	
	zzTestVanillaTM_p(i,:) = lsqcurvefit(@ctfun_ori_RD,p0,T,zzTestVanillaTM(i,:).',LB,UB);
	i
	
end

%ve values ktrans / kep = ve
for i = 1:1616
	zzTestDRNNGM_p(i,4) = zzTestDRNNGM_p(i,1)/zzTestDRNNGM_p(i,2);
	zzTestDRNNWM_p(i,4) = zzTestDRNNWM_p(i,1)/zzTestDRNNWM_p(i,2);

	zzTestLSTMGM_p(i,4) = zzTestLSTMGM_p(i,1)/zzTestLSTMGM_p(i,2);
	zzTestLSTMWM_p(i,4) = zzTestLSTMWM_p(i,1)/zzTestLSTMWM_p(i,2);
	
	zzTestResGM_p(i,4) = zzTestResGM_p(i,1)/zzTestResGM_p(i,2);
	zzTestResWM_p(i,4) = zzTestResWM_p(i,1)/zzTestResWM_p(i,2);
	
	zzTestVanillaGM_p(i,4) = zzTestVanillaGM_p(i,1)/zzTestVanillaGM_p(i,2);
	zzTestVanillaWM_p(i,4) = zzTestVanillaWM_p(i,1)/zzTestVanillaWM_p(i,2);
	i
end

for i = 1:1104
	zzTestDRNNTM_p(i,4) = zzTestDRNNTM_p(i,1)/zzTestDRNNTM_p(i,2);
	
	zzTestLSTMTM_p(i,4) = zzTestLSTMTM_p(i,1)/zzTestLSTMTM_p(i,2);
	
	zzTestResTM_p(i,4) = zzTestResTM_p(i,1)/zzTestResTM_p(i,2);
	
	zzTestVanillaTM_p(i,4) = zzTestVanillaTM_p(i,1)/zzTestVanillaTM_p(i,2);
	
end

%%bar plot with error bars subset real dataset
%Error bars for all ktrans values
x = 1:3;
data = [0.0084 0.0007 0.0586]';
errhigh = [0.007  0.0034 0.0295];
errlow  = [0 0 0];

bar(x,data)                

hold on

er = errorbar(x,data,errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
set(gca,'xticklabel',{'GM','WM','Tum'})

hold off

%Error bars for all Kep values
x = 1:3;
data = [1.5174 0.1967 0.46066]';
errhigh = [1.6040  1.1572 0.2339];
errlow  = [0 0 0];

bar(x,data)                

hold on

er = errorbar(x,data,errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
set(gca,'xticklabel',{'GM','WM','Tum'})

hold off

%Error Graph for Vp all regions
x = 1:3;
data = [0.0039 0.0003 0.0093]';
errhigh = [0.0016 0.0011 0.0053];
errlow  = [0 0 0];

bar(x,data)                

hold on

er = errorbar(x,data,errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
set(gca,'xticklabel',{'GM','WM','Tum'})

hold off

%Error Graph for Ve all regions
x = 1:3;
data = [0.0114 0.0011 0.1549]';
errhigh = [0.0418  0.0138 0.1139];
errlow  = [0 0 0];

bar(x,data)                

hold on

er = errorbar(x,data,errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
set(gca,'xticklabel',{'GM','WM','Tum'})

hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Removing outliers
llDRNN = [];
llLSTM = [];
llResCNN = [];
llVanilla = [];
for i = 1:1104
	if zzTestDRNNWM_p(i,4) > 10 
		llDRNN = [llDRNN i];
	end
	
	if zzTestLSTMWM_p(i,4) > 10 
		llLSTM = [llLSTM i];
	end
	
	if zzTestResWM_p(i,4) > 10 
		llResCNN = [llResCNN i];
	end
	
	if zzTestVanillaWM_p(i,4) > 10 
		llVanilla = [llVanilla i];
	end
end

zzTestDRNNWM_p(llDRNN, :) = [];
zzTestLSTMWM_p(llLSTM, :) = [];
zzTestResWM_p(llResCNN, :) = [];
zzTestVanillaWM_p(llVanilla, :) = [];

llResCNN = [];
for i = 1:1610
	
	if zzTestResGM_p(i,4) > 10 
		llResCNN = [llResCNN i];
	end
end

zzTestResGM_p(llResCNN, :) = [];


%%%%%%%%%%%%%%%%%%%%%%% boxplot
boxplot(zzTestDRNNGM_p,'Labels',{'K_trans','K_ep','V_p','V_e'})

%%%%%%%%%%%%%%%%%%%%%%%%% Final implementation
%%%%%%%% Predicting the tumorous regions

zzTM_Ct1 = zeros(4320, 32);
zzTM_p1 = zeros(4320,1);

k = 1;
for sl = 6:9
	for i = 130:165
		for j = 171:200
			zzTM_Ct1(k,:) = Con0(i,j,sl,:);
			zzTM_p1(k,:) = Ve(i,j,sl);
			k = k + 1;
		end
	end	
end

zTM_Ct1 = zeros(270, 512);
zTM_p1 = zeros(270,16);

for i = 1:270
	for j = 1:16
		zTM_Ct1(i,(j-1)*32 + 1 : j*32) = zzTM_Ct1((i-1)*16 + j, :);
		zTM_p1(i,j) = zzTM_p1((i-1)*16 + j, :);
	end
end	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% segmentation and fitting
for i = 1:270
    for j = 1:16
	    zzTM_CT((i-1)*16 + j,:) = Tum_CTT(i, 32*(j-1)+1 : 32*j);
	end
end

for i=1:4320
    p = lsqcurvefit(@ctfun_ori_RD,p0,T,zzTM_CT(i,:).',LB,UB);
	zzTM_p(i,:) = p(1)/p(2);
	i
end	

for i=1:4320
	if zzTM_p(i,:) > 0.7
		zzTM_p(i,:) = 0.7;
    end
end

k = 1;
for sl = 6:9
	for i = 130:165
		for j = 171:200
			copy_Ve(i,j,sl) = zzTM_p(k,:);
			k = k + 1;
		end
	end	
end	

fig3 = figure();
tlo = tiledlayout(fig3,'flow','TileSpacing','compact','Padding','compact');
for i = 1:20
    ax = nexttile(tlo);
    imagesc(ax,copy_Ve(:,:,i), [0,0.1]), colormap(jet)
end