% This is a dynamic model for brain populations.
% Main equations are following.
% p_dot = p/tau + (1-p)*gamma*H
% H = (ax - b)/(1-e^(-d(ax-b)))
% x = wJp + JGCp + I_0

function series = reducedWongWang(connectome, parcel_size, step, time, stimulus)

s = parcel_size;
C = connectome(1:s, 1:s);

w = 0.6;
I = 0.33 * ones(s, 1);
tau = 100;
a = 0.27; b = 0.108; d = 154.0;
G = 0.096;
% G = 0.12;
J = 0.2609;
gamma = 0.641;

h = step;
t = 0:h:time;
if(~exist("stimulus", "var"))
    stimulus = 0.33 * ones(s, size(t, 2));
else
    stimulus = repmat(stimulus, s, 1);
end
% x = abs(normrnd(0, 1, s, 1));

p(:, 1) = rand(s, 1);
% c = zeros(s, 1);
for k = 1:size(t, 2) - 1
    c = coupling(p(:, k));
    % kinetics equations
    x = w * J * p(:, k) + J * G * C * p(:, k) + stimulus(:, k) + J * c;
    % x = w * J * p(:, k) + J * G * C * p(:, k) + I;
    % disp(max(x));
    % x = w * J * p(:, k) + J * gamma * C * p(:, k) + I;
    % x = w * J * p(:, k) + J * gamma * C * p(:, k) + I + J * c;
    H = (a * x - b)./(1 - exp(-d * (a * x - b)));
    dp = -p(:, k) / tau + (1 - p(:, k)) * gamma .* H + 0.0001 * normrnd(0, 1, s, 1);
    % integrator
    p(:, k + 1) = p(:, k) + dp * h;
end
series = {t, p, inputname(1), h, time};
end
