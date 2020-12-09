function [result] = background_subtraction(img_path,radius,light_background,use_paraboloid,do_presmooth)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 img=py.cv2.imread(img_path,py.cv2.IMREAD_GRAYSCALE);
kwa=pyargs('light_background',light_background,'use_paraboloid', use_paraboloid,'do_presmooth',do_presmooth);
newimg=py.cv2_rolling_ball.subtract_background_rolling_ball(img,radius,kwa);
result=uint8(newimg{1});





end

