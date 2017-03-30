function [ ] = finish(button)
%OPENFILE 此处显示有关此函数的摘要
%   此处显示详细说明
%
%   输入参数:
%   button：当前所点击的按钮

global openfile_button;
global facedetection_button;
global eyesdetection_button;
global facelocation_button;
global normalization_button;
global facerecognization_button;

if button==openfile_button
     %%%%%%%%%%%%%%%%%%%%
    %激活facedetection_button按钮
    %%%%%%%%%%%%%%%%%%%%%
    set(facedetection_button,'enable','on');
end

if button==facedetection_button
    %%%%%%%%%%%%%%%%%%%%
    %激活eyesdetection_button按钮，阻止facedetection_button按钮
    %%%%%%%%%%%%%%%%%%%%%
    set(facedetection_button,'enable','off');
    set(eyesdetection_button,'enable','on');
end

if button==eyesdetection_button
    %%%%%%%%%%%%%%%%%%%%
    %激活facelocation_button按钮，阻止eyesdetection_button按钮
    %%%%%%%%%%%%%%%%%%%%%
    set(eyesdetection_button,'enable','off');
    set(facelocation_button,'enable','on');
end

if button==facelocation_button
    %%%%%%%%%%%%%%%%%%%%
    %激活normalization_button按钮，阻止facelocation_button按钮
    %%%%%%%%%%%%%%%%%%%%%
     set(facelocation_button,'enable','off');
     set(normalization_button,'enable','on');
end

if button==normalization_button
    %%%%%%%%%%%%%%%%%%%%
    %激活facerecognization_button按钮，阻止normalization_button按钮
    %%%%%%%%%%%%%%%%%%%%%
    set(normalization_button,'enable','off');
    set(facerecognization_button,'enable','on');
end

if button==facerecognization_button
    %%%%%%%%%%%%%%%%%%%%
    %阻止facedetection_button按钮
    %%%%%%%%%%%%%%%%%%%%%
     set(facedetection_button,'enable','off');
end

end

