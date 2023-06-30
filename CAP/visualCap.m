clear;
close all;
clc;

set(0,'defaulttextinterpreter','latex');
set(groot,'defaultAxesTickLabelInterpreter','latex');

c1 = load('CAP\dataOmega10dB\CAP1.mat');
semilogx(c1.N_ports, c1.C(:),'-o');
hold on;
c2 = load('CAP\dataOmega10dB\CAP2.mat');
semilogx(c2.N_ports, c2.C(:),'-o');
hold on;
c3 = load('CAP\dataOmega10dB\CAP5.mat');
semilogx(c3.N_ports, c3.C(:),'-o');
hold on;
c4 = load('CAP\dataOmega10dB\CAP10.mat');
semilogx(c4.N_ports, c4.C(:),'-o');
hold on;


axis([1 100 1.5 4])
grid on;

set(legend, 'Interpreter', 'latex')
xlabel('Number of Ports', 'FontSize', 12)
ylabel('Capacity', 'FontSize', 12)

ax = gca;
ax.FontSize = 12;

% legend('$\alpha$ = 0.5',...
%        '$\alpha$ = 2 (Rayleigh)',...
%        '$\alpha$ = 10',...
%        'FontSize', 12, 'location','southeast')

%Label
dim1 = [0.39 0.09 0.2 0.2];
str = {"$\mu = 1.0$","$\bar{\gamma}$ = 10 dB",'$W$ = 0.5'};
annotation('textbox',dim1,'interpreter','latex','String',str,'FitBoxToText','on', 'FontSize', 12);

legend('$\alpha$ = 1',...
       '$\alpha$ = 2 (Rayleigh)',...
       '$\alpha$ = 5',...
       '$\alpha$ = 10',...
       'FontSize', 12, 'location','southeast')

% %Label
% dim1 = [0.13 0.08 0.1 0.1];
% str = {"$\textbf{(c)}$"};
% annotation('textbox',dim1,'interpreter','latex','String',str,'FitBoxToText','on', 'FontSize', 12, 'fontweight', 'bold','LineStyle', 'none');


savefig('figs\CapOmegaFig2.fig')
hold off