function [result] = flood(img, coordinates,conn)
%flood fill algorithm on 2d binary image.
% conn=0 -> 8 connectivity 
% conn=1 ->4 connectivity
%   Detailed explanation goes here

temp=img;
visited=zeros(size(img,1),size(img,2));
result=zeros(size(img,1),size(img,2));
height=size(img,1);
width=size(img,2);
stack=java.util.Stack();
x=coordinates(1);
y=coordinates(2);

% if the coordinate is out of bound, return 
if temp(x,y)==0 || x<=0 || x>height ||y<=0 || y>width
    return;  
end
stack.push([x,y]);

while stack.empty()==false 
    element=stack.pop();
    row=element(1);
    col=element(2);
    result(row,col)=1;
    visited(row,col)=1;
    
    
    if (conn==0)
        if(row+1>=1&&row+1<=height&&visited(row+1,col)==0&&temp(row+1,col)==1)
            stack.push([row+1,col]);
        end
        
        if(row-1>=1&&row-1<=height&&visited(row-1,col)==0&&temp(row-1,col)==1)
            stack.push([row-1,col]);
        end
        if(col+1>=1&&col+1<=width&&visited(row,col+1)==0&&temp(row,col+1)==1)
            stack.push([row,col+1]);
        end
        if(col-1>=1&&col-1<=width&&visited(row,col-1)==0&&temp(row,col-1)==1)
            stack.push([row,col-1]);
        end
        if(row+1>=1&&row+1<=height&&col+1>=1&&col+1<=width&&visited(row+1,col+1)==0&&temp(row+1,col+1)==1)
            stack.push([row+1,col+1]);
        end
        if(row+1>=1&&row+1<=height&&col-1>=1&&col-1<=width&&visited(row+1,col-1)==0&&temp(row+1,col-1)==1)
            stack.push([row+1,col-1]);
        end
        if(row-1>=1&&row-1<=height&&col+1>=1&&col+1<=width&&visited(row-1,col+1)==0&&temp(row-1,col+1)==1)
            stack.push([row-1,col+1]);
        end
        if(row-1>=1&&row-1<=height&&col-1>=1&&col-1<=width&&visited(row-1,col-1)==0&&temp(row-1,col-1)==1)
            stack.push([row-1,col-1]);
        end 
    end 
    
    if (conn==1)
        if(row+1>=1&row+1<=height&visited(row+1,col)==0&temp(row+1,col)==1)
            stack.push([row+1,col]);
        end
        
        if(row-1>=1&row-1<=height&visited(row-1,col)==0&temp(row-1,col)==1)
            stack.push([row-1,col]);
        end
        if(col+1>=1&col+1<=width&visited(row,col+1)==0&temp(row,col+1)==1)
            stack.push([row,col+1]);
        end
        if(col-1>=1&col-1<=width&visited(row,col-1)==0&temp(row,col-1)==1)
            stack.push([row,col-1]);
        end
    end 
      
end 
return; 
    
end

