function beta2=beta_h(V,ch_name)
%%% function accepts present membrane volatge and channel name and outputs
%%% the beta variable beta_h

if strcmpi(ch_name,'Na')

   beta2 =  4/(1+exp((40-V)/5));
    
    
elseif strcmpi(ch_name,'Kdr')

     beta2  = 0;
   
    
elseif strcmpi(ch_name,'Ka')

    beta2  = 0.05/(1+exp((10.1-V)/5));
    
    
    
elseif strcmpi(ch_name,'Kahp') 
    beta2  = 0;
    
    
elseif strcmpi(ch_name,'Kc')

    beta2  = 0;
   
    
elseif strcmpi(ch_name,'Ca')   
   
    if V<=0
    beta2  = 0;
    
    else 

    beta2 = 0.005 - alpha_h(V,ch_name);
    
    end
    
    
end
end