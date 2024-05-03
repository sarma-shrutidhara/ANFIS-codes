clc
clear all
load TRAIN.txt
load TEST_20800.txt



trnData=TRAIN(1:2002, :);
% xin = Train_Cal_1_13_1d_A1(1:1251,1:4);
% xout = Train_Cal_1_13_1d_A1(1:1251,5);
chkData=TEST_20800(1:1001, :);
numMFs = 3;

inmfType = 'gaussmf';
%inmfType = 'gauss2mf';
%inmfType = 'pimf';



%outmftype = 'linear';
outmftype = 'constant';

epoch_n = 200;
optMethod =1;

fismat = genfis1(trnData,numMFs,inmfType,outmftype);
% fismat = genfis2(xin,xout,[0.5 0.4 0.3 0.3 0.25]);
% figure(2)
% subplot(2,2,1)
% plotmf(fismat, 'input', 1)
% subplot(2,2,2)
% plotmf(fismat, 'input', 2)
% subplot(2,2,3)
% plotmf(fismat, 'input', 3)
% subplot(2,2,4)
% plotmf(fismat, 'input', 4)
[fismat1,error1,ss,fismat2,error2] = anfis(trnData,fismat,epoch_n,[],chkData,optMethod);
% figure(3)
% subplot(2,2,1)
% plotmf(fismat2, 'input', 1)
% subplot(2,2,2)
% plotmf(fismat2, 'input', 2)
% subplot(2,2,3)
% plotmf(fismat2, 'input', 3)
% subplot(2,2,4)
% plotmf(fismat2, 'input', 4)
% figure(4)
% plot([error1 error2]);
% hold on; plot([error1 error2], 'o');
% xlabel('Epochs');
% ylabel('RMSE (Root Mean Squared Error)');
% title('Error Curves');
% figure(5)
anfis_output = abs(evalfis(chkData(:,1:2),fismat2));
time = TEST_20800(1:1001,1);
F_20 = TEST_20800(1:1001,3);
%plot(time*1000,abs(F_20),'--k');

       plot(time*1000,abs(F_20),'-k','LineWidth',1.5,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','k',...
                       'MarkerSize',1)
           
%  x = randn(100,1);
% save Train_Cal_1_13_1d_A3_RAMP_30_F_X.dat x -ascii
% % or
% save('c:\folderyouwant\Train_Cal_1_13_1d_A3_RAMP_30_F_X.dat','x','-ascii');

hold on
%plot(time*1000,abs(anfis_output),'-k');

       plot(time*1000,abs(anfis_output),'--r','LineWidth',1,...
                       'MarkerEdgeColor','r',...
                       'MarkerFaceColor','r',...
                       'MarkerSize',1)
                   
                   
%     save('C:\Users\Papaa\Desktop\ANFIS RESULTS\IMPULSE_TO_IMPULSE\TWO POINT\F_20N\F_X\Pred_Fx_Ramp_30_gassmf_liner_hybrid_20epoc.dat','anfis_output','-ascii'); 
%      create file, and write the title and number of columns
% fid = fopen('outputFile.dat', 'wt');
% fprintf(fid, '%s\n%d\n', 'avg_seismic_data_models', 3*size(X,2));
% fclose(fid);

%# append rest of data
%dlmwrite('outputFile.dat', [X Y avg_seismic_data_models], '-append', 'delimiter',',')
                    ylabel('Force(N)') 
                    xlabel('Time(ms)') 
                    grid on
                    legend('Input Force', 'Predicted Force' )
hold off
% index = 125:1124;
% subplot(211), plot(time(index), [x(index) anfis_output]);
% xlabel('Time (sec)');
% title('MG Time Series and ANFIS Prediction');
% subplot(212), plot(time(index), x(index) - anfis_output);
% xlabel('Time (sec)');
% title('Prediction Errors');


f1=fopen('cal_F_3_pred_Gauss2_mf_liner_Hyb_epoc_500.dat','w');
for i=1:1001
    % fprintf(f1,'\n%6.6f %10.6f\t',x1(i)*0.1e-3,out1(i));
   fprintf(f1,'\n%6.6f %10.6f\t',time(i)*1000,anfis_output(i));
end
fclose(f1);