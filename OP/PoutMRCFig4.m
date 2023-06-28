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

openfig('OP\data\PoutFig4_raw.fig'); hold on

loglog(v,ones(1,length(v))*Po(Ns,Antenas,0.5,1),'k:',...
       v,ones(1,length(v))*Po(Ns,Antenas,2,1),'k:',...
       v,ones(1,length(v))*Po(Ns,Antenas,5,1),'k:',...
         'linewidth',1.5)

ylim([0.9999e-5 1])


legend('$W$ = 0.5',...
       '$W$ = 1',...
       '$W$ = 2',...
       'FontSize', 12, 'location','southwest','interpreter','latex')

ax = gca;
ax.FontSize = 12;


set(legend, 'Interpreter', 'latex')
xlabel('Number of Ports', 'FontSize', 12)
ylabel('OP', 'FontSize', 12)

%Label
dim1 = [0.15 0.3 0.18 0.11];
str = {"$\mu = 1.0$","$\frac{\gamma_{\rm th}}{\bar{\gamma}}$ = -3 dB"};
annotation('textbox',dim1,'interpreter','latex','String',str,'FitBoxToText','on', 'FontSize', 12);

%TextArrow MRC
x_arrow = [0.72 0.72];
y_arrow = [0.2 0.88];
str2 = {"2-antennas MRC","($\alpha = $ 5.0, 2.0 and 0.5)"};
annotation('textarrow',x_arrow,y_arrow,'interpreter','latex','String',str2, 'FontSize', 12);

%Ellipse Alpha=5
dim = [0.25 0.52 .1 .04];
annotation('ellipse',dim,'LineStyle','--','LineWidth',0.75)
dim1 = [.12 .48 0.1 0.1];
str = {"$\alpha$ = 5.0"};
annotation('textbox',dim1,'LineStyle','none','interpreter','latex','String',str,'FitBoxToText','on', 'FontSize', 12);

%Ellipse Alpha=2
dim = [.32 .69 .1 .04];
annotation('ellipse',dim,'LineStyle','--','LineWidth',0.75)
% x_arrow = [0.53 0.63];
% y_arrow = [0.42 0.42];
dim1 = [.44 .65 0.1 0.1];
str2 = {"$\alpha$ = 2.0","(Rayleigh)"};
annotation('textbox',dim1,'LineStyle','none','interpreter','latex','String',str2,'FitBoxToText','on', 'FontSize', 12);
% annotation('textarrow',x_arrow,y_arrow,'interpreter','latex', 'FontSize', 12, 'HorizontalAlignment','right');
% dim1 = [.65 .36 0.1 0.1];
% annotation('textbox',dim1,'LineStyle','none','interpreter','latex','String',str2,'FitBoxToText','on', 'FontSize', 12, 'HorizontalAlignment','center');


%Ellipse Alpha=0.5
dim = [.497 .79 .04 .1];
annotation('ellipse',dim,'LineStyle','--','LineWidth',0.75)
dim1 = [.52 .83 0.1 0.1];
str = {"$\alpha$ = 0.5"};
annotation('textbox',dim1,'LineStyle','none','interpreter','latex','String',str,'FitBoxToText','on', 'FontSize', 12);


grid on

savefig('figs\PoutMRCFig4.fig')
hold off


