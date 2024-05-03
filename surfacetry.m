clear;
clf;
fid=fopen(['20w_anf_0.1cnt.txt'],'r');
Data=fscanf(fid,'%f',[3,inf]);
fclose(fid);
Data=Data';
x=Data(:,1); y=Data(:,2); z=Data(:,3);

f1=figure(1); hold on;
set (f1, 'renderer', 'zbuffer');
plot3(x,y,z,'.','MarkerSize',18);
view ([-20 30]); grid on;
% view (0, 90);
% view (0, 0);
% view (90, 0);
axis

v_x=linspace (0, 0.3, 100);   %change the starting and ending value keeping number of points same in x and y
v_y=linspace (1.69, 1.73, 100);
[xx, yy]=meshgrid (v_x, v_y);mesh (xx,yy,ones(100,100))
% zz= griddata (x,y,z,xx,yy, 'nearest'); %also works but not better than v4
zz= griddata (x,y,z,xx,yy, 'v4');
%Zsurf = @(xx,yy) griddata(x,y,z,xx,yy,'v4');


f2=figure(2); clf; hold on;
set (f2, 'renderer', 'zbuffer');
surf (xx,yy,zz);
h=surf (xx,yy,zz);
shading interp;   % shading flat;
%colorbar;
view ([-20 30]); grid on;
% view (0, 90);
% view (0, 0);
% view (90, 0);
% axis
 axis ([0 0.3 1.69 1.73 -100000 1200000])
       
        
        xlabel('Temperature difference \Delta T(^0C)') 
        ylabel('Resistance (\Omega)') 
        zlabel ('Thermal conductivity per unit length (W / m ^2 K)')
% 
% % for i = 0 : 0.1 : 1;
% %     set(h, 'xdata', x, 'ydata', y, 'zdata', i*z)
% %     drawnow
% % end  
% 
% %  % Save in AVI format
% % movie2avi(M,'animation_point.avi');
% 
% % for az = -37.5 : .5 : 30
% %     view(az, 30)
% %     drawnow   
% % end 
% 
%  
% f3=figure(3); clf; hold on;
% set (f3, 'renderer', 'zbuffer');
% mesh (xx,yy,zz);  grid on;            % to see the mesh
% axis ([21 36 11 11.15 -300 300])
% 
% f4=figure(4);
% contour(xx,yy,zz); grid on;   %to see contour
% axis ([21 36 11 11.15 -300 300])
% xlabel('X');
% ylabel('Y');
% 
% % To check along a plane passing through first point of X-axis
% 
% x_c=x(1); %constant value of x
% x1=@(t)x_c*ones(size(t));
% y1=@(t) t;
% z1=@(t) Zsurf(x1(t),y1(t));
% Yplot=linspace(min(y),max(y),20);
% f5=figure(5);
% scatter(Yplot,z1(Yplot),'r'); grid on;
% 
% % To check along a plane passing through 10th point of Y-axis
% 
% y_c=y(10); %constant value of y
% y2=@(t)x_c*ones(size(t));
% x2=@(t) t;
% z2=@(t) Zsurf(x2(t),y2(t));
% Xplot=linspace(min(x),max(x),20);
% f6=figure(6);
% scatter(Xplot,z2(Xplot),'g'); grid on;