function [finalresult] = getLargestComponents(img,k,conn)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
numcomp=numberComponents(img,conn);
numreq=k;
result=labelComponents(img,conn);
helperresult=getLargestHelper(img,conn);
height=size(img,1);
width=size(img,2);
finalresult=zeros(height,width);
counter=numcomp;

if(numreq>numcomp)
    numreq=numcomp;
end 

while (counter>numcomp-numreq)
    maximum=max(helperresult,[],"all");
    disp(maximum)
    label=find(helperresult==maximum);
    [xs,ys]=find(result==label);
    for i=1:length(xs)
        x=xs(i);
        y=ys(i);
        finalresult(x,y)=1;
    end
    
    helperresult(label)=0;
    counter=counter-1;
    
    
    
    
end




end

