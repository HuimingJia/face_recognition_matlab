% % 输入一个图像im，输出lbpimage
% % lbpimage长和宽分别比im小2个像素。
% % lbpimage中的像素值表示的是lbp pattern (lbp code)

function lbpimage = lbp(im)
%请在下面实现lbp计算
lbpimage=zeros(size(im,1)-2,size(im,2)-2);
thresholded=zeros(3,3);
weights=[1,2,4;128,0,8;64,32,16];
%创建98*98的lbpimage矩阵用于存放最后的lbp值
%thresholded矩阵和weight矩阵用于存放模式和权值

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
   %for循环对8个周围的像素进行比较，得出最后的模式     
         temp=thresholded.*weights;
         lbpimage(centerr,centerc)=sum((sum(temp))');
    %将算子与权值进行点乘，求和后求得lbp值
    end
end