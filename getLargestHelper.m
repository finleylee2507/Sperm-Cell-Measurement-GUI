function [result] = getLargestHelper(img,conn)
%helper function returning a 1 d array with the length of each labeled 
%component, with the indices indicating the label

numComp=numberComponents(img,conn);
temp=labelComponents(img,conn);
result=zeros(1,numComp);
counter=numComp;


while (counter>=1)
    tempcount=length(find(temp==counter));
    result(counter)=tempcount;
    counter=counter-1;
end
  
     
end 








