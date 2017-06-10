Cerebellar pitch tracking analysis: ZKA 2014
------------------------------------------------------------

the A files only need to be run once. 

set_params.m is a file where the parameters are set for the entire analysis. each script calls this at the beginning. 


Need to set stdev thresholds to a high number in set_params.m first, and then run A file, B files (patients and HCs separately as they have different thresholds and time windows), C file, D file first. Then run E file which calculates the groups within trial stdevs and spits out values for trials to be excluded on the basis that they lie outside of 2SDs. Enter these values into set_params.m, and then repeat the B, C, D files with these new values. 





we used different time windows for the HCs and the patients as the patients showed a slower response time. these time windows are defined in set_params.m

the B scripts are for artifact removal

the C script sorts the data by condition

the D script calculates stdevs

- Recipe -
A_PerceptualTest_goodtrials 	<- creates /Users/zagnew/Cereb_data/data/SUB.mat
B_fast_diffwindows_Pats		<- creates /Users/zagnew/Cereb_data/data/SUB01/mainexp/speak/gooddata.mat


- Notes - 

http://members.efn.org/~qehn/global/building/cents.htm

Exp notes

seconds_per_trial_req = 4.0;

% cents to shift
sup=100 % small up
bup=300 % big up
nos=0   % no shift
sdw=-100 % small down
bdw=-300 % big down
cents2shift_types = [sup bup nos sdw bdw];


fs = 11025;     % I'd rather just get this from p.fusp_init.sample_rate, but I need it before running init_fusp_lite()
data_size = 32; % I'd rather just get this from p.fusp_init.sample_rate, but I need it before running init_fusp_lite()
frame_rate = fs/data_size;


% frame to seconds
frame_fs = fs/data_size;
frame_num=413;
frame_num=50
framestosecs=(frame_num)/frame_fs


seconds_per_trial_req = 4.0;
nframes_per_trial = round(seconds_per_trial_req*frame_rate);
seconds_per_trial = nframes_per_trial/frame_rate;

% times to step
tbase = 1.2; tinc = 0.2;
tstep(1) = tbase;
tstep(2) = tstep(1) + tinc;
tstep(3) = tstep(2) + tinc;
tstep(4) = tstep(3) + tinc;
tstep(5) = tstep(4) + tinc;
istep = round(tstep*frame_rate);
