clear all
clc
close all


alpha = [0.5 2 5];
% alpha = [0.5];
mu = 1;
N_ports = [1 2 3 5 10 15 20 25 30 35 40 45 50 60 80 100];
% N_ports = [1 2 3 5 8 10 15 20 30 100];
W = [0.5 1 2];

%Fig1a
gamma_th_bar = 10.^(-3/10);
%Fig1b
% gamma_th_bar = 10.^(2/10);
% gamma_th_bar = 1;



Po = zeros(length(mu),length(N_ports),length(gamma_th_bar),length(W),length(alpha));
for g = 1:length(gamma_th_bar)
    for i = 1:length(N_ports)
        for m = 1:length(mu)
            for w = 1:length(W)
                for a = 1:length(alpha)
                    [g i m w a]
                    alpha_k = ones(1,N_ports(i)) * alpha(a);
                    Po(m,i,g,w,a) = Pout(gamma_th_bar(g),1,alpha_k,mu(m),W(w),N_ports(i));
                    figure(1)
                    loglog(N_ports(1:i),squeeze(Po(m,1:i,g,w,a)),'-o'); hold on
                    grid on
                end
            end
        end
    end
end
%%
axis([1 N_ports(end) min(Po(:)) 1])
hold off
%%
clc
% Po = [mu N_ports gamma_th_bar W alpha];
figure(1)
% loglog(N_ports,squeeze(Po(1,:,1,1,1)),'-go',...
%        N_ports,squeeze(Po(1,:,1,2,1)),'-bo',...
%        N_ports,squeeze(Po(1,:,1,1,2)),'-go',...
%        N_ports,squeeze(Po(1,:,1,2,2)),'-bo',...
%        N_ports,squeeze(Po(1,:,1,1,3)),'-go',...
%        N_ports,squeeze(Po(1,:,1,2,3)),'-bo'); hold on

       loglog(N_ports,squeeze(Po(1,:,1,1,1)),'-ro',...
       N_ports,squeeze(Po(1,:,1,2,1)),'-go',...
       N_ports,squeeze(Po(1,:,1,3,1)),'-bo',...
       N_ports,squeeze(Po(1,:,1,1,2)),'-ro',...
       N_ports,squeeze(Po(1,:,1,2,2)),'-go',...
       N_ports,squeeze(Po(1,:,1,3,2)),'-bo',...
       N_ports,squeeze(Po(1,:,1,1,3)),'-ro',...
       N_ports,squeeze(Po(1,:,1,2,3)),'-go',...
       N_ports,squeeze(Po(1,:,1,3,3)),'-bo'); hold on
grid on
axis([1 N_ports(end) min(Po(:)) 1])
hold off
legend('W=1',...
       'W=2')


savefig('OP\data\PoutFig4_raw.fig')
% savefig('OP\data\PoutFig1b_raw.fig')
% savefig('Pout.fig')

%%
% figure(2)
% semilogy(mu,Po(:,1,1),'-gx',...
%      mu,Po(:,1,2),'-bh',...
%      mu,Po(:,1,3),'-k*',...
%      mu,Po(:,1,4),'-ks',...
%      mu,Po(:,1,5),'-ms'); hold on
% grid on
% axis([1 mu(end) 1e-6 10])
% hold off
% legend('g=-10',...
%        'g=-5',...
%        'g=0',...
%        'g=5',...
%        'g=10')
