% % ����һ��ͼ��im�����lbpimage
% % lbpimage���Ϳ�ֱ��imС2�����ء�
% % lbpimage�е�����ֵ��ʾ����lbp pattern (lbp code)

function lbpimage = lbp(im)
%��������ʵ��lbp����
lbpimage=zeros(size(im,1)-2,size(im,2)-2);
thresholded=zeros(3,3);
weights=[1,2,4;128,0,8;64,32,16];
%����98*98��lbpimage�������ڴ������lbpֵ
%thresholded�����weight�������ڴ��ģʽ��Ȩֵ

for centerr=2:size(im,1)-1
    for centerc=2:size(im,2)-1
        if(im(centerr,centerc)>im(centerr-1,centerc-1))
            thresholded(1,1)=0;
        else
            thresholded(1,1)=1;
        end

        if(im(centerr,centerc)>im(centerr-1,centerc))
            thresholded(1,2)=0;
        else
            thresholded(1,2)=1;
        end

        if(im(centerr,centerc)>im(centerr-1,centerc+1))
            thresholded(1,3)=0;
        else
            thresholded(1,3)=1;
        end
    
        if(im(centerr,centerc)>im(centerr,centerc-1))
            thresholded(2,1)=0;
        else
            thresholded(2,1)=1;
        end
       
        if(im(centerr,centerc)>im(centerr,centerc+1))
            thresholded(2,3)=0;
        else
            thresholded(2,3)=1;
        end
     
        if(im(centerr,centerc)>im(centerr+1,centerc-1))
            thresholded(3,1)=0;
        else
            thresholded(3,1)=1;
        end
     
        if(im(centerr,centerc)>im(centerr+1,centerc))
            thresholded(3,2)=0;
        else
            thresholded(3,2)=1;
        end
    
        if(im(centerr,centerc)>im(centerr+1,centerc+1))
            thresholded(3,3)=0;
        else
            thresholded(3,3)=1;
        end
   %forѭ����8����Χ�����ؽ��бȽϣ��ó�����ģʽ     
         temp=thresholded.*weights;
         lbpimage(centerr,centerc)=sum((sum(temp))');
    %��������Ȩֵ���е�ˣ���ͺ����lbpֵ
    end
end