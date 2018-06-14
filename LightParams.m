function[L]=LightParams(c,irradiance)

t=timeParams();

L.FLight_orig=((irradiance*1E-6)*c.sigma_ret/(c.Ephoton*1E-3)); %/mm
% L.tlight=1;
L.on_off_light=0;
L.tLight_on=5;%200;
L.tLight_off=100;

L.period_light=L.tLight_on+L.tLight_off;

L.t_off_begin=0:(L.period_light/t.dt):t.loop;
L.t_on_begin= (L.tLight_off/t.dt):(L.period_light/t.dt):t.loop;
r=length(L.t_off_begin);
if length(L.t_off_begin)~=length(L.t_on_begin)
 L.t_on_begin(r)=t.loop;
end
j=0;
for i=1:t.loop

if j<r
    if i>=L.t_off_begin(j+1)
         j=j+1;
    end
end   
    if i>=L.t_off_begin(j) && i<L.t_on_begin(j)
    L.FLight(i)=L.FLight_orig*0;
    
    else
        
    L.FLight(i)=L.FLight_orig*1;
    
   end

end


end