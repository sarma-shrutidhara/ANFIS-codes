clear; clc; close all 

% Define paraboloid
X = -2 : .1 : 2; Y = X;
[x, y] = meshgrid(X, Y);
z = .5 * (x.^2 + y.^2); 

% Draw 3D figure, keep track of its handle
h = surf(x,y,z);
% Keep axes constant
axis([-2 2 -2 2 0 20]) 

% Define title and labels for reference
xlabel('x'); ylabel('y'); zlabel('z') 

% Stretch paraboloid and show updates
for i = 1 : .1 : 5;
    set(h, 'xdata', x, 'ydata', y, 'zdata', i*z)
    drawnow
end   

% Modify azimuth (horizontal rotation) and update drawing
for az = -37.5 : .5 : 30
    view(az, 30)
    drawnow
end 