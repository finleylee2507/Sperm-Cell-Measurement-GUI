function [result] = thin2D(cc,threshold1,threshold2)

parents=computeParents(cc);
copy=cc;

%initalize flag array 
% flags=cell(1,3);
flags={[],[],[]};
for i=1:size(cc,2)
    for j=1:size(cc{i},2)
        flags{i}(end+1)=1;
    end
end
counter=1;

%initialize I table 
% I=cell(1,3);
I={[],[],[]};
for i=1:size(parents,2)
    for j=1:size(parents{i},2)
        if(parents{i}(j)==0)
            I{i}(j)=0;
        else
            I{i}(j)=NaN;
        end
    end
end

%perform 2d thinning 

t1abs=threshold1;
t1rel=threshold2;

while 1
    pairs=computeSimplePair(cc,parents,flags);
    
    %check for medial cells
    for i=1:size(pairs,2)
        for j=1:size(pairs{i},2)
            if(pairs{i}(j)~=0)
                if(i==2&&(counter-I{i}(j)>t1abs)&&((counter-I{i}(j))/counter>t1rel))
                    pairs{i}(j)=0;
                end
            end
        end
    end
    
    %check if the table is empty, if so, break out of the while loop 
    isEmpty=1;
    for i=1:size(pairs,2)
        for j=1:size(pairs{i},2)
            if(pairs{i}(j)~=0)
                isEmpty=0;
            end
        end
    end
    
    if isEmpty==1
        break
    end
    
    
    %flag all the simple pairs 
    
                    
     for i=1:size(pairs,2)
        for j=1:size(pairs{i},2)
            if(pairs{i}(j)~=0)
                flags{i}(j)=0;
                flags{i-1}(pairs{i}(j))=0;
                
                if(i==2)
                    children1=cc{i}{j};
                    for k=1:size(children1,2)
                        parents{i-1}(children1(k))=parents{i-1}(children1(k))-1;
                        if(parents{i-1}(children1(k))==0&&isnan(I{i-1}(children1(k))))
                            I{i-1}(children1(k))=counter;
                        end
                    end
                end
                
                if(i>2)
                    children1=cc{i}{j};
                    children2=cc{i-1}{pairs{i}(j)};
                    
                    for k=1:size(children1,2)
                        parents{i-1}(children1(k))=parents{i-1}(children1(k))-1;
                        if(parents{i-1}(children1(k))==0&&isnan(I{i-1}(children1(k))))
                            I{i-1}(children1(k))=counter;
                        end
                    end
                    
                     for k=1:size(children2,2)
                        parents{i-2}(children2(k))=parents{i-2}(children2(k))-1;
                        if(parents{i-2}(children2(k))==0&&isnan(I{i-2}(children2(k))))
                            I{i-2}(children2(k))=counter;
                        end
                     end
                end
            end
        end
     end
     
     counter=counter+1;
end

%loop over complex and re-index

%create a new cell array that contains only the existing cells 
flags1=flags{1};
flags2=flags{2};
flags3=flags{3};
temp1={};
temp2={};
temp3={};
old1=copy{1};
old2=copy{2};
old3=copy{3};

%for the 0 cells
for i=1:size(flags{1},2)
    if(flags{1}(i)==1)
        temp1{end+1}=copy{1}{i};
    end
end

%for the 1 cells
for i=1:size(flags{2},2)
    if(flags{2}(i)==1)
        temp2{end+1}=copy{2}{i};
    end
end

%for the 2 cells
for i=1:size(flags{3},2)
    if(flags{3}(i)==1)
        temp3{end+1}=copy{3}{i};
    end
end

temp12=temp1;
temp22=temp2;
temp32=temp3;

%iterate over each list 
key1=[];
value1=[];
key2=[];
value2=[];
% key3=[];
% value3=[];

%FOR ALL THE 0 CELLS

for i=1:size(temp1,2)
    %find out where an element is in the old list
    new=i;
    findOld=cellfun(@(x)isequal(x,temp1{i}),copy{1});
%     disp(findOld);
    old=find(findOld==1);
%     disp(old);
    key1(end+1)=old;
    value1(end+1)=new;
end

if(~isempty(key1)&&~isempty(value1))
    %create a map for the 0 cells 
map1=containers.Map(key1,value1);

    %iterate over the 1 cells and reindex
    for i=1:size(temp22,2)
        for j=1:size(temp22{i},2)
            %find out the new index (if there is one) 
            if(isKey(map1,temp22{i}(j)))
                newKey=map1(temp22{i}(j));
                temp22{i}(j)=newKey;
            end
        end
    end

end
    




%FOR ALL THE 1 CELLS
for i=1:size(temp2,2)
    %find out where an element is in the old list
    new=i;
    findOld=cellfun(@(x)isequal(x,temp2{i}),copy{2});
    old=find(findOld==1);
    key2(end+1)=old;
    value2(end+1)=new;
end
%create a map for the 1 cells 
if(~isempty(key2)&&~isempty(value2))
    map2=containers.Map(key2,value2);

    %iterate over the 2 cells and reindex
    for i=1:size(temp32,2)
        for j=1:size(temp32{i},2)
            %find out the new index (if there is one) 
            if(isKey(map2,temp32{i}(j)))
                newKey=map2(temp32{i}(j));
                temp32{i}(j)=newKey;
            end
        end
    end
end


%return result
result={temp12,temp22,temp32};

            
        
end           








