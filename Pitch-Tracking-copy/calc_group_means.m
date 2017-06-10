%% (1) writes each persons data into a single matrix for each condition --------

for ipat=1:numpats
    group_cond1_pats(ipat,:)=DATA(ipat).mean_cond1_wholetrial(1,:);
    group_cond1_pats_pre(ipat,:)=DATA(ipat).mean_cond1_pre(1,:); 
    group_cond1_pats_post(ipat,:)=DATA(ipat).mean_cond1_post(1,:); 
    % 
    group_cond1_distfromtarg(ipat,:)=DATA(ipat).cond(1).distfromtarg_WT(1,:);
    
    group_cond2_pats(ipat,:)=DATA(ipat).mean_cond2_wholetrial(1,:);
    group_cond2_pats_pre(ipat,:)=DATA(ipat).mean_cond2_pre(1,:);
    group_cond2_pats_post(ipat,:)=DATA(ipat).mean_cond2_post(1,:); 

    group_cond3_pats(ipat,:)=DATA(ipat).mean_cond3_wholetrial(1,:);
    group_cond3_pats_pre(ipat,:)=DATA(ipat).mean_cond3_pre(1,:);
    group_cond3_pats_post(ipat,:)=DATA(ipat).mean_cond3_post(1,:); 
    
    group_cond4_pats(ipat,:)=DATA(ipat).mean_cond4_wholetrial(1,:);
    group_cond4_pats_pre(ipat,:)=DATA(ipat).mean_cond4_pre(1,:);
    group_cond4_pats_post(ipat,:)=DATA(ipat).mean_cond4_post(1,:); 

    group_cond5_pats(ipat,:)=DATA(ipat).mean_cond5_wholetrial(1,:);
    group_cond5_pats_pre(ipat,:)=DATA(ipat).mean_cond5_pre(1,:);
    group_cond5_pats_post(ipat,:)=DATA(ipat).mean_cond5_post(1,:); 
    
    group_cond6_pats(ipat,:)=DATA(ipat).mean_cond6_wholetrial(1,:);
    group_cond6_pats_pre(ipat,:)=DATA(ipat).mean_cond6_pre(1,:); 
    group_cond6_pats_post(ipat,:)=DATA(ipat).mean_cond6_post(1,:); 
    
    group_cond7_pats(ipat,:)=DATA(ipat).mean_cond7_wholetrial(1,:);
    group_cond7_pats_pre(ipat,:)=DATA(ipat).mean_cond7_pre(1,:);
    group_cond7_pats_post(ipat,:)=DATA(ipat).mean_cond7_post(1,:); 

    group_cond8_pats(ipat,:)=DATA(ipat).mean_cond8_wholetrial(1,:);
    group_cond8_pats_pre(ipat,:)=DATA(ipat).mean_cond8_pre(1,:);
    group_cond8_pats_post(ipat,:)=DATA(ipat).mean_cond8_post(1,:); 
    
    group_cond9_pats(ipat,:)=DATA(ipat).mean_cond9_wholetrial(1,:);
    group_cond9_pats_pre(ipat,:)=DATA(ipat).mean_cond9_pre(1,:);
    group_cond9_pats_post(ipat,:)=DATA(ipat).mean_cond9_post(1,:); 

    group_cond10_pats(ipat,:)=DATA(ipat).mean_cond10_wholetrial(1,:);
    group_cond10_pats_pre(ipat,:)=DATA(ipat).mean_cond10_pre(1,:);
    group_cond10_pats_post(ipat,:)=DATA(ipat).mean_cond10_post(1,:); 
end

%for isub=numpats+1:numsubs
for isub=1:numHCs    
    group_cond1_HCs(isub,:)=DATA(isub+numpats).mean_cond1_wholetrial(1,:);
    group_cond1_HCs_pre(isub,:)=DATA(isub+numpats).mean_cond1_pre(1,:); 
    group_cond1_HCs_post(isub,:)=DATA(isub+numpats).mean_cond1_post(1,:); 
    
    group_cond2_HCs(isub,:)=DATA(isub+numpats).mean_cond2_wholetrial(1,:);
    group_cond2_HCs_pre(isub,:)=DATA(isub+numpats).mean_cond2_pre(1,:);
    group_cond2_HCs_post(isub,:)=DATA(isub+numpats).mean_cond2_post(1,:); 

    group_cond3_HCs(isub,:)=DATA(isub+numpats).mean_cond3_wholetrial(1,:);
    group_cond3_HCs_pre(isub,:)=DATA(isub+numpats).mean_cond3_pre(1,:);
    group_cond3_HCs_post(isub,:)=DATA(isub+numpats).mean_cond3_post(1,:); 
    
    group_cond4_HCs(isub,:)=DATA(isub+numpats).mean_cond4_wholetrial(1,:);
    group_cond4_HCs_pre(isub,:)=DATA(isub+numpats).mean_cond4_pre(1,:);
    group_cond4_HCs_post(isub,:)=DATA(isub+numpats).mean_cond4_post(1,:); 

    group_cond5_HCs(isub,:)=DATA(isub+numpats).mean_cond5_wholetrial(1,:);
    group_cond5_HCs_pre(isub,:)=DATA(isub+numpats).mean_cond5_pre(1,:);
    group_cond5_HCs_post(isub,:)=DATA(isub+numpats).mean_cond5_post(1,:); 
    
    group_cond6_HCs(isub,:)=DATA(isub+numpats).mean_cond6_wholetrial(1,:);
    group_cond6_HCs_pre(isub,:)=DATA(isub+numpats).mean_cond6_pre(1,:); 
    group_cond6_HCs_post(isub,:)=DATA(isub+numpats).mean_cond6_post(1,:); 
    
    group_cond7_HCs(isub,:)=DATA(isub+numpats).mean_cond7_wholetrial(1,:);
    group_cond7_HCs_pre(isub,:)=DATA(isub+numpats).mean_cond7_pre(1,:);
    group_cond7_HCs_post(isub,:)=DATA(isub+numpats).mean_cond7_post(1,:); 

    group_cond8_HCs(isub,:)=DATA(isub+numpats).mean_cond8_wholetrial(1,:);
    group_cond8_HCs_pre(isub,:)=DATA(isub+numpats).mean_cond8_pre(1,:);
    group_cond8_HCs_post(isub,:)=DATA(isub+numpats).mean_cond8_post(1,:); 
    
    group_cond9_HCs(isub,:)=DATA(isub+numpats).mean_cond9_wholetrial(1,:);
    group_cond9_HCs_pre(isub,:)=DATA(isub+numpats).mean_cond9_pre(1,:);
    group_cond9_HCs_post(isub,:)=DATA(isub+numpats).mean_cond9_post(1,:); 

    group_cond10_HCs(isub,:)=DATA(isub+numpats).mean_cond10_wholetrial(1,:);
    group_cond10_HCs_pre(isub,:)=DATA(isub+numpats).mean_cond10_pre(1,:);
    group_cond10_HCs_post(isub,:)=DATA(isub+numpats).mean_cond10_post(1,:); 
end

%% put into one matrix
    pats_WT(1,:)=nanmean(group_cond1_pats);
    pats_WT(2,:)=nanmean(group_cond2_pats);
    pats_WT(3,:)=nanmean(group_cond3_pats);
    pats_WT(4,:)=nanmean(group_cond4_pats);
    pats_WT(5,:)=nanmean(group_cond5_pats);
    pats_WT(6,:)=nanmean(group_cond6_pats);
    pats_WT(7,:)=nanmean(group_cond7_pats);
    pats_WT(8,:)=nanmean(group_cond8_pats);
    pats_WT(9,:)=nanmean(group_cond9_pats);
    pats_WT(10,:)=nanmean(group_cond10_pats);
   
    pats_pre(1,:)=nanmean(group_cond1_pats_pre);
    pats_pre(2,:)=nanmean(group_cond2_pats_pre);
    pats_pre(3,:)=nanmean(group_cond3_pats_pre);
    pats_pre(4,:)=nanmean(group_cond4_pats_pre);
    pats_pre(5,:)=nanmean(group_cond5_pats_pre);
    pats_pre(6,:)=nanmean(group_cond6_pats_pre);
    pats_pre(7,:)=nanmean(group_cond7_pats_pre);
    pats_pre(8,:)=nanmean(group_cond8_pats_pre);
    pats_pre(9,:)=nanmean(group_cond9_pats_pre);
    pats_pre(10,:)=nanmean(group_cond10_pats_pre);
 
    pats_post(1,:)=nanmean(group_cond1_pats_post);
    pats_post(2,:)=nanmean(group_cond2_pats_post);
    pats_post(3,:)=nanmean(group_cond3_pats_post);
    pats_post(4,:)=nanmean(group_cond4_pats_post);
    pats_post(5,:)=nanmean(group_cond5_pats_post);
    pats_post(6,:)=nanmean(group_cond6_pats_post);
    pats_post(7,:)=nanmean(group_cond7_pats_post);
    pats_post(8,:)=nanmean(group_cond8_pats_post);
    pats_post(9,:)=nanmean(group_cond9_pats_post);
    pats_post(10,:)=nanmean(group_cond10_pats_post);
    
    HCs_WT(1,:)=nanmean(group_cond1_HCs);
    HCs_WT(2,:)=nanmean(group_cond2_HCs);
    HCs_WT(3,:)=nanmean(group_cond3_HCs);
    HCs_WT(4,:)=nanmean(group_cond4_HCs);
    HCs_WT(5,:)=nanmean(group_cond5_HCs);
    HCs_WT(6,:)=nanmean(group_cond6_HCs);
    HCs_WT(7,:)=nanmean(group_cond7_HCs);
    HCs_WT(8,:)=nanmean(group_cond8_HCs);
    HCs_WT(9,:)=nanmean(group_cond9_HCs);
    HCs_WT(10,:)=nanmean(group_cond10_HCs);
    
    HCs_pre(1,:)=nanmean(group_cond1_HCs_pre);
    HCs_pre(2,:)=nanmean(group_cond2_HCs_pre);
    HCs_pre(3,:)=nanmean(group_cond3_HCs_pre);
    HCs_pre(4,:)=nanmean(group_cond4_HCs_pre);
    HCs_pre(5,:)=nanmean(group_cond5_HCs_pre);
    HCs_pre(6,:)=nanmean(group_cond6_HCs_pre);
    HCs_pre(7,:)=nanmean(group_cond7_HCs_pre);
    HCs_pre(8,:)=nanmean(group_cond8_HCs_pre);
    HCs_pre(9,:)=nanmean(group_cond9_HCs_pre);
    HCs_pre(10,:)=nanmean(group_cond10_HCs_pre);
 
    
    HCs_post(1,:)=nanmean(group_cond1_HCs_post);
    HCs_post(2,:)=nanmean(group_cond2_HCs_post);
    HCs_post(3,:)=nanmean(group_cond3_HCs_post);
    HCs_post(4,:)=nanmean(group_cond4_HCs_post);
    HCs_post(5,:)=nanmean(group_cond5_HCs_post);
    HCs_post(6,:)=nanmean(group_cond6_HCs_post);
    HCs_post(7,:)=nanmean(group_cond7_HCs_post);
    HCs_post(8,:)=nanmean(group_cond8_HCs_post);
    HCs_post(9,:)=nanmean(group_cond9_HCs_post);
    HCs_post(10,:)=nanmean(group_cond10_HCs_post);
    
% stds 
    pats_WT_std(1,:)=nanstd(group_cond1_pats);
    pats_WT_std(2,:)=nanstd(group_cond2_pats);
    pats_WT_std(3,:)=nanstd(group_cond3_pats);
    pats_WT_std(4,:)=nanstd(group_cond4_pats);
    pats_WT_std(5,:)=nanstd(group_cond5_pats);
    pats_WT_std(6,:)=nanstd(group_cond6_pats);
    pats_WT_std(7,:)=nanstd(group_cond7_pats);
    pats_WT_std(8,:)=nanstd(group_cond8_pats);
    pats_WT_std(9,:)=nanstd(group_cond9_pats);
    pats_WT_std(10,:)=nanstd(group_cond10_pats);
    
    pats_pre(1,:)=nanstd(group_cond1_pats_pre);
    pats_pre(2,:)=nanstd(group_cond2_pats_pre);
    pats_pre(3,:)=nanstd(group_cond3_pats_pre);
    pats_pre(4,:)=nanstd(group_cond4_pats_pre);
    pats_pre(5,:)=nanstd(group_cond5_pats_pre);
    pats_pre(6,:)=nanstd(group_cond6_pats_pre);
    pats_pre(7,:)=nanstd(group_cond7_pats_pre);
    pats_pre(8,:)=nanstd(group_cond8_pats_pre);
    pats_pre(9,:)=nanstd(group_cond9_pats_pre);
    pats_pre(10,:)=nanstd(group_cond10_pats_pre);
 
    pats_post(1,:)=nanstd(group_cond1_pats_post);
    pats_post(2,:)=nanstd(group_cond2_pats_post);
    pats_post(3,:)=nanstd(group_cond3_pats_post);
    pats_post(4,:)=nanstd(group_cond4_pats_post);
    pats_post(5,:)=nanstd(group_cond5_pats_post);
    pats_post(6,:)=nanstd(group_cond6_pats_post);
    pats_post(7,:)=nanstd(group_cond7_pats_post);
    pats_post(8,:)=nanstd(group_cond8_pats_post);
    pats_post(9,:)=nanstd(group_cond9_pats_post);
    pats_post(10,:)=nanstd(group_cond10_pats_post);
    
    HCs_WT_std(1,:)=nanstd(group_cond1_HCs);
    HCs_WT_std(2,:)=nanstd(group_cond2_HCs);
    HCs_WT_std(3,:)=nanstd(group_cond3_HCs);
    HCs_WT_std(4,:)=nanstd(group_cond4_HCs);
    HCs_WT_std(5,:)=nanstd(group_cond5_HCs);
    HCs_WT_std(6,:)=nanstd(group_cond6_HCs);
    HCs_WT_std(7,:)=nanstd(group_cond7_HCs);
    HCs_WT_std(8,:)=nanstd(group_cond8_HCs);
    HCs_WT_std(9,:)=nanstd(group_cond9_HCs);
    HCs_WT_std(10,:)=nanstd(group_cond10_HCs);
    
    HCs_pre_std(1,:)=nanstd(group_cond1_HCs_pre);
    HCs_pre_std(2,:)=nanstd(group_cond2_HCs_pre);
    HCs_pre_std(3,:)=nanstd(group_cond3_HCs_pre);
    HCs_pre_std(4,:)=nanstd(group_cond4_HCs_pre);
    HCs_pre_std(5,:)=nanstd(group_cond5_HCs_pre);
    HCs_pre_std(6,:)=nanstd(group_cond6_HCs_pre);
    HCs_pre_std(7,:)=nanstd(group_cond7_HCs_pre);
    HCs_pre_std(8,:)=nanstd(group_cond8_HCs_pre);
    HCs_pre_std(9,:)=nanstd(group_cond9_HCs_pre);
    HCs_pre_std(10,:)=nanstd(group_cond10_HCs_pre);
 
    
    HCs_post_std(1,:)=nanstd(group_cond1_HCs_post);
    HCs_post_std(2,:)=nanstd(group_cond2_HCs_post);
    HCs_post_std(3,:)=nanstd(group_cond3_HCs_post);
    HCs_post_std(4,:)=nanstd(group_cond4_HCs_post);
    HCs_post_std(5,:)=nanstd(group_cond5_HCs_post);
    HCs_post_std(6,:)=nanstd(group_cond6_HCs_post);
    HCs_post_std(7,:)=nanstd(group_cond7_HCs_post);
    HCs_post_std(8,:)=nanstd(group_cond8_HCs_post);
    HCs_post_std(9,:)=nanstd(group_cond9_HCs_post);
    HCs_post_std(10,:)=nanstd(group_cond10_HCs_post);
    
%% put into one matrix
    pats_WT_sem(1,:)=nanstd(group_cond1_pats)/sqrt(numpats);
    pats_WT_sem(2,:)=nanstd(group_cond2_pats)/sqrt(numpats);
    pats_WT_sem(3,:)=nanstd(group_cond3_pats)/sqrt(numpats);
    pats_WT_sem(4,:)=nanstd(group_cond4_pats)/sqrt(numpats);
    pats_WT_sem(5,:)=nanstd(group_cond5_pats)/sqrt(numpats);
    pats_WT_sem(6,:)=nanstd(group_cond6_pats)/sqrt(numpats);
    pats_WT_sem(7,:)=nanstd(group_cond7_pats)/sqrt(numpats);
    pats_WT_sem(8,:)=nanstd(group_cond8_pats)/sqrt(numpats);
    pats_WT_sem(9,:)=nanstd(group_cond9_pats)/sqrt(numpats);
    pats_WT_sem(10,:)=nanstd(group_cond10_pats)/sqrt(numpats);
   
    pats_WT_sem(1,:)=nanstd(group_cond1_pats)/sqrt(numpats);
    pats_WT_sem(2,:)=nanstd(group_cond2_pats)/sqrt(numpats);
    pats_WT_sem(3,:)=nanstd(group_cond3_pats)/sqrt(numpats);
    pats_WT_sem(4,:)=nanstd(group_cond4_pats)/sqrt(numpats);
    pats_WT_sem(5,:)=nanstd(group_cond5_pats)/sqrt(numpats);
    pats_WT_sem(6,:)=nanstd(group_cond6_pats)/sqrt(numpats);
    pats_WT_sem(7,:)=nanstd(group_cond7_pats)/sqrt(numpats);
    pats_WT_sem(8,:)=nanstd(group_cond8_pats)/sqrt(numpats);
    pats_WT_sem(9,:)=nanstd(group_cond9_pats)/sqrt(numpats);
    pats_WT_sem(10,:)=nanstd(group_cond10_pats)/sqrt(numpats);
   
    pats_pre(1,:)=nanstd(group_cond1_pats_pre)/sqrt(numpats);
    pats_pre(2,:)=nanstd(group_cond2_pats_pre)/sqrt(numpats);
    pats_pre(3,:)=nanstd(group_cond3_pats_pre)/sqrt(numpats);
    pats_pre(4,:)=nanstd(group_cond4_pats_pre)/sqrt(numpats);
    pats_pre(5,:)=nanstd(group_cond5_pats_pre)/sqrt(numpats);
    pats_pre(6,:)=nanstd(group_cond6_pats_pre)/sqrt(numpats);
    pats_pre(7,:)=nanstd(group_cond7_pats_pre)/sqrt(numpats);
    pats_pre(8,:)=nanstd(group_cond8_pats_pre)/sqrt(numpats);
    pats_pre(9,:)=nanstd(group_cond9_pats_pre)/sqrt(numpats);
    pats_pre(10,:)=nanstd(group_cond10_pats_pre)/sqrt(numpats);
 
    pats_post(1,:)=nanstd(group_cond1_pats_post)/sqrt(numpats);
    pats_post(2,:)=nanstd(group_cond2_pats_post)/sqrt(numpats);
    pats_post(3,:)=nanstd(group_cond3_pats_post)/sqrt(numpats);
    pats_post(4,:)=nanstd(group_cond4_pats_post)/sqrt(numpats);
    pats_post(5,:)=nanstd(group_cond5_pats_post)/sqrt(numpats);
    pats_post(6,:)=nanstd(group_cond6_pats_post)/sqrt(numpats);
    pats_post(7,:)=nanstd(group_cond7_pats_post)/sqrt(numpats);
    pats_post(8,:)=nanstd(group_cond8_pats_post)/sqrt(numpats);
    pats_post(9,:)=nanstd(group_cond9_pats_post)/sqrt(numpats);
    pats_post(10,:)=nanstd(group_cond10_pats_post)/sqrt(numpats);
    
    HCs_WT_sem(1,:)=nanstd(group_cond1_HCs)/sqrt(numHCs);
    HCs_WT_sem(2,:)=nanstd(group_cond2_HCs)/sqrt(numHCs);
    HCs_WT_sem(3,:)=nanstd(group_cond3_HCs)/sqrt(numHCs);
    HCs_WT_sem(4,:)=nanstd(group_cond4_HCs)/sqrt(numHCs);
    HCs_WT_sem(5,:)=nanstd(group_cond5_HCs)/sqrt(numHCs);
    HCs_WT_sem(6,:)=nanstd(group_cond6_HCs)/sqrt(numHCs);
    HCs_WT_sem(7,:)=nanstd(group_cond7_HCs)/sqrt(numHCs);
    HCs_WT_sem(8,:)=nanstd(group_cond8_HCs)/sqrt(numHCs);
    HCs_WT_sem(9,:)=nanstd(group_cond9_HCs)/sqrt(numHCs);
    HCs_WT_sem(10,:)=nanstd(group_cond10_HCs)/sqrt(numHCs);
    
    HCs_pre_sem(1,:)=nanstd(group_cond1_HCs_pre)/sqrt(numHCs);
    HCs_pre_sem(2,:)=nanstd(group_cond2_HCs_pre)/sqrt(numHCs);
    HCs_pre_sem(3,:)=nanstd(group_cond3_HCs_pre)/sqrt(numHCs);
    HCs_pre_sem(4,:)=nanstd(group_cond4_HCs_pre)/sqrt(numHCs);
    HCs_pre_sem(5,:)=nanstd(group_cond5_HCs_pre)/sqrt(numHCs);
    HCs_pre_sem(6,:)=nanstd(group_cond6_HCs_pre)/sqrt(numHCs);
    HCs_pre_sem(7,:)=nanstd(group_cond7_HCs_pre)/sqrt(numHCs);
    HCs_pre_sem(8,:)=nanstd(group_cond8_HCs_pre)/sqrt(numHCs);
    HCs_pre_sem(9,:)=nanstd(group_cond9_HCs_pre)/sqrt(numHCs);
    HCs_pre_sem(10,:)=nanstd(group_cond10_HCs_pre)/sqrt(numHCs);

    HCs_post_sem(1,:)=nanstd(group_cond1_HCs_post)/sqrt(numHCs);
    HCs_post_sem(2,:)=nanstd(group_cond2_HCs_post)/sqrt(numHCs);
    HCs_post_sem(3,:)=nanstd(group_cond3_HCs_post)/sqrt(numHCs);
    HCs_post_sem(4,:)=nanstd(group_cond4_HCs_post)/sqrt(numHCs);
    HCs_post_sem(5,:)=nanstd(group_cond5_HCs_post)/sqrt(numHCs);
    HCs_post_sem(6,:)=nanstd(group_cond6_HCs_post)/sqrt(numHCs);
    HCs_post_sem(7,:)=nanstd(group_cond7_HCs_post)/sqrt(numHCs);
    HCs_post_sem(8,:)=nanstd(group_cond8_HCs_post)/sqrt(numHCs);
    HCs_post_sem(9,:)=nanstd(group_cond9_HCs_post)/sqrt(numHCs);
    HCs_post_sem(10,:)=nanstd(group_cond10_HCs_post)/sqrt(numHCs);
    
    %% sems
    for isub=1:10
    pats_WT_posSEM(isub,:)=pats_WT(isub,:)+pats_WT_std(isub,:)/sqrt(numpats);
    pats_WT_negSEM(isub,:)=pats_WT(isub,:)-pats_WT_std(isub,:)/sqrt(numpats);
    end
    
    for isub=1:10
    HCs_WT_posSEM(isub,:)=HCs_WT(isub,:)+HCs_WT_std(isub,:)/sqrt(numHCs);
    HCs_WT_negSEM(isub,:)=HCs_WT(isub,:)-HCs_WT_std(isub,:)/sqrt(numHCs);
    end
    
%% FINAL FIGURES 
HC.cond(1,:)=HCs_WT(1,250:end);
HC.cond(2,:)=HCs_WT(2,250:end);
HC.cond(3,:)=HCs_WT(3,250:end);
HC.cond(4,:)=HCs_WT(4,250:end);
HC.cond(5,:)=HCs_WT(5,250:end);
HC.cond(6,:)=HCs_WT(6,250:end);
HC.cond(7,:)=HCs_WT(7,250:end);
HC.cond(8,:)=HCs_WT(8,250:end);
HC.cond(9,:)=HCs_WT(9,250:end);
HC.cond(10,:)=HCs_WT(10,250:end);

PAT.cond(1,:)=pats_WT(1,250:end);
PAT.cond(2,:)=pats_WT(2,250:end);
PAT.cond(3,:)=pats_WT(3,250:end);
PAT.cond(4,:)=pats_WT(4,250:end);
PAT.cond(5,:)=pats_WT(5,250:end);
PAT.cond(6,:)=pats_WT(6,250:end);
PAT.cond(7,:)=pats_WT(7,250:end);
PAT.cond(8,:)=pats_WT(8,250:end);
PAT.cond(9,:)=pats_WT(9,250:end);
PAT.cond(10,:)=pats_WT(10,250:end);


for moo=1:10
    HC.lowpass_cond(moo,:)=lowpass(HC.cond(moo,:), 0.01, 3);
    PAT.lowpass_cond(moo,:)=lowpass(PAT.cond(moo,:), 0.01, 3);
    HC.variability_cond(moo,:)=calc_distance(HC.cond(moo,:), HC.lowpass_cond(moo,:));
    PAT.variability_cond(moo,:)=calc_distance(PAT.cond(moo,:), PAT.lowpass_cond(moo,:));
end

%% plot bar graph of pitch variability - distance between low pass and mean pitch track
HC_clear=nanmean([HC.variability_cond(1,:) HC.variability_cond(2,:) HC.variability_cond(3,:) ...
HC.variability_cond(4,:) HC.variability_cond(5,:)]);

HC_noise=nanmean([HC.variability_cond(6,:) HC.variability_cond(7,:) HC.variability_cond(8,:) ...
HC.variability_cond(9,:) HC.variability_cond(10,:)]);

PAT_clear=nanmean([PAT.variability_cond(1,:) PAT.variability_cond(2,:) PAT.variability_cond(3,:) ...
PAT.variability_cond(4,:) PAT.variability_cond(5,:)]);

PAT_noise=nanmean([PAT.variability_cond(6,:) PAT.variability_cond(7,:) PAT.variability_cond(8,:) ...
PAT.variability_cond(9,:) PAT.variability_cond(10,:)]);

HC_clear_SEM=nanstd([HC.variability_cond(1,:) HC.variability_cond(2,:) HC.variability_cond(3,:) ...
HC.variability_cond(4,:) HC.variability_cond(5,:)]);

HC_noise_SEM=nanstd([HC.variability_cond(6,:) HC.variability_cond(7,:) HC.variability_cond(8,:) ...
HC.variability_cond(9,:) HC.variability_cond(10,:)]);

PAT_clear_SEM=nanstd([PAT.variability_cond(1,:) PAT.variability_cond(2,:) PAT.variability_cond(3,:) ...
PAT.variability_cond(4,:) PAT.variability_cond(5,:)]);

PAT_noise_SEM=nanstd([PAT.variability_cond(6,:) PAT.variability_cond(7,:) PAT.variability_cond(8,:) ...
PAT.variability_cond(9,:) PAT.variability_cond(10,:)]);

%% ZED
% For #results table 1
for cond=1:10
    meanWT_HC_cond(cond)=nanmean(HC.variability_cond(cond,:))
    meanWT_PAT_cond(cond)=nanmean(PAT.variability_cond(cond,:))
    stdWT_HC_cond(cond)=nanstd(HC.variability_cond(cond,:))
    stdWT_PAT_cond(cond)=nanstd(PAT.variability_cond(cond,:))
end

results.meanWT_HC_clear=nanmean(meanWT_HC_cond(1:5))
results.meanWT_HC_noise=nanmean(meanWT_HC_cond(6:10))
results.meanWT_PAT_clear=nanmean(meanWT_PAT_cond(1:5))
results.meanWT_PAT_noise=nanmean(meanWT_PAT_cond(6:10))

results.stdWT_HC_clear=nanstd(meanWT_HC_cond(1:5))
results.stdWT_HC_noise=nanstd(meanWT_HC_cond(6:10))
results.stdWT_PAT_clear=nanstd(meanWT_PAT_cond(1:5))
results.stdWT_PAT_noise=nanstd(meanWT_PAT_cond(6:10))

save GroupData/stats/highfreqvar_results_table1 results

%% STATS
% ttest
pat_clear_raw=[PAT.variability_cond(1,:) PAT.variability_cond(2,:) PAT.variability_cond(3,:) ...
PAT.variability_cond(4,:) PAT.variability_cond(5,:)];

pat_noise_raw=[PAT.variability_cond(6,:) PAT.variability_cond(7,:) PAT.variability_cond(8,:) ...
PAT.variability_cond(9,:) PAT.variability_cond(10,:)];

ttest(pat_clear_raw, pat_noise_raw)
% ttest(HC_clear_raw, HC_noise_raw)

% anova for high freq variability by condition
anovadata_high_freq_var= [...
    HC.cond(1,:) HC.cond(2,:) HC.cond(3,:) HC.cond(4,:) HC.cond(5,:) ...
    HC.cond(6,:) HC.cond(7,:) HC.cond(8,:) HC.cond(9,:) HC.cond(10,:) ...
    PAT.cond(1,:) PAT.cond(2,:) PAT.cond(3,:) PAT.cond(4,:) PAT.cond(5,:) ...
    PAT.cond(6,:) PAT.cond(7,:) PAT.cond(8,:) PAT.cond(9,:) PAT.cond(10,:)];

trial=22220;

test=ones(1,11110);
test2=test*2;
subjectgroup=[test test2];
clear condition
for i=1:11110/2
    condition{i} = 'clear';
end
for i=5556:22220/2
    condition{i} = 'noise';
end
condition=[condition condition];
condition=condition';

highfreqvar_anova.group1=[subjectgroup];
highfreqvar_anova.group2=[condition];
[highfreqvar_anova.p_interaction,highfreqvar_anova.table,highfreqvar_anova.stats,highfreqvar_anova.terms]= ...
    anovan(anovadata_high_freq_var,{highfreqvar_anova.group1 highfreqvar_anova.group2},'model','interaction')

[highfreqvar_anova.p_interaction,highfreqvar_anova.table,highfreqvar_anova.stats,highfreqvar_anova.terms]= ...
    anovan(anovadata_high_freq_var,{highfreqvar_anova.group1 highfreqvar_anova.group2},'full')


display 'first anova is the interaction for high freq variab'
save /Users/zagnew/Cereb_data/data_final_run/GroupData/stats/highfreqvar_anova highfreqvar_anova



%% distance from target

DATA