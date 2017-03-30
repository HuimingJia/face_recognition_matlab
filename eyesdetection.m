function [ eyesRanges ] = eyesdetection( inputFace )
%UNTITLED function explain
%
%   INPUT:
%   inputFace£ºdetected human face from rough location
%
%   OUTPUT:
%   eyesRanges£ºLocation of eyes on human face
global eyesdetection_panel_show1;
global eyesdetection_panel_show2;


FaceDetector =vision.CascadeObjectDetector('EyePairSmall');
BB=step(FaceDetector,inputFace)
hold on
resultNumber=size(BB,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for optimizing errors in human eyes detection
%result£ºa number of pairs of eyes from human face detection 
%principle£º
%1.the situation that result is 1 and nostrils and eyebrows are returns as eyes will not be considered
%2.if the number is 2, the detected eyes might be eyes, nostrils, or eyebrows
%if the detected eyes are eyes and eyebrows, their widths are similar and the smaller bellow are eyes
%if the detected eyes are eyes and nostrils, their widths are more different and the bigger above are eyes
%3.if the number is 3,we will take the middle as eyes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(resultNumber==1)
    resultRanges=BB;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%.the situation that result is 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(resultNumber==2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%.if widths of both are smaller than 1.5, the detected eyes are eyes and eyebrows, we should take the one with bigger y-coordinate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if(BB(1,3)/BB(2,3)<1.5 && BB(2,3)/BB(1,3)<1.5)
        if(BB(1,2)>BB(2,2))
            resultRanges=BB(1,:);
        else
            resultRanges=BB(2,:);
        end      
    else
        if(BB(1,2)>BB(2,2))
            resultRanges=BB(2,:);
        else
            resultRanges=BB(1,:);
        end   
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%the situation that result is 3, y-coordinate is the middle one
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
if(resultNumber==3)
   if( (resultRanges(1,2)>resultRanges(2,2) && resultRanges(2,2) >resultRanges(3,2)) || (resultRanges(3,2)>resultRanges(2,2) && resultRanges(2,2) >resultRanges(1,2)))
       resultRanges=BB(2,2);             
   end

   if( (resultRanges(3,2)>resultRanges(1,2) && resultRanges(1,2) >resultRanges(2,2) ) || (resultRanges(2,2)>resultRanges(1,2) && resultRanges(1,2) >resultRanges(3,2) ))
       resultRanges=BB(1,2);             
   end

  if( (resultRanges(1,2)>resultRanges(3,2) && resultRanges(3,2) >resultRanges(2,2) ) || (resultRanges(2,2)>resultRanges(3,2) && resultRanges(3,2) >resultRanges(1,2) ))
       resultRanges=BB(3,2);             
   end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%.the situation that result is 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(resultNumber==0)
errordlg('This face is not available for recognization','Error','non-modal');      
end


eyesRanges=resultRanges;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%x_s: start x-coordinate of detected eyes
%x_e: end x-coordinate of detected eyes
%y_s: start y-coordinate of detected eyes
%y_e: end y-coordinate of detected eyes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_s=resultRanges(1,1);
x_e=resultRanges(1,1)+resultRanges(1,3);
y_s=resultRanges(1,2);
y_e=resultRanges(1,2)+resultRanges(1,4);
eyes=inputFace(y_s:y_e,x_s:x_e);

imshow(inputFace,'parent',eyesdetection_panel_show1);
imshow(eyes,'parent',eyesdetection_panel_show2);

end

