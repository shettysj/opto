function[A]=currentParams(Iext_ori)
t=timeParams();

A.tcurrent_on=100;%200;
A.tcurrent_off=50;
A.num_spikes=0;
A.spike_threshold=50;
% A.on_off_current=0;
A.period=A.tcurrent_on+A.tcurrent_off;

A.t_off_begin=0:(A.period/t.dt):t.loop;
A.t_on_begin= (A.tcurrent_off/t.dt):(A.period/t.dt):t.loop;
r=length(A.t_off_begin);
if length(A.t_off_begin)~=length(A.t_on_begin)
 A.t_on_begin(r)=t.loop;
end
j=0;
for i=1:t.loop

if j<r
    if i>=A.t_off_begin(j+1)
         j=j+1;
    end
end   
    if i>=A.t_off_begin(j) && i<A.t_on_begin(j)
    A.Iext(i)=Iext_ori*0;
    
    else
        
    A.Iext(i)=Iext_ori*1;
    
        end

end

end