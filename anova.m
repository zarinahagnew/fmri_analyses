%anova
load milage

factory  = repmat(1:3,6,1)
carmod = [ones(3,3); 2*ones(3,3)]

mileage = mileage(:);
factory = factory(:);
carmod = carmod(:);
[mileage factory carmod]

[pvals,tbl,stats] = anovan(mileage, {factory carmod}, ...
'model',2, 'random',1,'varnames',{'Factory' 'Car Model'});