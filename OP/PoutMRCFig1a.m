
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

raw = openfig('OP\data\PoutFig1a_raw.fig'); hold on

loglog(v,ones(1,length(v))*Po(Ns,Antenas,0.5,1),'k:',...
       v,ones(1,length(v))*Po(Ns,Antenas,2,1),'k:',...
       v,ones(1,length(v))*Po(Ns,Antenas,5,1),'k:',...
         'linewidth',1.5);

ylim([0.9999e-5 1])

op_fig = findobj(raw,'Type', 'line');
for i = 4:9
       set(get(get(op_fig(i), 'Annotation'), 'LegendInformation'), 'IconDisplayStyle', 'off');
end

legend(...
       '$W$ = 0.5',...
       '$W$ = 1',...
       '$W$ = 2',...
       sprintf('2-antennas\n MRC'),...
       'FontSize', 12, 'location','southwest')

ax = gca;
ax.FontSize = 12;


set(legend, 'Interpreter', 'latex')
xlabel('Number of Ports', 'FontSize', 12)
ylabel('OP', 'FontSize', 12)

%Label
dim1 = [0.62 0.05 0.2 0.2];
str = {"$\mu = 1.0$","$\frac{\gamma_{\rm th}}{\bar{\gamma}}$ = -3 dB"};
annotation('textbox',dim1,'interpreter','latex','String',str,'FitBoxToText','on', 'FontSize', 12);

% %TextArrow MRC
% x_arrow = [0.27 0.27];
% y_arrow = [0.2 0.88];
% str2 = {"2-antennas MRC","($\alpha = $ 5.0, 2.0 and 0.5)"};
% annotation('textarrow',x_arrow,y_arrow,'interpreter','latex','String',str2, 'FontSize', 12);

%Ellipse Alpha=5
dim = [0.295 0.45 .04 .1];
annotation('ellipse',dim,'LineStyle','--','LineWidth',0.75)
dim1 = [.33 .4 0.1 0.1];
str = {"$\alpha$ = 5.0"};
annotation('textbox',dim1,'LineStyle','none','interpreter','latex','String',str,'FitBoxToText','on', 'FontSize', 12);

%Ellipse Alpha=2
dim = [.295 .69 .04 .1];
annotation('ellipse',dim,'LineStyle','--','LineWidth',0.75)
% x_arrow = [0.55 0.71];
% y_arrow = [0.42 0.42];
dim1 = [.37 .7 0.1 0.1];
str2 = {"$\alpha$ = 2.0","(Rayleigh)"};
annotation('textbox',dim1,'LineStyle','none','interpreter','latex','String',str2,'FitBoxToText','on', 'FontSize', 12, 'HorizontalAlignment', 'center');
% annotation('textarrow',x_arrow,y_arrow,'interpreter','latex', 'FontSize', 12, 'HorizontalAlignment','right');
% dim1 = [.73 .36 0.1 0.1];
% annotation('textbox',dim1,'LineStyle','none','interpreter','latex','String',str2,'FitBoxToText','on', 'FontSize', 12, 'HorizontalAlignment','center');


%Ellipse Alpha=0.5
dim = [.5 .78 .04 .1];
annotation('ellipse',dim,'LineStyle','--','LineWidth',0.75)
dim1 = [.53 .81 0.1 0.1];
str = {"$\alpha$ = 0.5"};
annotation('textbox',dim1,'LineStyle','none','interpreter','latex','String',str,'FitBoxToText','on', 'FontSize', 12);

%Label
% dim1 = [0.13 0.08 0.1 0.1];
% str = {"$\textbf{(a)}$"};
% annotation('textbox',dim1,'interpreter','latex','String',str,'FitBoxToText','on', 'FontSize', 12, 'fontweight', 'bold','LineStyle', 'none');

% Delta OP
dim1 = [.248 .248];
dim2 = [.63 .49];
annotation('line',dim1,dim2,'LineStyle','-','LineWidth',0.75)
dim1 = [.248 .31];
dim2 = [.49 .49];
annotation('line',dim1,dim2,'LineStyle','-','LineWidth',0.75)
dim1 = [.15 .5 0.1 0.1];
str = {"$\Delta P_{\rm out}$"};
annotation('textbox',dim1,'LineStyle','none','interpreter','latex','String',str,'FitBoxToText','on', 'FontSize', 12);

grid on

savefig('figs\PoutJakesMRCFig1a.fig')
hold off


