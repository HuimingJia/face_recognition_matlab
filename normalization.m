function [normalizedFace] = normalization(face)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%
%   �������:
%   face���ȴ���������
%
%   �������
%   normalizedFace����׼�������

global normalization_panel_show1;
global normalization_panel_show2;

%%%%%%%%%%%%%%%%%%%%%%%%
%������������Ϊ100*100��С�ľ���
%%%%%%%%%%%%%%%%%%%%%%%%
normalizedFace=imresize(face,[100 100]);

imshow(face,'parent',normalization_panel_show1);
imshow(normalizedFace,'parent',normalization_panel_show2);

end

