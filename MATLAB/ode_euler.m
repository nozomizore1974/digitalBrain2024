clear
close all
h = 0.001;
x = 0:h:5;
%% ydot=lny-2y; y(0)=1;
ybar = zeros(size(x));
ydot = ybar;
ybar(1) = 1;
ydot(1) = 1;
for k = 2:size(x, 2)
    ybar(k) = ybar(k - 1) + ydot(k - 1) * h;
    ydot(k) = log(ybar(k)) - 2 * ybar(k);
end
plot(x,ybar,LineWidth=1)
%% udot=2v+u, vdot=-u; u(0)=0, v(0)=1
ubar = zeros(size(x));
vbar = ubar;
udot = ubar;
vdot = vbar;
ubar(1) = 0;
vbar(1) = 1;
udot(1) = 2;
vdot(1) = 0;
for k = 2:size(x, 2)
    ubar(k) = ubar(k - 1) + udot(k - 1) * h;
    vbar(k) = vbar(k - 1) + vdot(k - 1) * h;
    udot(k) = 2 * vbar(k) + ubar(k);
    vdot(k) = -ubar(k);
end
plot(x,ubar,x,vbar,LineWidth=1)
