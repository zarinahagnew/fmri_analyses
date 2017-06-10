clear all
close all
set_params_pitchtracking;

cerebellar_data_rootdir = '/Users/zagnew/Cereb_data/data_final_run/';
cd(cerebellar_data_rootdir)


load DATA.mat
% comes from Calc_WT_STDEV_2.m;

load /Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/targets

ymin=-400;
ymax=400;

for isubj= 1:16

fig1=figure

subplot(3,4,1)
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'single subject responses by condition', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
plot(DATA(isubj).mean_cond1_pre)
hold
plot(DATA(isubj).mean_cond2_pre)
plot(DATA(isubj).mean_cond3_pre)
plot(DATA(isubj).mean_cond4_pre)
plot(DATA(isubj).mean_cond5_pre)
axis([0 250 ymin ymax])
xlabel('Time (frames)');
ylabel('Pitch (Hz)');


subplot(3,4,2)
plot(DATA(isubj).mean_cond6_pre)
hold
plot(DATA(isubj).mean_cond7_pre)
plot(DATA(isubj).mean_cond8_pre)
plot(DATA(isubj).mean_cond9_pre)
plot(DATA(isubj).mean_cond10_pre)
axis([0 250 ymin ymax])
xlabel('Time (frames)');
ylabel('Pitch (Hz)');


%post
subplot(3,4,5)
plot(DATA(isubj).mean_cond1_post, 'c')
hold
plot(DATA(isubj).mean_cond2_post, 'b')
plot(DATA(isubj).mean_cond3_post, 'k')
plot(DATA(isubj).mean_cond4_post, 'y')
plot(DATA(isubj).mean_cond5_post, 'r')
axis([0 250 ymin ymax])
xlabel('Time (frames)');
ylabel('Pitch (Hz)');

subplot(3,4,6)
plot(DATA(isubj).mean_cond6_post, 'c')
hold
plot(DATA(isubj).mean_cond7_post, 'b')
plot(DATA(isubj).mean_cond8_post, 'k')
plot(DATA(isubj).mean_cond9_post, 'y')
plot(DATA(isubj).mean_cond10_post, 'r')
axis([0 250 ymin ymax])
xlabel('Time (frames)');
ylabel('Pitch (Hz)');

%wholetrial
subplot(3,4,9)
plot(DATA(isubj).mean_cond1_wholetrial, 'c')
hold
plot(DATA(isubj).mean_cond2_wholetrial, 'b')
plot(DATA(isubj).mean_cond3_wholetrial, 'k')
plot(DATA(isubj).mean_cond4_wholetrial, 'y')
plot(DATA(isubj).mean_cond5_wholetrial, 'r')
axis([0 1360 ymin ymax])
xlabel('Time (frames)');
ylabel('Pitch (Hz)');


subplot(3,4,10)
plot(DATA(isubj).mean_cond6_wholetrial, 'c')
hold
plot(DATA(isubj).mean_cond7_wholetrial, 'b')
plot(DATA(isubj).mean_cond8_wholetrial, 'k')
plot(DATA(isubj).mean_cond9_wholetrial, 'y')
plot(DATA(isubj).mean_cond10_wholetrial, 'r')
axis([0 1360 ymin ymax])
xlabel('Time (frames)');
ylabel('Pitch (Hz)');


subplot(3,4,3)
bar(1, nanmean(DATA(isubj).StdWithinCond1_within_pre_stdev))
hold all
bar(2, nanmean(DATA(isubj).StdWithinCond2_within_pre_stdev))
bar(3, nanmean(DATA(isubj).StdWithinCond3_within_pre_stdev))
bar(4, nanmean(DATA(isubj).StdWithinCond4_within_pre_stdev))
bar(5, nanmean(DATA(isubj).StdWithinCond5_within_pre_stdev))
axis([0 6 0 150])
xlabel('Conditions (clear)');
ylabel('WT Stdev of pitch');


subplot(3,4,4)
bar(1, nanmean(DATA(isubj).StdWithinCond6_within_pre_stdev), 'c')
hold all
bar(2, nanmean(DATA(isubj).StdWithinCond7_within_pre_stdev), 'b')
bar(3, nanmean(DATA(isubj).StdWithinCond8_within_pre_stdev), 'k')
bar(4, nanmean(DATA(isubj).StdWithinCond9_within_pre_stdev), 'y')
bar(5, nanmean(DATA(isubj).StdWithinCond10_within_pre_stdev), 'r')
xlabel('Conditions (noise)');
ylabel('WT Stdev of pitch');
axis([0 6 0 150])

subplot(3,4,7)
bar(1, nanmean(DATA(isubj).StdWithinCond1_within_post_stdev))
hold all
bar(2, nanmean(DATA(isubj).StdWithinCond2_within_post_stdev))
bar(3, nanmean(DATA(isubj).StdWithinCond3_within_post_stdev))
bar(4, nanmean(DATA(isubj).StdWithinCond4_within_post_stdev))
bar(5, nanmean(DATA(isubj).StdWithinCond5_within_post_stdev))
axis([0 6 0 150])
xlabel('Conditions (clear)');
ylabel('WT Stdev of pitch');


subplot(3,4,8)
bar(1, nanmean(DATA(isubj).StdWithinCond6_within_post_stdev), 'c')
hold all
bar(2, nanmean(DATA(isubj).StdWithinCond7_within_post_stdev), 'b')
bar(3, nanmean(DATA(isubj).StdWithinCond8_within_post_stdev), 'k')
bar(4, nanmean(DATA(isubj).StdWithinCond9_within_post_stdev), 'y')
bar(5, nanmean(DATA(isubj).StdWithinCond10_within_post_stdev), 'r')
axis([0 6 0 150])
xlabel('Conditions (noise)');
ylabel('WT Stdev of pitch');


subplot(3,4,11)
bar(1, nanmean(DATA(isubj).StdWithinCond1_within_wholetrial_stdev))
hold all
bar(2, nanmean(DATA(isubj).StdWithinCond2_within_wholetrial_stdev))
bar(3, nanmean(DATA(isubj).StdWithinCond3_within_wholetrial_stdev))
bar(4, nanmean(DATA(isubj).StdWithinCond4_within_wholetrial_stdev))
bar(5, nanmean(DATA(isubj).StdWithinCond5_within_wholetrial_stdev))
axis([0 6 0 150])
xlabel('Conditions (clear)');
ylabel('WT Stdev of pitch');


subplot(3,4,12)
bar(1, nanmean(DATA(isubj).StdWithinCond6_within_wholetrial_stdev), 'c')
hold all
bar(2, nanmean(DATA(isubj).StdWithinCond7_within_wholetrial_stdev), 'b')
bar(3, nanmean(DATA(isubj).StdWithinCond8_within_wholetrial_stdev), 'k')
bar(4, nanmean(DATA(isubj).StdWithinCond9_within_wholetrial_stdev), 'y')
bar(5, nanmean(DATA(isubj).StdWithinCond10_within_wholetrial_stdev), 'r')
axis([0 6 0 150])
xlabel('Conditions (noise)');
ylabel('WT Stdev of pitch');


cd SingleSubjectPlots
saveas(fig1, (['SingleSub_data_',num2str(isubj) '.jpg']))
cd (cerebellar_data_rootdir)
pause
end



% 
% % 
% isubj=2
% cleardata_WT(isubj,:)=[DATA(isubj).mean_cond1_wholetrial DATA(isubj).mean_cond2_wholetrial DATA(isubj).mean_cond3_wholetrial DATA(isubj).mean_cond4_wholetrial DATA(isubj).mean_cond5_wholetrial]
% noisedata_WT(isubj,:)=[DATA(isubj).mean_cond6_wholetrial DATA(isubj).mean_cond7_wholetrial DATA(isubj).mean_cond8_wholetrial DATA(isubj).mean_cond9_wholetrial DATA(isubj).mean_cond10_wholetrial]
% ttest(cleardata_WT(isubj,:), noisedata_WT(isubj,:))
% 
% cleardata_pre=[DATA(isubj).mean_cond1_pre DATA(isubj).mean_cond2_pre DATA(isubj).mean_cond3_pre DATA(isubj).mean_cond4_pre DATA(isubj).mean_cond5_pre]
% noisedata_pre=[DATA(isubj).mean_cond6_pre DATA(isubj).mean_cond7_pre DATA(isubj).mean_cond8_pre DATA(isubj).mean_cond9_pre DATA(isubj).mean_cond10_pre]
% ttest(cleardata_pre, noisedata_pre)
% 
% cleardata_post=[DATA(isubj).mean_cond1_post DATA(isubj).mean_cond2_post DATA(isubj).mean_cond3_post DATA(isubj).mean_cond4_post DATA(isubj).mean_cond5_post]
% noisedata_post=[DATA(isubj).mean_cond6_post DATA(isubj).mean_cond7_post DATA(isubj).mean_cond8_post DATA(isubj).mean_cond9_post DATA(isubj).mean_cond10_post]
% ttest(cleardata_post, noisedata_post)
% % 
% 
% 
% 
% isubj=2
% cleardata_WT=[DATA(isubj).StdWithinCond1_within_wholetrial_stdev DATA(isubj).StdWithinCond2_within_wholetrial_stdev DATA(isubj).StdWithinCond3_within_wholetrial_stdev DATA(isubj).StdWithinCond4_within_wholetrial_stdev DATA(isubj).StdWithinCond5_within_wholetrial_stdev]
% noisedata_WT=[DATA(isubj).StdWithinCond6_within_wholetrial_stdev DATA(isubj).StdWithinCond7_within_wholetrial_stdev DATA(isubj).StdWithinCond8_within_wholetrial_stdev DATA(isubj).StdWithinCond9_within_wholetrial_stdev DATA(isubj).StdWithinCond10_within_wholetrial_stdev]
% ttest(cleardata_WT,noisedata_WT)
% 
% cleardata_pre=[DATA(isubj).StdWithinCond1_within_pre_stdev DATA(isubj).StdWithinCond2_within_pre_stdev DATA(isubj).StdWithinCond3_within_pre_stdev DATA(isubj).StdWithinCond4_within_pre_stdev DATA(isubj).StdWithinCond5_within_pre_stdev]
% noisedata_pre=[DATA(isubj).StdWithinCond6_within_pre_stdev DATA(isubj).StdWithinCond7_within_pre_stdev DATA(isubj).StdWithinCond8_within_pre_stdev DATA(isubj).StdWithinCond9_within_pre_stdev DATA(isubj).StdWithinCond10_within_pre_stdev]
% ttest(cleardata_pre,noisedata_pre)
% 
% cleardata_post=[DATA(isubj).StdWithinCond1_within_post_stdev DATA(isubj).StdWithinCond2_within_post_stdev DATA(isubj).StdWithinCond3_within_post_stdev DATA(isubj).StdWithinCond4_within_post_stdev DATA(isubj).StdWithinCond5_within_post_stdev]
% noisedata_post=[DATA(isubj).StdWithinCond6_within_post_stdev DATA(isubj).StdWithinCond7_within_post_stdev DATA(isubj).StdWithinCond8_within_post_stdev DATA(isubj).StdWithinCond9_within_post_stdev DATA(isubj).StdWithinCond10_within_post_stdev]
% ttest(cleardata_post,noisedata_post)
% 
% ttest(DATA(isubj).StdWithinCond3_within_wholetrial_stdev, DATA(isubj).StdWithinCond8_within_wholetrial_stdev)
% 
% 
% isubj=12
% cleardata_WT=[DATA(isubj).StdWithinCond1_within_wholetrial_stdev DATA(isubj).StdWithinCond2_within_wholetrial_stdev DATA(isubj).StdWithinCond3_within_wholetrial_stdev DATA(isubj).StdWithinCond4_within_wholetrial_stdev DATA(isubj).StdWithinCond5_within_wholetrial_stdev]
% noisedata_WT=[DATA(isubj).StdWithinCond6_within_wholetrial_stdev DATA(isubj).StdWithinCond7_within_wholetrial_stdev DATA(isubj).StdWithinCond8_within_wholetrial_stdev DATA(isubj).StdWithinCond9_within_wholetrial_stdev DATA(isubj).StdWithinCond10_within_wholetrial_stdev]
% ttest(cleardata_WT,noisedata_WT)
% 
% cleardata_pre=[DATA(isubj).StdWithinCond1_within_pre_stdev DATA(isubj).StdWithinCond2_within_pre_stdev DATA(isubj).StdWithinCond3_within_pre_stdev DATA(isubj).StdWithinCond4_within_pre_stdev DATA(isubj).StdWithinCond5_within_pre_stdev]
% noisedata_pre=[DATA(isubj).StdWithinCond6_within_pre_stdev DATA(isubj).StdWithinCond7_within_pre_stdev DATA(isubj).StdWithinCond8_within_pre_stdev DATA(isubj).StdWithinCond9_within_pre_stdev DATA(isubj).StdWithinCond10_within_pre_stdev]
% ttest(cleardata_pre,noisedata_pre)
% 
% cleardata_post=[DATA(isubj).StdWithinCond1_within_post_stdev DATA(isubj).StdWithinCond2_within_post_stdev DATA(isubj).StdWithinCond3_within_post_stdev DATA(isubj).StdWithinCond4_within_post_stdev DATA(isubj).StdWithinCond5_within_post_stdev]
% noisedata_post=[DATA(isubj).StdWithinCond6_within_post_stdev DATA(isubj).StdWithinCond7_within_post_stdev DATA(isubj).StdWithinCond8_within_post_stdev DATA(isubj).StdWithinCond9_within_post_stdev DATA(isubj).StdWithinCond10_within_post_stdev]
% ttest(cleardata_post,noisedata_post)
% ttest(DATA(isubj).StdWithinCond3_within_wholetrial_stdev, DATA(isubj).StdWithinCond8_within_wholetrial_stdev)
% 
% 
% isubj=15
% cleardata_WT=[DATA(isubj).StdWithinCond1_within_wholetrial_stdev DATA(isubj).StdWithinCond2_within_wholetrial_stdev DATA(isubj).StdWithinCond3_within_wholetrial_stdev DATA(isubj).StdWithinCond4_within_wholetrial_stdev DATA(isubj).StdWithinCond5_within_wholetrial_stdev]
% noisedata_WT=[DATA(isubj).StdWithinCond6_within_wholetrial_stdev DATA(isubj).StdWithinCond7_within_wholetrial_stdev DATA(isubj).StdWithinCond8_within_wholetrial_stdev DATA(isubj).StdWithinCond9_within_wholetrial_stdev DATA(isubj).StdWithinCond10_within_wholetrial_stdev]
% ttest(cleardata_WT,noisedata_WT)
% 
% cleardata_pre=[DATA(isubj).StdWithinCond1_within_pre_stdev DATA(isubj).StdWithinCond2_within_pre_stdev DATA(isubj).StdWithinCond3_within_pre_stdev DATA(isubj).StdWithinCond4_within_pre_stdev DATA(isubj).StdWithinCond5_within_pre_stdev]
% noisedata_pre=[DATA(isubj).StdWithinCond6_within_pre_stdev DATA(isubj).StdWithinCond7_within_pre_stdev DATA(isubj).StdWithinCond8_within_pre_stdev DATA(isubj).StdWithinCond9_within_pre_stdev DATA(isubj).StdWithinCond10_within_pre_stdev]
% ttest(cleardata_pre,noisedata_pre)
% 
% cleardata_post=[DATA(isubj).StdWithinCond1_within_post_stdev DATA(isubj).StdWithinCond2_within_post_stdev DATA(isubj).StdWithinCond3_within_post_stdev DATA(isubj).StdWithinCond4_within_post_stdev DATA(isubj).StdWithinCond5_within_post_stdev]
% noisedata_post=[DATA(isubj).StdWithinCond6_within_post_stdev DATA(isubj).StdWithinCond7_within_post_stdev DATA(isubj).StdWithinCond8_within_post_stdev DATA(isubj).StdWithinCond9_within_post_stdev DATA(isubj).StdWithinCond10_within_post_stdev]
% ttest(cleardata_post,noisedata_post)
% ttest(DATA(isubj).StdWithinCond3_within_wholetrial_stdev, DATA(isubj).StdWithinCond8_within_wholetrial_stdev)
% 
% 
% 
% clear=[DATA(2).StdWithinCond3_within_wholetrial_stdev DATA(12).StdWithinCond3_within_wholetrial_stdev DATA(15).StdWithinCond3_within_wholetrial_stdev]
% noise=[DATA(2).StdWithinCond8_within_wholetrial_stdev DATA(12).StdWithinCond8_within_wholetrial_stdev DATA(15).StdWithinCond8_within_wholetrial_stdev]
% ttest(clear,noise)
% nanmean(clear)
% nanmean(noise)
% figure
% plot(clear)
% hold
% plot(noise)
% 
% ttest(DATA(isubj).mean_cond3_wholetrial(210:800), DATA(isubj).mean_cond8_wholetrial(210:800))
% 
% figure
% subplot(3, 1, 1)
% plot(DATA(isubj).mean_cond3_wholetrial(210:800), 'k')
% axis([ 0 1400 140 210])
% subplot(3, 1, 2)
% plot(DATA(isubj).mean_cond8_wholetrial(210:800), 'r')
% axis([ 0 1400 140 210])
% subplot(3,1,3)
% bar(1, nanstd(DATA(isubj).mean_cond3_wholetrial(210:800)), 'k')
% hold on
% bar(2, nanstd(DATA(isubj).mean_cond8_wholetrial(210:800)), 'w')
% axis([ 0 10 0 15])




