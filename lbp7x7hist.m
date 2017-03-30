% ��ͼ�񻮷�Ϊ7x7blocks, ����ÿ��block��LBPֱ��ͼ��
% Ȼ��49����ֱ��ͼ������������һ��������
% ÿ��block��ֱ��ͼ��59ά��ǰ58����uniform lbp��
% ���һ�������е�non-unifrom lbp������
function hists = lbp7x7hist(im)

    hists=[];
    if  (size(im,1) ~= 100 ||  size(im,2) ~= 100)
        disp('����ͼ�����Ϊ100x100��С');
        return ;
    end
    
    %58�� uniform lbp code
    uniform_codes=[0, 1, 2, 3, 4, 6, 7, 8, 12, 14, 15, 16, 24, 28, 30, 31, 32, 48, 56, 60, 62, 63, 64, 96, 112, 120, 124, 126, 127, 128, 129, 131, 135, 143, 159, 191, 192, 193, 195, 199, 207, 223, 224, 225, 227, 231, 239, 240, 241, 243, 247, 248, 249, 251, 252, 253, 254, 255];
    lbpimage = lbp(im);
    
    for blockr = 1:7
        for blockc = 1:7
            %ͳ��һ��block��ֱ��ͼ
            sub_lbp = lbpimage( ((blockr-1)*14 + 1):(blockr * 14), ((blockc-1)*14 + 1):(blockc * 14) );
            sub_256hist = imhist( uint8(sub_lbp));
            
            %ֻѡ���uniform patterns
            sub_hist=zeros(59,1);
            for codeid=1:size(uniform_codes,2)
                sub_hist(codeid) = sub_256hist( uniform_codes(codeid)+1);
            end
            sub_hist(59) = 14*14 - sum(sub_hist(1:58));
            hists = [hists; sub_hist];
        end
    end
