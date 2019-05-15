function varargout = demo3(varargin)
% DEMO3 MATLAB code for demo3.fig
%      DEMO3, by itself, creates a new DEMO3 or raises the existing
%      singleton*.
%
%      H = DEMO3 returns the handle to a new DEMO3 or the handle to
%      the existing singleton*.
%
%      DEMO3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMO3.M with the given input arguments.
%
%      DEMO3('Property','Value',...) creates a new DEMO3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before demo3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to demo3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demo3

% Last Modified by GUIDE v2.5 14-May-2019 15:25:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demo3_OpeningFcn, ...
                   'gui_OutputFcn',  @demo3_OutputFcn, ...
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


% --- Executes just before demo3 is made visible.
function demo3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to demo3 (see VARARGIN)

% Choose default command line output for demo3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes demo3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = demo3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button1.
function button1_Callback(hObject, eventdata, handles)
% hObject    handle to button1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
demo1;

% --- Executes on button press in button2.
function button2_Callback(hObject, eventdata, handles)
% hObject    handle to button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
demo2;

% --------------------------------------------------------------------
function View_Callback(hObject, eventdata, handles)
% hObject    handle to View (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    d = dialog('Position',[300 300 250 150],'Name','关于...');
    a = {'author:PEIXINXIN';'pei.xx@neusoft.com';'QQ:596887275'};
    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[20 40 210 60],...
               'String',a);
   movegui(d, 'center');

% --------------------------------------------------------------------
function helpDocument_Callback(hObject, eventdata, handles)
% hObject    handle to helpDocument (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    d = dialog('Position',[300 300 250 150],'Name','helpDocument');
    a = {'1,项目名称为必填项';'2,请先检查文件数据是否匹配';'3,有问题查看了解更多'};
    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[20 40 210 70],...
               'String',a);
   btn = uicontrol('Parent',d,...
   'Position',[85 20 70 25],...
   'String','了解更多',...
   'Callback','web(''https://www.jianshu.com/p/09bbfcbad62f'',''-browser'');');
   movegui(d, 'center');

% --------------------------------------------------------------------
function View1_Callback(hObject, eventdata, handles)
% hObject    handle to View1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function View2_Callback(hObject, eventdata, handles)
% hObject    handle to View2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
demo1;

% --------------------------------------------------------------------
function View3_Callback(hObject, eventdata, handles)
% hObject    handle to View3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
demo2;



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


% --------------------------------------------------------------------
function oneView3_Callback(hObject, eventdata, handles)
% hObject    handle to oneView3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
demo5;
