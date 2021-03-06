%%%%%%%%%%%%%%%%%%%%%
%%%      2011150209_贾慧明      %%%
%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%
%全局变量声明，主窗口FR
%%%%%%%%%%%%%%%%%%%%%
global FR;

%%%%%%%%%%%%%%%%%%%%%
%全局变量声明，用于展示信息的面板panel，每步操作展示不同的panel
%  openfile_panel：用于展示用户选择打开的文件
%  facedetection_panel：用于展示人脸粗定位的结果
%  eyesdetection_panel：用于展示粗定位下人眼识别的结果
%  facelocation_panel：用于展示通过人眼位置和人工控制参数定位的人脸结果
%  normalization_panel：显示resize后的用于检测人脸的结果
%  recognization_panel：显示原样本，结果样本和lbp统计图
%%%%%%%%%%%%%%%%%%%%%
global openfile_panel;
global facedetection_panel;
global eyesdetection_panel;
global facelocation_panel;
global normalization_panel;
global recognization_panel;

%%%%%%%%%%%%%%%%%%%%%
%全局变量声明，panel中的axes，用具展示每部操作的结果
%show1用于展示输入图像
%show2用于展示输出图像
%%%%%%%%%%%%%%%%%%%%%
global image_show;

global facedetection_panel_show1;
global facedetection_panel_show2;

global eyesdetection_panel_show1;
global eyesdetection_panel_show2;

global facelocation_panel_show1;
global facelocation_panel_show2;

global normalization_panel_show1;
global normalization_panel_show2;

global face_show;
global face_analysis;
global face_r_show;
global face_r_analysis;

%%%%%%%%%%%%%%%%%%%%%
%全局变量声明，按钮，用于控制流程
%  openfile_button：选择读入图片
%  facedetection_button：点击进行人脸检测
%  eyesdetection_button：点击进行人眼检测
%  facelocation_button：点击进行人脸重定位
%  normalization_button：点击进行resize
%  facerecognization_button： 点击进行识别
%%%%%%%%%%%%%%%%%%%%%
global openfile_button;
global facedetection_button;
global eyesdetection_button;
global facelocation_button;
global normalization_button;
global facerecognization_button;

FR=figure('NumberTitle', 'off', 'Name', '人脸与人眼检测','MenuBar','none','position',[100,100,575,500]);

image_show=axes;

 facedetection_panel_show1=axes;
 facedetection_panel_show2=axes;

 eyesdetection_panel_show1=axes;
 eyesdetection_panel_show2=axes;

 facelocation_panel_show1=axes;
 facelocation_panel_show2=axes;
  
normalization_panel_show1=axes;
normalization_panel_show2=axes;

face_show=axes;
face_analysis=axes;
face_r_show=axes;
face_r_analysis=axes;

u=uicontrol(gcf,'position',[0,460,575,40],'style','text','String','==人脸识别系统==','FontSize',20,'HorizontalAlignment','center','FontName','黑体');

%%%%%%%%%%%%%%%%%%%%%
%设置面板的样式，面板标题居中，初始化时只有用于展示原始图片的面板显示，其余全部影藏
%%%%%%%%%%%%%%%%%%%%%
 openfile_panel=uipanel(gcf,'position',[0.02,0,0.65,0.91],'BorderWidth',2,'Title','Image','TitlePosition','centertop');
 facedetection_panel=uipanel(gcf,'position',[0.02,0,0.65,0.91],'BorderWidth',2,'Title','facedetection','TitlePosition','centertop','Visible','off');
 eyesdetection_panel=uipanel(gcf,'position',[0.02,0,0.65,0.91],'BorderWidth',2,'Title','eyesdetection','TitlePosition','centertop','Visible','off');
 facelocation_panel=uipanel(gcf,'position',[0.02,0,0.65,0.91],'BorderWidth',2,'Title','facelocation','TitlePosition','centertop','Visible','off');
 normalization_panel=uipanel(gcf,'position',[0.02,0,0.65,0.91],'BorderWidth',2,'Title','normalization','TitlePosition','centertop','Visible','off');
 recognization_panel=uipanel(gcf,'position',[0.02,0,0.65,0.91],'BorderWidth',2,'Title','recognization','TitlePosition','centertop','Visible','off');

 
 uicontrol(facedetection_panel,'position',[0,170,350,40],'style','text','String','======人脸粗定位结果======','FontSize',13,'HorizontalAlignment','center','FontName','黑体');
uicontrol(eyesdetection_panel,'position',[0,170,350,40],'style','text','String','======人眼定位结果======','FontSize',13,'HorizontalAlignment','center','FontName','黑体');
uicontrol(facelocation_panel,'position',[0,170,350,40],'style','text','String','======人脸精确定位结果======','FontSize',13,'HorizontalAlignment','center','FontName','黑体');
uicontrol(normalization_panel,'position',[0,170,350,40],'style','text','String','======标准化结果======','FontSize',13,'HorizontalAlignment','center','FontName','黑体');


set(FR,'Resize','off');

%%%%%%%%%%%%%%%%%%%%%
%设置axes样式，隐藏坐标系，单纯用于图片展示
%%%%%%%%%%%%%%%%%%%%%
set(image_show,'parent',openfile_panel,'position',[0,0,1,1],'Visible','on','Color','w','xtick',[],'ytick',[]);

 set(facedetection_panel_show1,'parent',facedetection_panel,'position',[0,0.5,1,0.5],'Color','w','xtick',[],'ytick',[]);
 set(facedetection_panel_show2,'parent',facedetection_panel,'position',[0,0,1,0.4],'Color','w','xtick',[],'ytick',[]);
 
 set(eyesdetection_panel_show1,'parent',eyesdetection_panel,'position',[0,0.5,1,0.5],'Color','w','xtick',[],'ytick',[]);
 set(eyesdetection_panel_show2,'parent',eyesdetection_panel,'position',[0,0,1,0.4],'Color','w','xtick',[],'ytick',[]);
 
 set(facelocation_panel_show1,'parent',facelocation_panel,'position',[0,0.5,1,0.5],'Color','w','xtick',[],'ytick',[]);
 set(facelocation_panel_show2,'parent',facelocation_panel,'position',[0,0,1,0.4],'Color','w','xtick',[],'ytick',[]);
 
  set(normalization_panel_show1,'parent',normalization_panel,'position',[0,0.5,1,0.5],'Color','w','xtick',[],'ytick',[]);
 set(normalization_panel_show2,'parent',normalization_panel,'position',[0,0,1,0.4],'Color','w','xtick',[],'ytick',[]);

set(face_show,'parent',recognization_panel,'position',[0,0.5,0.5,0.4],'Visible','on','Color','w','xtick',[],'ytick',[]);
set(face_analysis,'parent',recognization_panel,'position',[0.55,0.5,0.4,0.4],'Visible','on','Color','w','xtick',[],'ytick',[]);
set(face_r_show,'parent',recognization_panel,'position',[0,0,0.5,0.4],'Visible','on','Color','w','xtick',[],'ytick',[]);
set(face_r_analysis,'parent',recognization_panel,'position',[0.55,0,0.4,0.4],'Visible','on','Color','w','xtick',[],'ytick',[]);

%%%%%%%%%%%%%%%%%%%%%
%设置button样式，初始化时只有openfile的样式可点击，其余通过initiate的函数来完成流程控制
%%%%%%%%%%%%%%%%%%%%%

%         [f,p]=uigetfile('*.*','选择图像文件','myFace.jpg');
%         in=imread(strcat(p,f)); 
%         ined=imresize(in,[100 100]);
%         imwrite(ined,'103.png');
                
openfile_button=uicontrol(gcf,'Style','push','position',[400,400,150,50],'string','Open File');
facedetection_button=uicontrol(gcf,'Style','push','position',[400,320,150,50],'string','Face Detection','enable','off');
eyesdetection_button=uicontrol(gcf,'Style','push','position',[400,240,150,50],'string','Eyes Detection','enable','off');
facelocation_button=uicontrol(gcf,'Style','push','position',[400,160,150,50],'string','Face Location','enable','off');
normalization_button=uicontrol(gcf,'Style','push','position',[400,80,150,50],'string','Normalization','enable','off');
facerecognization_button=uicontrol(gcf,'Style','push','position',[400,0,150,50],'string','Recognization','enable','off');

%%%%%%%%%%%%%%%%%%%%%
%button中，callback属性的值
%initiate()执行相应功能前完成得初始化工作
%finish() 完成相应功能后进一步完成后续操作实现流程控制
%%%%%%%%%%%%%%%%%%%%%

str_callback_openfile_button='initiate(openfile_button);image=openfile();finish(openfile_button);';
str_callback_facedetection_button='initiate(facedetection_button);[face,facerange]=facedetection(image);finish(facedetection_button);';
str_callback_eyesdetection_button='initiate(eyesdetection_button);eyesrange=eyesdetection(face),finish(eyesdetection_button);';
str_callback_facelocation_button='initiate(facelocation_button);locatedface=facelocation(image,eyesrange,facerange);finish(facelocation_button);';
str_callback_normalization_button='initiate(normalization_button);normalizedFace=normalization(locatedface);finish(normalization_button);';
str_callback_facerecognization_button='initiate(facerecognization_button);recognization(normalizedFace);finish(facerecognization_button);';

%%%%%%%%%%%%%%%%%%%%%
%button按钮callback的设置
%%%%%%%%%%%%%%%%%%%%%

set(openfile_button,'callback',str_callback_openfile_button);
set(facedetection_button,'callback',str_callback_facedetection_button);
set(eyesdetection_button,'callback',str_callback_eyesdetection_button);
set(facelocation_button,'callback',str_callback_facelocation_button);
set(normalization_button,'callback',str_callback_normalization_button);
set(facerecognization_button,'callback',str_callback_facerecognization_button);

%%%%%%%%%%%%%%%%%%%%%
%button按钮样式的设置
%%%%%%%%%%%%%%%%%%%%%

set(openfile_button,'FontSize',12,'FontName','微软雅黑','FontWeight','bold','ForegroundColor',[0.3 0.3 0.3]);
set(facedetection_button,'FontSize',12,'FontName','微软雅黑','FontWeight','bold','ForegroundColor',[0.3 0.3 0.3]);
set(eyesdetection_button,'FontSize',12,'FontName','微软雅黑','FontWeight','bold','ForegroundColor',[0.3 0.3 0.3]);
set(facelocation_button,'FontSize',12,'FontName','微软雅黑','FontWeight','bold','ForegroundColor',[0.3 0.3 0.3]);
set(normalization_button,'FontSize',12,'FontName','微软雅黑','FontWeight','bold','ForegroundColor',[0.3 0.3 0.3]);
set(facerecognization_button,'FontSize',12,'FontName','微软雅黑','FontWeight','bold','ForegroundColor',[0.3 0.3 0.3]);
