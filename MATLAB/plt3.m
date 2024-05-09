
% This function plots brain activity in 3D.
function plt3(varargin)
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

n = 1:size(d, 1);
m = ones(size(t));
indices = n' * m;

figure('Name', varargin{1}{3})
plot3(indices, t, d, LineWidth=1.2);
% xlabel('population ID')
% ylabel('time/ms')
% zlabel('BOLD signal')
grid on
end
