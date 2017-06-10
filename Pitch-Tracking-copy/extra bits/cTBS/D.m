%% calculate how many nan trials
        
for cond=1:10
goodtrial_counter(cond)=0;    
    for itrial=1:8
        if sum(isnan(sorted_data(cond).wholetrial(itrial,:)))<1360
            goodtrial_counter(cond)=goodtrial_counter(cond)+1;
        end
    end
end

sub_total_goodtrial(each_subject)=sum(goodtrial_counter);
    
    save sorted_data sorted_data
    cd(cerebellar_data_rootdir)
    total_trials_included=sum(sub_total_goodtrial);
    save sub_total_goodtrial sub_total_goodtrial
    save total_trials_included total_trials_included