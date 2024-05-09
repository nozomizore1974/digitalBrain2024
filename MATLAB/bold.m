function bold = bold(series)
% This is the function simulating the BOLD signal.
% v_dot = 1/tau * (f_in - f_out);
% q_dot = 1/tau (f_in*E/E0 - f_out*q/v);
% f_out = v ^ 1/a; ##Grubb's exponential law
% E = 1 - (1 - E0) ^ 1/f_in;
% In summary,
% v_dot = 1/tau * (f - v ^ 1/a);
% q_dot = 1/tau * (f * (1 - (1 - E0) ^ 1/f)/E0 - v ^ 1/a * q/v). 
% lambda = Delta_S/S0 = V0 * [k1*(1-q) + k2*(1-q/v) + k3*(1-v)];

% series = amvb;
t = series{1}(5000:end);
p = series{2}(:, 5000:end);
h = series{4};
time = series{5};

f_in = flow(series);
f = f_in{2};

a = 0.6;
E0 = 0.6;
tau = 2;

k1 = 7 * E0;
% k2 = 2;
k2 = 2 * E0;
k3 = 2 * E0 - 0.2;
V = 0.2 ;
v = ones(size(p));
q = ones(size(p));

%%
for k = 1:size(t, 2) - 1
    % kinetics equations
    v_dot = 1/tau * (f(:, k) - v(:, k) .^ (1/a));
    q_dot = 1/tau * (f(:, k) .* (1 - (1 - E0) .^ (1./f(:, k))) / E0 - v(:, k) .^ (1/a - 1) .* q(:, k)); 
    % integrator
    v(:, k + 1) = v(:, k) + h * v_dot;
    q(:, k + 1) = q(:, k) + h * q_dot;
end

lambda = V * (k1 * (1 - q) + k2 * (1 - q ./ v) + k3 * (1 - v));
% bs = {t, lambda, 'bold signal', h, time};
% plt(bs);
b = lambda;
bold = {t, b, ['bold signal of ' inputname(1)], h, time};
end
