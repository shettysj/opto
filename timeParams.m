function[t]=timeParams()
t.dt=0.05; %0.05ms
t.tspan=1000; %ms
t.loop=ceil(t.tspan/t.dt);
t.tme=(1:t.loop)*t.dt;

end