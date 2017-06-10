%% anova on group data
HC_cond(1)=nanstd(group_cond1_HCs_to_use_mean)
HC_cond(2)=nanstd(group_cond2_HCs_to_use_mean)
HC_cond(3)=nanstd(group_cond3_HCs_to_use_mean)
HC_cond(4)=nanstd(group_cond4_HCs_to_use_mean)
HC_cond(5)=nanstd(group_cond5_HCs_to_use_mean)

HC_cond(6)=nanstd(group_cond6_HCs_to_use_mean)
HC_cond(7)=nanstd(group_cond7_HCs_to_use_mean)
HC_cond(8)=nanstd(group_cond8_HCs_to_use_mean)
HC_cond(9)=nanstd(group_cond9_HCs_to_use_mean)
HC_cond(10)=nanstd(group_cond10_HCs_to_use_mean)
%% anova on group data
Pat_cond(1)=nanstd(group_cond1_pats_to_use_mean)
Pat_cond(2)=nanstd(group_cond2_pats_to_use_mean)
Pat_cond(3)=nanstd(group_cond3_pats_to_use_mean)
Pat_cond(4)=nanstd(group_cond4_pats_to_use_mean)
Pat_cond(5)=nanstd(group_cond5_pats_to_use_mean)

Pat_cond(6)=nanstd(group_cond6_pats_to_use_mean)
Pat_cond(7)=nanstd(group_cond7_pats_to_use_mean)
Pat_cond(8)=nanstd(group_cond8_pats_to_use_mean)
Pat_cond(9)=nanstd(group_cond9_pats_to_use_mean)
Pat_cond(10)=nanstd(group_cond10_pats_to_use_mean)

anovadata=[HC_cond Pat_cond]

%create subject group
test=ones(1,10);
test2=test*2;
subjectgroup=[test test2];

%create condition group
condition = cell(1,5);
for i=1:5
    condition{i}='clear';
end
for i=6:10
    condition{i}='noise';
end
for i=11:15
    condition{i}='clear';
end
for i=16:20
    condition{i}='noise';
end
condition=condition';

group1=[subjectgroup];
group2=[condition];
p = anovan(anovadata,{group1 group2},'model','interaction')

figure
bar(1:10,HC_cond, 'k')
hold on
bar(11:20,Pat_cond, 'm')

fig_cond1=figure
subplot(2,3,1); plot(group_cond1_HCs_to_use_mean); axis([0 2000 -300 300])
subplot(2,3,2); plot(group_cond1_pats_to_use_mean); axis([0 2000 -300 300])
subplot(2,3,4); plot(group_cond6_HCs_to_use_mean, 'm'); axis([0 2000 -300 300])
subplot(2,3,5); plot(group_cond6_pats_to_use_mean, 'm'); axis([0 2000 -300 300])
subplot(2,3,3); bar(1,HC_cond(1)); hold on; bar(2,Pat_cond(1)); axis([0 3 0 100])
subplot(2,3,6); bar(1,HC_cond(6)); hold on; bar(2,Pat_cond(6)); axis([0 3 0 100])


fig_cond2=figure
subplot(2,3,1); plot(group_cond2_HCs_to_use_mean); axis([0 2000 -350 350])
subplot(2,3,2); plot(group_cond2_pats_to_use_mean); axis([0 2000 -350 350])
subplot(2,3,4); plot(group_cond7_HCs_to_use_mean, 'm'); axis([0 2000 -350 350])
subplot(2,3,5); plot(group_cond7_pats_to_use_mean, 'm'); axis([0 2000 -350 350])
subplot(2,3,3); bar(1,HC_cond(2)); hold on; bar(2,Pat_cond(2)); axis([0 3 0 400])
subplot(2,3,6); bar(1,HC_cond(7)); hold on; bar(2,Pat_cond(7)); axis([0 3 0 400])



fig_cond3=figure
subplot(2,3,1); plot(group_cond3_HCs_to_use_mean); axis([0 2000 -350 350])
subplot(2,3,2); plot(group_cond3_pats_to_use_mean); axis([0 2000 -350 350])
subplot(2,3,4); plot(group_cond8_HCs_to_use_mean, 'm'); axis([0 2000 -350 350])
subplot(2,3,5); plot(group_cond8_pats_to_use_mean, 'm'); axis([0 2000 -350 350])
subplot(2,3,3); bar(1,HC_cond(3)); hold on; bar(2,Pat_cond(3)); axis([0 3 0 400])
subplot(2,3,6); bar(1,HC_cond(8)); hold on; bar(2,Pat_cond(8)); axis([0 3 0 400])

ttest(group_cond3_HCs_to_use_mean, group_cond8_HCs_to_use_mean)
ttest(group_cond3_pats_to_use_mean, group_cond8_pats_to_use_mean)
ttest2(group_cond3_HCs_to_use_mean, group_cond3_pats_to_use_mean)
ttest2(group_cond8_HCs_to_use_mean, group_cond8_pats_to_use_mean)