function [] = recognization( inputFace)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

global face_show;
global face_analysis;
global face_r_show;
global face_r_analysis;

imshow(inputFace,'parent',face_show);

%读入所有人脸
%每个人脸图像一列，存入faceLibrary_mat和faceInput_mat

num=112; %共有107个人
GNum = 1; %每个人有5个注册人脸
PNum = 1; %每个人有1个测试人脸

faceLibrary_mat = zeros(10000, num*GNum); %空矩阵, 注册集
faceInput_mat = zeros(10000, num*PNum); %空矩阵，测试集

%读入所有人脸数据
for person_id = 1:num

	%逐一读注册集中的样本
	%for gallery_id=1:GNum %每个人注册集中有5个人脸图像
		filename = ['facelibrary/', num2str(person_id) ,'.png'];
		im = imread(filename);
%         if(person_id==107)
%             disp(size(im,1));
%             disp(size(im,2));
%         end
		im = double( reshape(im, 10000, 1) ); %将读入的100x100矩阵转为 10000x1的列向量
		faceLibrary_mat(:,person_id) = im; %将之放入第person_id列
	%end
end

	%读测试集中的样本
	im = double( reshape(inputFace, 10000, 1) ); %将读入的100x100矩阵转为 10000x1的列向量
	faceInput_mat(:,1) = im; 
	
	%disp(['Person ID ', num2str(person_id)]);
    
    disp('all samples have been loaded.');

%计算 distance matrix，矩阵元素是两个样本的距离
%距离越小说明越相似
% 提取LBP特征，然后计算Chi-square距离

disp('方法三：LBP');
faceLibrary_mat_lbp=[];
faceInput_mat_lbp=[];

%为所有注册集中的样本提取LBP特征
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
%下面代码将权重一次性乘到所有特征向量上，可以加快计算速度
faceLibrary_mat_wlbp=faceLibrary_mat_lbp .* repmat(weights,1, size(faceLibrary_mat_lbp,2));
faceInput_mat_wlbp=faceInput_mat_lbp .* repmat(weights,1, size(faceInput_mat_lbp,2));
    
    
%计算注册集中所有样本，与测试集中所有样本两两之间的距离，!!!卡方距离!!!
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

