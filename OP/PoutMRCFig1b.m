close all
clear all
clc

set(0,'defaulttextinterpreter','latex');
set(groot,'defaultAxesTickLabelInterpreter','latex');

GbdB = 0;
Gb = 10^(GbdB/10);
GthdB = -3;
Gth = 10^(GthdB/10);

Ns = 1e5;
Antenas = 2;
% Entradas são
% Ns: Numero de amostas
% Ant: Numero de antenas
% x: Alfa
% mu: Mu
Po =@(Ns,Ant,x,mu) sum(sum(Gb^(x/2)*reshape(envalpha(x,mu,Ns*Ant),[Ns Ant]).^2,2)<Gth)/Ns;
v = linspace(1,100,1e2);

openfig('PoutFig1b_raw.fig'); hold on

loglog(v,ones(1,length(v))*Po(Ns,Antenas,0.5,1),'k:',...
       v,ones(1,length(v))*Po(Ns,Antenas,2,1),'k:',...
       v,ones(1,length(v))*Po(Ns,Antenas,5,1),'k:',...
         'linewidth',1.5)

ylim([0.9999e-5 1])


legend('$W$ = 1',...
       '$W$ = 1.5',...
       '$W$ = 2',...
       'FontSize', 12, 'location','northeast')

ax = gca;
ax.FontSize = 12;


set(legend, 'Interpreter', 'latex')
xlabel('Number of Ports', 'FontSize', 12)
ylabel('OP', 'FontSize', 12)

dim1 = [0.65 0.53 0.2 0.2];
str = {"$\mu = 1.0$","$\gamma_{\rm th}/\bar{\gamma}$ = -3dB"};
annotation('textbox',dim1,'interpreter','latex','String',str,'FitBoxToText','on', 'FontSize', 14);

x_arrow = [0.29 0.29];
y_arrow = [0.33 0.88];
str2 = {"2-antennas MRC","($\alpha = $ 5.0, 2.0 and 0.5)"};
annotation('textarrow',x_arrow,y_arrow,'interpreter','latex','String',str2, 'FontSize', 12);

grid on

savefig('PoutMRC.fig')
hold off


