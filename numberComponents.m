function [result] = numberComponents(img,conn)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
result=labelComponents(img,conn);
result=max(result,[],'all');
end

