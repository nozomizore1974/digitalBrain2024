
% This function calculates and plots Function Connectome.
function fc = fplt(series)
fc = corrcoef(series{2}(2000:end)');
figure('Name', inputname(1));
imagesc(fc);
% colormap summer
colorbar
end
