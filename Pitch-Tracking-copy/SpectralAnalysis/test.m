% check that low pass filter paramters are correct

%raw data:

sig1=group_cond5_pats_to_use_mean(210:1200)
sig2=group_cond10_pats_to_use_mean(210:1200)

axlims=[0 1000 -400 100]

%clear trial
figure
subplot(321)
plot(sig1)
axis(axlims)

subplot(322)
plot(sig2)
axis(axlims)

subplot(323)
smoothdata=lowpass(sig1,  0.01, 3);
plot(smoothdata)
axis(axlims)

subplot(324)
smoothdata_2=lowpass(sig2,  0.01, 3);
plot(smoothdata_2)
axis(axlims)

subplot(325)
plot(sig1-smoothdata)

subplot(326)
plot(sig2-smoothdata_2)

cleartrial=sig1-smoothdata
noisetrial=sig2-smoothdata_2

nanstd(cleartrial)
nanstd(noisetrial)





% 
% 
% 
% subplot(326)
% 
% %noise
% figure
% subplot(321)
% plot(group_cond10_pats_to_use_mean(210:1200))
% 
% subplot(322)
% sig=group_cond10_pats_to_use_mean(210:1200)
% my_spectrum(sig,345)
% 
% subplot(323)
% smoothdata=lowpass(sig,  0.01, 3);
% plot(smoothdata)
% 
% subplot(324)
% my_spectrum(smoothdata,345)
% 
% subplot(325)
% plot(sig-smoothdata)
% 
% subplot(326)
% 
% 
% 
% 
% 


