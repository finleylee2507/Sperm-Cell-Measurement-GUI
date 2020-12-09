function [result] = computeSimplePair(cc,parents,existed)

%initialize result array
% result=cell(1,3);
    result={[],[],[]};

for i=1:size(cc,2)
    for j=1:size(cc{i},2)
        result{i}(end+1)=0;
    end
end

%compute simple pair
for i=2:size(cc,2)
    for j=1:size(cc{i},2)
        for k=1:size(cc{i}{j},2)
            
            if(existed{i}(j)==1)
                element=cc{i}{j}(k);
%                 count=parents{i-1}{element};
                  count=parents{i-1}(element);
                if(count==1)
%                     result{i}{j}=element;
                    result{i}(j)=element;
                end
            end
        end
    end
end

            
            
end
    






