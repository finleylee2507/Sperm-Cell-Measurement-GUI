format compact 

% 
% I = imread("bone_small.png");
% % 
% % BW=im2bw(I,0.4)
% % 
% % test=max(BW, [], 'all');
% 
% m1=[1 3 5 ; 2 4 6];
% m2=[2 2 2 ; 3 5 7];
% 
% sum(m1(:,[1]),1);
% isequal(m1,m2);
% prod(m1);
% cumsum(m1,2)
% 
% ca1={1,2,3,4,"hello",[1,2,3]};
% ca2=cell(5);
% ca2{1}=["hello","wo"];
% ca2{1};
% ca3={[],[]};
% ca3{1}(1)=1;
% ca3{1}(end+1)=2;
% ca3{1};
% 
% import java.util.LinkedList
% q = LinkedList();
% q.add('item1');
% q.add(2);
% q.add([3 3 3]);
% item = q.remove();
% q.add('item4');
% 
% x=[1 2 3 ];
% y=[4 5 6];
% z=sin(x) + cos(y);

% 
% plot([1 3], [2 4])

% sperm=imread("sperm1.jpg");
% % sperm1=histeq(sperm);
% % figure
% % imshow(sperm1)
% graysperm = rgb2gray(sperm);
% imshow(graysperm)
% 
% 
% 
% 
% 
% while true 
%     H=imrect(gca);
%     pos=wait(H);
%     % close all
%     graysperm(pos(1,2):pos(1,2)+pos(1,4),pos(1,1):pos(1,1)+pos(1,3))=0;
%     imshow(graysperm);
%     loop = inputdlg('Continue? (1/0) : '); % 1 to continue 0 to break loop
%     user_val = str2num(loop{1});
%     if user_val ==0
%         break
%     else 
%         continue 
%     end 
% end 
% imshow(graysperm)



% run the following to select a region to blacken


% A=[1 2 3; 3 5 3];
% [row,col]=find(A==3);
% row;
% col;
% 
% B=[1,2,3,4];
% length(B);

% thre_sperm=graysperm>=200;
% thre_sperm=threshold(graysperm,200);
% imshow(thre_sperm)


% function thre=threshold(img,val)
% thre=arrayfun(@(z) z>=val, img )
% 
% end 



% smallbone=imread("bone_small.png");
% smallbone=rgb2gray(smallbone);
% imshow(smallbone);
% figure;
% thre_smallbone=smallbone>=90;
% thre_smallbone;
% % imshow(thre_smallbone);
% 
% bone_flood_test=flood(thre_smallbone,[30,16],1);
% % imshow(bone_flood_test);
% 
% 
% 
% bone_labeled=labelComponents(thre_smallbone,0);
% imshow(bone_labeled,[0,17])
% bone_labeled;
% 
% numberComponents(thre_smallbone,0)
% 
% % maximum=max(getLargestHelper(thre_smallbone,0),[],"all");
% % find(getLargestHelper(thre_smallbone,0)==maximum)
% 
% 
% largest_bones=getLargestComponents(thre_smallbone,1,0);
% imshow(largest_bones);

largebone=imread("test.jpg");
largebone=rgb2gray(largebone);
size(largebone)
% largebone=rgb2gray(largebone);
% imshow(largebone)
% thre_largebone=largebone>=100;
% figure
% imshow(thre_largebone);
% largest_largebone=getLargestComponents(thre_largebone,2,0);
% imshow(largest_largebone)
% imwrite(largest_largebone,"largebone_filtered.png",'png');

% thre_sperm=graysperm>=185;
% imshow(thre_sperm);
% 
% largest_sperm=getLargestComponents(thre_sperm,6,0);
% imshow(largest_sperm);

% hardsperm=imread("hardsperm.jpg");
% hardsperm=rgb2gray(hardsperm);
% imshow(hardsperm)

% img, background = py.cv2_rolling_ball.subtract_background_rolling_ball(hardsperm, 30,pyargs('light_background','True'), pyargs('use_paraboloid', 'False'),pyargs('do_presmooth','True');
          

% p1 = [10,100];
% p2 = [100,20];
% 
% %# plot the points.
% %# Note that depending on the definition of the points,
% %# you may have to swap x and y
% plot([p1(2),p2(2)],[p1(1),p2(1)],'Color','r','LineWidth',2)

% empty={};
% disp(empty)
% empty{1}=[1, 2];
% test=empty{1};
% disp(test(2));
% empty{end+1}=3;
% disp(empty);


% test=empty(1);
% disp(test);

% empty(1)=1;
% disp(empty)
% test={{1,2},{3,4}};
% disp(test)

% 
% arrC=[1 0 1 1 1;1 1 0 1 1; 0 0 1 1 1];
% CC=buildCC2D(arrC);
% celldisp(CC)
% plotCC2(CC);
% 
% arrRing=[1 1 1 1 1 1; 1 1 1 1 1 1; 1 1 0 0 1 1; 1 1 0 0 1 1; 1 1 1 1 1 1; 1 1 1 1 1 1];
% CC2=buildCC2D(arrRing);
% plotCC2(CC2);
% celldisp(CC2)
% size(CC2{1},2)







% horse=imread('horse_64.png');
% horse=rgb2gray(horse);
% horse=horse>=100;
% 
% 
% horsecc=buildCC2D(horse);
% 
% 
% plotCC2(horsecc);

% emptyCell=cell(1,3);
% 
% for i=1:size(CC2,2)
%     for j=1:size(CC2{i},2)
%         emptyCell{i}{end+1}=0;
%     end
% end

% celldisp(emptyCell)



% disp(isnan(NaN))
% 
% size(computeSimplePair(CC2,computeParents(CC2),testflags),2)
% 
% % size(horsecc{1},2)
% % celldisp(horsecc{1});
% % hold on 
% % line([1,2], [3, 4], 'Color', 'r');
% % 
% % line([1,4], [5, 7], 'Color', 'r');
% 
% a={1 2 3 4 5};
% b={0 0 0 0 1};
% 
% % c=a.*b;
% % c(c>=0)
% 
% 
% c={[],[],[]};
% c{1}(end+1)=1;
% c{1}(end+1)=1;
% celldisp(c)
% 

% testing={[1,2,1,NaN,2]};
% size(testing{1},2)
% testing{end+1}=2;
% celldisp(testing)

% a={1,2,3,4,6,[1,3]};
% isSix = cellfun(@(x)isequal(x,[3,1]),a);
% find(isSix==1)

% keySet = [1,2,3,4];
% valueSet = [327.2 368.2 197.6 178.4];
% M = containers.Map(keySet,valueSet);
% keySet(end+1)=5;
% valueSet(end+1)=233;
% M = containers.Map(keySet,valueSet);
% M(1)

% plotCC2(thin2D(horsecc,3,0.3))
% 
% grayoverlay("bone_large.png");
% largebone=rgb2gray(largebone);
% imshow(largebone, 'InitialMag', 'fit')
% 
% red = cat(3, ones(size(largebone)), zeros(size(largebone)), zeros(size(largebone)));
% hold on
% h = imshow(red);
% hold off
% set(h, 'AlphaData', bone_binary)



%testing thinning on sperm1
% sperm1=imread("sperm1.png");
% imshow(sperm1);
% imshow(threshold(sperm1,35));
% bin_sperm1=threshold(sperm1,37);
% largestsperm1=getLargestComponents(bin_sperm1,1,0);
% grayoverlay(sperm1,largestsperm1);
% sperm1cc=buildCC2D(largestsperm1);
% plotCC2(sperm1cc);
% thin_sperm1=thin2D(sperm1cc,3,0.3);
% plotCC2(thin_sperm1);



%testing on sperm2 
% sperm2=imread("sperm2.png");
% imshow(sperm2);
% imshow(threshold(sperm2,35));
% bin_sperm2=threshold(sperm2,35);
% largestsperm2=getLargestComponents(bin_sperm2,2,0);
% grayoverlay(sperm2,largestsperm2);
% sperm2cc=buildCC2D(largestsperm2);
% plotCC2(sperm2cc);
% thin_sperm2=thin2D(sperm2cc,3,0.3);
% plotCC2(thin_sperm2);

% sperm1=imread('hardsperm4.jpg');
% imshow(sperm1)
% smallsperm1=imresize(sperm1,0.15);
% imshow(smallsperm1);
% imwrite(smallsperm1,"smallsperm3.png",'png')
% 





% testoriginal=imread('smallsperm3.png');
% test=background_subtraction('smallsperm3.png',1,false,false,false);
% test=testoriginal;
% test=rgb2gray(test);

% imshow(test);
% while true 
%     H=imrect(gca);
%     pos=wait(H);
%     % close all
%     test(pos(1,2):pos(1,2)+pos(1,4),pos(1,1):pos(1,1)+pos(1,3))=0;
%     imshow(test);
%     loop = inputdlg('Continue? (1/0) : '); % 1 to continue 0 to break loop
%     user_val = str2num(loop{1});
%     if user_val ==0
%         break
%     else 
%         continue 
%     end 
% end 
% 
% imshow(test);



%testing thinning on test

% bin_test=threshold(test,65);
% imshow(bin_test);
% largesttest=getLargestComponents(bin_test,1,0);
% grayoverlay(testoriginal,largesttest);
% testcc=buildCC2D(largesttest);
% plotCC2(testcc);
% thin_test=thin2D(testcc,6,0.6);
% plotCC2(thin_test);
% 

strcat("I love ","you")

