% This is a dynamics model for brain simulation.
% Main equations are following.
%
%

function series = Oscillator2D(connectome, parcel_size, step, time)
s = parcel_size;
C = connectome(1:s, 1:s);

a = -2;
b = -10;
% c = 0;
d = 0.02;
e = 3;
f = 1;
g = 0;
I = 0;
alpha = 1;
beta = 1;
gamma = 1;
tau = 2;
%%
h = step;
t = 0:h:time;
v = zeros(s, size(t, 2));
w = v;

v(:, 1) = rand(s, 1);
w(:, 1) = rand(s, 1);

for i =1:size(t, 2) - 1
    dv = d * tau * (-f * v(:, i).^3 +e * v(:, i).^2 + g * v(:, i) + alpha * w(:, i) + gamma * I) + 0.001*normrnd(0, 1, s, 1);
    dw = d / tau * (a + b * v(:, i) + C * v(:, i).^2 - beta * w(: ,i)) + 0.001*normrnd(0, 1, s, 1);
    v(:, i + 1) = v(:, i) + dv * h;
    w(:, i + 1) = w(:, i) + dw * h;
end
series = {t, v, inputname(1), h, time};
end
