function varargout = Solar_App_FinalReport_GUI(varargin)
% SOLAR_APP_FINALREPORT_GUI MATLAB code for Solar_App_FinalReport_GUI.fig
%      SOLAR_APP_FINALREPORT_GUI, by itself, creates a new SOLAR_APP_FINALREPORT_GUI or raises the existing
%      singleton*.
%
%      H = SOLAR_APP_FINALREPORT_GUI returns the handle to a new SOLAR_APP_FINALREPORT_GUI or the handle to
%      the existing singleton*.
%
%      SOLAR_APP_FINALREPORT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOLAR_APP_FINALREPORT_GUI.M with the given input arguments.
%
%      SOLAR_APP_FINALREPORT_GUI('Property','Value',...) creates a new SOLAR_APP_FINALREPORT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Solar_App_FinalReport_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Solar_App_FinalReport_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Solar_App_FinalReport_GUI

% Last Modified by GUIDE v2.5 10-Nov-2015 12:35:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Solar_App_FinalReport_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Solar_App_FinalReport_GUI_OutputFcn, ...
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


% --- Executes just before Solar_App_FinalReport_GUI is made visible.
function Solar_App_FinalReport_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Solar_App_FinalReport_GUI (see VARARGIN)

% Setting Global Variable for NEXT & Previous Buttons
global next;
next=1;

% Getting Solar PV System Rsults from Main GUI Workspace
PrjName=getappdata(Solar_APP_Main_GUI,'PrjName');
PlantCapacity=getappdata(Solar_APP_Main_GUI,'PlantCapacity');
Lat=getappdata(Solar_APP_Main_GUI,'Lat');
Long=getappdata(Solar_APP_Main_GUI,'Long');

TotalPVout=getappdata(Solar_APP_Main_GUI,'TotalPVout');
TotalINVpin=getappdata(Solar_APP_Main_GUI,'TotalINVpin');
TotalINVpout=getappdata(Solar_APP_Main_GUI,'TotalINVpout');
TotalPgrid=getappdata(Solar_APP_Main_GUI,'TotalPgrid');
TotalArrayMismatchLoss=getappdata(Solar_APP_Main_GUI,'TotalArrayMismatchLoss');
TotalShadingLoss=getappdata(Solar_APP_Main_GUI,'TotalShadingLoss');
TotalLIDLoss=getappdata(Solar_APP_Main_GUI,'TotalLIDLoss');
TotalOhmicLoss=getappdata(Solar_APP_Main_GUI,'TotalOhmicLoss');
TotalInverterLoss=getappdata(Solar_APP_Main_GUI,'TotalInverterLoss');
TotalTrackerLoss=getappdata(Solar_APP_Main_GUI,'TotalTrackerLoss');
TotalTransformerLoss=getappdata(Solar_APP_Main_GUI,'TotalTransformerLoss');

% Setting Static Texts to Total Energy Results
set(handles.PrjName,'String',PrjName);
set(handles.PlantCapacity,'String',PlantCapacity);
set(handles.Lat,'String',Lat);
set(handles.Long,'String',Long);

set(handles.TotalPVout,'String',TotalPVout);
set(handles.TotalINVpin,'String',TotalINVpin);
set(handles.TotalINVpout,'String',TotalINVpout);
set(handles.TotalPgrid,'String',TotalPgrid);

set(handles.TotalArrayMismatchLoss,'String',TotalArrayMismatchLoss);
set(handles.TotalShadingLoss,'String',TotalShadingLoss);
set(handles.TotalLIDLoss,'String',TotalLIDLoss);
set(handles.TotalOhmicLoss,'String',TotalOhmicLoss);
set(handles.TotalInverterLoss,'String',TotalInverterLoss);
set(handles.TotalTrackerLoss,'String',TotalTrackerLoss);
set(handles.TotalTransformerLoss,'String',TotalTransformerLoss);

% Getting Month-Wise Energy Data from Main GUI Workspace
MonthPVout=getappdata(Solar_APP_Main_GUI,'MonthPVout');
MonthINVpin=getappdata(Solar_APP_Main_GUI,'MonthINVpin');
MonthINVpout=getappdata(Solar_APP_Main_GUI,'MonthINVpout');
MonthPgrid=getappdata(Solar_APP_Main_GUI,'MonthPgrid');
MonthArrayMismatchLoss=getappdata(Solar_APP_Main_GUI,'MonthArrayMismatchLoss');
MonthShadingLoss=getappdata(Solar_APP_Main_GUI,'MonthShadingLoss');
MonthLIDLoss=getappdata(Solar_APP_Main_GUI,'MonthLIDLoss');
MonthOhmicLoss=getappdata(Solar_APP_Main_GUI,'MonthOhmicLoss');
MonthInverterLoss=getappdata(Solar_APP_Main_GUI,'MonthInverterLoss');
MonthTrackerLoss=getappdata(Solar_APP_Main_GUI,'MonthTrackerLoss');
MonthTransformerLoss=getappdata(Solar_APP_Main_GUI,'MonthTransformerLoss');

% Setting the UI Table with Month-Wise Energy Generation & Energy Losses in the PV System
a=cell(12,11);

for i=1:12
    a(i,1)={MonthPVout(1,i)};
end
set(handles.Table1,'Data',a);
for i=1:12
    a(i,2)={MonthINVpin(1,i)};
end
set(handles.Table1,'Data',a);
for i=1:12
    a(i,3)={MonthINVpout(1,i)};
end
set(handles.Table1,'Data',a);
for i=1:12
    a(i,4)={MonthPgrid(1,i)};
end
set(handles.Table1,'Data',a);
for i=1:12
    a(i,5)={MonthArrayMismatchLoss(1,i)};
end
set(handles.Table1,'Data',a);
for i=1:12
    a(i,6)={MonthLIDLoss(1,i)};
end
set(handles.Table1,'Data',a);
for i=1:12
    a(i,7)={MonthShadingLoss(1,i)};
end
set(handles.Table1,'Data',a);
for i=1:12
    a(i,8)={MonthOhmicLoss(1,i)};
end
set(handles.Table1,'Data',a);
for i=1:12
    a(i,9)={MonthInverterLoss(1,i)};
end
set(handles.Table1,'Data',a);
for i=1:12
    a(i,10)={MonthTrackerLoss(1,i)};
end
set(handles.Table1,'Data',a);
for i=1:12
    a(i,11)={MonthTransformerLoss(1,i)};
end
set(handles.Table1,'Data',a);

% Creating the Opening BAR Graph for the REPORT (PVout)
axes(handles.G1);
bar(MonthPVout);
title('Month-Wise Energy Output from PV Array');
ylabel('Energy Generated (kWh)');
set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        

% Choose default command line output for Solar_App_FinalReport_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Solar_App_FinalReport_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Solar_App_FinalReport_GUI_OutputFcn(hObject, eventdata, handles) 
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
% a={1 2 ;3 1};
% set(handles.Table1,'Data',a);

% Proramming NEXT Button
global next;
if next==11
    next=0;
end 
next=next+1;

% Creating Switch Case for BAR Graph Display
switch next
    case 1
        MonthPVout=getappdata(Solar_APP_Main_GUI,'MonthPVout');
        axes(handles.G1);
        bar(MonthPVout);
        title('Month-Wise Energy Output from PV Array');
        ylabel('Energy Generated (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});

        
    case 2
        MonthINVpin=getappdata(Solar_APP_Main_GUI,'MonthINVpin');
        axes(handles.G1);
        bar(MonthINVpin);
        title('Month-Wise Energy Input to Inverters from PV Array');
        ylabel('Energy Generated (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 3
        MonthINVpout=getappdata(Solar_APP_Main_GUI,'MonthINVpout');
        axes(handles.G1);
        bar(MonthINVpout);
        title('Month-Wise Energy Output from Inverters');
        ylabel('Energy Generated (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 4
        MonthPgrid=getappdata(Solar_APP_Main_GUI,'MonthPgrid');
        axes(handles.G1);
        bar(MonthPgrid);
        title('Month-Wise Energy Output to Grid');
        ylabel('Energy Generated (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 5
        MonthArrayMismatchLoss=getappdata(Solar_APP_Main_GUI,'MonthArrayMismatchLoss');
        axes(handles.G1);
        bar(MonthArrayMismatchLoss);
        title('Month-Wise Energy Loss due to Array Mismatch');
        ylabel('Energy Loss (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 6
        MonthShadingLoss=getappdata(Solar_APP_Main_GUI,'MonthShadingLoss');
        axes(handles.G1);
        bar(MonthShadingLoss);
        title('Month-Wise Energy Loss due to Shading');
        ylabel('Energy Loss (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 7
        MonthLIDLoss=getappdata(Solar_APP_Main_GUI,'MonthLIDLoss');
        axes(handles.G1);
        bar(MonthLIDLoss);
        title('Month-Wise Energy Loss due to Light Induced Degradation');
        ylabel('Energy Loss (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 8
       MonthOhmicLoss=getappdata(Solar_APP_Main_GUI,'MonthOhmicLoss'); 
        axes(handles.G1);
        bar(MonthOhmicLoss);
        title('Month-Wise Ohmic Loss');
        ylabel('Energy Loss (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 9
      MonthInverterLoss=getappdata(Solar_APP_Main_GUI,'MonthInverterLoss');  
        axes(handles.G1);
        bar(MonthInverterLoss);
        title('Month-Wise Inverter Loss');
        ylabel('Energy Loss (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 10
       MonthTrackerLoss=getappdata(Solar_APP_Main_GUI,'MonthTrackerLoss'); 
        axes(handles.G1);
        bar(MonthTrackerLoss);
        title('Month-Wise Tracker Loss');
        ylabel('Energy Loss (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
    case 11
       MonthTransformerLoss=getappdata(Solar_APP_Main_GUI,'MonthTransformerLoss'); 
        axes(handles.G1);
        bar(MonthTransformerLoss);
        title('Month-Wise Transformer Loss');
        ylabel('Energy Loss (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});        
        
        
        
end
        

 
% --- Executes on button press in PB2.
function PB2_Callback(hObject, eventdata, handles)
% hObject    handle to PB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Proramming NEXT Button
global next;
if next==1
    next=12;
end 
next=next-1;

% Creating Switch Case for BAR Graph Display
switch next
    case 1
        MonthPVout=getappdata(Solar_APP_Main_GUI,'MonthPVout');
        axes(handles.G1);
        bar(MonthPVout);
        title('Month-Wise Energy Output from PV Array');
        ylabel('Energy Generated (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});

        
    case 2
        MonthINVpin=getappdata(Solar_APP_Main_GUI,'MonthINVpin');
        axes(handles.G1);
        bar(MonthINVpin);
        title('Month-Wise Energy Input to Inverters from PV Array');
        ylabel('Energy Generated (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 3
        MonthINVpout=getappdata(Solar_APP_Main_GUI,'MonthINVpout');
        axes(handles.G1);
        bar(MonthINVpout);
        title('Month-Wise Energy Output from Inverters');
        ylabel('Energy Generated (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 4
        MonthPgrid=getappdata(Solar_APP_Main_GUI,'MonthPgrid');
        axes(handles.G1);
        bar(MonthPgrid);
        title('Month-Wise Energy Output to Grid');
        ylabel('Energy Generated (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 5
        MonthArrayMismatchLoss=getappdata(Solar_APP_Main_GUI,'MonthArrayMismatchLoss');
        axes(handles.G1);
        bar(MonthArrayMismatchLoss);
        title('Month-Wise Energy Loss due to Array Mismatch');
        ylabel('Energy Loss (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 6
        MonthShadingLoss=getappdata(Solar_APP_Main_GUI,'MonthShadingLoss');
        axes(handles.G1);
        bar(MonthShadingLoss);
        title('Month-Wise Energy Loss due to Shading');
        ylabel('Energy Loss (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 7
        MonthLIDLoss=getappdata(Solar_APP_Main_GUI,'MonthLIDLoss');
        axes(handles.G1);
        bar(MonthLIDLoss);
        title('Month-Wise Energy Loss due to Light Induced Degradation');
        ylabel('Energy Loss (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 8
       MonthOhmicLoss=getappdata(Solar_APP_Main_GUI,'MonthOhmicLoss'); 
        axes(handles.G1);
        bar(MonthOhmicLoss);
        title('Month-Wise Ohmic Loss');
        ylabel('Energy Loss (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 9
      MonthInverterLoss=getappdata(Solar_APP_Main_GUI,'MonthInverterLoss');  
        axes(handles.G1);
        bar(MonthInverterLoss);
        title('Month-Wise Inverter Loss');
        ylabel('Energy Loss (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
        
    case 10
       MonthTrackerLoss=getappdata(Solar_APP_Main_GUI,'MonthTrackerLoss'); 
        axes(handles.G1);
        bar(MonthTrackerLoss);
        title('Month-Wise Tracker Loss');
        ylabel('Energy Loss (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
        
    case 11
       MonthTransformerLoss=getappdata(Solar_APP_Main_GUI,'MonthTransformerLoss'); 
        axes(handles.G1);
        bar(MonthTransformerLoss);
        title('Month-Wise Transformer Loss');
        ylabel('Energy Loss (kWh)');
        set(gca,'XTickLabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'}); 
        
            
        
        
end





% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=cell(12,10);
a(:,1)={1;2;3;4;5;6;7;8;9;0;1;2};
b=[1,2,3,4,5,6,7,8,9,0,1,2];
for i=1:12
    a(i,10)={b(1,i)};
end
set(handles.Table1,'Data',a);
for i=1:12
    a(i,1)={b(1,i)};
end
set(handles.Table1,'Data',a);
