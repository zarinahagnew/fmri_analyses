


%% anova with each subject mean distance clear vs masked trials

anovandata_distfrommean=[reshape(distfromtarg_HCs_WT,[1, 11110]), reshape(distfromtarg_pats_WT,[1, 11110])];        

conditionlength=1111*5;
grouplength=1111*10;

group1=ones(1, 11110);
group2=group1*2;
group=[group1 group2];

cond1=ones(1,1111*5)
cond2=cond1*2
cond=[cond1 cond2 cond1 cond2]

%create group
clear condition
for i=1:1111*5
    condition{i} = 'clear';
end

for i=1111*5+1:1111*10
    condition{i} = 'noise';
end
condition=[condition condition];
condition=condition';

meandist_anova.group1=[group];
meandist_anova.group2=[condition];
%meandist_anova.group2=cond;

[meandist_anova.p_full,meandist_anova.table,meandist_anova.stats,meandist_anova.terms] = ...
    anovan(anovandata_distfrommean,{meandist_anova.group1 meandist_anova.group2}, 'interaction')

%results = multcompare(stats,'Dimension',[1 2])

meandist_anova.posthoctests=multcompare(meandist_anova.stats)

save /Users/zagnew/Cereb_data/data_final_run/GroupData/stats/meandist_anova_clearvnoise meandist_anova



%% anova with all condition  modeled separately
conditionlength=1111;
grouplength=1111*10;

group1=ones(1, 11110);
group2=group1*2;
group=[group1 group2];

clear cond
cond1=ones(1,1111)
cond2=cond1*2
cond3=cond1*3
cond4=cond1*4
cond5=cond1*5
cond6=cond1*6
cond7=cond1*7
cond8=cond1*8
cond9=cond1*9
cond10=cond1*10
cond=[cond1 cond2 cond3 cond4 cond5 cond6 cond7 cond8 cond9 cond10]
cond=[cond cond]

meandist_anova.group1=[group];
meandist_anova.group3=[cond];

[meandist_anova_.p_full,meandist_anova.table,meandist_anova.stats,meandist_anova.terms] = ...
    anovan(anovandata_distfrommean,{meandist_anova.group1 meandist_anova.group3}, 'interaction')

save /Users/zagnew/Cereb_data/data_final_run/GroupData/stats/meandist_anova_allconds meandist_anova

%% early and late windows

distfromtarg_HCs_WT

