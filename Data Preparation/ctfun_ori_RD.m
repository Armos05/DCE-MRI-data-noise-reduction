%%%Code for generating GTKM model data
%Developer: AnupSingh@IIT Delhi, 2016

function [ Ct ] = ctfun_ori_RD(p,T)
global Cp

T = squeeze(T);
h = T(2)-T(1);
t0 = T(1);
t1 = T(2);
td = t1-t0;

Ct = zeros (length(T),1);
for k = 1: length(T)
    
	p = TKP0(1,:)  % Delete afterwards
    t = T(k);
    if t<t1
        Ct(k) = 0;
    else
        ind0 = int16(1000*T) == int16(1000*(t-td));
        C1 = p(3)*Cp(ind0);
        U = t1:h:t;
        C2 = 0;
        for n  = 1: length(U)
            u = U(n);
            ind = int16(1000*T) == int16(1000*(u-td));
            C2 = C2 + (Cp(ind)*exp(-p(2)*(t-u)));
        end
        
        Ct(k) =  C1 + p(1)*h*C2;
    end
end
end
