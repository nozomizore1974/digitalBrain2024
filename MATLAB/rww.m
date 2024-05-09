function series = rww(connectome, parcelsize, step, time)
% This is a dynamic model of brain.
% p_dot = p/tau + (1-p)*gamma*H
% H = (ax - b)/(1-e^(-d(ax-b)))
% x = wJs + JGCS + I_0
s = parcelsize;
C = connectome(1:s, 1:s);

w = 0.3;
I = ones(s, 1);
tau = 0.1;
a = 270; b = 108; d = 0.154;
G = 0.096; J = 0.2609;
gamma = 0.641;

h = step;
t = 0:h:time;
x = abs(normrnd(0, 1, s, 1));

p(:, 1) = 1 + 0.05 * normrnd(0, 1, s, 1);
p_dot(:, 1) = zeros(s, 1);

for k = 2:size(t, 2)
    p(:, k) = p(:, k - 1) + p_dot(:, k - 1) * h + 0.005 * normrnd(0, 1, s, 1);
    H = (a * x - b)./(1 - exp(-d * (a * x - b)));
    p_dot(:, k) = p(:, k - 1) / tau + (1 - p(:, k - 1)) * gamma .* H;
    x = w * J * p(:, k) + J * G * (C * p(:, k)) + I;
end

series = {t, p};
end

