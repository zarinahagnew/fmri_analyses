
% %% anova pre/post clear/noise big/small/step
anovadata= [...
prestep_WTstdev_clear_smallstep prestep_WTstdev_clear_bigstep ...
prestep_WTstdev_noise_smallstep prestep_WTstdev_noise_bigstep ...
poststep_WTstdev_clear_smallstep poststep_WTstdev_clear_bigstep ...
poststep_WTstdev_noise_smallstep poststep_WTstdev_noise_bigstep];

onecond=length(prestep_WTstdev_clear_smallstep);
twocond=onecond*2
trial=length(anovadata);

% pre_post
test=ones(1,length(prestep_WTstdev_clear_smallstep)*4);
test2=test*2;
pre_post=[test test2];

% clear_noise
clear clear_noise;
for i=1:onecond*2
    clear_noise{i} = 'clear';
end
for i=onecond*2+1:onecond*4
    clear_noise{i} = 'noise';
end
clear_noise=[clear_noise clear_noise]
clear_noise=clear_noise';

%step_size
clear step_size
for i=1:onecond
    step_size{i} = 'small';
end
for i=onecond+1:onecond*2
    step_size{i} = 'big';
end

step_size=[step_size step_size step_size step_size];
step_size=step_size';

group1=[pre_post];
group2=[clear_noise];
group3=[step_size];
p = anovan(anovadata,{group1 group2 group3},'model','interaction');

