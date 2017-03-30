function [normalizedFace] = normalization(face)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
%
%   输入参数:
%   face：等待检测的人脸
%
%   输出参数
%   normalizedFace：标准化后的脸

global normalization_panel_show1;
global normalization_panel_show2;

%%%%%%%%%%%%%%%%%%%%%%%%
%将所有人脸变为100*100大小的矩阵
%%%%%%%%%%%%%%%%%%%%%%%%
normalizedFace=imresize(face,[100 100]);

imshow(face,'parent',normalization_panel_show1);
imshow(normalizedFace,'parent',normalization_panel_show2);

end

