%% looks at the correlation between 'mean distance from target' and 
% 'wtstdev pitch' between patients and controls, for both the pre and post
% step window
% -------------------------------------------------------------------------
% ZKA Oct 2014

% loads data ANCOVA_DATA.m created and saved in H_meanpitches.m

clear all
close all
set_params;
cd(cerebellar_data_rootdir)
load /Users/zagnew/Cereb_data/data/ANCOVA_DATA.mat
whos % look at variables

distfromtarg_pre=[cleartrials_dist_fm_targ_pats_pre cleartrials_dist_fm_targ_HCs_pre ];
wtstdev_pre=[cleartrials_wtstdev_pats_pre cleartrials_wtstdev_HCs_pre];    
distfromtarg_post=[cleartrials_dist_fm_targ_pats_post cleartrials_dist_fm_targ_HCs_post ];
wtstdev_post=[cleartrials_wtstdev_pats_post cleartrials_wtstdev_HCs_post];    

group_a=ones(1,200);
group_b=ones(1,520);
group_c=group_b*2;
group=[group_a group_c];

[h,atab,ctab,stats] = aoctool(distfromtarg_pre,wtstdev_pre, group);
prewindowcorrelation=ans
[h,atab,ctab,stats] = aoctool(distfromtarg_post,wtstdev_post, group);
postwindowcorrelation=ans

aoctool(distfromtarg_pre,wtstdev_pre,group,0.05)


% try grouping with inidiviudals instead of patients/Hcs

