clc

set(0,'defaulttextinterpreter','latex');
set(groot,'defaultAxesTickLabelInterpreter','latex');

mu = 2;
fd = 1;
alpha = [1 1.5 2];
W = [0.2];
rdB = linspace(25,25,1);
N = 1:1:15;
% N = [1 5 10 14 16 20 25 30];

r = (1e-3)*10.^(rdB/10);

L = zeros(length(N),length(r),length(W),length(alpha));
Li = zeros(length(N),length(r),length(W),length(alpha));
for w = 1:length(W)
    for a = 1:length(alpha)
        for n = 1:length(N)
            al = alpha(a)*ones(N(n),1);
            for i = 1:length(r)
                L(n,i,w,a) = LCR_Jakes(r(i),al,mu,W(w),N(n),fd);
                L(n,i,w,a)
                Li(n,i,w,a) = LCRI(r(i),al,mu,W(w),N(n),fd);
            end
        end
    end
end

%%

figure(2)
plot(N,squeeze(L(:,1,1,1)),'-ro',...
     N,squeeze(L(:,1,1,2)),'-go',...
     N,squeeze(L(:,1,1,3)),'-bo',...
     N,squeeze(Li(:,1,1,1)),'--r',...
     N,squeeze(Li(:,1,1,2)),'--g',...
     N,squeeze(Li(:,1,1,3)),'--b',...
     'linewidth',0.5)
hold off

xlim([1 15])
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15])

legend('$\alpha$ = 1',...
       '$\alpha$ = 1.5',...
       '$\alpha$ = 2',...
       'Independent case ($\alpha$ = 1.0)',...
       'Independent case ($\alpha$ = 1.5)',...
       'Independent case ($\alpha$ = 2.0)',...
       'FontSize', 12, 'location','northeast','interpreter','latex')

ax = gca;
ax.FontSize = 12;  

xlabel('Number of Ports', 'FontSize', 12)
ylabel('Normalized LCR $L(\rho_{\rm th})/f_{\rm D}$','interpreter','latex', 'FontSize', 12)

grid on
savefig('figs\LCRJakesFig3.fig')