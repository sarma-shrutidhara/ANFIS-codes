
%PROGRAM TO FILTER (LOWPASS) AN ACCELERATION SIGNAL
% display('Have you entered correct acquistion time')


clc
clear;
good=input('Replace the existing file name with the required one : If done, enter any number :')
%better=input('Enter 1 for Deepti DAS and 2 for NI DAS :')
better=2;
note=input('You have to enter the proper Column number to change in 5 places in programme : ');
%rate=input('Enter the acquisition rate in seconds : ');
rate=4e-7;
load run3_2.dat;                     %Acceleration signal to be filtered
[m,n]=size( run3_2)  
%x=linspace(0,0.005005,10010);
x= run3_2(:,1);
pq= run3_2(1,1);
%y=bcc030_text.(:,2)*1000*9.81/103.5;       % Plot of the original acceleration signal
%y=bcc030_text.(:,2)*1000*9.81/99.2;
y= run3_2(:,2);                         % 1st Place
offset=mean( run3_2(1:10,2));           % 2nd Place
y=y-offset;
figure(1);
plot(x,y);

                                          % FFT is done to check the frequency components
f1= run3_2(:,2);                      % 3rd Place
f=f1(1:(m));                                
n=4096;                                     % in the signal and to know the cut off frequency  
%t=[-2048:2047]/(0.1e-3*4096);

t=[-2048:2047]/(rate*4096);
fr=fftshift(abs(fft(f,n)));
figure(2);
plot(t,fr);

%% Saving  the frequency vs amplitude  for the filtered  data : Need to be updated before running program
Needed =input('Replace the existing file name with the required one : If done, enter any number :')

f11=fopen('run3_2_Fr_Ax_6.dat','w');
for i=1:n
    % fprintf(f1,'\n%6.6f %10.6f\t',x1(i)*0.1e-3,out1(i));
   fprintf(f11,'\n%6.6f %10.6f\t',t(i),fr(i));
end
fclose(f11);

if (better==1)                                %This is done to find out the Nyquist Frequency 
t1= run3_2(m,1)*1e-3;                       %which will be used to find out the filter coeffs.
else
    t1= run3_2(m,1);
end

%t1=0.005005;
frq=m/t1;
nf=frq/2;                               

freq=10e3;
%freq=input('Enter the cut off frequency in Hz :');
[a,b]=butter(5,freq/nf);                            %This is to determine the coeffs of the filter where a and b are the 
                                                    %coeffs of the numerator and the denominator respectively.    
out1=filtfilt(a,b,y);                               %Filtfilt filters in the time domain
x1=0:m-1;
figure(3);
% plot(x1*0.1e-3,out1,'r');
plot(x1*rate,out1,'r');
hold on;
if (better==1) 
plot((x-pq)*1e-3, run3_2(:,2)-offset)         % 4th Place
else
    plot(x-pq, run3_2(:,2)-offset)            % 5th Place
end

%% Saving  the time vs amplitude  for the filtered  data : Need to be updated before running program
Important =input('Replace the existing file name with the required one : If done, enter any number :')

f1=fopen('run3_2_filter.dat','w');
for i=1:m
    % fprintf(f1,'\n%6.6f %10.6f\t',x1(i)*0.1e-3,out1(i));
   fprintf(f1,'\n%6.6f %10.6f\t',x1(i)*rate,out1(i));
end
fclose(f1);
x1'
t1
nf

