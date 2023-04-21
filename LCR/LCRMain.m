clc

mu = 2;
fd = 1;
alpha = [1 1.5 2];
W = [0.2];
rdB = linspace(25,25,1);
N = 1:1:20;
% N = [1 5 10 14 16 25];

r = (1e-3)*10.^(rdB/10);

L = zeros(length(N),length(r),length(W),length(alpha));
Li = zeros(length(N),length(r),length(W),length(alpha));
for w = 1:length(W)
    for a = 1:length(alpha)
        for n = 1:length(N)
            al = alpha(a)*ones(N(n),1);
            for i = 1:length(r)
                L(n,i,w,a) = LCR(r(i),al,mu,W(w),N(n),fd);
                L(n,i,w,a);
                Li(n,i,w,a) = LCRI(r(i),al,mu,W(w),N(n),fd);
            end
        end
    end
end

%%

figure(2)
plot(N,squeeze(L(:,1,1,1)),'-rx',...
     N,squeeze(L(:,1,1,2)),'-gd',...
     N,squeeze(L(:,1,1,3)),'-bo',...
     N,squeeze(Li(:,1,1,1)),'--rx',...
     N,squeeze(Li(:,1,1,2)),'--gd',...
     N,squeeze(Li(:,1,1,3)),'--bo',...
     'linewidth',1.5)
hold off
legend('Alpha = 1',...
        'Alpha = 1.5',...
        'Alpha = 2')
grid on
savefig('lcr.fig')