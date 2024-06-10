%% clear workspace
clc
clear
close all

%% load data
loading

%% setting super-parameter
period = 1000; % ms
step = 0.1; % ms
sz = 232;

gstep = 1;
lambdastep = 10;

m = 0;

%% perform simulation
% for G = 1:gstep:2 % large-scale connectivity [1]
%     for lambda = 10:lambdastep:30 % poisson noise [ms]
%         [s, r, fc] = oscillator(pax, 232, step, period, G, lambda, gpax);
%         if (s > m)
%             bG = G;
%             blambda = lambda;
%             m = s;
%             mfc = fc;
%         end
%     end
% end
% 
% figure;imagesc(mfc);colorbar
% figure;imagesc(gpax);colorbar

%% NOTE
% HCP & Bunkyo-ku(JTD)
% Houkusai Usage

% Similarity
% System Energy
% Less Square Error & Linear Regression

%% comment
close all
[ks,kr,kfc] = oscillator(pax, sz, step, period, 10, 0.01, gpax);
display(ks)
figure("Name", "cosine similarity = " + num2str(ks));
% colormap("turbo")
% imagesc(kfc.*(kfc>0));colorbar
% subplot(121);imagesc(kfc);colorbar;
subplot(221);imagesc(kfc.*(kfc>0));colorbar;
subplot(222);imagesc(pax(1:sz, 1:sz));colorbar;
subplot(223);imagesc(gpax(1:sz, 1:sz).*(gpax(1:sz, 1:sz)>0));colorbar;
subplot(224);imagesc(pax(1:sz, 1:sz));colorbar;
% subplot(122);imagesc(gpax);colorbar;
% figure;
% imagesc(kfc-gpax);colorbar

