function test_spectrum_pitchprod()

homedir='/Users/zagnew/Cereb_data/data'
cd(homedir)

frame_fs = 11025/32;
nfreqs = 1025;

curdir = cd;
hcsdirs = { ...
'SUB01/expr20140321T103415_SUBJ01_measurepitch/speak/',...
'SUB02/expr20140321T121956_Sub2_measurepitch/speak/',...
'SUB03/expr20140321T142416_Subj3-measurepitch/speak/',...
'SUB04/expr20140321T170947_Subj4_measurepitch/speak/',...
'SUB05/expr20140321T183529_Subj5_measurepitch/speak/',...
'SUB06/expr20140322T104901_SUB06_measurepitch/speak/',...
'SUB07/expr20140322T115150_Sub7_measurepitch/speak/',...
'SUB08/expr20140322T134549_Sub08_measurepitch/speak/',...
'SUB09/expr20140322T154047_SUB09_measure_pitch/speak/',...
'SUB10/expr20140322T162455_SUB10_measurepitch/speak/',...
'SUB11/expr20140322T183812_Subj11_measurepitch/speak/',...
'SUB12/expr20140323T104953_Sub12_measurepitch/speak/',...
'SUB13/expr20140323T132703_Sub13_measurepitch/speak/',...
'SUB14/expr20140323T150747_subj14/speak/',...
'SUB15/expr20140323T162223_SUB15_measurepitch/speak/',...
'SUB16/expr20140323T180417_sub16_measurepitch/speak/',...
};


nhcss = length(hcsdirs);
for ihcs = 1:nhcss
%  dir2proc = [hcsdirs{ihcs} '/speak'];
  dir2proc = [hcsdirs{ihcs}];
  
  fprintf('%s\n',dir2proc);
  cd(dir2proc)
  %load gooddata
  load goodpitchdata
  % get sig array - get's good pitch data into a diff form. 
  hcs(ihcs).mean_sigs = mean(hcs(ihcs).sigs,1); % take mean on that for each sub, stdev adn mag spec
  % look at this ^^ to see individual subjects
  
  %array: sigs n trials x nfrmes
  hcs(ihcs).stde_sigs =  std(hcs(ihcs).sigs,0,1)/sqrt(hcs(ihcs).ntrials); %SEM
  [hcs(ihcs).magspecs,hcs(ihcs).faxis] = my_spectrum(hcs(ihcs).sigs,frame_fs,nfreqs); %takes spec for each trial which creates magspecs
  % each row of sigs is a pitch track for each trial
  % magspecs (magnitude spectrum for each trial) the mag at each row of the
  % each row of mag specs is the mag spec of that row (pitch track) for all frequencies. 
   
  hcs(ihcs).mean_magspecs = mean(hcs(ihcs).magspecs,1);
  hcs(ihcs).stde_magspecs =  std(hcs(ihcs).magspecs,0,1)/sqrt(hcs(ihcs).ntrials);
  cd(curdir)
end

% patient data
%patdirs = {'Patient1','Patient2','Patient3','Patient4f,'Patient5'};

patdirs = {...
    'SUB11/expr2014.03.22.T18.46.44_mainrun/speak/', ...
    'SUB12/expr2014.03.23.T11.03.52_mainrun/speak',...
    'SUB13/expr2014.03.23.T13.47.01_mainrun/speak/',...
    'SUB14/expr2014.03.23.T15.21.00_mainrun/speak/',...
    'SUB15/expr2014.03.23.T16.32.53_mainrun/speak/',...
    'SUB16/expr2014.03.23.T18.16.58_mainrun/speak/',...

    
    
    };

npats = length(patdirs);
for ipat = 1:npats
  dir2proc = patdirs{ipat};
  fprintf('%s\n',dir2proc);
  cd(dir2proc)
  load gooddata
  [pat(ipat).ntrials,pat(ipat).nframes_min,pat(ipat).frame_taxis,pat(ipat).sigs] = get_sig_array(gooddata,frame_fs);
  pat(ipat).mean_sigs = mean(pat(ipat).sigs,1);
  pat(ipat).stde_sigs =  std(pat(ipat).sigs,0,1)/sqrt(pat(ipat).ntrials);
  [pat(ipat).magspecs,pat(ipat).faxis] = my_spectrum(pat(ipat).sigs,frame_fs,nfreqs);
  pat(ipat).mean_magspecs = mean(pat(ipat).magspecs,1);
  pat(ipat).stde_magspecs =  std(pat(ipat).magspecs,0,1)/sqrt(pat(ipat).ntrials);
  cd(curdir)
end

%razmatazz. find shorted trial and make all trials the same length in order
%to plot for both  chops all to nframes min (finds it)
for ihcs = 1:nhcss
  if ihcs == 1
    overall_nframes_min = hcs(ihcs).nframes_min;
  else
    if overall_nframes_min > hcs(ihcs).nframes_min;
      overall_nframes_min = hcs(ihcs).nframes_min;
    end
  end
end
% same for patients
for ipat = 1:npats
  if overall_nframes_min > pat(ipat).nframes_min;
    overall_nframes_min = pat(ipat).nframes_min;
  end
end

%group stat for HCs and patients
mean_hcs.sigs     = zeros(nhcss,overall_nframes_min);
mean_hcs.magspecs = zeros(nhcss,nfreqs);
for ihcs = 1:nhcss
  mean_hcs.sigs(ihcs,:)     = hcs(ihcs).mean_sigs(1:overall_nframes_min); % chops HCs to nfame min position
  mean_hcs.magspecs(ihcs,:) = hcs(ihcs).mean_magspecs;
  if ihcs == 1
    mean_hcs.frame_taxis = hcs(ihcs).frame_taxis(1:overall_nframes_min); % 
    mean_hcs.faxis = hcs(ihcs).faxis;
  end
end

%stats (across subjects
mean_hcs.mean_sigs = mean(mean_hcs.sigs,1);
mean_hcs.stde_sigs =  std(mean_hcs.sigs,0,1)/sqrt(nhcss); %SEM
mean_hcs.mean_magspecs = mean(mean_hcs.magspecs,1);
mean_hcs.stde_magspecs =  std(mean_hcs.magspecs,0,1)/sqrt(nhcss);

% same for patients
mean_pat.sigs     = zeros(npats,overall_nframes_min);
mean_pat.magspecs = zeros(npats,nfreqs);
for ipat = 1:npats
  mean_pat.sigs(ipat,:)     = pat(ipat).mean_sigs(1:overall_nframes_min);
  mean_pat.magspecs(ipat,:) = pat(ipat).mean_magspecs;
  if ipat == 1
    mean_pat.frame_taxis = pat(ipat).frame_taxis(1:overall_nframes_min);
    mean_pat.faxis = pat(ipat).faxis;
  end
end

%stats for across patients
mean_pat.mean_sigs = mean(mean_pat.sigs,1);
mean_pat.stde_sigs =  std(mean_pat.sigs,0,1)/sqrt(npats);
mean_pat.mean_magspecs = mean(mean_pat.magspecs,1);
mean_pat.stde_magspecs =  std(mean_pat.magspecs,0,1)/sqrt(npats);


hf = figure;
for ihcs = 1:nhcss %2
  hpl = plot(mean_hcs.frame_taxis,mean_hcs.sigs(ihcs,:));
  title(num2str(ihcs))
  pause;
end

hf = figure;
hpl = plot(mean_hcs.frame_taxis,mean_hcs.mean_sigs,'r');
hold on
hpl = plot(mean_hcs.frame_taxis,mean_hcs.mean_sigs + mean_hcs.stde_sigs,'r');
hpl = plot(mean_hcs.frame_taxis,mean_hcs.mean_sigs - mean_hcs.stde_sigs,'r');

hpl = plot(mean_pat.frame_taxis,mean_pat.mean_sigs,'b');% patients
hpl = plot(mean_pat.frame_taxis,mean_pat.mean_sigs + mean_pat.stde_sigs,'b');
hpl = plot(mean_pat.frame_taxis,mean_pat.mean_sigs - mean_pat.stde_sigs,'b');

hf = figure;
hpl = semilogx(mean_hcs.faxis,mean_hcs.mean_magspecs,'r'); %log scale in the freq axis HCs
hold on
hpl = semilogx(mean_hcs.faxis,mean_hcs.mean_magspecs + mean_hcs.stde_magspecs,'r');
hpl = semilogx(mean_hcs.faxis,mean_hcs.mean_magspecs - mean_hcs.stde_magspecs,'r');

hpl = semilogx(mean_pat.faxis,mean_pat.mean_magspecs,'b');
hpl = semilogx(mean_pat.faxis,mean_pat.mean_magspecs + mean_pat.stde_magspecs,'b');
hpl = semilogx(mean_pat.faxis,mean_pat.mean_magspecs - mean_pat.stde_magspecs,'b');

warning('poop')

function [ntrials,nframes_min,frame_taxis,sigs] = get_sig_array(gooddata,frame_fs)
% find the numner of trials in goodpitch 
%ntrials_maybe = length(gooddata.window);
ntrials_maybe = length(gooddata.wholetrial);
ntrials = 0;
for itrial = 1:ntrials_maybe
  nframes_trial = length(gooddata.wholetrial(itrial).data);
  if nframes_trial ~= 1 % if only one trisl
    ntrials = ntrials + 1;
    igoodtrial(ntrials) = itrial;
    if ntrials == 1
      nframes_min = nframes_trial;
    else
      if nframes_min > nframes_trial
        nframes_min = nframes_trial;
      end
    end
  end
end
frame_taxis = (0:(nframes_min-1))/frame_fs;
sigs = zeros(ntrials,nframes_min);

% for itrial = 1:ntrials
%   pitchdat4anal = gooddata.wholetrial(igoodtrial(itrial)).data - nanmean(gooddata.wholetrial(igoodtrial(itrial)).data); % mean normalised
%   sigs(itrial,:)= pitchdat4anal(1:nframes_min); % take the min numnber of frames 
% end



