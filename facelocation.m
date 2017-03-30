function [ locatedFace ] = facelocation( image,eyesRange,faceRange )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
%
%   输入参数:
%   image：用户所载入的图像
%   eyesRange：所检测到眼睛在人脸中的位置
%   faceRange：人脸在图像中的位置
%
%   输出参数
%   locatedFace：通过眼睛位置自定义的人脸的大小

global facelocation_panel_show1;
global facelocation_panel_show2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%.设人脸宽度为眼睛宽度的1.2被，高度为眼睛高度的5.5倍
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
face_height=5.5*eyesRange(1,4);
face_width=1.2*eyesRange(1,3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%.通过眼睛在脸中的位置和眼睛在图片中的位置算出脸的中心位置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
face_centre=[faceRange(1,1)+eyesRange(1,1)+eyesRange(1,3)*0.5 faceRange(1,3)+eyesRange(1,2)+(eyesRange(1,4))*1.5];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%.x_start：定位后的人脸在图片中X轴的起始位置
%.x_end：定位后的人脸在图片中X轴的末尾位置
%.y_start：定位后的人脸在图片中Y轴的起始位置
%.y_end：定位后的人脸在图片中Y轴的末尾位置
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

