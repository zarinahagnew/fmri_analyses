% http://stackoverflow.com/questions/15527390/formatting-matrix-data-for-anovan-in-matlab


X = [1 2 3 4 5 6 7 8];
group = {[1 2 1 2 1 2 1 2];...
    ['hi';'hi';'lo';'lo';'hi';'hi';'lo';'lo'];...
    {'may' 'may' 'may' 'may' 'june' 'june' 'june' 'june'}};

p = anovan(X,group)

% ---------------------
anovandata
groupp = {[subjectgroup];...
    [pre_post];... %needs to be char
    {condition}};

group1=[subjectgroup]
group2=[pre_post]
group3=[condition]
p = anovan(anovandata,{group1 group2})


pre_post = cell(1,10);
for i=1:10
    %names{i} = ['Sample Text ' num2str(i)];
    pre_post{1,i} = 'pre';
end



% -p-------------------


y = [52.7 57.5 45.9 44.5 53.0 57.0 45.9 44.0]';
g1 = [1 2 1 2 1 2 1 2]; 
g2 = {'hi';'hi';'lo';'lo';'hi';'hi';'lo';'lo'}; 
g3 = {'may';'may';'may';'may';'june';'june';'june';'june'}; 
p = anovan(y,{g1 g2 g3})
