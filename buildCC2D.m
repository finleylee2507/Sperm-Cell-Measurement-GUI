function [result] = buildCC2D(array)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
arr=array;
%rotate the image 
arr=flipdim(arr,1);
cell0={};
cell1={};
cell2={};
height=size(array,1);
width=size(array,2);
visited=zeros(2*height+1,2*width+1);
counter0=1;
counter1=1;
counter2=1;

for row=1:height
    for col=1:width
        
        if(arr(row,col)==1)
            x=2*row;
            y=2*col;
            
            %for all the 0 cells around the object
            if(visited(x+1,y-1)==0)
                visited(x+1,y-1)=counter0;
                cell0{end+1}=[y-1,x+1];
                counter0=counter0+1;
            end
            
            if(visited(x+1,y+1)==0)
                visited(x+1,y+1)=counter0;
                cell0{end+1}=[y+1,x+1];
                counter0=counter0+1;
            end
            
            if(visited(x-1,y+1)==0)
                visited(x-1,y+1)=counter0;
                cell0{end+1}=[y+1,x-1];
                counter0=counter0+1;
            end
            
            if(visited(x-1,y-1)==0)
                visited(x-1,y-1)=counter0;
                cell0{end+1}=[y-1,x-1];
                counter0=counter0+1;
            end
            
            %for all the 1 cells around the object
            if(visited(x,y-1)==0)
                visited(x,y-1)=counter1;
                cell1{end+1}=[visited(x+1,y-1),visited(x-1,y-1)];
                counter1=counter1+1;
            end
            
             if(visited(x+1,y)==0)
                visited(x+1,y)=counter1;
                cell1{end+1}=[visited(x+1,y-1),visited(x+1,y+1)];
                counter1=counter1+1;
             end
            
              if(visited(x,y+1)==0)
                visited(x,y+1)=counter1;
                cell1{end+1}=[visited(x-1,y+1),visited(x+1,y+1)];
                counter1=counter1+1;
              end
            
               if(visited(x-1,y)==0)
                visited(x-1,y)=counter1;
                cell1{end+1}=[visited(x-1,y-1),visited(x-1,y+1)];
                counter1=counter1+1;
               end
            
               %for the 2 cell where the object is at 
               if(visited(x,y)==0)
                   visited(x,y)=counter2;
                   cell2{end+1}=[visited(x,y-1),visited(x,y+1),visited(x-1,y),visited(x+1,y)];
                   counter2=counter2+1;
               end
        end
         
    end
end



result={cell0,cell1,cell2};



end

