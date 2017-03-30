function [] = recognization( inputFace)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

global face_show;
global face_analysis;
global face_r_show;
global face_r_analysis;

imshow(inputFace,'parent',face_show);

%������������
%ÿ������ͼ��һ�У�����faceLibrary_mat��faceInput_mat

num=112; %����107����
GNum = 1; %ÿ������5��ע������
PNum = 1; %ÿ������1����������

faceLibrary_mat = zeros(10000, num*GNum); %�վ���, ע�Ἧ
faceInput_mat = zeros(10000, num*PNum); %�վ��󣬲��Լ�

%����������������
for person_id = 1:num

	%��һ��ע�Ἧ�е�����
	%for gallery_id=1:GNum %ÿ����ע�Ἧ����5������ͼ��
		filename = ['facelibrary/', num2str(person_id) ,'.png'];
		im = imread(filename);
%         if(person_id==107)
%             disp(size(im,1));
%             disp(size(im,2));
%         end
		im = double( reshape(im, 10000, 1) ); %�������100x100����תΪ 10000x1��������
		faceLibrary_mat(:,person_id) = im; %��֮�����person_id��
	%end
end

	%�����Լ��е�����
	im = double( reshape(inputFace, 10000, 1) ); %�������100x100����תΪ 10000x1��������
	faceInput_mat(:,1) = im; 
	
	%disp(['Person ID ', num2str(person_id)]);
    
    disp('all samples have been loaded.');

%���� distance matrix������Ԫ�������������ľ���
%����ԽС˵��Խ����
% ��ȡLBP������Ȼ�����Chi-square����

disp('��������LBP');
faceLibrary_mat_lbp=[];
faceInput_mat_lbp=[];

%Ϊ����ע�Ἧ�е�������ȡLBP����
for idx = 1:size(faceLibrary_mat,2)
    face_image = reshape(faceLibrary_mat(:,idx), 100,100);
    faceLibrary_mat_lbp = [faceLibrary_mat_lbp, lbp7x7hist( face_image )];
end

    face_image = reshape(faceInput_mat(:,1), 100,100);
    faceInput_mat_lbp = [faceInput_mat_lbp, lbp7x7hist( face_image )];    
    
    weights=[ones(59,1)*2; %line 1
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*2;
        ones(59,1)*2; %line 2
        ones(59,1)*4;
        ones(59,1)*4;
        ones(59,1)*1;
        ones(59,1)*4;
        ones(59,1)*4;
        ones(59,1)*2;
        ones(59,1)*1; %line 3
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*0;
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*0; %line 4
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*0;
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*0;
        ones(59,1)*0; %line 5
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*0;
        ones(59,1)*0; %line 6
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*2;
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*0;
        ones(59,1)*0; %line 7
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*1;
        ones(59,1)*0 ];
%������뽫Ȩ��һ���Գ˵��������������ϣ����Լӿ�����ٶ�
faceLibrary_mat_wlbp=faceLibrary_mat_lbp .* repmat(weights,1, size(faceLibrary_mat_lbp,2));
faceInput_mat_wlbp=faceInput_mat_lbp .* repmat(weights,1, size(faceInput_mat_lbp,2));
    
    
%����ע�Ἧ����������������Լ���������������֮��ľ��룬!!!��������!!!
dist_mat = cal_dist_mat( faceLibrary_mat_lbp , faceInput_mat_lbp, 3 );



disp(dist_mat(:,1));
min= dist_mat(1,1);
count=1;
for i=1:size(dist_mat,1)
    if(dist_mat(i,1)<=min)
        count=i;
        disp(count);
    end
end

result_filename = ['facelibrary/',num2str(count) ,'.png'];
result_face_image = imread(result_filename);

imshow(result_face_image,'parent',face_r_show);
bar(faceInput_mat_lbp,'parent',face_analysis);
bar(faceLibrary_mat_lbp(:,count),'parent',face_r_analysis);
end

