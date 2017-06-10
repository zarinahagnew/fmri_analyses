%% calculate how many are all nan trials
HC_alltrials_clear=vertcat(...
    HC_data_distlowpass(1).data, HC_data_distlowpass(2).data, HC_data_distlowpass(3).data, HC_data_distlowpass(4).data, ...
    HC_data_distlowpass(5).data);

HC_alltrials_noise=vertcat(...
    HC_data_distlowpass(6).data, HC_data_distlowpass(7).data, HC_data_distlowpass(8).data, ...
    HC_data_distlowpass(9).data, HC_data_distlowpass(9).data, HC_data_distlowpass(10).data);

PAT_alltrials_clear=vertcat(...
    Pat_data_distlowpass(1).data, Pat_data_distlowpass(2).data, Pat_data_distlowpass(3).data, Pat_data_distlowpass(4).data, ...
    Pat_data_distlowpass(5).data);

PAT_alltrials_noise=vertcat(...
    Pat_data_distlowpass(6).data, Pat_data_distlowpass(7).data, Pat_data_distlowpass(8).data, ...
    Pat_data_distlowpass(9).data, Pat_data_distlowpass(9).data, Pat_data_distlowpass(10).data);

%%
pat_clear_goodtrial_counter=0;
for itrial=1:size(PAT_alltrials_clear,1)
    if sum(isnan(PAT_alltrials_clear(itrial,:)))<size(PAT_alltrials_clear,2)-1
        pat_clear_goodtrial_counter=pat_clear_goodtrial_counter+1;
    end
end
fraction_gd_pats_clear=(pat_clear_goodtrial_counter/640)*100;
goodtrials_pat_clear=pat_clear_goodtrial_counter; % use this as N for SEM


pat_noise_goodtrial_counter=0;
for itrial=1:size(PAT_alltrials_noise,1)
    if sum(isnan(PAT_alltrials_noise(itrial,:)))<size(PAT_alltrials_noise,2)-1
        pat_noise_goodtrial_counter=pat_noise_goodtrial_counter+1;
    end
end
fraction_gd_pats_noise=(pat_noise_goodtrial_counter/768)*100;
goodtrials_pat_noise=pat_noise_goodtrial_counter; % use this as N for SEM

HC_clear_goodtrial_counter=0;
for itrial=1:size(HC_alltrials_clear,1)
    if sum(isnan(HC_alltrials_clear(itrial,:)))<size(HC_alltrials_clear,2)-1
        HC_clear_goodtrial_counter=HC_clear_goodtrial_counter+1;
    end
end
fraction_gd_HCs_clear=(HC_clear_goodtrial_counter/440)*100;
goodtrials_HC_clear=HC_clear_goodtrial_counter; % use this as N for SEM


HC_noise_goodtrial_counter=0;
for itrial=1:size(HC_alltrials_noise,1)
    if sum(isnan(HC_alltrials_noise(itrial,:)))<size(HC_alltrials_noise,2)-1
        HC_noise_goodtrial_counter=HC_noise_goodtrial_counter+1;
    end
end
fraction_gd_HCs_noise=(HC_noise_goodtrial_counter/528)*100;
goodtrials_HC_noise=HC_noise_goodtrial_counter; % use this as N for SEM
