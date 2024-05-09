%% preparation
clc
clear
close all

%% loading
loading

%% pre-processing
cpax = 5 * cpax;

%% main simulation
apax = reducedWongWang(cpax, 116, 0.1, 2000);
plt(apax);
% axis off
% xlabel('population label','FontName','Times New Roman')
% ylabel('time/ms','FontName','Times New Roman')
% zlabel('spiking rate','FontName','Times New Roman')

% plt(amvb);
%% BOLD signal sim
bpax = bold(apax);
plt(bpax)
% plt(bmvb)
%% pearson correlation coeffience
% fpax = fplt(bpax);
% axis off
% fmvb = fplt(bmvb);
% ffc=fc.*(fc>0);
% figure;
% imagesc(ffc)
% colorbar

%%
% figure;
% imagesc(cpax)
% % imagesc(Paxinos_FC)
% % colormap summer
% % colorbar
% axis off
