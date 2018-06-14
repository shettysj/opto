function alpha2=alpha_h(V,ch_name)
%%% function accepts present membrane volatge and channel name and outputs
%%% the alpha variable alpha_h


if strcmpi(ch_name,'Na')
 
    alpha2 =0.128 * exp((17-V)/18);
 
elseif strcmpi(ch_name,'Kdr')
 
     alpha2 = 0;
   
elseif strcmpi(ch_name,'Ka')

    alpha2 = 0.0016 * exp((-13-V)/18);

elseif strcmpi(ch_name,'Kahp') 

    alpha2 = 0;

elseif strcmpi(ch_name,'Kc')
   
    alpha2 = 0;
  
elseif strcmpi(ch_name,'Ca') 

    if V<=0
    alpha2 = 0.005;

    else 
    alpha2= (exp((-V)/20))/200;

    end

end
end