% This function plots brain activity in 2D.
function plt(varargin)
% varargin = [series, head, tail]
switch nargin
    case 3
        head = varargin{2};
        tail = varargin{3};
        t = varargin{1}{1}(head:tail);
        d = varargin{1}{2}(:, head:tail);
    case 2
        head = varargin{2};
        t = varargin{1}{1}(head:end);
        d = varargin{1}{2}(:, head:end);
    case 1
        t = varargin{1}{1};
        d = varargin{1}{2};
end

figure("Name", varargin{1}{3});
plot(t, d, 'LineWidth', 1.2)
grid on
% xlabel('time/ms','FontSize', 28)
% ylabel('BOLD signal', 'FontSize', 28)
end

