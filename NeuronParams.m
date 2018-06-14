function[n]=NeuronParams()
n.Csoma=0.01; %pF/um^2
n.Cdend=0.01; %pF/um^2
n.g_c=0.02;   %nS/um^2
n.init_V=0;   %mV



%%%%%%% Soma Na %%%%%%%%%%%
n.gNa_S=0.3; %nS/um^2 1.2;%
n.ENa_S=115; %mV 55.17;%

%%%%%%% Soma Kdr %%%%%%%%%%%
n.gKdr_S=0.15; %nS/um^2 0.36;%
n.EKdr_S=-15; %mV -72.14;%

%%%%%%% Soma Ka %%%%%%%%%%%
n.gKa_S=0.05; %nS/um^2
n.EKa_S=-15; %mV

%%%%%%% Soma Kahp %%%%%%%%%%%
n.gKahp_S=0.008; %nS/um^2
n.EKahp_S=-15; %mV

%%%%%%% Soma Kc %%%%%%%%%%%
n.gKc_S=0.1; %nS/um^2
n.EKc_S=-15; %mV

%%%%%%% Soma Ca %%%%%%%%%%%
n.gCa_S=0.04; %nS/um^2
n.ECa_S=140; %mV

% %%%%%%% Soma leak %%%%%%%%%%%
n.gLeak_S=0.001; %nS/um^2 0.003;%
n.ELeak_S=-12.5; %mV -49.42;

%%%%%%%%%% Synaptic %%%%%%%%%
n.gsyn_S=0.01;%0.7;%0.87;   %0.01 %nS/um^2
n.Esyn_S=0;       %mV     
n.eff_syn=1;        %100% efficience
%%%%%%% Dendrite Na %%%%%%%%%%%
n.gNa_D=0; %nS/um^2
n.ENa_D=115; %mV

%%%%%%% Dendrite Kdr %%%%%%%%%%%
n.gKdr_D=0; %nS/um^2
n.EKdr_D=-15; %mV

%%%%%%% Dendrite Ka %%%%%%%%%%%
n.gKa_D=0; %nS/um^2
n.EKa_D=-15; %mV

%%%%%%% Dendrite Kahp %%%%%%%%%%%
n.gKahp_D=0.008; %nS/um^2
n.EKahp_D=-15; %mV

%%%%%%% Dendrite Kc %%%%%%%%%%%
n.gKc_D=0.05; %nS/um^2
n.EKc_D=-15; %mV

%%%%%%% Dendrite Ca %%%%%%%%%%%
n.gCa_D=0.02; %nS/um^2
n.ECa_D=140; %mV

%%%%%%% Dendrite leak %%%%%%%%%%%
n.gLeak_D=0.001; %nS/um^2
n.ELeak_D=-12.5; %mV

%%%%%%%% Ca Concentration %%%%%%%
n.F=3;
n.Tau_Ca=13.33; %%ms
n.init_Ca=0;%0.005;
end