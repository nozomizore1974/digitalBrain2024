clc;
clear
close all
%%
load('default.mat')
parcel = 54;
default = weights(1:parcel, 1:parcel);
load("connectome_data.mat")
ion_cas = MBMv4_SC(1:parcel, 1:parcel);
paxinos = Paxinos_SC(1:parcel, 1:parcel);

n = 1:parcel;
step = 0.001;
period = 1000;
% C = 0.5 * normrnd(0, 1, parcel, parcel);
% C = (C + C')/2 - min(min(C));
%%
dft = reducedWongWang(default, parcel, step, period);
ion = reducedWongWang(ion_cas, parcel, step, period);
pax = reducedWongWang(paxinos, parcel, step, period);
%% 
close all
m = ones(size(t(70:end)));
q = n' * m;
figure('Name',['ion_cas_' 'connectome size = ' num2str(parcel)]);
subplot(121)
imagesc(ion_cas)
subplot(122)
plot3(q, t(70:end), p(:, 70:end), LineWidth=0.8);
grid on
% title("ioncas data")

figure('Name',['default_' 'connectome size = ' num2str(parcel)])
subplot(121)
imagesc(default)
subplot(122)
plot3(q, t(70:end), d(:, 70:end), LineWidth=0.8);
grid on
% title("default data")

figure('Name', ['paxinos_' 'connectome size = ' num2str(parcel)])
subplot(121)
imagesc(paxinos)
subplot(122)
plot3(q, t(70:end), s(:, 70:end), LineWidth=0.8)
grid on