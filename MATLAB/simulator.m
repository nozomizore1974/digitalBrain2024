%
% This is a pipeline for simulaiton conducting.
%

function results = simulator(connectome, size, model, step, period, G, lambda, stimulus)
model = str2func(model);
FC = zeros(size);
stim = zeros(size, 1 + period/step);
for n = 1:size
    stim(n, :) = stimulus;
    % activity-sim
    if (~exist("stimulus", "var"))
        a = model(connectome, size, step, period);
    else
        a = model(connectome, size, step, period, stim);
    end
    % bold-sim
    b = bold(a);
    % correl-cal
    fc = corrcoef(b{2}');
    FC(n:end, n:end) = fc(n:end, n:end);
end
% results
results = struct("act", a, "bold", b, "fc", FC);
end
