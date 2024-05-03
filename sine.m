% x=-15:0.5:15;
% y=-15:0.5:15;
% [X,Y] = meshgrid(x,y); % greate rectangullar mesh
% R=sqrt(X.^2+Y.^2); %rasius
% k=1; % wave vector
% phi=0; % phase
% Z=sin(k*R+phi);
% figure
% surf(X,Y,Z);
% axis equal;

[x,y,z] = ellipsoid(0,0,0,4,1,1);  %# Make an ellipsoid shape
hMesh = mesh(x,y,z);               %# Plot the shape as a mesh
axis equal                         %# Change the axis scaling
for longAxis = 4:-0.1:1
  [x,y,z] = ellipsoid(0,0,0,longAxis,1,1);   %# Make a new ellipsoid
  set(hMesh,'XData',x,'YData',y,'ZData',z);  %# Update the mesh data
  pause(0.25);                               %# Pause for 1/4 second
end

% function timer_fcn(obj,event,hMesh)
%   n = get(obj,'TasksExecuted');               %# The number of times the
%                                               %#   timer has fired already
%   [x,y,z] = ellipsoid(0,0,0,4-(3*n/40),1,1);  %# Make a new ellipsoid
%   set(hMesh,'XData',x,'YData',y,'ZData',z);   %# Update the mesh data
%   drawnow;                                    %# Force the display to update
% end

% [x,y,z] = ellipsoid(0,0,0,4,1,1);  %# Make an ellipsoid shape
% hMesh = mesh(x,y,z);               %# Plot the shape as a mesh
% axis equal                         %# Change the axis scaling
% animationTimer = timer('ExecutionMode','fixedRate',...  %# Fire at a fixed rate
%                        'Period',0.25,...                %#   every 0.25 seconds
%                        'TasksToExecute',40,...          %#   for 40 times and
%                        'TimerFcn',{@timer_fcn,hMesh});  %#   run this function
% start(animationTimer);  %# Start timer, which runs on its own until it ends