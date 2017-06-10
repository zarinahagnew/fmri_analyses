function[y]=countgaps(test)

% mymax(test)
% loads in a variable and calulates the number of gaps longer than x
% frames.

% y = nnz(diff(test)~=0);
% gaps=y/2

for i=1:length(test)-4
    if test(i)==0 & test(i+1)==1 & test(i+2)==1 & test(i+3)==1 & test(i+4)==1
        
        %y = nnz(diff(test)~=0);
        y = nnz(diff(test)~=0 & test(i+1)==1 & test(i+2)==1 &test(i+3)==1 &test(i+3)==4 )
            gaps=y/2

%     else
%         pwd;
%     end
end

% test=[0 0 0 0 0 1 1 1 1 0 0 0 1 1 1 1 0 0 0 0 1 1 0 0 0 0 0 1 1 1 1 0 0 0 0]


% data_4.goodpitchdata(each_block).data(d,i:i+framestoremove)=NaN;
