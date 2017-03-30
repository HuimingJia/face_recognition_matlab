function [face,faceRange] = facedetection(image)
%人脸检测
%无参数默认为人脸检测
%
%   输入参数:
%   image：用户所读入图片
%
%   输出参数
%   face：检测出来的人脸（1张）
%   faceRange：人脸在图片中的位置信息
global openfile_button;
global facedetection_panel_show1;
global facedetection_panel_show2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%调用库函数识别人脸，将位置信息存储进居中BB，其每一行为一张人脸
%本系统同如果读入图片中检测出多张人脸，则报错提示将图片规范化
%如果行数为0，则提示无法检测出人脸
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FaceDetector =vision.CascadeObjectDetector('FrontalFaceLBP');
BB=step(FaceDetector,image);

if(size(BB,1)>1)
    errordlg('There are more than one faces in the picture, format before reload');  
end
 if(size(BB,1)==0)
     errordlg('There is no face having been detected in the picture','Error','non-modal');
     initiate(openfile_button);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%x_start: 识别人脸的x轴起始位置
%x_start: 识别人脸的x轴末尾位置
%y_start: 识别人脸的y轴起始位置
%y_end: 识别人脸的y轴末尾位置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x_start=BB(1,1);
x_end=BB(1,1)+BB(1,3);
y_start=BB(1,2);
y_end=BB(1,2)+BB(1,4);

face=image(y_start:y_end,x_start:x_end);
faceRange=[x_start x_end y_start y_end];

imshow(image,'parent',facedetection_panel_show1);
imshow(face,'parent',facedetection_panel_show2);

end
