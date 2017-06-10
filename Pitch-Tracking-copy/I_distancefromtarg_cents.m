%% calculates distance between pitch tracking and pitch target
% ZKA Jan 2015 
% run first: G_plot_groupdata;
close all
set_params;

set(0,'DefaultFigureWindowStyle','docked');

posttarg_cond1=100;
posttarg_cond2=300;
posttarg_cond3=0;
posttarg_cond4=-100;
posttarg_cond5=-300;

load /Users/zagnew/Cereb_data/data/DATA_TO_USE.mat;
load GROUPDATA.mat

%% PRE & POST WINDOW DATA -all based on individual subject means
subz=size(DATA_TO_USE);
subz=subz(2);

% patients
for isub=1:numpats
    diff_pats_cond1(isub)=abs(0 - nanmean(DATA_TO_USE(isub).mean_cond1_pre));
    diff_pats_cond2(isub)=abs(0 - nanmean(DATA_TO_USE(isub).mean_cond2_pre));
    diff_pats_cond3(isub)=abs(0 - nanmean(DATA_TO_USE(isub).mean_cond3_pre));
    diff_pats_cond4(isub)=abs(0 - nanmean(DATA_TO_USE(isub).mean_cond4_pre));
    diff_pats_cond5(isub)=abs(0 - nanmean(DATA_TO_USE(isub).mean_cond5_pre));
    diff_pats_cond6(isub)=abs(0 - nanmean(DATA_TO_USE(isub).mean_cond6_pre));
    diff_pats_cond7(isub)=abs(0 - nanmean(DATA_TO_USE(isub).mean_cond7_pre));
    diff_pats_cond8(isub)=abs(0 - nanmean(DATA_TO_USE(isub).mean_cond8_pre));
    diff_pats_cond9(isub)=abs(0 - nanmean(DATA_TO_USE(isub).mean_cond9_pre));
    diff_pats_cond10(isub)=abs(0 - nanmean(DATA_TO_USE(isub).mean_cond10_pre));
    
    diff_pats_cond1_post(isub)=abs(posttarg_cond1 - nanmean(DATA_TO_USE(isub).mean_cond1_post));
    diff_pats_cond2_post(isub)=abs(posttarg_cond2 - nanmean(DATA_TO_USE(isub).mean_cond2_post));
    diff_pats_cond3_post(isub)=abs(posttarg_cond3 - nanmean(DATA_TO_USE(isub).mean_cond3_post));
    diff_pats_cond4_post(isub)=abs(posttarg_cond4 - nanmean(DATA_TO_USE(isub).mean_cond4_post));
    diff_pats_cond5_post(isub)=abs(posttarg_cond5 - nanmean(DATA_TO_USE(isub).mean_cond5_post));
    diff_pats_cond6_post(isub)=abs(posttarg_cond1 - nanmean(DATA_TO_USE(isub).mean_cond6_post));
    diff_pats_cond7_post(isub)=abs(posttarg_cond2 - nanmean(DATA_TO_USE(isub).mean_cond7_post));
    diff_pats_cond8_post(isub)=abs(posttarg_cond3 - nanmean(DATA_TO_USE(isub).mean_cond8_post));
    diff_pats_cond9_post(isub)=abs(posttarg_cond4 - nanmean(DATA_TO_USE(isub).mean_cond9_post));
    diff_pats_cond10_post(isub)=abs(posttarg_cond5 - nanmean(DATA_TO_USE(isub).mean_cond10_post));
end

pat_mean_cond1=nanmean(diff_pats_cond1);
pat_mean_cond2=nanmean(diff_pats_cond2);
pat_mean_cond3=nanmean(diff_pats_cond3);
pat_mean_cond4=nanmean(diff_pats_cond4);
pat_mean_cond5=nanmean(diff_pats_cond5);
pat_mean_cond6=nanmean(diff_pats_cond6);
pat_mean_cond7=nanmean(diff_pats_cond7);
pat_mean_cond8=nanmean(diff_pats_cond8);
pat_mean_cond9=nanmean(diff_pats_cond9);
pat_mean_cond10=nanmean(diff_pats_cond10);

pat_mean_cond1_post=nanmean(diff_pats_cond1_post);
pat_mean_cond2_post=nanmean(diff_pats_cond2_post);
pat_mean_cond3_post=nanmean(diff_pats_cond3_post);
pat_mean_cond4_post=nanmean(diff_pats_cond4_post);
pat_mean_cond5_post=nanmean(diff_pats_cond5_post);
pat_mean_cond6_post=nanmean(diff_pats_cond6_post);
pat_mean_cond7_post=nanmean(diff_pats_cond7_post);
pat_mean_cond8_post=nanmean(diff_pats_cond8_post);
pat_mean_cond9_post=nanmean(diff_pats_cond9_post);
pat_mean_cond10_post=nanmean(diff_pats_cond10_post);

pat_mean_noise=[diff_pats_cond1 diff_pats_cond2 diff_pats_cond3 diff_pats_cond4 diff_pats_cond5];
pat_mean_clear=[diff_pats_cond6 diff_pats_cond7 diff_pats_cond8 diff_pats_cond9 diff_pats_cond10];
pat_mean_noise_group=nanmean(pat_mean_noise);
pat_mean_clear_group=nanmean(pat_mean_clear);

pat_mean_noise_post=[diff_pats_cond1_post diff_pats_cond2_post diff_pats_cond3_post diff_pats_cond4_post diff_pats_cond5_post];
pat_mean_clear_post=[diff_pats_cond6_post diff_pats_cond7_post diff_pats_cond8_post diff_pats_cond9_post diff_pats_cond10_post];
pat_mean_noise_group_post=nanmean(pat_mean_noise_post);
pat_mean_clear_group_post=nanmean(pat_mean_clear_post);

% stdev
pat_mean_cond1_SEM=nanstd(diff_pats_cond1)/(sqrt(16));
pat_mean_cond2_SEM=nanstd(diff_pats_cond2)/(sqrt(16));
pat_mean_cond3_SEM=nanstd(diff_pats_cond3)/(sqrt(16));
pat_mean_cond4_SEM=nanstd(diff_pats_cond4)/(sqrt(16));
pat_mean_cond5_SEM=nanstd(diff_pats_cond5)/(sqrt(16));
pat_mean_cond6_SEM=nanstd(diff_pats_cond6)/(sqrt(16));
pat_mean_cond7_SEM=nanstd(diff_pats_cond7)/(sqrt(16));
pat_mean_cond8_SEM=nanstd(diff_pats_cond8)/(sqrt(16));
pat_mean_cond9_SEM=nanstd(diff_pats_cond9)/(sqrt(16));
pat_mean_cond10_SEM=nanstd(diff_pats_cond10)/(sqrt(16));

pat_mean_cond1_post_SEM=nanstd(diff_pats_cond1_post)/(sqrt(16));
pat_mean_cond2_post_SEM=nanstd(diff_pats_cond2_post)/(sqrt(16));
pat_mean_cond3_post_SEM=nanstd(diff_pats_cond3_post)/(sqrt(16));
pat_mean_cond4_post_SEM=nanstd(diff_pats_cond4_post)/(sqrt(16));
pat_mean_cond5_post_SEM=nanstd(diff_pats_cond5_post)/(sqrt(16));
pat_mean_cond6_post_SEM=nanstd(diff_pats_cond6_post)/(sqrt(16));
pat_mean_cond7_post_SEM=nanstd(diff_pats_cond7_post)/(sqrt(16));
pat_mean_cond8_post_SEM=nanstd(diff_pats_cond8_post)/(sqrt(16));
pat_mean_cond9_post_SEM=nanstd(diff_pats_cond9_post)/(sqrt(16));
pat_mean_cond10_post_SEM=nanstd(diff_pats_cond10_post)/(sqrt(16));

%pat_mean_noise_stdev=[diff_pats_cond1_stdev diff_pats_cond2_stdev diff_pats_cond3_stdev diff_pats_cond4_stdev diff_pats_cond5_stdev]
pat_mean_clear=[diff_pats_cond6 diff_pats_cond7 diff_pats_cond8 diff_pats_cond9 diff_pats_cond10];
pat_mean_noise_group=nanmean(pat_mean_noise);
pat_mean_clear_group=nanmean(pat_mean_clear);

pat_SEM_noise_group=nanstd(pat_mean_noise)/sqrt(80);
pat_SEM_clear_group=nanstd(pat_mean_clear)/sqrt(80);

pat_mean_noise_post=[diff_pats_cond1_post diff_pats_cond2_post diff_pats_cond3_post diff_pats_cond4_post diff_pats_cond5_post];
pat_mean_clear_post=[diff_pats_cond6_post diff_pats_cond7_post diff_pats_cond8_post diff_pats_cond9_post diff_pats_cond10_post];
pat_mean_noise_group_post=nanmean(pat_mean_noise_post);
pat_mean_clear_group_post=nanmean(pat_mean_clear_post);

pat_SEM_noise_group_post=nanstd(pat_mean_noise_post)/sqrt(80);
pat_SEM_clear_group_post=nanstd(pat_mean_clear_post)/sqrt(80);


%% HCs - pre and post

for isub=1:numHCs
    diff_HC_cond1(isub)=abs(0 - nanmean(DATA_TO_USE(numpats+isub).mean_cond1_pre));
    diff_HC_cond2(isub)=abs(0 - nanmean(DATA_TO_USE(numpats+isub).mean_cond2_pre));
    diff_HC_cond3(isub)=abs(0 - nanmean(DATA_TO_USE(numpats+isub).mean_cond3_pre));
    diff_HC_cond4(isub)=abs(0 - nanmean(DATA_TO_USE(numpats+isub).mean_cond4_pre));
    diff_HC_cond5(isub)=abs(0 - nanmean(DATA_TO_USE(numpats+isub).mean_cond5_pre));
    diff_HC_cond6(isub)=abs(0 - nanmean(DATA_TO_USE(numpats+isub).mean_cond6_pre));
    diff_HC_cond7(isub)=abs(0 - nanmean(DATA_TO_USE(numpats+isub).mean_cond7_pre));
    diff_HC_cond8(isub)=abs(0 - nanmean(DATA_TO_USE(numpats+isub).mean_cond8_pre));
    diff_HC_cond9(isub)=abs(0 - nanmean(DATA_TO_USE(numpats+isub).mean_cond9_pre));
    diff_HC_cond10(isub)=abs(0 - nanmean(DATA_TO_USE(numpats+isub).mean_cond10_pre));
    
    diff_HC_cond1_post(isub)=abs(posttarg_cond1 - nanmean(DATA_TO_USE(numpats+isub).mean_cond1_post));
    diff_HC_cond2_post(isub)=abs(posttarg_cond2 - nanmean(DATA_TO_USE(numpats+isub).mean_cond2_post));
    diff_HC_cond3_post(isub)=abs(posttarg_cond3 - nanmean(DATA_TO_USE(numpats+isub).mean_cond3_post));
    diff_HC_cond4_post(isub)=abs(posttarg_cond4 - nanmean(DATA_TO_USE(numpats+isub).mean_cond4_post));
    diff_HC_cond5_post(isub)=abs(posttarg_cond5 - nanmean(DATA_TO_USE(numpats+isub).mean_cond5_post));
    diff_HC_cond6_post(isub)=abs(posttarg_cond1 - nanmean(DATA_TO_USE(numpats+isub).mean_cond6_post));
    diff_HC_cond7_post(isub)=abs(posttarg_cond2 - nanmean(DATA_TO_USE(numpats+isub).mean_cond7_post));
    diff_HC_cond8_post(isub)=abs(posttarg_cond3 - nanmean(DATA_TO_USE(numpats+isub).mean_cond8_post));
    diff_HC_cond9_post(isub)=abs(posttarg_cond4 - nanmean(DATA_TO_USE(numpats+isub).mean_cond9_post));
    diff_HC_cond10_post(isub)=abs(posttarg_cond5 - nanmean(DATA_TO_USE(numpats+isub).mean_cond10_post));
    
end

HC_mean_cond1=nanmean(diff_HC_cond1);
HC_mean_cond2=nanmean(diff_HC_cond2);
HC_mean_cond3=nanmean(diff_HC_cond3);
HC_mean_cond4=nanmean(diff_HC_cond4);
HC_mean_cond5=nanmean(diff_HC_cond5);
HC_mean_cond6=nanmean(diff_HC_cond6);
HC_mean_cond7=nanmean(diff_HC_cond7);
HC_mean_cond8=nanmean(diff_HC_cond8);
HC_mean_cond9=nanmean(diff_HC_cond9);
HC_mean_cond10=nanmean(diff_HC_cond10);

HC_mean_noise=[diff_HC_cond1 diff_HC_cond2 diff_HC_cond3 diff_HC_cond4 diff_HC_cond5];
HC_mean_clear=[diff_HC_cond6 diff_HC_cond7 diff_HC_cond8 diff_HC_cond9 diff_HC_cond10];
HC_mean_noise_group=nanmean(HC_mean_noise);
HC_mean_clear_group=nanmean(HC_mean_clear);

HC_mean_cond1_post=nanmean(diff_HC_cond1_post);
HC_mean_cond2_post=nanmean(diff_HC_cond2_post);
HC_mean_cond3_post=nanmean(diff_HC_cond3_post);
HC_mean_cond4_post=nanmean(diff_HC_cond4_post);
HC_mean_cond5_post=nanmean(diff_HC_cond5_post);
HC_mean_cond6_post=nanmean(diff_HC_cond6_post);
HC_mean_cond7_post=nanmean(diff_HC_cond7_post);
HC_mean_cond8_post=nanmean(diff_HC_cond8_post);
HC_mean_cond9_post=nanmean(diff_HC_cond9_post);
HC_mean_cond10_post=nanmean(diff_HC_cond10_post);

HC_mean_noise_post=[diff_HC_cond1_post diff_HC_cond2_post diff_HC_cond3_post diff_HC_cond4_post diff_HC_cond5_post];
HC_mean_clear_post=[diff_HC_cond6_post diff_HC_cond7_post diff_HC_cond8_post diff_HC_cond9_post diff_HC_cond10_post];
HC_mean_noise_group_post=nanmean(HC_mean_noise_post);
HC_mean_clear_group_post=nanmean(HC_mean_clear_post);

HC_SEM_noise_group=nanstd(HC_mean_noise)/sqrt(55);
HC_SEM_clear_group=nanstd(HC_mean_clear)/sqrt(55);

HC_SEM_noise_group_post=nanstd(HC_mean_noise_post)/sqrt(55);
HC_SEM_clear_group_post=nanstd(HC_mean_clear_post)/sqrt(55);

%% ttests
% within group
ttest(pat_mean_noise,pat_mean_clear)
ttest(pat_mean_noise_post,pat_mean_clear_post)
ttest(HC_mean_noise,HC_mean_clear)
ttest(HC_mean_noise_post,HC_mean_clear_post)

% across group
ttest2(pat_mean_noise, HC_mean_noise)
ttest2(pat_mean_clear, HC_mean_clear)
ttest2(pat_mean_noise_post, HC_mean_noise_post)
ttest2(pat_mean_clear_post, HC_mean_clear_post)

%% plot mean performance with error bars

distfromtarg_DATA_TO_USE=[pat_mean_noise_group pat_mean_clear_group; ...
          HC_mean_noise_group HC_mean_clear_group; ...
          pat_mean_noise_group_post pat_mean_clear_group_post; ...
          HC_mean_noise_group_post HC_mean_clear_group_post];

errY2= [pat_SEM_noise_group pat_SEM_clear_group; ...
        HC_SEM_noise_group HC_SEM_clear_group; ...
        pat_SEM_noise_group_post pat_SEM_clear_group_post; ...
        HC_SEM_noise_group_post HC_SEM_clear_group_post];

    
fig1=figure;
whitebg('white')
h = barwitherr(errY2, distfromtarg_DATA_TO_USE);% Plot with errorbars
set(gca,'XTickLabel',{'patients (pre)','controls (pre)','patients(post)','controls(post)'})
ylabel('distance from target pitch (cents)')
set(h(1),'FaceColor','k');
set(h(2),'FaceColor','w');
title(sprintf('Motor performance: pre and post windows'));
goodplot;
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/dist_targ_prepost.pdf');

%% anova (pre and post DATA_TO_USE)
anovadata=[pat_mean_noise pat_mean_clear pat_mean_noise_post pat_mean_clear_post ...
           HC_mean_noise HC_mean_clear HC_mean_noise_post HC_mean_clear_post];  
    
PAT_size=length(pat_mean_noise);
HC_size=length(HC_mean_noise);

%create subject group
pattest=ones(1,220);
HCtest=ones(1,80);
test2=HCtest*2;
subjectgroup=[pattest test2];

%create window group
for i=1:PAT_size*2
    pre_post_1{i} = 'pre';
end

for i=1:PAT_size*2
    pre_post_2{i} = 'post';
end

temp_1=[pre_post_1 pre_post_2];

for i=1:HC_size*2
    pre_post_3{i} = 'pre';
end

for i=1:HC_size*2
    pre_post_4{i} = 'post';
end
temp_2=[pre_post_3 pre_post_4];

pre_post=[temp_1 temp_2];
pre_post=pre_post';

%create condition group
for i=1:PAT_size
    condition_1{i}='noise';
end

for i=1:PAT_size
    condition_2{i}='clear';
end

for i=1:HC_size
    condition_3{i}='noise';
end

for i=1:HC_size
    condition_4{i}='clear';
end

condition=[condition_1 condition_2 condition_1 condition_2 condition_3 condition_4 condition_3 condition_4];
condition=condition';

group1=[subjectgroup];
group2=[pre_post];
group3=[condition];
p = anovan(anovadata,{group1 group2 group3},'model','interaction');

%% pre step anova
anovadata_prestep=[pat_mean_noise pat_mean_clear HC_mean_noise HC_mean_clear];  
  
PAT_size=length(pat_mean_noise);
HC_size=length(HC_mean_noise);

%create subject group
pattest=ones(1,110);
HCtest=ones(1,40);
test2=HCtest*2;
subjectgroup=[pattest test2];

%create condition group
for i=1:PAT_size
    condition_1{i}='noise';
end

for i=1:PAT_size
    condition_2{i}='clear';
end

for i=1:HC_size
    condition_3{i}='noise';
end

for i=1:HC_size
    condition_4{i}='clear';
end

condition=[condition_1 condition_2 condition_3 condition_4];
condition=condition';

group1=[subjectgroup];
group2=[condition];
p = anovan(anovadata_prestep,{group1 group2},'model','interaction');


%% WHOLE TRIAL DATA -------------------------------------------------------
% To calculate distance between performance and target:
% 1. create targets
test=[zeros(1, stepframe) ones(1, 1360-stepframe)];
smallup=test*100;
bigup=test*300;
smalldown=test*-100;
bigdown=test*-300;
nostep=zeros(1,1360);

% 2. calulate distances for each subject
for isubj=1:15
dist_from_targ_cond1(isubj,:)=calc_distance(smallup, DATA_TO_USE(isubj).mean_cond1_wholetrial);
dist_from_targ_cond2(isubj,:)=calc_distance(bigup, DATA_TO_USE(isubj).mean_cond2_wholetrial);
dist_from_targ_cond3(isubj,:)=calc_distance(nostep, DATA_TO_USE(isubj).mean_cond3_wholetrial);
dist_from_targ_cond4(isubj,:)=calc_distance(smalldown, DATA_TO_USE(isubj).mean_cond4_wholetrial);
dist_from_targ_cond5(isubj,:)=calc_distance(bigdown, DATA_TO_USE(isubj).mean_cond5_wholetrial);
dist_from_targ_cond6(isubj,:)=calc_distance(smallup, DATA_TO_USE(isubj).mean_cond6_wholetrial);
dist_from_targ_cond7(isubj,:)=calc_distance(bigup, DATA_TO_USE(isubj).mean_cond7_wholetrial);
dist_from_targ_cond8(isubj,:)=calc_distance(nostep, DATA_TO_USE(isubj).mean_cond8_wholetrial);
dist_from_targ_cond9(isubj,:)=calc_distance(smalldown, DATA_TO_USE(isubj).mean_cond9_wholetrial);
dist_from_targ_cond10(isubj,:)=calc_distance(bigdown, DATA_TO_USE(isubj).mean_cond10_wholetrial);
end

% 3. Caluculate mean distance from target for the patients and HCs for each condition
PAT.meandist_from_targ(1,:) = nanmean(dist_from_targ_cond1(1:numpats,:));
PAT.meandist_from_targ(2,:) = nanmean(dist_from_targ_cond2(1:numpats,:));
PAT.meandist_from_targ(3,:) = nanmean(dist_from_targ_cond3(1:numpats,:));
PAT.meandist_from_targ(4,:) = nanmean(dist_from_targ_cond4(1:numpats,:));
PAT.meandist_from_targ(5,:) = nanmean(dist_from_targ_cond5(1:numpats,:));
PAT.meandist_from_targ(6,:) = nanmean(dist_from_targ_cond6(1:numpats,:));
PAT.meandist_from_targ(7,:) = nanmean(dist_from_targ_cond7(1:numpats,:));
PAT.meandist_from_targ(8,:) = nanmean(dist_from_targ_cond8(1:numpats,:));
PAT.meandist_from_targ(9,:) = nanmean(dist_from_targ_cond9(1:numpats,:));
PAT.meandist_from_targ(10,:) = nanmean(dist_from_targ_cond10(1:numpats,:));

HC.meandist_from_targ(1,:) = nanmean(dist_from_targ_cond1(numpats+1:numpats+numHCs,:));
HC.meandist_from_targ(2,:) = nanmean(dist_from_targ_cond2(numpats+1:numpats+numHCs,:));
HC.meandist_from_targ(3,:) = nanmean(dist_from_targ_cond3(numpats+1:numpats+numHCs,:));
HC.meandist_from_targ(4,:) = nanmean(dist_from_targ_cond4(numpats+1:numpats+numHCs,:));
HC.meandist_from_targ(5,:) = nanmean(dist_from_targ_cond5(numpats+1:numpats+numHCs,:));
HC.meandist_from_targ(6,:) = nanmean(dist_from_targ_cond6(numpats+1:numpats+numHCs,:));
HC.meandist_from_targ(7,:) = nanmean(dist_from_targ_cond7(numpats+1:numpats+numHCs,:));
HC.meandist_from_targ(8,:) = nanmean(dist_from_targ_cond8(numpats+1:numpats+numHCs,:));
HC.meandist_from_targ(9,:) = nanmean(dist_from_targ_cond9(numpats+1:numpats+numHCs,:));
HC.meandist_from_targ(10,:) = nanmean(dist_from_targ_cond10(numpats+1:numpats+numHCs,:));

% 4. Calculate group mean distance across all noise and clear trials for
% patients and controls
PAT.cleartrials_groupmean=mean(PAT.meandist_from_targ(1:5,:));
PAT.noisetrials_groupmean=mean(PAT.meandist_from_targ(6:10,:));
HC.cleartrials_groupmean=mean(HC.meandist_from_targ(1:5,:));
HC.noisetrials_groupmean=mean(HC.meandist_from_targ(6:10,:));

figure
subplot(211)
plot(PAT.cleartrials_groupmean, 'k', 'LineWidth', 2)
hold on
plot(PAT.noisetrials_groupmean, 'r', 'LineWidth', 2)
axis([0 1500 0 300])
goodplot

subplot(212)
plot(HC.cleartrials_groupmean, 'k', 'LineWidth', 2)
hold on
plot(HC.noisetrials_groupmean, 'r', 'LineWidth', 2)
axis([0 1500 0 300])
goodplot
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/distfromtarget.pdf');


% 5. plot this separately for patients and controls
plotdistfromtarg;

% anova on whole trial disntance from target data
anovadata=[...
    HC.meandist_from_targ(1,:) HC.meandist_from_targ(2,:)  HC.meandist_from_targ(3,:)  HC.meandist_from_targ(4,:)  HC.meandist_from_targ(5,:) ...
    HC.meandist_from_targ(6,:) HC.meandist_from_targ(7,:)  HC.meandist_from_targ(8,:)  HC.meandist_from_targ(9,:)  HC.meandist_from_targ(10,:) ...    
    PAT.meandist_from_targ(1,:) PAT.meandist_from_targ(2,:)  PAT.meandist_from_targ(3,:)  PAT.meandist_from_targ(4,:)  PAT.meandist_from_targ(5,:) ...
    PAT.meandist_from_targ(6,:) PAT.meandist_from_targ(7,:)  PAT.meandist_from_targ(8,:)  PAT.meandist_from_targ(9,:)  PAT.meandist_from_targ(10,:)]    

anovalength=length(anovadata);
anovalength/2
anovalength/4
%create subject group
HCtest=ones(1,anovalength/2);
pattest=ones(1,anovalength/2);
test2=pattest*2;
subjectgroup=[HCtest test2];

%create condition group
for i=1:6800
    condition_1a{i}='clear';
end

for i=1:6800
    condition_2a{i}='noise';
end

condition=[condition_1a condition_2a condition_1a condition_2a];
condition=condition';

group1=[subjectgroup];
group2=[condition];
p = anovan(anovadata,{group1 group2},'model','interaction');








%% anova on group data comparing the HC distance from target with patient distance from target
anovadata=[zee(1,:) zee(2,:) zee(3,:) zee(4,:) zee(5,:) zee(6,:) zee(7,:) zee(8,:) zee(9,:) zee(10,:)];
  
%create subject group
pattest=ones(1,6800);
HCtest=ones(1,6800);
test2=HCtest*2;
subjectgroup=[pattest test2];

%create condition group
for i=1:6800
    condition_1a{i}='clear';
end

for i=1:6800
    condition_2a{i}='noise';
end

condition=[condition_1a condition_2a];
condition=condition';

group1=[subjectgroup];
group2=[condition];
p = anovan(anovadata,{group1 group2},'model','interaction');


figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Difference in motor performance between patients and HCs', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')

for moo=1:5
subplot(5,1, moo)
plot(zee(moo,:),'k', 'LineWidth', 2);
hold on
plot(zee(moo+5,:),'r', 'LineWidth', 2);
axis([0 1500, 0 500])
goodplot_wide
end
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/diff_groups_indistfromtarget.pdf');

% difference between HC and patient motor performance
% is greater
% where the red is higher than the black is where the the difference 
% between the groups is greater in noise

%% ttests

clearconds=[zee(1,:) zee(2,:) zee(3,:) zee(4,:) zee(5,:)];
noiseconds=[zee(6,:) zee(7,:) zee(8,:) zee(9,:) zee(10,:)];
ttest2(clearconds, noiseconds)
















%% Sanity check: plot the same based on the group means, not the individual data - this is totally redundanttttt 

test(1,:)=calc_distance(group_cond1_HCs_to_use_mean, smallup);
test(2,:)=calc_distance(group_cond2_HCs_to_use_mean, bigup);
test(3,:)=calc_distance(group_cond3_HCs_to_use_mean, nostep);
test(4,:)=calc_distance(group_cond4_HCs_to_use_mean, smalldown);
test(5,:)=calc_distance(group_cond5_HCs_to_use_mean, bigdown);
test(6,:)=calc_distance(group_cond6_HCs_to_use_mean, smallup);
test(7,:)=calc_distance(group_cond7_HCs_to_use_mean, bigup);
test(8,:)=calc_distance(group_cond8_HCs_to_use_mean, nostep);
test(9,:)=calc_distance(group_cond9_HCs_to_use_mean, smalldown);
test(10,:)=calc_distance(group_cond10_HCs_to_use_mean, bigdown);


%% works
% distance between mean trial perf and target for patients and controls
% from group data

PAT.meandist_from_targ_groupdata(1,:)=calc_distance(group_cond1_pats_to_use_mean, smallup);
PAT.meandist_from_targ_groupdata(2,:)=calc_distance(group_cond2_pats_to_use_mean, bigup);
PAT.meandist_from_targ_groupdata(3,:)=calc_distance(group_cond3_pats_to_use_mean, nostep);
PAT.meandist_from_targ_groupdata(4,:)=calc_distance(group_cond4_pats_to_use_mean, smalldown);
PAT.meandist_from_targ_groupdata(5,:)=calc_distance(group_cond5_pats_to_use_mean, bigdown);
PAT.meandist_from_targ_groupdata(6,:)=calc_distance(group_cond6_pats_to_use_mean, smallup);
PAT.meandist_from_targ_groupdata(7,:)=calc_distance(group_cond7_pats_to_use_mean, bigup);
PAT.meandist_from_targ_groupdata(8,:)=calc_distance(group_cond8_pats_to_use_mean, nostep);
PAT.meandist_from_targ_groupdata(9,:)=calc_distance(group_cond9_pats_to_use_mean, smalldown);
PAT.meandist_from_targ_groupdata(10,:)=calc_distance(group_cond10_pats_to_use_mean, bigdown);

HC.meandist_from_targ_groupdata(1,:)=calc_distance(group_cond1_HCs_to_use_mean, smallup);
HC.meandist_from_targ_groupdata(2,:)=calc_distance(group_cond2_HCs_to_use_mean, bigup);
HC.meandist_from_targ_groupdata(3,:)=calc_distance(group_cond3_HCs_to_use_mean, nostep);
HC.meandist_from_targ_groupdata(4,:)=calc_distance(group_cond4_HCs_to_use_mean, smalldown);
HC.meandist_from_targ_groupdata(5,:)=calc_distance(group_cond5_HCs_to_use_mean, bigdown);
HC.meandist_from_targ_groupdata(6,:)=calc_distance(group_cond6_HCs_to_use_mean, smallup);
HC.meandist_from_targ_groupdata(7,:)=calc_distance(group_cond7_HCs_to_use_mean, bigup);
HC.meandist_from_targ_groupdata(8,:)=calc_distance(group_cond8_HCs_to_use_mean, nostep);
HC.meandist_from_targ_groupdata(9,:)=calc_distance(group_cond9_HCs_to_use_mean, smalldown);
HC.meandist_from_targ_groupdata(10,:)=calc_distance(group_cond10_HCs_to_use_mean, bigdown);


