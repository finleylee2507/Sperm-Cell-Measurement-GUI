function grayoverlay(img,imgbinary)
% rgb=imread(img);
% imshow(rgb);
% I=rgb2gray(rgb);
% r_comp= I;
% r_comp(I>100)=255;
% %........^ Gray pixel values condition 
% g_comp= I;
% g_comp(I>110)=0;
% b_comp=I;
% b_comp(I>110)=0;
% result=cat(3,r_comp,g_comp,b_comp);
% % image(result);
% imshow(result);
% grayimg=rgb2gray(img);
grayimg=img;
imshow(grayimg, 'InitialMag', 'fit');
red = cat(3, ones(size(grayimg)), zeros(size(grayimg)), zeros(size(grayimg)));
hold on
h = imshow(red);
hold off
set(h, 'AlphaData', imgbinary);




