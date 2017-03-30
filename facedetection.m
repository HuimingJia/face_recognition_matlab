function [face,faceRange] = facedetection(image)
%�������
%�޲���Ĭ��Ϊ�������
%
%   �������:
%   image���û�������ͼƬ
%
%   �������
%   face����������������1�ţ�
%   faceRange��������ͼƬ�е�λ����Ϣ
global openfile_button;
global facedetection_panel_show1;
global facedetection_panel_show2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%���ÿ⺯��ʶ����������λ����Ϣ�洢������BB����ÿһ��Ϊһ������
%��ϵͳͬ�������ͼƬ�м��������������򱨴���ʾ��ͼƬ�淶��
%�������Ϊ0������ʾ�޷���������
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
%x_start: ʶ��������x����ʼλ��
%x_start: ʶ��������x��ĩβλ��
%y_start: ʶ��������y����ʼλ��
%y_end: ʶ��������y��ĩβλ��
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
