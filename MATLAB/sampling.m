function sampled = sampling(series, freq)
% This is function downsampling the time series.
% [series]=ms [freq]=kHz
period = 1 / freq; %[period]=ms
step = series{4}; %[step]=ms
p = period / step;
s = series{2}(:, 1:p:end);
t = 0:period:series{5};
sampled = {t, s, series{3}, period, series{5}};
% disp(p)
end

