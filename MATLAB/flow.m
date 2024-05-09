function flow = flow(series)
% This is the function deriving flow induction and vasolidatory signal from brain activity.
% 
t = series{1}(5000:end);
p = series{2}(:, 5000:end);
h = series{4};


s = size(p, 1);
q(:, 1) = ones(s, 1);
f(:, 1) = ones(s, 1);
kappa = 1/1.54;
gamma = 1/1.44;

for k = 1:size(t, 2) - 1
    % kinetics equations
    dq = p(:, k) - kappa * q(:, k) + gamma * (1 - f(:, k));
    df = q(:, k);
    % integrator
    q(:, k + 1) = q(:, k) + h * dq;
    f(:, k + 1) = f(:, k) + h * df;
end

flow = {t, f, inputname(1), h, series{5}};
% vaso = {t, q, inputname, h, series{5}};
end