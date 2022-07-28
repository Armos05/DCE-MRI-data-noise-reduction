%%GTKM fit function actual

function [ Ct ] = CtFit_GTKM(parm, timeAIF, Cp, BAT_avAIF, BAT_Ct, PreCtVal)

step_fun = timeAIF(2)- timeAIF(1);
tt = timeAIF;
t0 = tt(BAT_avAIF);
BAT_Ct = round(BAT_Ct/step_fun);
t1 = tt(BAT_Ct);
delT = (t1-t0);
indDelT = abs(round(delT/step_fun));
Ct = zeros (length(tt),1);

for k = 1: length(tt)-indDelT
    t = tt(k);
    % if t<t0
    if t<=t1
        Ct(k) = PreCtVal;
    else
%          if (delT >= 0)
        ind0 = int16(10000*tt) == int16(10000*(t-delT));
        C1 = parm(3)*Cp(ind0);
        
        U = t1:step_fun:t;
        C2 = 0;
        for n  = 1: length(U)
            u = U(n);
            ind = int16(10000*tt) == int16(10000*(u-delT));
            C2 = C2 + (Cp(ind)*exp(-parm(2)*(t-u)));           
        end
        Ct(k) =  C1 + parm(1)*step_fun*C2;
%          end
     end
end
if indDelT>0
 Ct(length(tt)-indDelT+1: length(tt)) = Ct(length(tt)-indDelT);
end
end
