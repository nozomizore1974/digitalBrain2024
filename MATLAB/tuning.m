%% clear workspace
clear
close all

%% load data
loading

%% setting super-parameter
period = 800; % ms
step = 0.1; % ms
size = 232;

gstep = 25;
lambdastep = 2;

m = 0;
%% perform simulation
for G = 0:gstep:100 % large-scale connectivity [1]
    for lambda = 0:lambdastep:10 % poisson noise [ms]
        [k, r, fc] = oscillator(pax, 232, step, period, G, lambda, gpax);
        if (k > m)
            bG = G;
            blambda = lambda;
            m = k;
            mfc = fc;
        end
    end
end
figure;imagesc(mfc);colorbar
figure;imagesc(gpax);colorbar
%% NOTE
% HCP & Bunkyo-ku(JTD)
% Houkusai

% Similarity
% System Energy
% Less Square Error & Linear Regression

%% comment
