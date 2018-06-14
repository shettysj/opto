function beta1=beta_m(V,ch_name)
%%% function accepts present membrane volatge and channel name and outputs
%%% the beta variables beta_m

if strcmpi(ch_name,'Na')
 

     beta1  = (0.28 *(V-40.1))/(exp((V-40.1)/10)-1); %%%% changed

elseif strcmpi(ch_name,'Kdr')


      beta1  = 0.25 *  exp((20-V)/40);
    
elseif strcmpi(ch_name,'Ka')
 
    beta1  = (0.0175 *(V-40.1))/(exp((V-40.1)/5)-1);
    
elseif strcmpi(ch_name,'Kahp') 

    beta1  = 0.001;
    
elseif strcmpi(ch_name,'Kc')
   
    if V<=50
      beta1  = (2 *(exp((6.5-V)/27))) - alpha_m(V,ch_name,0);
    else
      beta1  = 0;
    
    end

elseif strcmpi(ch_name,'Ca') 

    beta1  = (0.02 *(V-51.1))/(exp((V-51.1)/5)-1);
  
end
end