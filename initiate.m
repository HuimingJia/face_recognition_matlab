function [] = initiate(button)
%OPENFILE 此处显示有关此函数的摘要
%   此处显示详细说明
%
%   输入参数:
%   button：当前所点击的按钮
global openfile_panel;
global facedetection_panel;
global eyesdetection_panel;
global facelocation_panel;
global normalization_panel;
global recognization_panel;

global image_show;

global facedetection_panel_show1;
global facedetection_panel_show2;

global eyesdetection_panel_show1;
global eyesdetection_panel_show2;

global facelocation_panel_show1;
global facelocation_panel_show2;

global normalization_panel_show1;
global normalization_panel_show2;

global face_show;
global face_analysis;
global face_r_show;
global face_r_analysis;

global openfile_button;
global facedetection_button;
global eyesdetection_button;
global facelocation_button;
global normalization_button;
global facerecognization_button;

if button==openfile_button
    %%%%%%%%%%%%%%%%%%%%%
    %点击openfile_button后进行初始化操作，只能点击载入文件功能，是的流程按步骤进行
    %%%%%%%%%%%%%%%%%%%%%
    
    set(facedetection_button,'enable','off');
    set(eyesdetection_button,'enable','off');
    set(facelocation_button,'enable','off');
    set(normalization_button,'enable','off');
    set(facerecognization_button,'enable','off');
    
    %%%%%%%%%%%%%%%%%%%%
    %清空初始化面板
    %%%%%%%%%%%%%%%%%%%%%
    axes(image_show);
    cla;
    
    %%%%%%%%%%%%%%%%%%%%
    %点击openfile_button后进行初始化操作，无论上次操作在哪一步，直接隐藏除了初始化面板的全部面板
    %%%%%%%%%%%%%%%%%%%%%
    set(openfile_panel,'visible','on');
    set(facedetection_panel,'visible','off');
    set(eyesdetection_panel,'visible','off');
     set(facelocation_panel,'visible','off');
    set(normalization_panel,'visible','off');
    set(recognization_panel,'visible','off');
    
end

if button==facedetection_button        
    axes(facedetection_panel_show1);
     axes(facedetection_panel_show2);
    cla;
    
    %%%%%%%%%%%%%%%%%%%%
    %隐藏openfile_panel面板，展示facedetection_panel面板
    %%%%%%%%%%%%%%%%%%%%%
    set(openfile_panel,'visible','off');
    set(facedetection_panel,'visible','on');
end

if button==eyesdetection_button
    axes(eyesdetection_panel_show1);
    axes(eyesdetection_panel_show2);
    cla;
     %%%%%%%%%%%%%%%%%%%%
    %隐藏facedetection_panel面板，展示eyesdetection_panel面板
    %%%%%%%%%%%%%%%%%%%%%
    set(facedetection_panel,'visible','off');
    set(eyesdetection_panel,'visible','on');
end

if button==facelocation_button
      axes(facelocation_panel_show1);
      axes(facelocation_panel_show2);
    cla;
    %%%%%%%%%%%%%%%%%%%%
    %隐藏eyesdetection_panel面板，展示facelocation_panel面板
    %%%%%%%%%%%%%%%%%%%%%
    set(eyesdetection_panel,'visible','off');
    set(facelocation_panel,'visible','on');
end

if button==normalization_button
    axes(normalization_panel_show1);
     axes(normalization_panel_show2);
    cla;
    %%%%%%%%%%%%%%%%%%%%
    %隐藏facelocation_panel面板，展示normalization_panel面板
    %%%%%%%%%%%%%%%%%%%%%
    set(facelocation_panel,'visible','off');
    set(normalization_panel,'visible','on');
end

if button==facerecognization_button
    axes(face_show);
    axes(face_analysis);
    axes(face_r_show);
    axes(face_r_analysis);
    cla;
    %%%%%%%%%%%%%%%%%%%%
    %隐藏normalization_panel面板，展示recognization_panel面板
    %%%%%%%%%%%%%%%%%%%%%
    set(normalization_panel,'visible','off');
    set(recognization_panel,'visible','on');
end

end

