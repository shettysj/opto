function[c]=ChR2Params()
%%%%%%%%%%%%% chr2 %%%%%%%%%%%
c.gamma=0.05;
c.A_ChR2=5000;
c.gChR2=0.0025;
c.EChR2=0;
c.v0=43;%70;
c.v1=70;%43;
c.epsilon1=0.8535;%0.5;%
c.epsilon2=0.025;%0.5;%
c.V_rest_ChR2=-70; %mV
 
c.TChRL=1.3;
c.TChRD=0.3;
c.Gd1=0.13;
c.etc=0.023;
c.ect=0.053;
c.Grd=0.000333;
c.Gd2=0.0025;

c.h=6.63E-34; %kg m^2/s
c.c=2.998E8; %m/s
%hc=1.986446E-25; %kg m^3/s^2
c.wavelength=470; %nm
c.sigma_ret=1.2E-8; %um^2
c.Ephoton=1E9*c.h*c.c/c.wavelength; %converted lambda from nm to m
c.Ephoton=c.Ephoton*1E12;
end