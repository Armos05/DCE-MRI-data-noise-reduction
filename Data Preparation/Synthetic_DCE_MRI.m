%%%Code for generating Synthetic DCE-MRI data
%Developer: AnupSingh@IIT Delhi, 2020

%% @1 Global AIF -model based; Ref: Parker G, MRM 2006. 'Experimentally-Derived Functional Form for a Population-Averaged....'
%%% Initial Parameters for generating AIF using 'cpfun_ori_RD()'.

global B tc a1 a2 m1 m2 sgm1 sgm2 mu1 mu2
B=1.050; % mM CA Dose
m1=0.1685; % per min Amplitude and the decay constant of the exponential
m2=38.078; % Sigmoid width
tc=0.483; % min Sigmoid center
a1=0.809;  % mM min Scales of the Gaussian Kernels
a2=0.330;
sgm1=0.0563; % min Widths of the Gaussian kernels
sgm2=0.132;
mu1=0.170;  % min Centers of the Gaussian kernels
mu2=0.365;

%% @2 duration of data and sampling. User can change it
Duration = 2.030; % in minutes
StepSize = 0.0625; % in minutes
T = 0:StepSize:Duration;  %time in min

%% @3 Generating AIF (model function )
global Cp
Cp = cpfun_ori_RD(T);
Cp = squeeze(Cp);
figure, plot(T,Cp,'-*r')

%% @4 Generating tissue C(t) for different parameetrs and noise levels
%%% input tracer-kinetic-parameetrs(TKP) = (Ktrans, Kep, Vp) for GTKM model.
Ktr0 = [0.01, 0.05, 0.2]; % /min
Kep0 = [1, 1, 1]; % /min
vp0 =  [0.01, 0.02, 0.04];

l1 = length(Ktr0); l2 = length(Kep0); l3 = length(vp0);

TKP0 = zeros(l1*l2*l3, 3);
ind = 1;
for k1 = 1: l1
    for k2 = 1: l2
        for k3 = 1: l3
            TKP0(ind,:) = [Ktr0(k1), Kep0(k2), vp0(k3)];
            ind = ind+1;
        end
    end
end
clear l1 l2 l3

 pExp = [0.1; 0.9; 0.01]; %[ktrans, kep, vp]  
 Ct = ctfun_ori_RD(pExp,T);
 figure, plot(T, Ct, '*-')

%% Mounte carlo simulation
maxConc = 0.1; % 0.1 mM/L
% noise level link with the ground truth (Take the max value of the ground 
%truth curve find the maximum value replace the value here with maxConc.

noiseLevel = 0.1; % (0.1 = 10 percent of maxConc.)
NS = 5; % number of noise simulations;

% figure,
CtN = zeros(size(TKP0, 1) * NS, length(T));
for kk = 1: size(TKP0, 1)
    Cto = ctfun_ori_RD(TKP0(kk,:),T); %Original Ct curves without noise
    for n = 1:NS
        noise = maxConc*noiseLevel*randn(length(T),1); % random noise with normal distribution (u=0, sd=1)  
        CtN(kk + n-1, :) = Cto + noise;
         plot(T, CtN, '*-'), hold on;
    end
end

%% Fitting GTKM to Ct
%%%Initial guess, lower and upper bounds for tracer kinetic fitting using GTKM
%%%[Ktrans,Kep,Vp]
% ve = Ktrans / kep

 p0 = [0.5, 4, 0.5];
 LB = [0, 0, 0];
 UB = [2, 10, 1];
 
 T = squeeze(T);
 [p] = lsqcurvefit(@ctfun_ori_RD,p0,T,Ct,LB,UB);
 
 Ct_fit = ctfun_ori_RD(p,T);
 figure, plot(T,Ct_fit,'-g',T,Ct,'-ob'), ylim([0 1.8])
 figure, plot(T,Ct_fit,'-g',T,Ct,'-ob', T, Cp, '-*r')
 
 Cpt = Cp*p(3);
 Cees = Ct - Cpt';
 figure, plot(T,Ct,'-ob',T,Cpt,'-*r', T, Cees, '--k'), ylim([0 1.8])


******************************************************
