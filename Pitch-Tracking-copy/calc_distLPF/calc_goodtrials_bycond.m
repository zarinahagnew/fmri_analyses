% calcuate good trials by condition
pat_goodtrial_counter_cond1=0;
pat_goodtrial_counter_cond2=0;
pat_goodtrial_counter_cond3=0;
pat_goodtrial_counter_cond4=0;
pat_goodtrial_counter_cond5=0;
pat_goodtrial_counter_cond6=0;
pat_goodtrial_counter_cond7=0;
pat_goodtrial_counter_cond8=0;
pat_goodtrial_counter_cond9=0;
pat_goodtrial_counter_cond10=0;

for itrial=1:size(patient_data_cond1,1)
    if sum(isnan(patient_data_cond1(itrial,:)))<size(patient_data_cond1,2)-1
        pat_goodtrial_counter_cond1=pat_goodtrial_counter_cond1+1;
    end    
end
fraction_gd_pats_cond1=(pat_goodtrial_counter_cond1/size(patient_data_cond1,1))*100;
goodtrials_pat_cond1=pat_goodtrial_counter_cond1; % use this as N for SEM

for itrial=1:size(patient_data_cond2,1)
    if sum(isnan(patient_data_cond2(itrial,:)))<size(patient_data_cond2,2)-1
        pat_goodtrial_counter_cond2=pat_goodtrial_counter_cond2+1;
    end    
end
fraction_gd_pats_cond2=(pat_goodtrial_counter_cond2/size(patient_data_cond2,1))*100;
goodtrials_pat_cond2=pat_goodtrial_counter_cond2; % use this as N for SEM

for itrial=1:size(patient_data_cond3,1)
    if sum(isnan(patient_data_cond3(itrial,:)))<size(patient_data_cond3,2)-1
        pat_goodtrial_counter_cond3=pat_goodtrial_counter_cond3+1;
    end    
end
fraction_gd_pats_cond3=(pat_goodtrial_counter_cond3/size(patient_data_cond3,1))*100;
goodtrials_pat_cond3=pat_goodtrial_counter_cond3; % use this as N for SEM

for itrial=1:size(patient_data_cond4,1)
    if sum(isnan(patient_data_cond4(itrial,:)))<size(patient_data_cond4,2)-1
        pat_goodtrial_counter_cond4=pat_goodtrial_counter_cond4+1;
    end    
end
fraction_gd_pats_cond4=(pat_goodtrial_counter_cond4/size(patient_data_cond4,1))*100;
goodtrials_pat_cond4=pat_goodtrial_counter_cond4; % use this as N for SEM

for itrial=1:size(patient_data_cond5,1)
    if sum(isnan(patient_data_cond5(itrial,:)))<size(patient_data_cond5,2)-1
        pat_goodtrial_counter_cond5=pat_goodtrial_counter_cond5+1;
    end    
end
fraction_gd_pats_cond5=(pat_goodtrial_counter_cond5/size(patient_data_cond5,1))*100;
goodtrials_pat_cond5=pat_goodtrial_counter_cond5; % use this as N for SEM


for itrial=1:size(patient_data_cond6,1)
    if sum(isnan(patient_data_cond6(itrial,:)))<size(patient_data_cond6,2)-1
        pat_goodtrial_counter_cond6=pat_goodtrial_counter_cond6+1;
    end    
end
fraction_gd_pats_cond6=(pat_goodtrial_counter_cond6/size(patient_data_cond6,1))*100;
goodtrials_pat_cond6=pat_goodtrial_counter_cond6; % use this as N for SEM

for itrial=1:size(patient_data_cond7,1)
    if sum(isnan(patient_data_cond7(itrial,:)))<size(patient_data_cond6,2)-1
        pat_goodtrial_counter_cond7=pat_goodtrial_counter_cond7+1;
    end    
end
fraction_gd_pats_cond7=(pat_goodtrial_counter_cond7/size(patient_data_cond7,1))*100;
goodtrials_pat_cond7=pat_goodtrial_counter_cond7; % use this as N for SEM

for itrial=1:size(patient_data_cond8,1)
    if sum(isnan(patient_data_cond8(itrial,:)))<size(patient_data_cond8,2)-1
        pat_goodtrial_counter_cond8=pat_goodtrial_counter_cond8+1;
    end    
end
fraction_gd_pats_cond8=(pat_goodtrial_counter_cond8/size(patient_data_cond8,1))*100;
goodtrials_pat_cond8=pat_goodtrial_counter_cond8; % use this as N for SEM

for itrial=1:size(patient_data_cond9,1)
    if sum(isnan(patient_data_cond9(itrial,:)))<size(patient_data_cond9,2)-1
        pat_goodtrial_counter_cond9=pat_goodtrial_counter_cond9+1;
    end    
end
fraction_gd_pats_cond9=(pat_goodtrial_counter_cond9/size(patient_data_cond9,1))*100;
goodtrials_pat_cond9=pat_goodtrial_counter_cond9; % use this as N for SEM

for itrial=1:size(patient_data_cond10,1)
    if sum(isnan(patient_data_cond10(itrial,:)))<size(patient_data_cond10,2)-1
        pat_goodtrial_counter_cond10=pat_goodtrial_counter_cond10+1;
    end    
end
fraction_gd_pats_cond10=(pat_goodtrial_counter_cond10/size(patient_data_cond10,1))*100;
goodtrials_pat_cond10=pat_goodtrial_counter_cond10; % use this as N for SEM

%HC
% calcuate good trials by condition
HC_goodtrial_counter_cond1=0;
HC_goodtrial_counter_cond2=0;
HC_goodtrial_counter_cond3=0;
HC_goodtrial_counter_cond4=0;
HC_goodtrial_counter_cond5=0;
HC_goodtrial_counter_cond6=0;
HC_goodtrial_counter_cond7=0;
HC_goodtrial_counter_cond8=0;
HC_goodtrial_counter_cond9=0;
HC_goodtrial_counter_cond10=0;

for itrial=1:size(HC_data_cond1,1)
    if sum(isnan(HC_data_cond1(itrial,:)))<size(HC_data_cond1,2)-1
        HC_goodtrial_counter_cond1=HC_goodtrial_counter_cond1+1;
    end    
end
fraction_gd_HCs_cond1=(HC_goodtrial_counter_cond1/size(HC_data_cond1,1))*100;
goodtrials_HC_cond1=HC_goodtrial_counter_cond1; % use this as N for SEM

for itrial=1:size(HC_data_cond2,1)
    if sum(isnan(HC_data_cond2(itrial,:)))<size(HC_data_cond2,2)-1
        HC_goodtrial_counter_cond2=HC_goodtrial_counter_cond2+1;
    end    
end
fraction_gd_HCs_cond2=(HC_goodtrial_counter_cond2/size(HC_data_cond2,1))*100;
goodtrials_HC_cond2=HC_goodtrial_counter_cond2; % use this as N for SEM

for itrial=1:size(HC_data_cond3,1)
    if sum(isnan(HC_data_cond3(itrial,:)))<size(HC_data_cond3,2)-1
        HC_goodtrial_counter_cond3=HC_goodtrial_counter_cond3+1;
    end    
end
fraction_gd_HCs_cond3=(HC_goodtrial_counter_cond3/size(HC_data_cond3,1))*100;
goodtrials_HC_cond3=HC_goodtrial_counter_cond3; % use this as N for SEM

for itrial=1:size(HC_data_cond4,1)
    if sum(isnan(HC_data_cond4(itrial,:)))<size(HC_data_cond4,2)-1
        HC_goodtrial_counter_cond4=HC_goodtrial_counter_cond4+1;
    end    
end
fraction_gd_HCs_cond4=(HC_goodtrial_counter_cond4/size(HC_data_cond4,1))*100;
goodtrials_HC_cond4=HC_goodtrial_counter_cond4; % use this as N for SEM

for itrial=1:size(HC_data_cond5,1)
    if sum(isnan(HC_data_cond5(itrial,:)))<size(HC_data_cond5,2)-1
        HC_goodtrial_counter_cond5=HC_goodtrial_counter_cond5+1;
    end    
end
fraction_gd_HCs_cond5=(HC_goodtrial_counter_cond5/size(HC_data_cond5,1))*100;
goodtrials_HC_cond5=HC_goodtrial_counter_cond5; % use this as N for SEM


for itrial=1:size(HC_data_cond6,1)
    if sum(isnan(HC_data_cond6(itrial,:)))<size(HC_data_cond6,2)-1
        HC_goodtrial_counter_cond6=HC_goodtrial_counter_cond6+1;
    end    
end
fraction_gd_HCs_cond6=(HC_goodtrial_counter_cond6/size(HC_data_cond6,1))*100;
goodtrials_HC_cond6=HC_goodtrial_counter_cond6; % use this as N for SEM

for itrial=1:size(HC_data_cond7,1)
    if sum(isnan(HC_data_cond7(itrial,:)))<size(HC_data_cond7,2)-1
        HC_goodtrial_counter_cond7=HC_goodtrial_counter_cond7+1;
    end    
end
fraction_gd_HCs_cond7=(HC_goodtrial_counter_cond7/size(HC_data_cond7,1))*100;
goodtrials_HC_cond7=HC_goodtrial_counter_cond7; % use this as N for SEM

for itrial=1:size(HC_data_cond8,1)
    if sum(isnan(HC_data_cond8(itrial,:)))<size(HC_data_cond8,2)-1
        HC_goodtrial_counter_cond8=HC_goodtrial_counter_cond8+1;
    end    
end
fraction_gd_HCs_cond8=(HC_goodtrial_counter_cond8/size(HC_data_cond8,1))*100;
goodtrials_HC_cond8=HC_goodtrial_counter_cond8; % use this as N for SEM

for itrial=1:size(HC_data_cond9,1)
    if sum(isnan(HC_data_cond9(itrial,:)))<size(HC_data_cond9,2)-1
        HC_goodtrial_counter_cond9=HC_goodtrial_counter_cond9+1;
    end    
end
fraction_gd_HCs_cond9=(HC_goodtrial_counter_cond9/size(HC_data_cond9,1))*100;
goodtrials_HC_cond9=HC_goodtrial_counter_cond9; % use this as N for SEM

for itrial=1:size(HC_data_cond10,1)
    if sum(isnan(HC_data_cond10(itrial,:)))<size(HC_data_cond10,2)-1
        HC_goodtrial_counter_cond10=HC_goodtrial_counter_cond10+1;
    end    
end
fraction_gd_HCs_cond10=(HC_goodtrial_counter_cond10/size(HC_data_cond10,1))*100;
goodtrials_HC_cond10=HC_goodtrial_counter_cond10; % use this as N for SEM



