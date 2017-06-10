
%% second attempt at anova after talking to sri and running it on the means - not the raw data but the mean data
anovandata=[group_pat_pre_clear_anova group_pat_post_clear_anova group_HC_pre_clear_anova group_HC_post_clear_anova ...
            group_pat_pre_noise_anova group_pat_post_noise_anova group_HC_pre_noise_anova group_HC_post_noise_anova];

%create subject group
test=ones(1,10);
test2=test*2;
subjectgroup=[test test2 test test2];


%create window group
pre_post = cell(1,20);
for i=1:5
    %names{i} = ['Sample Text ' num2str(i)];
    pre_post{i} = 'pre';
end
for i=6:10
    pre_post{i} = 'post';
end
for i=11:15
    %names{i} = ['Sample Text ' num2str(i)];
    pre_post{i} = 'pre';
end
for i=16:20
    pre_post{i} = 'post';
end
pre_post2=[pre_post pre_post]
pre_post=pre_post2';

%create condition group
condition = cell(1,40);
for i=1:20
    condition{i}='clear';
end
for i=21:40
    condition{i}='noise';
end
condition=condition';

mean_WTstdev_anova.group1=[subjectgroup];
mean_WTstdev_anova.group2=[pre_post];
mean_WTstdev_anova.group3=[condition];
% p = anovan(anovandata,{mean_WTstdev_anova.group1 mean_WTstdev_anova.group2 mean_WTstdev_anova.group3},'model','interaction')
% p = anovan(test,{group1 group2 group3},'model','interaction')
% p = anovan(anovandata,{group1 group2 group3}, 1)
[mean_WTstdev_anova.p_interaction,mean_WTstdev_anova.table,mean_WTstdev_anova.stats,mean_WTstdev_anova.terms]= anovan(anovandata,{mean_WTstdev_anova.group1 mean_WTstdev_anova.group2 mean_WTstdev_anova.group3}, 'full')

%[mean_WTstdev_anova.p_interaction,mean_WTstdev_anova.table,mean_WTstdev_anova.stats,mean_WTstdev_anova.terms]= anovan(anovandata,{mean_WTstdev_anova.group1 mean_WTstdev_anova.group2 mean_WTstdev_anova.group3},'model','interaction');


clc
display 'first anova is the interaction for mean_WTstdev_anova done on each subject mean'
save /Users/zagnew/Cereb_data/data_final_run/GroupData/stats/mean_WTstdev_anova mean_WTstdev_anova

save STATS STATS