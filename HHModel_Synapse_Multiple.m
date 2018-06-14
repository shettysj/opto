%%%%%%%%%%%%%%%%%%%%%%%% F=(I*sigma_ret/Ephoton); Ephoton=hc/lambda
%%%%%%%%%%%%%%%%%%%%%%%% sigma_ret=1.2E-8 (um-2); lambda=470nm

clear all;
num_neuron=8; %dirac:max=180,min=9 g=0.01
tspk1=0;
tP= timeParams();
% for li=1:length(Iext)-1
IEXT=0.0;%1ms=0.5
Isy=zeros();
irradiance=0.08;%0.2;%0.895;%895;%0.04; %mW/mm^2 1ms=6
CP= ChR2Params();
LP= LightParams(CP,irradiance);
nP= NeuronParams();
AP=currentParams(IEXT);

% alpha_syn=zeros(1,tP.loop);
% alpha_syn_temp=zeros(1,tP.loop);
% tau=1/0.05;


AP2=currentParams(0);
LP2= LightParams(CP,0);
[paramAll_1,tspk2,drc1]=neuron_test(AP.Iext,LP.FLight,Isy,tspk1,tP,nP,CP,LP,AP);

drc=repmat(drc1,num_neuron,1);% 5 max spiking; stops behaviour after 50
tspk=repmat(tspk2,num_neuron,1);

paramAll_3=neuron_test(AP2.Iext,LP2.FLight,drc,tspk,tP,nP,CP,LP,AP);
figure();



    suptitle([ num2str(irradiance), 'mW/mm^2','Light pulse on=' num2str(LP.tLight_on) 'ms']);
subplot(6,1,1);
    plot(tP.tme,(paramAll_1(10,:)));
    axis([0 inf 0  1E-4]);
    xlabel('Time');
    ylabel(' photon flux');
    title('Light pulse');
%     hold on
    
    subplot(6,1,2);
    plot(tP.tme,paramAll_1(1,:));
    xlabel('Time');
    ylabel('Membrane Potential');
    title('Voltage time series-presynaptic neuron');
   
    subplot(6,1,4);
    plot(tP.tme,paramAll_3(1,:));
    axis([0 800 -50  200]);
    xlabel('Time');
    ylabel('Membrane Potential');
    title('Voltage time series-postsynaptic neuron');
%      axis([0 inf -50  100]);
%   plot(tP.tme,paramAll_3(8,:));
%     xlabel('Time');
%     ylabel(' ISyn');
%     title('Voltage time series');
    
    subplot(6,1,3);
  plot(tP.tme,paramAll_1(2,:));
  axis([0 800 -50  200]);
    xlabel('Time');
    ylabel('dendrite Membrane Potential');
    title('Voltage time series-presynaptic neuron');
    
    
    subplot(6,1,5);
  plot(tP.tme,paramAll_3(2,:));
 
    axis([0 800 -50  100]);

    xlabel('Time');
    ylabel('dendrite Membrane Potential');
    title('Voltage time series-postsynaptic neuron');
    
    
     subplot(6,1,6);
  plot(tP.tme,paramAll_1(12,:));
 
%     axis([0 800 -50  100]);

    xlabel('Time');
    ylabel('Ichr2');
    