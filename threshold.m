function [result] = threshold(img,thre)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%need to add a conditional statement checking if img is rgb or gray

% copy=rgb2gray(img);
copy=img;
result=copy>=thre;


end

