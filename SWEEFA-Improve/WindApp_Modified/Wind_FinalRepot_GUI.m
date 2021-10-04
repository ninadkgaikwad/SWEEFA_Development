function varargout = Wind_FinalRepot_GUI(varargin)
% WIND_FINALREPOT_GUI MATLAB code for Wind_FinalRepot_GUI.fig
%      WIND_FINALREPOT_GUI, by itself, creates a new WIND_FINALREPOT_GUI or raises the existing
%      singleton*.
%
%      H = WIND_FINALREPOT_GUI returns the handle to a new WIND_FINALREPOT_GUI or the handle to
%      the existing singleton*.
%
%      WIND_FINALREPOT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WIND_FINALREPOT_GUI.M with the given input arguments.
%
%      WIND_FINALREPOT_GUI('Property','Value',...) creates a new WIND_FINALREPOT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Wind_FinalRepot_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Wind_FinalRepot_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Wind_FinalRepot_GUI

% Last Modified by GUIDE v2.5 04-Jun-2016 17:10:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Wind_FinalRepot_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Wind_FinalRepot_GUI_OutputFcn, ...
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


% --- Executes just before Wind_FinalRepot_GUI is made visible.
function Wind_FinalRepot_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Wind_FinalRepot_GUI (see VARARGIN)

% Getting Wind GUI Main GUI Workspace
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Setting Global Variable for NEXT & Previous Buttons
global next4;
next4=1;

% Getting Solar PV System Rsults from Main GUI Workspace
PrjName=getappdata(Wind_GUI_MainPage,'PrjName');
PlantCapacity=getappdata(Wind_GUI_MainPage,'PlantCapacity');
Lat=getappdata(Wind_GUI_MainPage,'Lat');
Long=getappdata(Wind_GUI_MainPage,'Long');
Altitude=getappdata(Wind_GUI_MainPage,'Altitude');

TotalWTGOut=getappdata(Wind_GUI_MainPage,'TotalWTGOut');
TotalWTGPGrid=getappdata(Wind_GUI_MainPage,'TotalWTGPGrid');
TotalWTGOhmicLoss=getappdata(Wind_GUI_MainPage,'TotalWTGOhmicLoss');
TotalWTGTransLoss=getappdata(Wind_GUI_MainPage,'TotalWTGTransLoss');

% Setting Static Texts to Total Energy Results
set(handles.PrjName,'String',PrjName);
set(handles.PlantCapacity,'String',PlantCapacity);
set(handles.Lat,'String',Lat);
set(handles.Long,'String',Long);
set(handles.Altitude,'String',Altitude);

set(handles.TotalWTGOut,'String',TotalWTGOut);
set(handles.TotalWTGPGrid,'String',TotalWTGPGrid);
set(handles.TotalWTGOhmicLoss,'String',TotalWTGOhmicLoss);
set(handles.TotalWTGTransLoss,'String',TotalWTGTransLoss);

% Getting Month-Wise Energy Data from Main GUI Workspace
MonthWTGOut=getappdata(Wind_GUI_MainPage,'MonthWTGOut');
MonthWTGPGrid=getappdata(Wind_GUI_MainPage,'MonthWTGPGrid');
MonthWTGOhmicLoss=getappdata(Wind_GUI_MainPage,'MonthWTGOhmicLoss');
MonthWTGTransLoss=getappdata(Wind_GUI_MainPage,'MonthWTGTransLoss');

% Setting the UI Table with Month-Wise Energy Generation & Energy Losses in the PV System
a=cell(12,4);

for i=1:12
    a(i,1)={MonthWTGOut(1,i)};
end
set(handles.Table1,'Data',a);
for i=1:12
    a(i,2)={MonthWTGPGrid(1,i)};
end
set(handles.Table1,'Data',a);
for i=1:12
    a(i,3)={MonthWTGOhmicLoss(1,i)};
end
set(handles.Table1,'Data',a);
for i=1:12
    a(i,4)={MonthWTGTransLoss(1,i)};
end
set(handles.Table1,'Data',a);



% Creating the Opening BAR Graph for the REPORT (PVout)
axes(handles.G1);
bar(MonthWTGOut);
title('Month-Wise Energy Output from Wind Turbines');
ylabel('Energy Generated (kWh)');
set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        

% Choose default command line output for Wind_FinalRepot_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Wind_FinalRepot_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Wind_FinalRepot_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in PB1.
function PB1_Callback(hObject, eventdata, handles)
% hObject    handle to PB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Proramming NEXT Button
global next4;
if next4==4
    next4=0;
end 
next4=next4+1;

% Creating Switch Case for BAR Graph Display
switch next4
    case 1
        MonthWTGOut=getappdata(Wind_GUI_MainPage,'MonthWTGOut');
        axes(handles.G1);
        bar(MonthWTGOut);
        title('Month-Wise Energy Output from Wind Turbines');
        ylabel('Energy Generated (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});

        
    case 2
        MonthWTGPGrid=getappdata(Wind_GUI_MainPage,'MonthWTGPGrid');
        axes(handles.G1);
        bar(MonthWTGPGrid);
        title('Month-Wise Energy Output to Grid');
        ylabel('Energy Generated (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 3
        MonthWTGOhmicLoss=getappdata(Wind_GUI_MainPage,'MonthWTGOhmicLoss');
        axes(handles.G1);
        bar(MonthWTGOhmicLoss);
        title('Month-Wise Ohmic Loss');
        ylabel('Energy Generated (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 4
        MonthWTGTransLoss=getappdata(Wind_GUI_MainPage,'MonthWTGTransLoss');
        axes(handles.G1);
        bar(MonthWTGTransLoss);
        title('Month-Wise Transformer Loss');
        ylabel('Energy Generated (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});

end

% --- Executes on button press in PB2.
function PB2_Callback(hObject, eventdata, handles)
% hObject    handle to PB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Proramming NEXT Button
global next4;
if next4==1
    next4=5;
end 
next4=next4-1;

% Creating Switch Case for BAR Graph Display
switch next4
    case 1
        MonthWTGOut=getappdata(Wind_GUI_MainPage,'MonthWTGOut');
        axes(handles.G1);
        bar(MonthWTGOut);
        title('Month-Wise Energy Output from Wind Turbines');
        ylabel('Energy Generated (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});

        
    case 2
        MonthWTGPGrid=getappdata(Wind_GUI_MainPage,'MonthWTGPGrid');
        axes(handles.G1);
        bar(MonthWTGPGrid);
        title('Month-Wise Energy Output to Grid');
        ylabel('Energy Generated (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 3
        MonthWTGOhmicLoss=getappdata(Wind_GUI_MainPage,'MonthWTGOhmicLoss');
        axes(handles.G1);
        bar(MonthWTGOhmicLoss);
        title('Month-Wise Ohmic Loss');
        ylabel('Energy Generated (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 4
        MonthWTGTransLoss=getappdata(Wind_GUI_MainPage,'MonthWTGTransLoss');
        axes(handles.G1);
        bar(MonthWTGTransLoss);
        title('Month-Wise Transformer Loss');
        ylabel('Energy Generated (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});

end
