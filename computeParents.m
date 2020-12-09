function [result] = computeParents(cc)
%given a cell complex and compute the parent for each cell

% %initialize parent array
% result=cell(1,3);
result={[],[],[]};

for i=1:size(cc,2)
    for j=1:size(cc{i},2)
%         result{i}{end+1}=0;
    result{i}(end+1)=0;
         
    end
end

%compute parents
for i=2:size(cc,2)
    for j=1:size(cc{i},2)
        for k=1:size(cc{i}{j},2)
%             result{i-1}{cc{i}{j}(k)}= result{i-1}{cc{i}{j}(k)}+1;
             result{i-1}(cc{i}{j}(k))= result{i-1}(cc{i}{j}(k))+1;
        end
    end
end

 
   



end

