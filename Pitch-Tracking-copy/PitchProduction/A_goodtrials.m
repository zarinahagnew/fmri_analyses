%% Analysis of spontaenous pitch production
% ------------------------------------------------------------
% ZKA March 2014

% Looks at the data trial by trial

clear all
close all

%% load in patients
cerebellar_data_rootdir = '/Users/zagnew/Cereb_data/data/';

npatients = 0;
% npatients = npatients + 1; %400 and 1000 are ok
% patient_info{npatients}.exprdir = 'SUB01/expr20140321T103415_SUBJ01_measurepitch/speak/';
%meanpitchtag(npatients)=1; % keep this way so that this script works even if you're not running all 16 subjects

% npatients = npatients + 1; % needs manual
% patient_info{npatients}.exprdir = 'SUB02/expr20140321T121956_Sub2_measurepitch/speak/';
% 
% npatients = npatients + 1; % needs manual
% patient_info{npatients}.exprdir = 'SUB03/expr20140321T142416_Subj3-measurepitch/speak/';
% npatients = npatients + 1; % needs manual
% patient_info{npatients}.exprdir ='SUB04/expr20140321T170947_Subj4_measurepitch/speak/';

%   npatients = npatients + 1;  %400 and 1000 are ok
% patient_info{npatients}.exprdir = 'SUB05/expr20140321T183529_Subj5_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB06/expr20140322T104901_SUB06_measurepitch/speak/';
% 
% BAD SUBJECT
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB07/expr20140322T115150_Sub7_measurepitch/speak/';
% 
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB08/expr20140322T134549_Sub08_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB09/expr20140322T154047_SUB09_measure_pitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB10/expr20140322T162455_SUB10_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB11/expr20140322T183812_Subj11_measurepitch/speak/';
% v wobbly

% 
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB12/expr20140323T104953_Sub12_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB13/expr20140323T132703_Sub13_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB14/expr20140323T150747_subj14/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB15/expr20140323T162223_SUB15_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB16/expr20140323T180417_sub16_measurepitch/speak/';

%missing data
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC01/expr20140506T121323_ZKA/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC02/expr20140617T123801_HC02_pitchprodn/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC03/expr20140617T133413_HC03_pitchprodn/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC04/expr20140617T161417_measurepitch/speak/'; %400 to 1000 ok
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC05/expr20140618T150410_HC05_measurepitch/speak'; %400 to 1000 ok
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC06/expr20140618T160728_HC06_measurepitch/speak';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC07/expr20140725T101015_W4Z_subj25/speak';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC08/expr20140814T154458_W4Z_subj3/speak';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC09/expr20140921T133544_annette/speak';

%BAD TRACKING
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC10/expr20140921T152451_JL/speak';
 npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC11/expr20140923t151309_sn/speak';



% curdir=cd;
% z=0
for iexpr = 1:npatients
    %z=z+1
    the_expr_dir = [cerebellar_data_rootdir (patient_info{iexpr}.exprdir)];
    cd (the_expr_dir)
    cd block0
    
    %import data via get_vec_hist6
    pitchdata=get_vec_hist6('pitch2',3); %two arguments are file name and then file type (float vec)
    block=get_vec_hist6('blockalt',3); %pert response (needs to be shifted in time as only begins in response to voice onsett detect
    voiceonset=get_vec_hist6('voice_onset_detect',2); %voice detect
    outbuff_wav=get_vec_hist6('outbuffer', 3); % playable waveform
    outbuff_pitch=get_vec_hist6('output_pitch', 3); % pitch of outbuffer is the target
    audio=get_vec_hist6('inbuffer2',3)
    fs = 11025;
    pitch_lims = [80 250]; % sets pitch finding limits
    pitch_lims2plot = [50 300];
    shift_lims2plot = [-300 300];
    
    for a = 1:15 % should be 15
        % john's graph function
        hf = figure;
        set(hf,'Position',[1000         416         560        1082]);
        nspl = 2; ispl = 0;
        ispl = ispl + 1; hax(ispl) = subplot(nspl,1,ispl);
        ispl = ispl + 1; hax(ispl) = subplot(nspl,1,ispl);
        
        vhs = [];
        vhs = add2vechists(vhs,'inbuffer2');
        vhs = add2vechists(vhs,'pitch2');
        
        ntrials = vhs.inbuffer2.ntrials;
        y = play_vec_hist6(vhs.inbuffer2,1,fs,0);
        
        nsamps = length(y);
        taxis = (0:(nsamps-1))/fs;
        nframes = vhs.pitch2.nvecs;
        data_size = vhs.inbuffer2.vec_size;
        frame_fs = fs/data_size;
        frame_taxis = (0:(nframes-1))/frame_fs;
        
        y = play_vec_hist6(vhs.inbuffer2,a,fs,0);  % does something that needs to be done in the play function, without actually playing the track (see last argument)
        ypitch = get_sig_pitch(y,fs,pitch_lims);        % new and improved pitch tracking
        ypitch_fr = interp1(taxis,ypitch,frame_taxis);  % pitch tracking in seconds
        yampl  = get_sig_ampl( y,fs);
        yampl_fr = interp1(taxis,yampl,frame_taxis);
        ypitch2 = vhs.pitch2.data(a,:);
        
        axes(hax(1))
        hpl = plot(ypitch2); axis([0 1344 pitch_lims2plot]);
        
        
        axes(hax(2))
        hpl = plot(ypitch_fr); axis([0 1344 pitch_lims2plot]);
        
        
        %         [T,TT]=ginput(2); %hack
        %         pause(0.5);        
        T=[400 1270]
        % 290 frames = 1s
        % 870 frames = 3s
        
        hold on;
        rectangle('Position',[T(1),80,T(2)-T(1),200],...
            'LineWidth',2,'LineStyle','--')
        % write the time point to goodwindow
        goodwindow{a}=ypitch_fr(round(T(1)):round(T(2)));
        
        % if it is a good trial writes a 1 to good_trial.
        reply = input('good? [y]/n: ','s');
        if ~isempty(reply) && strcmp(reply,'n')
            good_trial(iexpr,a) = 0;
        else
            good_trial(iexpr,a) = 1;
        end
        close all

        %% Writes good trials data into new variable 'goodpitchdata'
        if good_trial(iexpr,a) > 0.5;
            goodpitchdata.wholetrial{a,:}=ypitch_fr(1,:); %this is the whole trial
            goodpitchdata.window{a}=goodwindow{a}; %this is the selected part
            goodpitchdata.stdevwindow{a}=nanstd(goodwindow{a});
            goodpitchdata.meanwindow{a}=nanmean(goodwindow{a});
        else
            goodpitchdata.wholetrial{a,:}=[NaN(1,1344)];
            goodpitchdata.window{a}=NaN(1, T(2)-T(1)+1)
            goodpitchdata.stdevwindow{a}=NaN;
            goodpitchdata.meanwindow{a}=NaN;
            
        end
    end

    
    
    for itrial=1:15
        sub(iexpr).data(itrial,:)=goodpitchdata(1).window{itrial};
    end
    
   
    
save (['SS_meandata',num2str(iexpr)]);
cd .. %into speak folder
save goodpitchdata goodpitchdata
cd (cerebellar_data_rootdir);
    
end


%
%
% cd (the_expr_dir)
%
% for itrial=1:15
%     sub(1).data(itrial,:)=goodpitchdata(1).window{itrial};
% end
% fig1=figure
% plot(nanmean(sub(1).data))
% axis([1 800 80 280])
% saveas(fig1, 'Single sub pitch production.jpg')
%


% 
% fig2=figure
% ymin=0.8;
% ymax=1.2;
% 
% for ipat=1:16
% subplot(4,4,ipat)
% gppitch(ipat,:)=nanmean(sub(ipat).data);
% %plot(nanmean(sub(ipat).data),'b','LineWidth',1.3)
% overallmean=nanmean(gppitch(ipat,:));
% plot(nanmean(sub(ipat).data)/overallmean,'b','LineWidth',1.1)
% axis([1 800 ymin ymax])
% end
% 
% saveas(fig2, 'Single sub pitch production.jpg')
% 
% 
% 
% for ipat=1:8
% subplot(4,4,ipat)
% gppitch(ipat,:)=nanmean(sub(ipat).data);
% %plot(nanmean(sub(ipat).data),'b','LineWidth',1.3)
% overallmean=nanmean(gppitch(ipat,:));
% plot(nanmean(sub(ipat).data)/overallmean,'r','LineWidth',1.1)
% axis([1 800 ymin ymax])
% end

