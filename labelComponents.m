function [finalresult] = labelComponents(img,conn)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
height=size(img,1);
width=size(img,2);
finalresult=zeros(height,width);
label=1;
[xs,ys]=find(img==1);


for i=1:length(xs)
    x=xs(i);
    y=ys(i);
    
    if(finalresult(x,y)==0)
        result=flood(img,[x,y],conn);
        [xs1,ys1]=find(result==1);
        finalresult(x,y)=label;
        for j=1:length(xs1)
            x1=xs1(j);
            y1=ys1(j);
            finalresult(x1,y1)=label;
        end 
        label=label+1;
    end 
end 

return;
end

