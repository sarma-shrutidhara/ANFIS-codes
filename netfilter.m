%# some random data resembling yours
rate=0.005;
m=1002;
load filter.txt;
x=filter(:,2); t=filter(:,1); 
% x = randn(100,1);
% x(75) = -14; x(25) = 20;
% subplot(211), plot(x)

%# zero out everything but the high peaks
mu = mean(x); sd = std(x); Z = 3;
x( abs(x-mu) < Z*sd ) = 0;
plot(x.*abs(x)/max(abs(x)))
val=(x.*abs(x)/max(abs(x)))
axis ([0 1000 -100000 250000])
x1=0:m-1;

f1=fopen('netfilt.dat','w');
for i=1:m
    % fprintf(f1,'\n%6.6f %10.6f\t',x1(i)*0.1e-3,out1(i));
   fprintf(f1,'\n%6.6f \t %10.6f\t',x1(i)*rate,val(i));
end
fclose(f1);
% subplot(212), plot(x)
