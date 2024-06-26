% This is a dynamics model for brain simulation.
% Main equations are following.
%
%

function series = Wilson_Cowans(connectome, parcel_size, step, time, stimulus)
s = parcel_size;
C = connectome(1:s, 1:s);

tau_e = 100;
tau_i = 100;
c_ei = -1;
c_ie = 1;
c_i = -1;

v = 0.005;
w = 0.005;
% r_e = 2;
% r_i = 2;

h = step;
t = 0:h:time;
if(~exist("stimulus", "var"))
    stimulus = zeros(s, size(t, 2));
end

E = 0 * ones(s, size(t, 2));
I = E;
p = I;
q = p;
% E(:, 1) = 0.73 + 0.1 * rand(s, 1);
% I(:, 1) = 0.73 + 0.1 * rand(s, 1);
E(:, 1) = abs(normrnd(0, 1, s, 1))/5;
I(:, 1) = abs(normrnd(0, 1, s, 1))/5;

for k = 1:size(t, 2) - 1
    p(:, k) = C * E(:, k) + c_ei * I(:, k);
    q(:, k) = c_ie * E(:, k) + c_i * I(:, k);
    P = Se(p(:, k));
    Q = Si(q(:, k));
    dE = 1/tau_e * (-E(:, k) + max(P)*(1 - E(:, k)/max(P)) .* P + stimulus(:, k)) + v * normrnd(0, 1, s, 1);
    dI = 1/tau_i * (-I(:, k) + max(Q)*(1 - I(:, k)/max(Q)) .* Q) + w * normrnd(0, 1, s, 1);
    E(:, k + 1) = E(:, k) + h * dE;
    I(:, k + 1) = I(:, k) + h * dI;
end
series = {t, E, inputname(1), step, time};

% figure(Name="p");subplot(211);plot(t,p);subplot(212);plot(min(min(p)):0.1:max(max(p)), Se(min(min(p)):0.1:max(max(p))));
% figure(Name="q");subplot(211);plot(t,q);subplot(212);plot(min(min(q)):0.1:max(max(q)), Si(min(min(q)):0.1:max(max(q))));
end

% function s = S(x)
%  s = 0.33*(1 + tanh(x/pi));
% end
function se = Se(x)
theta = 5;
a = 1;
se = 1./(1 + exp(1 + a * (theta - x)));% - 1./(1 + exp(1 + a * theta));
end 
function si = Si(x)
theta = -0;
a = 9;
si = 1./(1 + exp(1 + a * (theta - x)));% - 1./(1 + exp(1 + a * theta));
end 
