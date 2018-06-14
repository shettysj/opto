function alpha1=alpha_m(V,ch_name, Ca_conc)
%%% function accepts present membrane volatge and channel name and outputs
%%% the alpha variable alpha_m

if strcmpi(ch_name,'Na')
    

     alpha1 = (0.32 *(13.1-V))/(exp((13.1-V)/4)-1);
      
    
elseif strcmpi(ch_name,'Kdr')
    

     alpha1 = (0.016 *(35.1-V))/(exp((35.1-V)/5)-1);
         
elseif strcmpi(ch_name,'Ka')
    
    alpha1 = (0.02 *(13.1-V))/(exp((13.1-V)/10)-1);

    
elseif strcmpi(ch_name,'Kahp') 

    alpha1 = min((0.2 * Ca_conc * (10^-4)) , 0.01);

elseif strcmpi(ch_name,'Kc')
   
    if V<=50
      alpha1 = (exp(((V-10)/11) - ((V-6.5)/27)))/18.975;
       
    else
        
      alpha1 = 2 *(exp((6.5-V)/27)); 
    
    end
    
elseif strcmpi(ch_name,'Ca') 
 
    alpha1 = 1.6 / (1 + (exp(-0.072 * (V-65))));
    
end
end