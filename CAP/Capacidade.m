clear all
clc

% alpha = [0.5 2 5 10];
alpha = [0.5]
mu = 1;
% N_ports = [1 2 3 5 10 20 60 200 1000];
N_ports = [1 2 3 5 10 20 50 100];
% N_ports = [1 2 3];
W = 0.5;
gamma_th_bar = 10^(0/10);
Tol = 1e4;
gb = 10^(10/10);

C = zeros(length(alpha),length(gb),length(W),length(N_ports));
for a=1:length(alpha)
for g=1:length(gb)
for i = 1:length(N_ports)
    for w = 1:length(W)
        [i w]
        alpha_k = ones(1,N_ports(i)) * alpha(a);
        C(a,g,w,i) = Cap(gb(g),alpha_k,mu,W(w),N_ports(i))
%         C(w,i) = sin(1-exp(-i*w))
        figure(1)
        semilogx(N_ports(1:i),squeeze(C(a,g,w,1:i)),'-o'); hold on
        grid on
        axis([1 1000 2 4.5])
    end
end
hold off


%%
for i = 1:length(N_ports)
    for w = 1:length(W)
        figure(1)
        plot(N_ports(1:i),C(w,1:i),'-'); hold on
        grid on
    end
end
end 
end

savefig('CAP.fig')