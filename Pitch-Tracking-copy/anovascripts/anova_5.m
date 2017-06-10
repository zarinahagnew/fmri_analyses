%% anova patients/controls clear/noise
anovadata= [HCs.allcleartrials HCs.allnoisetrials PATs.allcleartrials PATs.allnoisetrials];

hcs=length(HCs.allcleartrials);
pats=length(PATs.allcleartrials);
trial=length(anovadata);

% group
test=ones(1,hcs*2);
test2=ones(1,pats*2);
test2=test2*2;
group=[test test2];

% clear_noise
clear clear_noise;
for i=1:hcs
    clear_noise{i} = 'clear';
end

for i=hcs+1:hcs*2
    clear_noise{i} = 'noise';
end

for i=hcs*2+1:hcs*2+pats
    clear_noise{i} = 'clear';
end

for i=hcs*2+pats+1:hcs*2+pats*2
    clear_noise{i} = 'noise';
end

clear_noise=clear_noise';

group1=[group];
group2=[clear_noise];
p = anovan(anovadata,{group1 group2},'model','interaction');

