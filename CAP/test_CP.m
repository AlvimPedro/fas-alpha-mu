clear all
close all
clc

alpha = 2;
mu = linspace(1,2,2e1);
N_ports = [1 10 60 100];
W = 2;
gamma_th_bar = 10^(0/10);
Tol = 1e4;
gb = 10^(10/10);

C = zeros(length(mu),length(N_ports));
for i = 1:length(N_ports)
    for w = 1:length(mu)
        [i w]
        alpha_k = ones(1,N_ports(i)) * alpha;
        C(w,i) = Cap(gb,alpha_k,mu(w),W,N_ports(i))
        figure(1)
        plot(mu(1:w),C(1:w,i),'-o'); hold on
        grid on
    end
end
hold off


%%
for i = 1:length(N_ports)
    for w = 1:length(W)
        figure(1)
        plot(N_ports(1:i),C(w,1:i),'-o'); hold on
        grid on
    end
end


%%
figure(213)
plot(mu,C(:,1),'-o'); hold on


%%
load('matlab_05')

figure(2)
plot(N_ports,C(1,:),'-o',...
     N_ports,C(2,:),'-o',...
     N_ports,C(3,:),'-o',...
     N_ports,C(4,:),'-o'); hold on
legend('\alpha=0.5',...
       '\alpha=2.0',...
       '\alpha=5.0',...
       '\alpha=10.0')

%%
figure(3)
semilogx(N_ports,C(1,:),'-o',...
     N_ports,C(2,:),'-o',...
     N_ports,C(3,:),'-o',...
     N_ports,C(4,:),'-o'); hold on
legend('\alpha=0.5',...
       '\alpha=2.0',...
       '\alpha=5.0',...
       '\alpha=10.0')
