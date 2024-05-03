
clc
clear;

rate=0.005;


 load filter.txt;                     %Acceleration signal to be filtered
[m,n]=size( filter); 

%x=linspace(0,0.005005,10010);
x= filter(:,1);
pq= filter(1,1);

%y=bcc030_text.(:,2)*1000*9.81/103.5;       % Plot of the original acceleration signal
%y=bcc030_text.(:,2)*1000*9.81/99.2;
y= filter(:,2);                         % 1st Place
offset=mean(filter(1:10,2));  % 2nd Place

y=y-offset;
figure(1);
plot(x,y);


%% Saving  the frequency vs amplitude  for the filtered  data : Need to be updated before running program

t1= filter(m,1);


%t1=0.005005;
frq=m/t1;
nf=frq/2                               

%freq=12.5e3;
freq=20;
%freq=input('Enter the cut off frequency in Hz :');
[a,b]=butter(5,freq/nf)                        %This is to determine the coeffs of the filter where a and b are the 
                                                    %coeffs of the numerator and the denominator respectively.    
out1=filtfilt(a,b,y);                               %Filtfilt filters in the time domain
x1=0:m-1;
figure(3);
% plot(x1*0.1e-3,out1,'r');
 plot(x1*rate,out1,'r');
% hold on;

%  plot(x-pq, filter(:,2)-offset)            % 5th Place


%% Saving  the time vs amplitude  for the filtered  data : Need to be updated before running program

f1=fopen('filt.dat','w');
for i=1:m
    % fprintf(f1,'\n%6.6f %10.6f\t',x1(i)*0.1e-3,out1(i));
   fprintf(f1,'\n%6.6f \t %10.6f\t',x1(i)*rate,out1(i));
end
fclose(f1);
