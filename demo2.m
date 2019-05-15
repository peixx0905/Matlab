function varargout = demo2(varargin)
% DEMO2 MATLAB code for demo2.fig
%      DEMO2, by itself, creates a new DEMO2 or raises the existing
%      singleton*.
%
%      H = DEMO2 returns the handle to a new DEMO2 or the handle to
%      the existing singleton*.
%
%      DEMO2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMO2.M with the given input arguments.
%
%      DEMO2('Property','Value',...) creates a new DEMO2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before demo2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to demo2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demo2

% Last Modified by GUIDE v2.5 28-Apr-2019 16:42:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demo2_OpeningFcn, ...
                   'gui_OutputFcn',  @demo2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before demo2 is made visible.
function demo2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to demo2 (see VARARGIN)

% Choose default command line output for demo2
handles.output = hObject;

set(handles.edit1,'String',pwd);
set(handles.edit2,'String',pwd);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes demo2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = demo2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%% --- Executes on button press in button1.
function button1_Callback(hObject, eventdata, handles)
% hObject    handle to button1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = uigetdir; %进入文件夹选框
if a == 0 
else
    set(handles.edit1,'String',a);
    %把选择内容放入文本框中
end


%% --- Executes on button press in button2.
function button2_Callback(hObject, eventdata, handles)
% hObject    handle to button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = uigetdir; %进入文件夹选框
if a == 0 
else
    set(handles.edit2,'String',a);
    %把选择内容放入文本框中
end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button3.
function button3_Callback(hObject, eventdata, handles)
% hObject    handle to button3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%获取GUI输入的数据，模型地址和项目名称

pathModel = get(handles.edit1,'String');
pathExcel = get(handles.edit2,'String');
pName = get(handles.edit3,'String');
[a,modelList,excelList] = check1(pathModel,pathExcel);
disp('-------开始检查.........-------------');
try
    modelName = clName(modelList,1,4); %去掉前后缀
    excelName = clName(excelList,length(pName)+2,5); %去掉前后缀
    if a ==0
        [len1,~] = size(modelName);
        [len2,~] = size(excelName);
        %% 比较模型和数据个数的多少，并找到缺失的数据或模型
        if len1>len2
            disp('模型多于数据');
            for i=1:len1
                flag=0;
                for j = 1:len2
                    if strcmp(modelName{i,1},excelName{j,1})
                        flag=1;
                    end
                end
                if flag==0
                    disp(['未找到-',modelName{i,1},'-相对应的EXCEL数据']);
                end
            end
        else
            disp('数据多于模型');
            for i=1:len2
                flag=0;
                for j = 1:len1
                    if strcmp(excelName{i,1},modelName{j,1})
                        flag=1;
                    end
                end
                if flag==0
                    disp(['未找到-',excelName{i,1},'-相对应的MODEL数据']);
                end
            end
        end
               
        h = errordlg('文件个数不匹配','错误'); 
    else
        x = check2(pathModel,pathExcel,modelList,excelList,modelName,excelName);
        if x == 1
            h = errordlg('有错误，请在命令窗口查看','错误'); 
        else
            h = msgbox('没问题！棒棒哒','检查');
        end
    end
catch
    
     h = errordlg('未找到文件','错误'); 
end


% --- Executes on button press in button4.
function button4_Callback(hObject, eventdata, handles)
% hObject    handle to button4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pathModel = get(handles.edit1,'String');
pathExcel = get(handles.edit2,'String');
pName = get(handles.edit3,'String');

oldFolder = cd(pathModel);

[~,modelList,excelList] = check1(pathModel,pathExcel);
modelName = clName(modelList,1,4); %去掉前后缀
excelName = clName(excelList,length(pName)+2,5); %去掉前后缀
%对象的个数（多余，第一步检测已经完成）
[lengthSlx,~] = size(modelName);
[lengthXlsx,~] = size(excelName);
    %若个数相等，提取excel列表数据
    if lengthSlx == lengthXlsx
        dataList = cell(lengthSlx,1);
%---------------------------------------------------------------------
        f = waitbar(0,'Loading...','Name','数据读取...',...
            'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

        setappdata(f,'canceling',0);
        formatSpec = 'The current excel is: %d/%d';
        %提取excel列表数据并储存
        for i = 1:lengthXlsx
           %--------进度条------------
            if getappdata(f,'canceling')
                break
            end
            waitbar(i/lengthXlsx,f,sprintf(formatSpec,i,lengthXlsx));
           %-------------------------          
            dataList{i,1} = readExcelData([pathExcel,'\',excelList{i}]);
        end
        
        delete(f);
        %搜索所有模型
%---------------------------------------------------------------------------------
        f2 = waitbar(0,'Loading...','Name','写入进度...',...
            'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

        setappdata(f2,'canceling',0);
        formatSpec2 = 'The current model is: %d/%d';
        for i =1:lengthSlx
            %加载系统，写入数据，保存模型，关闭模型
            if strcmpi(modelName{i},excelName{i})
               load_system(modelList{i});
               %--------进度条------------
                if getappdata(f2,'canceling')
                    break
                end
                waitbar(i/lengthSlx,f2,sprintf(formatSpec2,i,lengthSlx));
               %-------------------------
              % disp(['===========',num2str(i),'/',num2str(lengthSlx),'=================']); 
               try
               ioWriteDiscription(dataList{i,1},modelName{i});
               catch
                   disp(['第---',num2str(i),'---个模型---',modelName{i},'---数据有错误,写入失败']);
               end
               save_system(modelList{i});
               close_system(modelList{i});
            end    
        end
        pause(.5);
        delete(f2);
    end
    
cd(oldFolder);
disp('===========Game Over=================');  


   
    
function [a,modelName,excelName] = check1(pathModel,pathExcel)%检查所选文件个数是否相等
%oldFolder = cd(pathModel);
%进入模型文件夹，保存现有文件夹

%计算文件个数
[modelName, len1]= fileProcess(pathModel,'slx');
[excelName, len2]= fileProcess(pathExcel,'xlsx');
if len1==len2
    a = 1;
else
    a = 0;
end

function x = check2(pathModel,pathExcel,modelList,excelList,modelName,excelName)%检查每个模型内接口数与所提供的数据是否一致
%进入模型文件夹，保存现有文件夹
%获取所有数据
x = 0;
[len,~] = size(modelList);
dataList = cell(len,1);

%-----------------进度条------------------
        f4 = waitbar(0,'Loading...','Name','数据读取...',...
            'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

        setappdata(f4,'canceling',0);
        formatSpec4 = 'The current excel is: %d/%d';
%------------------------------------------------------
 for i = 1:len
          dataList{i,1} = readExcelData([pathExcel,'\',excelList{i}]);
            %--------进度条------------
            if getappdata(f4,'canceling')
                break;
            end
            waitbar(i/len,f4,sprintf(formatSpec4,i,len));
            %-------------------------
 end
 
 delete(f4);
 
oldFolder = cd(pathModel);
%查找个数  
%-----------------进度条------------------
        f1 = waitbar(0,'Loading...','Name','检查进度...',...
            'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

        setappdata(f1,'canceling',0);
        formatSpec1 = 'The current model is: %d/%d';
%------------------------------------------------------
for i = 1:len
    [num1,~] = size(dataList{i,1});
   %加载系统，比较数据，保存模型，关闭模型
    if strcmpi(modelName{i},excelName{i})
       load_system(modelName{i});
        %--------进度条------------
        if getappdata(f1,'canceling')
            break
        end
        waitbar(i/len,f1,sprintf(formatSpec1,i,len));
        %-------------------------
        % 加载模型，查找输入输出个数
        mdlsys = modelName{i};
        inBlockHandle=find_system(mdlsys,'FindAll','on','SearchDepth','1','BlockType','Inport');
        outBlockHandle=find_system(mdlsys,'FindAll','on','SearchDepth','1','BlockType','Outport');
        [inbknum,~]=size(inBlockHandle);
        [outbknum,~]=size(outBlockHandle);
        if inbknum == 1
            inbkName{1,1}=get(inBlockHandle,'Name');
        else
            inbkName=get(inBlockHandle,'Name');
        end
        
        if outbknum == 1
            outbkName{1,1}=get(outBlockHandle,'Name');
        else
            outbkName=get(outBlockHandle,'Name');
        end
        bkname = vertcat(inbkName,outbkName);
        num2 = inbknum + outbknum;
        s =dataList{i,1}(:,3);
         if num1 ~= num2
             x = 1;
             disp(['第---',num2str(i),'---个模型---',modelName{i},'---数据个数有误']);
         else
             for j = 1:num1
                 if ~strcmp(bkname{j,1},s{j,1})
                     x = 1;
                     if i<=inbknum
                         disp(['第---',num2str(i),'---个模型---',modelName{i},'---第-',num2str(j),'个输入接口数据有误']);
                     else
                         disp(['第---',num2str(i),'---个模型---',modelName{i},'---第-',num2str(j-inbknum),'个输出接口数据有误']);
                     end
                         
                 end
             end
             
         end
         clear inbkName outbkName bkname;
       save_system(modelList{i});
       close_system(modelList{i});
    end   
end
pause(.5);
delete(f1);
cd(oldFolder);



 

function cellName = clName(cellIN,numPrefix,numSuffix) %去除前缀和后缀
 [len, ~] = size(cellIN);
 
for i= 1:len
    gscName = cellIN{i};%第一个文件名称
    [~, siz] = size(gscName); %第一个文件名称长度
    name = gscName(numPrefix:siz-numSuffix); %去掉前后缀
    Namecell{i} = name;
   cellName = Namecell';
end
%end




    
        
function [fileName, len]= fileProcess(path,suffix) %获取文件夹内指定后缀名文件个数及列表
%获取文件夹内指定后缀名文件
files = dir([path,'\*.',suffix]);
[len,~] = size(files);
%创建空的元组
fileName = cell(len,1);
%文件名复制到新的元组并返回
for i = 1:len
    fileName{i,1} = files(i).name;
end
%end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dataCell = readExcelData(name)
    [~,~,RAW] = xlsread(name,3); %从表格读取数组
    %获取有效数据并去表头
    dn = deleteNan(RAW);
    dataCelladdHeader = deleteEmpty(dn);
    [heightDataCelladdHeader, ] = size(dataCelladdHeader);
    dataCell = dataCelladdHeader(2:heightDataCelladdHeader,:);
%end

function newcell = deleteNan(cell)

    [height, width] = size(cell); %获取数组尺寸
    
    %检测数组中NaN元素，并替换
    for i = 1 : height
        for j = 1 : width
            if isnan(cell{i, j})
                cell{i, j}= '';
            end
        end
    end
    
    newcell = cell;
    
%end

function newcell = deleteEmpty(cell) %数组去空
    
    [height, ~] = size(cell);   %获取数组尺寸
 
    %检查有效数据长度
    for cnt = 1 : height           
        if isempty(cell{cnt, 3})
            break;
        end
    end
    
    if cnt == height
        newcell = cell(1:cnt,:);  %获取有效数据
    else
        newcell = cell(1:cnt-1,:);
    end

%end


function ioWriteDiscription(cell,mdlName)
%获取当前模型名
% mdlsys=gcs; 
mdlsys = mdlName;
%disp(['Current Model is ','<<',mdlsys,'>>']);


%disp('===========Find Handle of IO =================');
%找所有的input和output
inBlockHandle=find_system(mdlsys,'FindAll','on','SearchDepth','1','BlockType','Inport');
outBlockHandle=find_system(mdlsys,'FindAll','on','SearchDepth','1','BlockType','Outport');

%输入输入接口个数
[inbknum,~]=size(inBlockHandle);
[outbknum,~]=size(outBlockHandle);
%拆分数组为输入，输出两个数组
inCell=cell(1:inbknum,:);
outCell=cell(1+inbknum:inbknum+outbknum,:);

[lencell,~]=size(cell);
if lencell==(inbknum+outbknum)
    % ioBlockHandle = [inblockhandle;outblockhandle];
    % ioName = get(ioBlockHandle,'Name');

    % 获取输入信号名称
    inbkName=get(inBlockHandle,'Name');
    outbkName=get(outBlockHandle,'Name');
    % inbktype=get(inblockhandle,'OutDataTypeStr');
    % outbktype=get(outblockhandle,'OutDataTypeStr');
    % inbksize=get(inblockhandle,'PortDimensions');
    % outbksize=get(outblockhandle,'PortDimensions');
    % inbkDesp=get(inblockhandle,'Description');
    % outbkDesp=get(outblockhandle,'Description');
    %disp('===========Start IO Description Write=================');
    %同名判断，然后给输入写入注释
    if inbknum~=0
            for i = 1:inbknum
                %整合表格9-15列的值
                %---------1------------
                factorData = inCell{i,9};
                if isempty(factorData)
                    factor = '*';
                else
                    factor = all2str(factorData);
                end
                %---------2------------
                offsetData = inCell{i,10};
                if isempty(offsetData)
                    offset = '*';
                else
                    offset = all2str(offsetData);
                end
                %---------3------------
                unitData = inCell{i,11};
                if isempty(unitData)
                    unit = '*';
                else
                    unit = all2str(unitData);
                end
                %---------4------------
                maxData = inCell{i,12};
                if isempty(maxData)
                    max = '*';
                else
                    max = all2str(maxData);
                end
                %---------5------------
                minData = inCell{i,13};
                if isempty(minData)
                    min = '*';
                else
                    min = all2str(minData);
                end
                %--------6-------------
                descripData = inCell{i,14};
                if isempty(descripData)
                    descrip = '*';
                else
                    descrip = all2str(descripData);
                end
                %---------7------------
                commentData = inCell{i,15};
                if isempty(commentData)
                    comment = '*';
                else
                    comment = all2str(commentData);
                end
                %---------------------    
                %整合字符串
                discription = [factor, ' # ',offset, ' # ', unit, ' # ', max, ' # ', min, ' # ',descrip,' # ',comment];
                %写入
                if inbknum == 1 %输出一个信号是，inbkName不是元组
                        if strcmpi(inbkName,inCell{i,3})
                           set_param(inBlockHandle(i), 'Description',discription);
                        else
                          disp(['模型',mdlsys,'第---1---个输入接口数据有误']);
                        end
                else  %输出不是一个信号时，outbkName是元组
                       if strcmpi(inbkName{i},inCell{i,3})
                           set_param(inBlockHandle(i), 'Description',discription);
                       else
                           disp(['模型',mdlsys,'第---',num2str(i),'---个输入接口数据有误']);
                       end 
                end

            end
    end
    %同名判断，然后给输出写入注释
    if outbknum~=0
        for i = 1:outbknum
            %整合表格9-15列的值
             %---------1------------
                factorData = outCell{i,9};
                if isempty(factorData)
                    factor = '*';
                else
                    factor = all2str(factorData);
                end
                %---------2------------
                offsetData = outCell{i,10};
                if isempty(offsetData)
                    offset = '*';
                else
                    offset = all2str(offsetData);
                end
                %---------3------------
                unitData = outCell{i,11};
                if isempty(unitData)
                    unit = '*';
                else
                    unit = all2str(unitData);
                end
                %---------4------------
                maxData = outCell{i,12};
                if isempty(maxData)
                    max = '*';
                else
                    max = all2str(maxData);
                end
                %---------5------------
                minData = outCell{i,13};
                if isempty(minData)
                    min = '*';
                else
                    min = all2str(minData);
                end
                %--------6-------------
                descripData = outCell{i,14};
                if isempty(descripData)
                    descrip = '*';
                else
                    descrip = all2str(descripData);
                end
                %---------7------------
                commentData = outCell{i,15};
                if isempty(commentData)
                    comment = '*';
                else
                    comment = all2str(commentData);
                end
            %---------------------    
            %整合字符串
            discription = [factor, ' # ',offset, ' # ', unit, ' # ', max, ' # ', min, ' # ',descrip,' # ',comment];
            %写入
            if outbknum == 1  %输出一个信号是，outbkName不是元组
                if strcmpi(outbkName,outCell{i,3})
                   set_param(outBlockHandle(i), 'Description',discription);
                else
                    disp(['模型',mdlsys,'第---1---个输出接口数据有误']);    
                end
            else    
                   %输出不是一个信号是，outbkName是元组
                if strcmpi(outbkName{i},outCell{i,3})
                   set_param(outBlockHandle(i), 'Description',discription);
                else
                   disp(['模型',mdlsys,'第---',num2str(i),'---个输出接口数据有误']);
                end
            end    
        end
    end 
else
disp(['第---',num2str(i),'---个模型---',mdlsys,'---数据有错误,写入失败']);
end
%disp('===========IO Description Write End=================')
% save(modelsys)
%end

function out = all2str(in)
    inType = class(in); %显示数据类型
    %如果为数字类型，则转为字符串
    if strcmpi(inType,'double')||strcmpi(inType,'single')||strcmpi(inType,'int8')||strcmpi(inType,'int16')||strcmpi(inType,'int32')||strcmpi(inType,'int64')||strcmpi(inType,'uint8')||strcmpi(inType,'uint16')||strcmpi(inType,'uint32')||strcmpi(inType,'uint64')
        out = num2str(in);
    else
        out = in;
    end
    %end
