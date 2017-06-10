function[gaps]=countgaps(testz, gap_thresh)
%% ZKA Dec 2014
% format: countgaps([variable name], [gap threshold])
% loads in a variable and calulates the number of gaps longer than a
% certain number of frames. 
% gap_thresh - threshold for a 'gap' in frames
    
    gaps=0;
    temp=isnan(testz(250:end));     % finds nan values in trial
    for i=1:length(temp)-gap_thresh % go through each frame of the trial from frame 250 onwards
        if temp(i)==0 && temp(i+1)==1 && sum(temp(i+1:i+gap_thresh))>2;    % is the frame is 0 and the next few are 1s?    
            gaps=gaps+1;
        end        
    end
    
    % if the end of a trial is voiced subtract a gap
    if sum(temp(end-10:end))>5
        gaps=gaps-1;
    end
    
    % if 
    if sum(isnan(testz))==1360
        gaps=NaN;
    end
    
%     if gaps<=-1
%         gaps=0
%     end
    
%gaps; 

%     subplot(3,1,1)
%     plot(testz)

%     subplot(3,1,2)
%     plot(rubbish)
%     axis([0 1400 0 2])

%     subplot(3,1,3)
%     plot(temp)
%     axis([0 1400 0 2])
%
%     gaps
%     pause
