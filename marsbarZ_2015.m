% lovely script for Nov Jan 2011

% Step 1
 addpath(genpath('/Volumes/Big Momma/ZEEGOLD/fMRI_DAF/'));


clear all
close all

% Step 2
% put in here the names of all your subjects' folders
subs = {
    'AL'
    'CV'
    'HD'
    
    'AM'
    'LB'    
    
    'JO'
    'LN'
    'MB'
    'RA'
    'RN'
    'SW'
    'GH'
    'MT'
    'OG'
    'VC'
    'AR'
    'FC'
    'JM'
    'NL'
    'AT'
    };

% Step 3. Put in here the names of all your ROIs.

ROIs = {
    'Listen_Read_clusterROIs_-6_-52_19_roi.mat'
    'Listen_Read_clusterROIs_-45_-16_1_roi.mat'
    'Listen_Read_clusterROIs_-45_-76_40_roi.mat'
    'Listen_Read_clusterROIs_54_-64_25_roi.mat'
    'sphere_3--45_-16_1_roi.mat'
    'sphere_3--66_-16_-2_roi.mat'
    'sphere_3-63_-7_-2_roi.mat'
    
    };


 	for j = 1:length(ROIs)
 		for k = 1:length(subs)
            % Step 4. Change this file path to fit your file path. the
            % subs{k} bit is the name of the subject folder as specified in
            % stage 1. 
			spm_name = ['/Volumes/Big Momma/ZEEGOLD/fMRI_DAF/' subs{k} '/imported/first_level_2015/SPM.mat'];
            spm_location = ['/Volumes/Big Momma/ZEEGOLD/fMRI_DAF/' subs{k} '/imported/first_level_2015/'];
            image_location = ['/Volumes/Big Momma/ZEEGOLD/fMRI_DAF/' subs{k} '/imported/'];

            % edit SPM file with new location
            
            % Step 5. Make a folder called pROIs in your folder where all
            % you subjects are and put a copy of all the ROIs in there. 
            roi_file = ['./ROI_suppression/' ROIs{j}];
            
            %--------------------------------------------------------------
            
            %%This is  marsbar doing it's shizzle from here on:
			% Make marsbar design object
            
            %D = mardo('/path/to/spm/mat/SPM.mat');
            D = mardo(spm_name);
            D = cd_images(D, image_location);
            save_spm(D);
            
            %SPM.swd=spm_location;

          
			% Make marsbar ROI object
			R  = maroi(roi_file);

			% Fetch data into marsbar data object
			Y  = get_marsy(R, D, 'mean');

			% Get contrasts from original design
			xCon = get_contrasts(D);

			% Estimate design on ROI data
			E = estimate(D, Y);

			% Put contrasts from original design back into design object
			E = set_contrasts(E, xCon);

			% get design betas
			b{j}(k,:) = betas(E);

			% get stats and stuff for all contrasts into statistics structure
			marsS = compute_contrasts(E, 1:length(xCon));
            % error
            % http://akiraoconnor.org/2012/02/01/marsbar-error-in-pr_stat_compute/
%             Although the names were different, the number of contrasts had been 
%             amended to reflect the number of unique contrast vectors in SPM.xCon 
%             but not in Marsbar?s D, meaning that pr_stat_compute?s ?xCon = SPM.xCon? (line 23), 
%             did not return the same value as my own script?s ?xCon = get_contrasts(D)?.  
%             This was causing the two xCons to differ in their length and the resultant error in pr_stat_compute.
            
            
            %% This is the parameter estimates:
            ParamEst{j}(:,k) = marsS.con;
            
            
			% summary data; i.e. mean time course over all voxels in ROI
			sumdat{j}(k,:) = summary_data(Y)';
                       
			%% This is the mean percent signal change:

			% Get definitions of all events in model
			[e_specs, e_names] = event_specs(E);
			n_events = size(e_specs, 2);
			dur = 0;

			% Return mean percent signal estimate for all events in design
			for e_s = 1:n_events
			  pct_ev{j}(k,e_s) = event_signal(E, e_specs(:,e_s), dur);
            end
		end
	end

	cd ROI_suppression
	 save([num2str(length(subs)) 'ROIsuppression' 'daf.mat'], 'pct_ev', 'sumdat', 'b', 'ROIs','ParamEst') % x added by me
     %save([num2str(length(subs)) 'ss' '_POPoutput.mat'], 'pct_ev', 'sumdat', 'b', 'ROIs',)
cd ..