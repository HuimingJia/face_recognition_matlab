function [ locatedFace ] = facelocation( image,eyesRange,faceRange )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%
%   �������:
%   image���û��������ͼ��
%   eyesRange������⵽�۾��������е�λ��
%   faceRange��������ͼ���е�λ��
%
%   �������
%   locatedFace��ͨ���۾�λ���Զ���������Ĵ�С

global facelocation_panel_show1;
global facelocation_panel_show2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%.���������Ϊ�۾���ȵ�1.2�����߶�Ϊ�۾��߶ȵ�5.5��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
face_height=5.5*eyesRange(1,4);
face_width=1.2*eyesRange(1,3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%.ͨ���۾������е�λ�ú��۾���ͼƬ�е�λ�������������λ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
face_centre=[faceRange(1,1)+eyesRange(1,1)+eyesRange(1,3)*0.5 faceRange(1,3)+eyesRange(1,2)+(eyesRange(1,4))*1.5];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%.x_start����λ���������ͼƬ��X�����ʼλ��
%.x_end����λ���������ͼƬ��X���ĩβλ��
%.y_start����λ���������ͼƬ��Y�����ʼλ��
%.y_end����λ���������ͼƬ��Y���ĩβλ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_start=face_centre(1,1)-0.5*face_width;
x_end=face_centre(1,1)+0.5*face_width;

y_start=face_centre(1,2)-0.5*face_height;
y_end=face_centre(1,2)+0.5*face_height;

locatedFace=image(round(y_start):round(y_end),round(x_start):round(x_end));

%f=image(face_centre(1,1)-100:face_centre(1,1)+100,round(x_start):round(x_end));

imshow(image,'parent',facelocation_panel_show1);
imshow(locatedFace,'parent',facelocation_panel_show2);
end

