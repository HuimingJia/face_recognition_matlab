function [ ] = finish(button)
%OPENFILE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%
%   �������:
%   button����ǰ������İ�ť

global openfile_button;
global facedetection_button;
global eyesdetection_button;
global facelocation_button;
global normalization_button;
global facerecognization_button;

if button==openfile_button
     %%%%%%%%%%%%%%%%%%%%
    %����facedetection_button��ť
    %%%%%%%%%%%%%%%%%%%%%
    set(facedetection_button,'enable','on');
end

if button==facedetection_button
    %%%%%%%%%%%%%%%%%%%%
    %����eyesdetection_button��ť����ֹfacedetection_button��ť
    %%%%%%%%%%%%%%%%%%%%%
    set(facedetection_button,'enable','off');
    set(eyesdetection_button,'enable','on');
end

if button==eyesdetection_button
    %%%%%%%%%%%%%%%%%%%%
    %����facelocation_button��ť����ֹeyesdetection_button��ť
    %%%%%%%%%%%%%%%%%%%%%
    set(eyesdetection_button,'enable','off');
    set(facelocation_button,'enable','on');
end

if button==facelocation_button
    %%%%%%%%%%%%%%%%%%%%
    %����normalization_button��ť����ֹfacelocation_button��ť
    %%%%%%%%%%%%%%%%%%%%%
     set(facelocation_button,'enable','off');
     set(normalization_button,'enable','on');
end

if button==normalization_button
    %%%%%%%%%%%%%%%%%%%%
    %����facerecognization_button��ť����ֹnormalization_button��ť
    %%%%%%%%%%%%%%%%%%%%%
    set(normalization_button,'enable','off');
    set(facerecognization_button,'enable','on');
end

if button==facerecognization_button
    %%%%%%%%%%%%%%%%%%%%
    %��ֹfacedetection_button��ť
    %%%%%%%%%%%%%%%%%%%%%
     set(facedetection_button,'enable','off');
end

end

