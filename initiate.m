function [] = initiate(button)
%OPENFILE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%
%   �������:
%   button����ǰ������İ�ť
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
    %���openfile_button����г�ʼ��������ֻ�ܵ�������ļ����ܣ��ǵ����̰��������
    %%%%%%%%%%%%%%%%%%%%%
    
    set(facedetection_button,'enable','off');
    set(eyesdetection_button,'enable','off');
    set(facelocation_button,'enable','off');
    set(normalization_button,'enable','off');
    set(facerecognization_button,'enable','off');
    
    %%%%%%%%%%%%%%%%%%%%
    %��ճ�ʼ�����
    %%%%%%%%%%%%%%%%%%%%%
    axes(image_show);
    cla;
    
    %%%%%%%%%%%%%%%%%%%%
    %���openfile_button����г�ʼ�������������ϴβ�������һ����ֱ�����س��˳�ʼ������ȫ�����
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
    %����openfile_panel��壬չʾfacedetection_panel���
    %%%%%%%%%%%%%%%%%%%%%
    set(openfile_panel,'visible','off');
    set(facedetection_panel,'visible','on');
end

if button==eyesdetection_button
    axes(eyesdetection_panel_show1);
    axes(eyesdetection_panel_show2);
    cla;
     %%%%%%%%%%%%%%%%%%%%
    %����facedetection_panel��壬չʾeyesdetection_panel���
    %%%%%%%%%%%%%%%%%%%%%
    set(facedetection_panel,'visible','off');
    set(eyesdetection_panel,'visible','on');
end

if button==facelocation_button
      axes(facelocation_panel_show1);
      axes(facelocation_panel_show2);
    cla;
    %%%%%%%%%%%%%%%%%%%%
    %����eyesdetection_panel��壬չʾfacelocation_panel���
    %%%%%%%%%%%%%%%%%%%%%
    set(eyesdetection_panel,'visible','off');
    set(facelocation_panel,'visible','on');
end

if button==normalization_button
    axes(normalization_panel_show1);
     axes(normalization_panel_show2);
    cla;
    %%%%%%%%%%%%%%%%%%%%
    %����facelocation_panel��壬չʾnormalization_panel���
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
    %����normalization_panel��壬չʾrecognization_panel���
    %%%%%%%%%%%%%%%%%%%%%
    set(normalization_panel,'visible','off');
    set(recognization_panel,'visible','on');
end

end

