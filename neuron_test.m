function [params,timeSpike,dirac]=neuron_test(Iext,FLit,Isynap,tspk,t,n,c,L,A)

num_spikes=0;
num_neurons=8;
dirac_delta(1:num_neurons,1:t.loop)=Isynap;
dirac_temp=zeros();
time_temp=zeros();
lt=1;   %%%% counter for on off light pulse
tdr=zeros();
alpha_syn_temp=zeros(num_neurons,t.loop);
tme_dark=0;
time_spikes=tspk./(t.dt);
tau=20;%/0.05

O1=zeros();
C1(1)=1;
O2=zeros();
C2=zeros();

Vsoma(1)=n.init_V;%0;%-65; %mV
Vdend(1)=n.init_V;

CaConc_S(1)= n.init_Ca;
CaConc_D(1)= n.init_Ca;

mNa_S(1)=alpha_m(Vsoma(1),'Na', 0)/(alpha_m(Vsoma(1),'Na', 0)+beta_m(Vsoma(1),'Na'));
hNa_S(1)=alpha_h(Vsoma(1),'Na')/(alpha_h(Vsoma(1),'Na')+beta_h(Vsoma(1),'Na'));
mKdr_S(1)= alpha_m(Vsoma(1),'Kdr', 0)/(alpha_m(Vsoma(1),'Kdr', 0)+beta_m(Vsoma(1),'Kdr'));
mKa_S(1)= alpha_m(Vsoma(1),'Ka', 0)/(alpha_m(Vsoma(1),'Ka', 0)+beta_m(Vsoma(1),'Ka'));
hKa_S(1)= alpha_h(Vsoma(1),'Ka')/(alpha_h(Vsoma(1),'Ka')+beta_h(Vsoma(1),'Ka'));
mKahp_S(1)= alpha_m(Vsoma(1),'Kahp', CaConc_S(1))/(alpha_m(Vsoma(1),'Kahp', CaConc_S(1))+beta_m(Vsoma(1),'Kahp'));
mKc_S(1)= alpha_m(Vsoma(1),'Kc', CaConc_S(1))/(alpha_m(Vsoma(1),'Kc', CaConc_S(1))+beta_m(Vsoma(1),'Kc'));
mCa_S(1)= alpha_m(Vsoma(1),'Ca', 0)/(alpha_m(Vsoma(1),'Ca', 0)+beta_m(Vsoma(1),'Ca'));
hCa_S(1)= alpha_h(Vsoma(1),'Ca')/(alpha_h(Vsoma(1),'Ca')+beta_h(Vsoma(1),'Ca'));

mNa_D(1)=alpha_m(Vdend(1),'Na', 0)/(alpha_m(Vdend(1),'Na', 0)+beta_m(Vdend(1),'Na'));
hNa_D(1)=alpha_h(Vdend(1),'Na')/(alpha_h(Vdend(1),'Na')+beta_h(Vdend(1),'Na'));
mKdr_D(1)= alpha_m(Vdend(1),'Kdr', 0)/(alpha_m(Vdend(1),'Kdr', 0)+beta_m(Vdend(1),'Kdr'));
mKa_D(1)= alpha_m(Vdend(1),'Ka', 0)/(alpha_m(Vdend(1),'Ka', 0)+beta_m(Vdend(1),'Ka'));
hKa_D(1)= alpha_h(Vdend(1),'Ka')/(alpha_h(Vdend(1),'Ka')+beta_h(Vdend(1),'Ka'));
mKahp_D(1)= alpha_m(Vdend(1),'Kahp', CaConc_D(1))/(alpha_m(Vdend(1),'Kahp', CaConc_D(1))+beta_m(Vdend(1),'Kahp'));
mKc_D(1)= alpha_m(Vdend(1),'Kc', CaConc_D(1))/(alpha_m(Vdend(1),'Kc', CaConc_D(1))+beta_m(Vdend(1),'Kc'));
mCa_D(1)= alpha_m(Vdend(1),'Ca', 0)/(alpha_m(Vdend(1),'Ca', 0)+beta_m(Vdend(1),'Ca'));
hCa_D(1)= alpha_h(Vdend(1),'Ca')/(alpha_h(Vdend(1),'Ca')+beta_h(Vdend(1),'Ca'));
 
% INa_S(1) = n.gNa_S * mNa_S(1)^2 * hNa_S(1)*(Vsoma(1) - n.ENa_S);
% IKdr_S(1) = n.gKdr_S * mKdr_S(1)^2 *(Vsoma(1) - n.EKdr_S);
% IKa_S(1) = n.gKa_S * mKa_S(1)^1 * hKa_S(1)^1*(Vsoma(1) - n.EKa_S);    
% IKahp_S(1) = n.gKahp_S * mKahp_S(1)^1 *(Vsoma(1) - n.EKahp_S);
% IKc_S(1) = n.gKc_S * mKc_S(1)^1 * min(1,(CaConc_S(1)/250))*(Vsoma(1) - n.EKc_S);
% ICa_S(1) = n.gCa_S * mCa_S(1)^2 * hCa_S(1)^1*(Vsoma(1) - n.ECa_S);



%%%%%%%% Leakage current %%%%%%
 ILeak_S = (n.gLeak_S *n.ELeak_S);
 ILeak_D = (n.gLeak_D *n.ELeak_D);
 %%%%%%% synaptic surrent %%%%%%%

if tspk~=0
for i=1:t.loop
    for j=1:size(time_spikes,2)
        for r=1:num_neurons
        if i>=time_spikes(r,j)                                %max(time_spikes)
          alpha_syn_temp(r,i)= n.gsyn_S*((i-time_spikes(r,j))/tau)*exp(-(i-time_spikes(r,j))/tau);
        end 
        end
    end
  
end
end
  alpha_syn=sum(alpha_syn_temp);
  clear i;
  % %%%%%%%%% euler method %%%%%%%%%
for i=1:t.loop



INa_S(i) = n.gNa_S * mNa_S(i)^2 * hNa_S(i)*(Vsoma(i) - n.ENa_S);
     [mNa_S(i+1),hNa_S(i+1)]=stateVar(mNa_S(i), hNa_S(i), t.dt,Vsoma(i), 'Na', 0);
INa_D(i) = n.gNa_D * mNa_D(i)^2 * hNa_D(i)*(Vdend(i) - n.ENa_D);
     [mNa_D(i+1),hNa_D(i+1)]=stateVar(mNa_D(i), hNa_D(i), t.dt,Vdend(i), 'Na', 0);

IKdr_S(i) = n.gKdr_S * mKdr_S(i)^1 *(Vsoma(i) - n.EKdr_S);
      mKdr_S(i+1)=stateVar(mKdr_S(i), 0, t.dt,Vsoma(i), 'Kdr', 0);
IKdr_D(i) = n.gKdr_D * mKdr_D(i)^1 *(Vdend(i) - n.EKdr_D);
      mKdr_D(i+1)=stateVar(mKdr_D(i), 0, t.dt,Vdend(i), 'Kdr', 0);
      
      
ILeak_S(i) = (n.gLeak_S *(Vsoma(i)-n.ELeak_S));
ILeak_D(i) = (n.gLeak_D *(Vdend(i)-n.ELeak_D));
% 
% 
IKa_S(i) = n.gKa_S * mKa_S(i)^1 * hKa_S(i)^1*(Vsoma(i) - n.EKa_S);
     [mKa_S(i+1),hKa_S(i+1)]=stateVar(mKa_S(i), hKa_S(i), t.dt,Vsoma(i), 'Ka', 0);
IKa_D(i) = n.gKa_D * mKa_D(i)^1 * hKa_D(i)^1*(Vdend(i) - n.EKa_D);
     [mKa_D(i+1),hKa_D(i+1)]=stateVar(mKa_D(i), hKa_D(i), t.dt,Vdend(i), 'Ka', 0);
    
      
IKahp_S(i) = n.gKahp_S * mKahp_S(i)^1 *(Vsoma(i) - n.EKahp_S);
      mKahp_S(i+1)=stateVar(mKahp_S(i), 0, t.dt,Vsoma(i), 'Kahp', CaConc_S(i));
IKahp_D(i) = n.gKahp_D * mKahp_D(i)^1 *(Vdend(i) - n.EKahp_D);
      mKahp_D(i+1)=stateVar(mKahp_D(i), 0, t.dt,Vdend(i), 'Kahp', CaConc_D(i));
         
         
IKc_S(i) = n.gKc_S * mKc_S(i)^1 * min(1,(CaConc_S(i)/250))*(Vsoma(i) - n.EKc_S);
      mKc_S(i+1)=stateVar(mKc_S(i), 0, t.dt,Vsoma(i), 'Kc', CaConc_S(i));
IKc_D(i) = n.gKc_D * mKc_D(i)^1 * min(1,(CaConc_D(i)/250))*(Vdend(i) - n.EKc_D);
      mKc_D(i+1)=stateVar(mKc_D(i), 0, t.dt,Vdend(i), 'Kc', CaConc_D(i));
      
ICa_S(i) = n.gCa_S * mCa_S(i)^2 * hCa_S(i)^1*(Vsoma(i) - n.ECa_S);
   [mCa_S(i+1),hCa_S(i+1)]=stateVar(mCa_S(i), hCa_S(i), t.dt,Vsoma(i), 'Ca', 0);
ICa_D(i) = n.gCa_D * mCa_D(i)^2 * hCa_D(i)^1*(Vdend(i) - n.ECa_D);
   [mCa_D(i+1),hCa_D(i+1)]=stateVar(mCa_D(i), hCa_D(i), t.dt,Vdend(i), 'Ca', 0);
   
  CaConc_S(i+1) = CaConc_S(i) +(t.dt*((-n.F * ICa_S(i)) - (CaConc_S(i)/n.Tau_Ca)));
  CaConc_D(i+1) =  CaConc_D(i)+(t.dt*((-n.F * ICa_D(i)) - (CaConc_D(i)/n.Tau_Ca)));

% Isyn_S(i) =-alpha_syn(i) * n.gsyn_S * n.eff_syn * (Vsoma(i) - n.Esyn_S);  %% alpha
 Isyn_S(i) =-sum(dirac_delta(:,i)) * n.gsyn_S * n.eff_syn * (Vsoma(i) - n.Esyn_S);  %%dirac
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

if FLit(i)>0%t(i)<=tlight
   
c.Ga1= c.epsilon1 * FLit(i) *(1-exp(-t.tme(i)/c.TChRL));
c.Ga2= c.epsilon2 * FLit(i) *(1-exp(-t.tme(i)/c.TChRL));
else
 if i>1 && FLit(i-1)>0 
          lt=lt+1;
 end
 tdr(lt,end+1)=t.tme(i)-(L.t_off_begin(lt)*0.05);
 tdr2=exp(-(t.tme(i)-(L.t_off_begin(lt)*0.05))/c.TChRD);
c.Ga1= c.epsilon1 * FLit(i) *(exp(-(t.tme(i)-(L.t_off_begin(lt)*0.05))/c.TChRD)-exp(-t.tme(i)/c.TChRD));
c.Ga2= c.epsilon2 * FLit(i) *(exp(-(t.tme(i)-(L.t_off_begin(lt)*0.05))/c.TChRD)-exp(-t.tme(i)/c.TChRD));
% c.Ga1= c.epsilon1 * FLit(i) *(exp((tme_dark-(L.tLight_on/0.05))/c.TChRD)-exp(-t.tme(i)/c.TChRD));
% c.Ga2= c.epsilon2 * FLit(i) *(exp((tme_dark-(L.tLight_on/0.05))/c.TChRD)-exp(-t.tme(i)/c.TChRD));

end


C1(i+1)= C1(i)+ (t.dt *((c.Grd *C2(i)) + (c.Gd1 *O1(i)) - (c.Ga1*C1(i))));
O1(i+1)= O1(i) + (t.dt *((c.Ga1 * C1(i)) - ((c.Gd1 +c.ect)*O1(i)) + (c.etc*O2(i))));
O2(i+1)= O2(i) + (t.dt *((c.Ga2 *C2(i)) - ((c.Gd2 +c.etc)*O2(i)) + (c.ect*O1(i))));
C2(i+1)= C2(i) + (t.dt *((c.Gd2 *O2(i)) - ((c.Ga2 +c.Grd)*C2(i)))) ;

 I_ChR2(i)=(O1(i) + (c.gamma *O2(i))) *c.A_ChR2 * c.gChR2 *(c.V_rest_ChR2-c.EChR2) * ((1-exp(-(c.V_rest_ChR2-c.EChR2)/c.v0))/((c.V_rest_ChR2-c.EChR2)/c.v1)); 
%  I_ChR2(i)=(O1(i) + (c.gamma *O2(i))) *c.A_ChR2 * c.gChR2 *(Vsoma(i)-c.EChR2) * ((1-exp(-(Vsoma(i)-c.EChR2)/c.v0))/((Vsoma(i)-c.EChR2)/c.v1));  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

  Vsoma(i+1) =  Vsoma(i) + (t.dt/n.Csoma)*(Iext(i)-(INa_S(i)+IKdr_S(i)+IKa_S(i)+IKahp_S(i)+IKc_S(i)+ICa_S(i)+I_ChR2(i)-Isyn_S(i)+ILeak_S(i)+(n.g_c*(Vdend(i)-Vsoma(i)))));%+(g_c*(Vdend(i)-Vsoma(i)))));  Iext(i)
  Vdend(i+1)=   Vdend(i) + (t.dt/n.Cdend)*(-(INa_D(i)+IKdr_D(i)+IKa_D(i)+IKahp_D(i)+IKc_D(i)+ICa_D(i)+ILeak_D(i))+(n.g_c*(Vsoma(i)-Vdend(i))));
  
if Vsoma(i+1)>=A.spike_threshold && Vsoma(i)<A.spike_threshold
    num_spikes=num_spikes+1;
    time_temp(num_spikes)=(i*t.dt);
    dirac_temp(i)=1;
    
else
     dirac_temp(i)=0;
end
end

dirac_delta=dirac_temp;
% INa_S(i+1) = 0;
% IKdr_S(i+1) = 0;
% IKa_S(i+1) = 0;    
% IKahp_S(i+1) = 0;
% IKc_S(i+1) = 0;
% ICa_S(i+1) = 0;
% I_ChR2(i+1) = 0;
% Isyn_S(i+1) = 0;
% 
% FLight(i+1)=0;
% Iext(i+1)=0;
% jh=alpha_syn.*0.05;
% figure();
% subplot(2,1,1);
% plot(t.tme,(alpha_syn.*n.gsyn_S));
% title('synapse conductance mult 2');
% 
% subplot(2,1,2);
% plot(t.tme,(alpha_syn));
% title('synapse conductance');
% 
% figure();
% plot(t.tme,Isyn_S);
% title('synapse current');

timeSpike=time_temp;
dirac=dirac_delta;
params=[Vsoma(:,1:end-1);Vdend(:,1:end-1);INa_S;IKdr_S;IKa_S;IKahp_S;IKc_S;ICa_S;Isyn_S;FLit;CaConc_S(:,1:end-1);I_ChR2];
end