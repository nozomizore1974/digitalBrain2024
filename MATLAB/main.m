%% preparation
% clc
clear
close all

%% loading
loading

%% pre-process
cion = 1 * (10.^(ion) - 1) * (ion>0);
cpax = 60 * (10.^(pax)-1) .* (pax>0);
% cpax = -1/9 * log(pax + ~(pax>0));
%% Parameter setting
step = 0.1;% ms
period = 5000;% ms

%% stimulus
stim = 0 * ones(1, 1 + period / step);
stim(1000/step:end) = 0.13;
% stim(60/step:80/step) = 1;
% stim(150/step:180/step) = 1;
% stim(100/step:120/step) = 1;

%% simulation
close all
% aion = reducedWongWang(cion, 192, 0.1, 1000);
% aion = Wilson_Cowans(cion, 192, 0.1, 1000);
% apax = reducedWongWang(cpax, 232, 0.1, 200);
% atvb = reducedWongWang(ctvb, 76, 0.1, 1000);
% apax = Oscillator2D(cpax, 232, 0.1, 1000);
apax = Wilson_Cowans(cpax, 232, step, period);
plt(apax)
% plt(apax, 5000);
% result = simulator(cion, 192, "Wilson_Cowans", step, period, stim);
% imagesc(result(1).fc);colorbar
%% BOLD-based sim
% bion = bold(aion);
bpax = bold(apax);
% btvb = bold(atvb);

% plt(bion);
plt(bpax);
% plt(btvb);
% plt(bmvb);
% cosineSimilarity(gpax, )
%% post-process
% close all
% fplt(bion);
% fplt(btvb);
% fplt(bmvb);
% fc = fplt(bpax);
% figure;imagesc(fc .* (fc>0));colorbar

%% trials

%% comments
