function plotCC2D(cc)
%helper function for displaying the 0 and 1 cells in a 2D complex 
cell0=cc{1};
cell1=cc{2};
x=[];
y=[];
xs=[];
ys=[];

figure(1)
%plot the 0 cells 
for i=1:size(cell0,2)
    x(end+1)=cell0{i}(1);
    y(end+1)=cell0{i}(2);
end


scatter(x,y,'or','filled');

%plot the 1 cells 
for j=1:size(cell1,2)
    temp=cell1{j};
    p1idx=temp(1);
    p2idx=temp(2);
    p1=cell0{p1idx};
    p2=cell0{p2idx};
    p1x=p1(1);
    p1y=p1(2);
    p2x=p2(1);
    p2y=p2(2);
    line([p1x,p2x],[p1y,p2y],'Color','r');
    
    
    
end



