function varargout = Solar_APP_Main_GUI(varargin)
% SOLAR_APP_MAIN_GUI MATLAB code for Solar_APP_Main_GUI.fig
%      SOLAR_APP_MAIN_GUI, by itself, creates a new SOLAR_APP_MAIN_GUI or raises the existing
%      singleton*.
%
%      H = SOLAR_APP_MAIN_GUI returns the handle to a new SOLAR_APP_MAIN_GUI or the handle to
%      the existing singleton*.
%
%      SOLAR_APP_MAIN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOLAR_APP_MAIN_GUI.M with the given input arguments.
%
%      SOLAR_APP_MAIN_GUI('Property','Value',...) creates a new SOLAR_APP_MAIN_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Solar_APP_Main_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Solar_APP_Main_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Solar_APP_Main_GUI

% Last Modified by GUIDE v2.5 31-Oct-2017 14:04:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Solar_APP_Main_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Solar_APP_Main_GUI_OutputFcn, ...
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


% --- Executes just before Solar_APP_Main_GUI is made visible.
function Solar_APP_Main_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Solar_APP_Main_GUI (see VARARGIN)

% Initializing the GUI

set(handles.PrjName,'String','');
set(handles.PlantCapacity,'String','');
set(handles.Lat,'String','');
set(handles.Long,'String','');

set(handles.Pmod,'String','');
set(handles.ModNum,'String','');
set(handles.PVTech,'String','');
set(handles.ModTemCF,'String','');
set(handles.Tn,'String','');
set(handles.Gn,'String','');

set(handles.ft,'Value',0);
set(handles.st,'Value',0);
set(handles.saew,'Value',0);
set(handles.sans,'Value',0);
set(handles.da,'Value',0);

set(handles.PB1,'Enable','off');
set(handles.PB2,'Enable','off');
set(handles.PB3,'Enable','off');
set(handles.PB4,'Enable','off');
set(handles.PB5,'Enable','off');

set(handles.StartYear,'String','');
set(handles.lpy,'Value',0);
set(handles.nolpy,'Value',0);
set(handles.popupmenu1,'Value',1);
set(handles.popupmenu2,'Value',1);
set(handles.popupmenu3,'Value',12);
set(handles.popupmenu4,'Value',31);

set(handles.HHres,'String','');
set(handles.GHICal,'Value',0);
set(handles.UserGHI,'Value',0);
set(handles.UserInso,'Value',0);
set(handles.PB6,'Enable','off');
set(handles.PB7,'Enable','off');
set(handles.gau,'Value',0);
set(handles.sin,'Value',0);
set(handles.avg,'Value',0);
set(handles.HourWise,'Value',0);
set(handles.ResWise,'Value',0);

% Choose default command line output for Solar_APP_Main_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'Solar_APP_Main_GUI',gcf);
% setappdata(Solar_APP_Main_GUI,'m',1);
% setappdata(Solar_APP_Main_GUI,'n',11);

% UIWAIT makes Solar_APP_Main_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Solar_APP_Main_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Pmod_Callback(hObject, eventdata, handles)
% hObject    handle to Pmod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pmod as text
%        str2double(get(hObject,'String')) returns contents of Pmod as a double


% --- Executes during object creation, after setting all properties.
function Pmod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pmod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ModNum_Callback(hObject, eventdata, handles)
% hObject    handle to ModNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ModNum as text
%        str2double(get(hObject,'String')) returns contents of ModNum as a double


% --- Executes during object creation, after setting all properties.
function ModNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ModNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ModTemCF_Callback(hObject, eventdata, handles)
% hObject    handle to ModTemCF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ModTemCF as text
%        str2double(get(hObject,'String')) returns contents of ModTemCF as a double


% --- Executes during object creation, after setting all properties.
function ModTemCF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ModTemCF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Tn_Callback(hObject, eventdata, handles)
% hObject    handle to Tn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tn as text
%        str2double(get(hObject,'String')) returns contents of Tn as a double


% --- Executes during object creation, after setting all properties.
function Tn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Gn_Callback(hObject, eventdata, handles)
% hObject    handle to Gn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Gn as text
%        str2double(get(hObject,'String')) returns contents of Gn as a double


% --- Executes during object creation, after setting all properties.
function Gn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tf.
function tf_Callback(hObject, eventdata, handles)
% hObject    handle to tf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tf


% --- Executes on button press in crys.
function crys_Callback(hObject, eventdata, handles)
% hObject    handle to crys (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of crys



function PrjName_Callback(hObject, eventdata, handles)
% hObject    handle to PrjName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PrjName as text
%        str2double(get(hObject,'String')) returns contents of PrjName as a double


% --- Executes during object creation, after setting all properties.
function PrjName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PrjName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Lat_Callback(hObject, eventdata, handles)
% hObject    handle to Lat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Lat as text
%        str2double(get(hObject,'String')) returns contents of Lat as a double


% --- Executes during object creation, after setting all properties.
function Lat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Long_Callback(hObject, eventdata, handles)
% hObject    handle to Long (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Long as text
%        str2double(get(hObject,'String')) returns contents of Long as a double


% --- Executes during object creation, after setting all properties.
function Long_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Long (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB4.
function PB4_Callback(hObject, eventdata, handles)
% hObject    handle to PB4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Single Axis NS Data GUI
SingleAxis_NS_Data;

% --- Executes on button press in PB3.
function PB3_Callback(hObject, eventdata, handles)
% hObject    handle to PB3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Single Axis EW Data GUI
SingleAxis_EW_Data;

% --- Executes on button press in PB2.
function PB2_Callback(hObject, eventdata, handles)
% hObject    handle to PB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Seasonal Tilt Data GUI
Seasonal_Tilt_Data;

% --- Executes on button press in PB1.
function PB1_Callback(hObject, eventdata, handles)
% hObject    handle to PB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Fixed Tilt Data GUI
Fixed_Tilt_Data;

% --- Executes on button press in PB5.
function PB5_Callback(hObject, eventdata, handles)
% hObject    handle to PB5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Double Axis Data GUI
DoubleAxis_Data;

% --- Executes on button press in sans.
function sans_Callback(hObject, eventdata, handles)
% hObject    handle to sans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sans


% --- Executes on button press in saew.
function saew_Callback(hObject, eventdata, handles)
% hObject    handle to saew (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of saew


% --- Executes on button press in st.
function st_Callback(hObject, eventdata, handles)
% hObject    handle to st (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of st


% --- Executes on button press in ft.
function ft_Callback(hObject, eventdata, handles)
% hObject    handle to ft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ft


% --- Executes on button press in da.
function da_Callback(hObject, eventdata, handles)
% hObject    handle to da (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of da


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB12.
function PB12_Callback(hObject, eventdata, handles)
% hObject    handle to PB12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing all Application Windows
hf1=findobj('Name','Loss_Parameters');
close(hf1);
hf2=findobj('Name','Rainy_Snowy_Months');
close(hf2);
hf3=findobj('Name','Fixed_Tilt_Data');
close(hf3);
hf4=findobj('Name','Seasonal_Tilt_Data');
close(hf4);
hf5=findobj('Name','SingleAxis_EW_Data');
close(hf5);
hf6=findobj('Name','SingleAxis_NS_Data');
close(hf6);
hf7=findobj('Name','DoubleAxis_Data');
close(hf7);
hf8=findobj('Name','Solar_App_FinalReport_GUI');
close(hf8);
hf9=findobj('Name','ohmic_losses_figure');
close(hf9);
close;

% --- Executes on button press in PB11.
function PB11_Callback(hObject, eventdata, handles)
% hObject    handle to PB11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting User Data from the Main GUI

Solar_APP_Main_GUI=getappdata(0,'Solar_APP_Main_GUI');

%% Getting User Data from the Step 1
PrjName=get(handles.PrjName,'String');
setappdata(Solar_APP_Main_GUI,'PrjName',PrjName);

PlantCapacity=get(handles.PlantCapacity,'String');
PlantCapacity=str2double(PlantCapacity);
setappdata(Solar_APP_Main_GUI,'PlantCapacity',PlantCapacity);

Lat=get(handles.Lat,'String');
setappdata(Solar_APP_Main_GUI,'Lat',Lat);
Lat=str2double(Lat);

Long=get(handles.Long,'String');
setappdata(Solar_APP_Main_GUI,'Long',Long);
Long=str2double(Long);

%% Getting User Data from the Step 2
Pmod=get(handles.Pmod,'String');
%Pmod=str2double(Pmod);
Pmod=strread(Pmod,'%f','delimiter',',');
Pmod=Pmod';

PVTech=get(handles.PVTech,'String');
%PVTech=str2double(PVTech);
PVTech=strread(PVTech,'%f','delimiter',',');
PVTech=PVTech';

ModNum=get(handles.ModNum,'String');
%ModNum=str2double(ModNum);
ModNum=strread(ModNum,'%f','delimiter',',');
ModNum=ModNum';

ModTemCF=get(handles.ModTemCF,'String');
%ModTemCF=str2double(ModTemCF);
ModTemCF=strread(ModTemCF,'%f','delimiter',',');
ModTemCF=ModTemCF';

Tn=get(handles.Tn,'String');
Tn=str2double(Tn);

Gn=get(handles.Gn,'String');
Gn=str2double(Gn);

%% Getting User Data from the Step 4
lpy=get(handles.lpy,'Value');

nolpy=get(handles.nolpy,'Value');

StartMonth=get(handles.popupmenu1,'Value');

StartDay=get(handles.popupmenu3,'Value');

EndMonth=get(handles.popupmenu2,'Value');

EndDay=get(handles.popupmenu4,'Value');

StartYear=get(handles.StartYear,'String');
StartYear=str2double(StartYear);

%% Getting User Data from the Step 6 (From Sub-Window Loss_Parameters)

Loss_Parameters=getappdata(0,'Loss_Parameters');

SF=getappdata(Loss_Parameters,'SF');

LID=getappdata(Loss_Parameters,'LID');

LS=getappdata(Loss_Parameters,'LS');

Arraymismat=getappdata(Loss_Parameters,'Arraymismat');

OhmicLoss=getappdata(Loss_Parameters,'OhmicLoss');

rho=getappdata(Loss_Parameters,'rho');

TrackerL=getappdata(Loss_Parameters,'TrackerL');

INVeff=getappdata(Loss_Parameters,'INVeff');

TransLoss=getappdata(Loss_Parameters,'TransLoss');

Uo=getappdata(Loss_Parameters,'Uo');

U1=getappdata(Loss_Parameters,'U1');

Shading=getappdata(Loss_Parameters,'Shading');

bo=getappdata(Loss_Parameters,'bo');


%% Getting User Data from the Step 5 (Temperature File & Wind Speed File)
Temp=getappdata(Solar_APP_Main_GUI,'TempFile');

WS=getappdata(Solar_APP_Main_GUI,'WindSpeedFile');

%% Getting User Data from the Step 3
ft=get(handles.ft,'Value');

st=get(handles.st,'Value');

saew=get(handles.saew,'Value');

sans=get(handles.sans,'Value');

da=get(handles.da,'Value');

OrientationParameters=zeros(1,8);

if ft==1
    
    Fixed_Tilt_Data=getappdata(0,'Fixed_Tilt_Data');
    
    tilt=getappdata(Fixed_Tilt_Data,'tilt');
    phic=getappdata(Fixed_Tilt_Data,'phic');
    tiltsummer=0;
    tiltwinter=0;
    phicmax=0;
    phicmin=0;
    tiltmax=0;
    tiltmin=0;
    
    OrientationParameters=[tilt,phic,tiltsummer,tiltwinter,phicmax,phicmin,tiltmax,tiltmin];
    
    OrientationType=1;
elseif st==1
    
    Seasonal_Tilt_Data=getappdata(0,'Seasonal_Tilt_Data');
    
    tilt=getappdata(Seasonal_Tilt_Data,'tilt');
    phic=getappdata(Seasonal_Tilt_Data,'phic');
    tiltsummer=getappdata(Seasonal_Tilt_Data,'tiltsummer');
    tiltwinter=getappdata(Seasonal_Tilt_Data,'tiltwinter');
    phicmax=0;
    phicmin=0;
    tiltmax=0;
    tiltmin=0;
    
    OrientationParameters=[tilt,phic,tiltsummer,tiltwinter,phicmax,phicmin,tiltmax,tiltmin];
    
    OrientationType=2;    
    
elseif saew==1
    
    SingleAxis_EW_Data=getappdata(0,'SingleAxis_EW_Data');
    
    tilt=getappdata(SingleAxis_EW_Data,'tilt');
    phic=0;
    tiltsummer=0;
    tiltwinter=0;
    phicmax=getappdata(SingleAxis_EW_Data,'phicmax');
    phicmin=getappdata(SingleAxis_EW_Data,'phicmin');
    tiltmax=0;
    tiltmin=0;
    
    OrientationParameters=[tilt,phic,tiltsummer,tiltwinter,phicmax,phicmin,tiltmax,tiltmin];
    
    OrientationType=3;    
    
elseif sans==1
    
    SingleAxis_NS_Data=getappdata(0,'SingleAxis_NS_Data');
    
    tilt=0;
    phic=getappdata(SingleAxis_NS_Data,'phic');
    tiltsummer=0;
    tiltwinter=0;
    phicmax=0;
    phicmin=0;
    tiltmax=getappdata(SingleAxis_NS_Data,'tiltmax');
    tiltmin=getappdata(SingleAxis_NS_Data,'tiltmin');
    
    OrientationParameters=[tilt,phic,tiltsummer,tiltwinter,phicmax,phicmin,tiltmax,tiltmin];
    
    OrientationType=4;     
    
elseif da==1
    
    DoubleAxis_Data=getappdata(0,'DoubleAxis_Data');
    
    tilt=0;
    phic=0;
    tiltsummer=0;
    tiltwinter=0;
    phicmax=getappdata(DoubleAxis_Data,'phicmax');
    phicmin=getappdata(DoubleAxis_Data,'phicmin');
    tiltmax=getappdata(DoubleAxis_Data,'tiltmax');
    tiltmin=getappdata(DoubleAxis_Data,'tiltmin');
    
    OrientationParameters=[tilt,phic,tiltsummer,tiltwinter,phicmax,phicmin,tiltmax,tiltmin];
    
    OrientationType=5;     
    
end

%% Getting User Data from the Step 5
HHres=get(handles.HHres,'String');
HHres=str2double(HHres);

GHICal=get(handles.GHICal,'Value');

UserGHI=get(handles.UserGHI,'Value');

UserInso=get(handles.UserInso,'Value');

if GHICal==1
    RainSnowMonths=getappdata(Rainy_Snowy_Months,'RainSnowMonths');
    yr=getappdata(Rainy_Snowy_Months,'yr');
    mr=getappdata(Rainy_Snowy_Months,'mr');
    YearRain=getappdata(Rainy_Snowy_Months,'YearRain');
    MonthRain=getappdata(Rainy_Snowy_Months,'MonthRain');
    NormalClearSky=getappdata(Rainy_Snowy_Months,'NormalClearSky');
    ModifiedClearSky=getappdata(Rainy_Snowy_Months,'ModifiedClearSky');
    
    gau=0;
    sin=0;
    avg=0;
    
    GhiInsoFile=0;
    
    SimulationMode=1;
elseif UserGHI==1       
    GhiInsoFile=getappdata(Solar_APP_Main_GUI,'GhiInsoFile');

    RainSnowMonths=0;
    yr=0;
    mr=0;
    YearRain=0;
    MonthRain=0;
    NormalClearSky=0;
    ModifiedClearSky=0;   
    
    gau=0;
    sin=0;
    avg=0;
    
    SimulationMode=2;
    
elseif UserInso==1
    GhiInsoFile=getappdata(Solar_APP_Main_GUI,'GhiInsoFile');
    
    gau=get(handles.gau,'Value');
    sin=get(handles.sin,'Value');
    avg=get(handles.avg,'Value');
    
    RainSnowMonths=0;
    yr=0;
    mr=0;
    YearRain=0;
    MonthRain=0;  
    NormalClearSky=0;
    ModifiedClearSky=0;    
    
    SimulationMode=3;
    
end

HourWise=get(handles.HourWise,'Value');

ResWise=get(handles.ResWise,'Value');

if (HourWise==1)&&(ResWise==0)
    
    WeatherDataFormat=1; % Hourly Formatted Weather Data Files
    
elseif (HourWise==0)&&(ResWise==1)
    
    WeatherDataFormat=0; % Resolution-Wise Formatted Weather Data Files
    
end

% Getting data from Strin_Sizing GUI
% Strin_Sizing=getappdata(0,'Strin_Sizing');
% 
% modlen=getappdata(Strin_Sizing,'modlen');
% 
% modbr=getappdata(Strin_Sizing,'modbr');

%% Using External Function to evaluate Energy
[ TotalPVout,TotalINVpin,TotalINVpout,TotalPgrid,TotalArrayMismatchLoss,TotalShadingLoss,TotalLIDLoss,TotalOhmicLoss,TotalInverterLoss, TotalTrackerLoss,TotalTransformerLoss,MonthPVout,MonthINVpin,MonthINVpout,MonthPgrid,MonthArrayMismatchLoss,MonthShadingLoss,MonthLIDLoss,MonthOhmicLoss,MonthInverterLoss,MonthTrackerLoss,MonthTransformerLoss,PgridEnergy ] = SolarPVEnergySimulation( PrjName,Lat,Long,Pmod,PVTech,ModNum,ModTemCF,Tn,Gn,lpy,nolpy,StartMonth,StartDay,EndMonth,EndDay,SF,LID,LS,Arraymismat,OhmicLoss,rho,TrackerL,INVeff,TransLoss,Uo,U1,Shading,bo,Temp,WS,OrientationType,OrientationParameters,HHres,SimulationMode,RainSnowMonths,yr,mr,YearRain,MonthRain,NormalClearSky,ModifiedClearSky,gau,sin,avg,GhiInsoFile,WeatherDataFormat,StartYear,PlantCapacity);



% Debugging Values

% count1
% 
% count2

% Saving Daily Energy Variables to WorkSpace
DailyPVEnergy=PgridEnergy/1000;

% Setting Computed Energy Values to the Figure Workspace

% Total Energies
TotalPVout=num2str(TotalPVout/1000);
setappdata(Solar_APP_Main_GUI,'TotalPVout',TotalPVout);

TotalINVpin=num2str(TotalINVpin/1000);
setappdata(Solar_APP_Main_GUI,'TotalINVpin',TotalINVpin);

TotalINVpout=num2str(TotalINVpout/1000);
setappdata(Solar_APP_Main_GUI,'TotalINVpout',TotalINVpout);

TotalPgrid=num2str(TotalPgrid/1000);
setappdata(Solar_APP_Main_GUI,'TotalPgrid',TotalPgrid);

TotalArrayMismatchLoss=num2str(TotalArrayMismatchLoss/1000);
setappdata(Solar_APP_Main_GUI,'TotalArrayMismatchLoss',TotalArrayMismatchLoss);

TotalShadingLoss=num2str(TotalShadingLoss/1000);
setappdata(Solar_APP_Main_GUI,'TotalShadingLoss',TotalShadingLoss);

TotalLIDLoss=num2str(TotalLIDLoss/1000);
setappdata(Solar_APP_Main_GUI,'TotalLIDLoss',TotalLIDLoss);

TotalOhmicLoss=num2str(TotalOhmicLoss/1000);
setappdata(Solar_APP_Main_GUI,'TotalOhmicLoss',TotalOhmicLoss);

TotalInverterLoss=num2str(TotalInverterLoss/1000);
setappdata(Solar_APP_Main_GUI,'TotalInverterLoss',TotalInverterLoss);

TotalTrackerLoss=num2str(TotalTrackerLoss/1000);
setappdata(Solar_APP_Main_GUI,'TotalTrackerLoss',TotalTrackerLoss);

TotalTransformerLoss=num2str(TotalTransformerLoss/1000);
setappdata(Solar_APP_Main_GUI,'TotalTransformerLoss',TotalTransformerLoss);


% Month-Wise Energies
MonthPVout=(MonthPVout/1000);
setappdata(Solar_APP_Main_GUI,'MonthPVout',MonthPVout);

MonthINVpin=(MonthINVpin/1000);
setappdata(Solar_APP_Main_GUI,'MonthINVpin',MonthINVpin);

MonthINVpout=(MonthINVpout/1000);
setappdata(Solar_APP_Main_GUI,'MonthINVpout',MonthINVpout);

MonthPgrid=(MonthPgrid/1000);
setappdata(Solar_APP_Main_GUI,'MonthPgrid',MonthPgrid);

MonthArrayMismatchLoss=(MonthArrayMismatchLoss/1000);
setappdata(Solar_APP_Main_GUI,'MonthArrayMismatchLoss',MonthArrayMismatchLoss);

MonthShadingLoss=(MonthShadingLoss/1000);
setappdata(Solar_APP_Main_GUI,'MonthShadingLoss',MonthShadingLoss);

MonthLIDLoss=(MonthLIDLoss/1000);
setappdata(Solar_APP_Main_GUI,'MonthLIDLoss',MonthLIDLoss);

MonthOhmicLoss=(MonthOhmicLoss/1000);
setappdata(Solar_APP_Main_GUI,'MonthOhmicLoss',MonthOhmicLoss);

MonthInverterLoss=(MonthInverterLoss/1000);
setappdata(Solar_APP_Main_GUI,'MonthInverterLoss',MonthInverterLoss);

MonthTrackerLoss=(MonthTrackerLoss/1000);
setappdata(Solar_APP_Main_GUI,'MonthTrackerLoss',MonthTrackerLoss);

MonthTransformerLoss=(MonthTransformerLoss/1000);
setappdata(Solar_APP_Main_GUI,'MonthTransformerLoss',MonthTransformerLoss);

% Opening Final Report GUI
Solar_App_FinalReport_GUI;
  

% --- Executes on button press in PB10.
function PB10_Callback(hObject, eventdata, handles)
% hObject    handle to PB10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Loss_Parameters GUI
Loss_Parameters;

% --- Executes on button press in PB6.
function PB6_Callback(hObject, eventdata, handles)
% hObject    handle to PB6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Open Rainy Months GUI
Rainy_Snowy_Months;

function HHres_Callback(hObject, eventdata, handles)
% hObject    handle to HHres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HHres as text
%        str2double(get(hObject,'String')) returns contents of HHres as a double


% --- Executes during object creation, after setting all properties.
function HHres_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HHres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in PB7.
function PB7_Callback(hObject, eventdata, handles)
% hObject    handle to PB7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Loading Wind Speed File into Simulation
[filename,pathname]=uigetfile({'*.*'},'Insolation/Irradiance File Selector');
fullpathname=strcat(pathname, filename);
GhiInsoFile=xlsread(fullpathname);
setappdata(Solar_APP_Main_GUI,'GhiInsoFile',GhiInsoFile);

%assignin('base','INso',InsolationFile); % For Debugging


% --- Executes on button press in PB8.
function PB8_Callback(hObject, eventdata, handles)
% hObject    handle to PB8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Loading Temperature File into Simulation
[filename,pathname]=uigetfile({'*.*'},'Temperature File Selector');
fullpathname=strcat(pathname, filename);
TempFile=xlsread(fullpathname);
setappdata(Solar_APP_Main_GUI,'TempFile',TempFile);

assignin('base','temp',TempFile); % For Debugging



% --- Executes on button press in PB9.
function PB9_Callback(hObject, eventdata, handles)
% hObject    handle to PB9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Loading Wind Speed File into Simulation
[filename,pathname]=uigetfile({'*.*'},'Wind Speed File Selector');
fullpathname=strcat(pathname, filename);
WindSpeedFile=xlsread(fullpathname);
setappdata(Solar_APP_Main_GUI,'WindSpeedFile',WindSpeedFile);

assignin('base','ws',WindSpeedFile); % For Debugging

% --- Executes on button press in PB13.
function PB13_Callback(hObject, eventdata, handles)
% hObject    handle to PB13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting all Values of the GUI
set(handles.PrjName,'String','');
set(handles.Lat,'String','');
set(handles.Long,'String','');

% set(handles.crys,'Value',0);
% set(handles.tf,'Value',0);

set(handles.Pmod,'String','');
set(handles.ModNum,'String','');
set(handles.PVTech,'String','');
set(handles.ModTemCF,'String','');
set(handles.Tn,'String','');
set(handles.Gn,'String','');

set(handles.ft,'Value',0);
set(handles.st,'Value',0);
set(handles.saew,'Value',0);
set(handles.sans,'Value',0);
set(handles.da,'Value',0);

set(handles.PB1,'Enable','off');
set(handles.PB2,'Enable','off');
set(handles.PB3,'Enable','off');
set(handles.PB4,'Enable','off');
set(handles.PB5,'Enable','off');

set(handles.lpy,'Value',0);
set(handles.nolpy,'Value',0);

set(handles.popupmenu1,'Value',1);
set(handles.popupmenu2,'Value',12);
set(handles.popupmenu3,'Value',1);
set(handles.popupmenu4,'Value',31);

set(handles.HHres,'String','');

set(handles.GHICal,'Value',0);
set(handles.UserGHI,'Value',0);
set(handles.UserInso,'Value',0);

set(handles.PB6,'Enable','off');
set(handles.PB7,'Enable','off');

set(handles.gau,'Value',0);
set(handles.sin,'Value',0);
set(handles.avg,'Value',0);

set(handles.gau,'Enable','off');
set(handles.sin,'Enable','off');
set(handles.avg,'Enable','off');


% --- Executes when selected object is changed in uipanel7.
function uipanel7_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel7 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Making Appropriate PuspButtons to Operate Depending on the Radiobutton
% Selected
a=get(handles.ft,'Value');
b=get(handles.st,'Value');
c=get(handles.saew,'Value');
d=get(handles.sans,'Value');
e=get(handles.da,'Value');

if a==1
    set(handles.PB1,'Enable','on');
   
    set(handles.PB2,'Enable','off');
    set(handles.PB3,'Enable','off');
    set(handles.PB4,'Enable','off');
    set(handles.PB5,'Enable','off');
elseif b==1
    set(handles.PB2,'Enable','on');
   
    set(handles.PB1,'Enable','off');
    set(handles.PB3,'Enable','off');
    set(handles.PB4,'Enable','off');
    set(handles.PB5,'Enable','off');
elseif c==1
    set(handles.PB3,'Enable','on');
   
    set(handles.PB1,'Enable','off');
    set(handles.PB2,'Enable','off');
    set(handles.PB4,'Enable','off');
    set(handles.PB5,'Enable','off'); 
elseif d==1
    set(handles.PB4,'Enable','on');
   
    set(handles.PB1,'Enable','off');
    set(handles.PB2,'Enable','off');
    set(handles.PB3,'Enable','off');
    set(handles.PB5,'Enable','off'); 
elseif e==1
    set(handles.PB5,'Enable','on');
    set(handles.PB1,'Enable','off');
    set(handles.PB2,'Enable','off');
    set(handles.PB3,'Enable','off');
    set(handles.PB4,'Enable','off');
end
    


% --- Executes when selected object is changed in uipanel23.
function uipanel23_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel23 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Making Appropriate PuspButtons to Operate Depending on the Radiobutton
% Selected
a=get(handles.GHICal,'Value');
b=get(handles.UserGHI,'Value');
c=get(handles.UserInso,'Value');

if a==1
    set(handles.PB6,'Enable','on');
    
    set(handles.PB7,'Enable','off'); 

    set(handles.gau,'Enable','off');
    set(handles.sin,'Enable','off');
    set(handles.avg,'Enable','off');
    
    set(handles.gau,'Value',0);
    set(handles.sin,'Value',0);
    set(handles.avg,'Value',0);    
       
elseif (b==1)
    set(handles.PB7,'Enable','on');
    
    set(handles.PB6,'Enable','off');  

    set(handles.gau,'Enable','off');
    set(handles.sin,'Enable','off');
    set(handles.avg,'Enable','off');
    
    set(handles.gau,'Value',0);
    set(handles.sin,'Value',0);
    set(handles.avg,'Value',0);
    
elseif c==1
    set(handles.PB7,'Enable','on');
    
    set(handles.PB6,'Enable','off');  
    
    set(handles.gau,'Enable','on');
    set(handles.sin,'Enable','on');
    set(handles.avg,'Enable','on');
    
end

    



function PVTech_Callback(hObject, eventdata, handles)
% hObject    handle to PVTech (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PVTech as text
%        str2double(get(hObject,'String')) returns contents of PVTech as a double


% --- Executes during object creation, after setting all properties.
function PVTech_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PVTech (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PlantCapacity_Callback(hObject, eventdata, handles)
% hObject    handle to PlantCapacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PlantCapacity as text
%        str2double(get(hObject,'String')) returns contents of PlantCapacity as a double


% --- Executes during object creation, after setting all properties.
function PlantCapacity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PlantCapacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function StartYear_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartYear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function StartYear_Callback(hObject, eventdata, handles)
% hObject    handle to StartYear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StartYear as text
%        str2double(get(hObject,'String')) returns contents of StartYear as a double




% --- Executes on button press in PB14.
function PB14_Callback(hObject, eventdata, handles)
% hObject    handle to PB14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Getting Plant Info File from User

[filename,pathname]=uigetfile({'*.xlsx';'*.xls';'*.xlsb';'*.xlsm'},'Plant Info File Selector');

fullpathname=strcat(pathname, filename);

[~,~,PlantInfo_DataCell] =xlsread(fullpathname);

%% Putting PlantInfo_DataCell in GUI WorkSpace

Solar_APP_Main_GUI=getappdata(0,'Solar_APP_Main_GUI');

setappdata(Solar_APP_Main_GUI,'PlantInfo_DataCell',PlantInfo_DataCell);

%% Setting Current GUI Properties according to PlantInfo_DataCell

% Data For Step 1
PrjName=PlantInfo_DataCell{2,2};
set(handles.PrjName,'String',PrjName);

PlantCapacity=PlantInfo_DataCell{3,2};
set(handles.PlantCapacity,'String',PlantCapacity);

Lat=PlantInfo_DataCell{4,2};
set(handles.Lat,'String',Lat);

Long=PlantInfo_DataCell{5,2};
set(handles.Long,'String',Long);

% Data For Step 2
Pmod=PlantInfo_DataCell{8,2};
set(handles.Pmod,'String',Pmod);

ModNum=PlantInfo_DataCell{9,2};
set(handles.ModNum,'String',ModNum);

PVTech=PlantInfo_DataCell{10,2};
set(handles.PVTech,'String',PVTech);

ModTemCF=PlantInfo_DataCell{11,2};
set(handles.ModTemCF,'String',ModTemCF);

Tn=PlantInfo_DataCell{12,2};
set(handles.Tn,'String',Tn);

Gn=PlantInfo_DataCell{13,2};
set(handles.Gn,'String',Gn);

% Data For Step 4
StartYear=PlantInfo_DataCell{31,2};
set(handles.StartYear,'String',StartYear);

lpy=PlantInfo_DataCell{32,2};
set(handles.lpy,'Value',lpy);

nolpy=PlantInfo_DataCell{33,2};
set(handles.nolpy,'Value',nolpy);

StartMonth=PlantInfo_DataCell{34,2};
set(handles.popupmenu1,'Value',StartMonth);

StartDay=PlantInfo_DataCell{35,2};
set(handles.popupmenu2,'Value',StartDay);

EndMonth=PlantInfo_DataCell{36,2};
set(handles.popupmenu3,'Value',EndMonth);

EndDay=PlantInfo_DataCell{37,2};
set(handles.popupmenu4,'Value',EndDay);

% Data For Step 3
ft=PlantInfo_DataCell{16,2};
set(handles.ft,'Value',ft);

st=PlantInfo_DataCell{17,2};
set(handles.st,'Value',st);

saew=PlantInfo_DataCell{18,2};
set(handles.saew,'Value',saew);

sans=PlantInfo_DataCell{19,2};
set(handles.sans,'Value',sans);

da=PlantInfo_DataCell{20,2};
set(handles.da,'Value',da);

if (ft==1)
    
    set(handles.PB1,'Enable','on');
    
    % Opening GUI
    Fixed_Tilt_Data;
    
elseif (st==1)
    
    set(handles.PB2,'Enable','on');
    
    % Opening GUI
    Seasonal_Tilt_Data;
    
elseif (saew==1)
    
    set(handles.PB3,'Enable','on');
    
    % Opening GUI
    SingleAxis_EW_Data;
    
elseif (sans==1)
    
    set(handles.PB4,'Enable','on');
    
    % Opening GUI
    SingleAxis_NS_Data;
    
elseif (da==1)
    
    set(handles.PB5,'Enable','on');
    
    % Opening GUI
    DoubleAxis_Data;
    
end

% Data For Step 5
HHres=PlantInfo_DataCell{40,2};
set(handles.HHres,'String',Hres);

GHICal=PlantInfo_DataCell{41,2};
set(handles.GHICal,'Value',GHICal);

UserGHI=PlantInfo_DataCell{42,2};
set(handles.UserGHI,'Value',UserGHI);

UserInso=PlantInfo_DataCell{43,2};
set(handles.UserInso,'Value',UserInso);

gau=PlantInfo_DataCell{44,2};
set(handles.gau,'Value',gau);

sin=PlantInfo_DataCell{45,2};
set(handles.sin,'Value',sin);

avg=PlantInfo_DataCell{46,2};
set(handles.avg,'Value',avg);

HourWise=PlantInfo_DataCell{47,2};
set(handles.HourWise,'Value',HourWise);

ResWise=PlantInfo_DataCell{48,2};
set(handles.ResWise,'Value',ResWise);

if (GHICal==1)
    
    set(handles.gau,'Enable','off');    
    set(handles.sin,'Enable','off');    
    set(handles.avg,'Enable','off');    
    
elseif (UserGHI==1)
    
    set(handles.gau,'Enable','off');    
    set(handles.sin,'Enable','off');    
    set(handles.avg,'Enable','off');    
    
elseif (UserInso==1)
    
    set(handles.gau,'Enable','on');    
    set(handles.sin,'Enable','on');    
    set(handles.avg,'Enable','on');    
    
end

% Opening GUI
Loss_Parameters;


% --- Executes on button press in PB15.
function PB15_Callback(hObject, eventdata, handles)
% hObject    handle to PB15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Getting User Data from the Step 1
PrjName=get(handles.PrjName,'String');

PlantCapacity=get(handles.PlantCapacity,'String');

Lat=get(handles.Lat,'String');

Long=get(handles.Long,'String');

%% Getting User Data from the Step 2
Pmod=get(handles.Pmod,'String');

PVTech=get(handles.PVTech,'String');

ModNum=get(handles.ModNum,'String');

ModTemCF=get(handles.ModTemCF,'String');

Tn=get(handles.Tn,'String');

Gn=get(handles.Gn,'String');

%% Getting User Data from the Step 4
lpy=get(handles.lpy,'Value');

nolpy=get(handles.nolpy,'Value');

StartMonth=get(handles.popupmenu1,'Value');

StartDay=get(handles.popupmenu3,'Value');

EndMonth=get(handles.popupmenu2,'Value');

EndDay=get(handles.popupmenu4,'Value');

StartYear=get(handles.StartYear,'String');

%% Getting User Data from the Step 6 (From Sub-Window Loss_Parameters)

Loss_Parameters=getappdata(0,'Loss_Parameters');

UserDef=getappdata(Loss_Parameters,'UserDef');

Default=getappdata(Loss_Parameters,'Default');

SF=getappdata(Loss_Parameters,'SF');
SF=num2str(SF);

LID=getappdata(Loss_Parameters,'LID');
LID=num2str(LID);

LS=getappdata(Loss_Parameters,'LS');
LS=num2str(LS);

Arraymismat=getappdata(Loss_Parameters,'Arraymismat');
Arraymisma=num2str(Arraymisma);

OhmicLoss=getappdata(Loss_Parameters,'OhmicLoss');
OhmicLoss=num2str(OhmicLoss);

rho=getappdata(Loss_Parameters,'rho');
rho=num2str(rho);

TrackerL=getappdata(Loss_Parameters,'TrackerL');
TrackerL=num2str(TrackerL);

INVeff=getappdata(Loss_Parameters,'INVeff');
INVeff=num2str(INVeff);

TransLoss=getappdata(Loss_Parameters,'TransLoss');
TransLoss=num2str(TransLoss);

Uo=getappdata(Loss_Parameters,'Uo');
Uo=num2str(Uo);

U1=getappdata(Loss_Parameters,'U1');
U1=num2str(U1);

Shading=getappdata(Loss_Parameters,'Shading');
Shading=num2str(Shading);

bo=getappdata(Loss_Parameters,'bo');
bo=num2str(bo);


%% Getting User Data from the Step 3
ft=get(handles.ft,'Value');

st=get(handles.st,'Value');

saew=get(handles.saew,'Value');

sans=get(handles.sans,'Value');

da=get(handles.da,'Value');

if ft==1
    
    Fixed_Tilt_Data=getappdata(0,'Fixed_Tilt_Data');
    
    tilt=getappdata(Fixed_Tilt_Data,'tilt');
    tilt=num2str(tilt);
    
    phic=getappdata(Fixed_Tilt_Data,'phic');
    phic=num2str(phic);

elseif st==1
    
    Seasonal_Tilt_Data=getappdata(0,'Seasonal_Tilt_Data');
    
    tilt=getappdata(Seasonal_Tilt_Data,'tilt');
    tilt=num2str(tilt);
    
    phic=getappdata(Seasonal_Tilt_Data,'phic');
    phic=num2str(phic);
    
    tiltsummer=getappdata(Seasonal_Tilt_Data,'tiltsummer');
    tiltsummer=num2str(tiltsummer);
    
    tiltwinter=getappdata(Seasonal_Tilt_Data,'tiltwinter');  
    tiltwinter=num2str(tiltwinter);
    
elseif saew==1
    
    SingleAxis_EW_Data=getappdata(0,'SingleAxis_EW_Data');
    
    tilt=getappdata(SingleAxis_EW_Data,'tilt');
    tilt=num2str(tilt);

    phicmax=getappdata(SingleAxis_EW_Data,'phicmax');
    phicmax=num2str(phicmax);
    
    phicmin=getappdata(SingleAxis_EW_Data,'phicmin');
    phicmin=num2str(phicmin);
    
elseif sans==1 
    
    SingleAxis_NS_Data=getappdata(0,'SingleAxis_NS_Data');
    
    phic=getappdata(SingleAxis_NS_Data,'phic');
    phic=num2str(phic);

    tiltmax=getappdata(SingleAxis_NS_Data,'tiltmax');
    tiltmax=num2str(tiltmax);
    
    tiltmin=getappdata(SingleAxis_NS_Data,'tiltmin');
    tiltmin=num2str(tiltmin);     
    
elseif da==1    
    
    DoubleAxis_Data=getappdata(0,'DoubleAxis_Data');

    phicmax=getappdata(DoubleAxis_Data,'phicmax');
    phicmax=num2str(phicmax);
    
    phicmin=getappdata(DoubleAxis_Data,'phicmin');
    phicmin=num2str(phicmin);
    
    tiltmax=getappdata(DoubleAxis_Data,'tiltmax');
    tiltmax=num2str(tiltmax);
    
    tiltmin=getappdata(DoubleAxis_Data,'tiltmin');  
    tiltmin=num2str(tiltmin);
    
end

%% Getting User Data from the Step 5
HHres=get(handles.HHres,'String');

GHICal=get(handles.GHICal,'Value');

UserGHI=get(handles.UserGHI,'Value');

UserInso=get(handles.UserInso,'Value');

if GHICal==1
    
    gau=0;
    sin=0;
    avg=0;   
               
elseif UserGHI==1    
     
    gau=0;
    sin=0;
    avg=0;    
       
elseif UserInso==1
        
    gau=get(handles.gau,'Value');
    
    sin=get(handles.sin,'Value');
    
    avg=get(handles.avg,'Value');    
    
end

HourWise=get(handles.HourWise,'Value');

ResWise=get(handles.ResWise,'Value');

%% Creating Cell Array for Writing in the Excel File

% Intalizing Plant Info Data Cell

PlantInfo_DataCell=cell(65,2);

% Formatting the PlantInfo_DataCell with Plant Information

% Site Data
PlantInfo_DataCell(1,1:2)={'Site Data','Values'};

PlantInfo_DataCell(2,1:2)={'Project Name',PrjName};

PlantInfo_DataCell(3,1:2)={'Plant Capacity (kW)',PlantCapacity};

PlantInfo_DataCell(4,1:2)={'Latitude (Degree)',Lat};

PlantInfo_DataCell(5,1:2)={'Longitude (Degree)',Long};

% PV Module Data
PlantInfo_DataCell(7,1)={'PV Module Data'};

PlantInfo_DataCell(8,1:2)={'Module Power (W)',Pmod};

PlantInfo_DataCell(9,1:2)={'Total Number of Modules',ModNum};

PlantInfo_DataCell(10,1:2)={'PV Technology',PVTech};

PlantInfo_DataCell(11,1:2)={'Module Temperature Coefficient (%/Degree)',ModTemCF};

PlantInfo_DataCell(12,1:2)={'STC Temperature (Degree Celsius)',Tn};

PlantInfo_DataCell(13,1:2)={'STC Irradiance (W/m^(2))',Gn};

% Orientation Data
PlantInfo_DataCell(15,1)={'Orientation Data'};

PlantInfo_DataCell(16,1:2)={'Fixed Tilt',ft};

PlantInfo_DataCell(17,1:2)={'Seasonal Tilt',st};

PlantInfo_DataCell(18,1:2)={'Single-Axis EW',saew};

PlantInfo_DataCell(19,1:2)={'Single-Axis NS',sans};

PlantInfo_DataCell(20,1:2)={'Double Axis',da};

if (ft==1)
    
    PlantInfo_DataCell(21,1:2)={'Tilt of Module (Degree)',tilt};
    PlantInfo_DataCell(22,1:2)={'Azimuth of Module (Degree)',phic};
    PlantInfo_DataCell(23,1:2)={'Tilt of Module in Summer (Degree)','NA'};
    PlantInfo_DataCell(24,1:2)={'Tilt of Module in Winter (Degree)','NA'};
    PlantInfo_DataCell(25,1:2)={'Maximum Azimuth (Degree)','NA'};
    PlantInfo_DataCell(26,1:2)={'Minimum Azimuth (Degree)','NA'};
    PlantInfo_DataCell(27,1:2)={'Maximum Tilt (Degree)','NA'};
    PlantInfo_DataCell(28,1:2)={'Minimum Tilt (Degree)','NA'};
    
elseif (st==1)
    
    PlantInfo_DataCell(21,1:2)={'Tilt of Module (Degree)',tilt};
    PlantInfo_DataCell(22,1:2)={'Azimuth of Module (Degree)',phic};
    PlantInfo_DataCell(23,1:2)={'Tilt of Module in Summer (Degree)',tiltsummer};
    PlantInfo_DataCell(24,1:2)={'Tilt of Module in Winter (Degree)',tiltwinter};
    PlantInfo_DataCell(25,1:2)={'Maximum Azimuth (Degree)','NA'};
    PlantInfo_DataCell(26,1:2)={'Minimum Azimuth (Degree)','NA'};
    PlantInfo_DataCell(27,1:2)={'Maximum Tilt (Degree)','NA'};
    PlantInfo_DataCell(28,1:2)={'Minimum Tilt (Degree)','NA'};    
    
elseif (saew==1)
    
    PlantInfo_DataCell(21,1:2)={'Tilt of Module (Degree)',tilt};
    PlantInfo_DataCell(22,1:2)={'Azimuth of Module (Degree)','NA'};
    PlantInfo_DataCell(23,1:2)={'Tilt of Module in Summer (Degree)','NA'};
    PlantInfo_DataCell(24,1:2)={'Tilt of Module in Winter (Degree)','NA'};
    PlantInfo_DataCell(25,1:2)={'Maximum Azimuth (Degree)',phicmax};
    PlantInfo_DataCell(26,1:2)={'Minimum Azimuth (Degree)',phicmin};
    PlantInfo_DataCell(27,1:2)={'Maximum Tilt (Degree)','NA'};
    PlantInfo_DataCell(28,1:2)={'Minimum Tilt (Degree)','NA'};    
    
elseif (sans==1)
    
    PlantInfo_DataCell(21,1:2)={'Tilt of Module (Degree)','NA'};
    PlantInfo_DataCell(22,1:2)={'Azimuth of Module (Degree)',phic};
    PlantInfo_DataCell(23,1:2)={'Tilt of Module in Summer (Degree)','NA'};
    PlantInfo_DataCell(24,1:2)={'Tilt of Module in Winter (Degree)','NA'};
    PlantInfo_DataCell(25,1:2)={'Maximum Azimuth (Degree)','NA'};
    PlantInfo_DataCell(26,1:2)={'Minimum Azimuth (Degree)','NA'};
    PlantInfo_DataCell(27,1:2)={'Maximum Tilt (Degree)',tiltmax};
    PlantInfo_DataCell(28,1:2)={'Minimum Tilt (Degree)',tiltmin};    
    
elseif (da==1)
    
    PlantInfo_DataCell(21,1:2)={'Tilt of Module (Degree)','NA'};
    PlantInfo_DataCell(22,1:2)={'Azimuth of Module (Degree)','NA'};
    PlantInfo_DataCell(23,1:2)={'Tilt of Module in Summer (Degree)','NA'};
    PlantInfo_DataCell(24,1:2)={'Tilt of Module in Winter (Degree)','NA'};
    PlantInfo_DataCell(25,1:2)={'Maximum Azimuth (Degree)',phicmax};
    PlantInfo_DataCell(26,1:2)={'Minimum Azimuth (Degree)',phicmin};
    PlantInfo_DataCell(27,1:2)={'Maximum Tilt (Degree)',tiltmax};
    PlantInfo_DataCell(28,1:2)={'Minimum Tilt (Degree)',tiltmin}; 
    
end

% Simulation Period
PlantInfo_DataCell(30,1)={'Simulation Period'}; 

PlantInfo_DataCell(31,1:2)={'Year',StartYear};

PlantInfo_DataCell(32,1:2)={'Leap Year',lpy};

PlantInfo_DataCell(33,1:2)={'Non-Leap Year',nolpy};

PlantInfo_DataCell(34,1:2)={'Start Month',StartMonth};

PlantInfo_DataCell(35,1:2)={'Start Day',StartDay};

PlantInfo_DataCell(36,1:2)={'End Month',EndMonth};

PlantInfo_DataCell(37,1:2)={'End Day',EndDay};

% Computation Options
PlantInfo_DataCell(39,1)={'Computation Options'};

PlantInfo_DataCell(40,1:2)={'Simulation Resolution (minutes)',HHres};

PlantInfo_DataCell(41,1:2)={'Irradiance Calculator',GHICal};

PlantInfo_DataCell(42,1:2)={'Irradiance File',UserGHI};

PlantInfo_DataCell(43,1:2)={'Insolation File',UserInso};

PlantInfo_DataCell(44,1:2)={'Gaussian (Distribution of Insolation)',gau};

PlantInfo_DataCell(45,1:2)={'Sinusoidal (Distribution of Insolation)',sin};

PlantInfo_DataCell(46,1:2)={'Average (Distribution of Insolation)',avg};

PlantInfo_DataCell(47,1:2)={'Weather File Hour-Wise',HourWise};

PlantInfo_DataCell(48,1:2)={'Weather File Resolution-Wise',ResWise};

% Loss Parameters
PlantInfo_DataCell(50,1)={'Loss Parameters'};

PlantInfo_DataCell(51,1:2)={'Deafault Values (Loss Parameters)',Default};

PlantInfo_DataCell(52,1:2)={'User-Defined (Loss Parameters)',UserDef};
    
PlantInfo_DataCell(53,1:2)={'Soiling Loss (%)',SF};

PlantInfo_DataCell(54,1:2)={'Light Induced Degradation (%)',LID};

PlantInfo_DataCell(55,1:2)={'Light Soaking (%)',LS};

PlantInfo_DataCell(56,1:2)={'Array Mismatch (%)',Araymismat};

PlantInfo_DataCell(57,1:2)={'Ohmic Loss (%)',OhmicLoss};

PlantInfo_DataCell(58,1:2)={'Albedo Value',rho};

PlantInfo_DataCell(59,1:2)={'Tracker System Loss (%)',TrackerL};

PlantInfo_DataCell(60,1:2)={'Inverter Efficiency (%)',INVeff};

PlantInfo_DataCell(61,1:2)={'Transformer Loss (%)',TransLoss};

PlantInfo_DataCell(62,1:2)={'Faimans Uo Constant Heat Transfer (W/m^(2)K)',Uo};

PlantInfo_DataCell(63,1:2)={'Faimans U1 Consvective Heat Transfer (W/m^(2)K)',U1};

PlantInfo_DataCell(64,1:2)={'Shading Loss (%)',Shading};

PlantInfo_DataCell(65,1:2)={'IAM Factor (bo)',bo};


%% Getting File Name from User for Saving Plant Info

[file,path] = uiputfile({'*.xlsx';'*.xls';'*.xlsb';'*.xlsm'},'Save Solar Plant Information As');

%% Saving the Plant Info in Excel File

fullpathname=strcat(path, file);

sheet = 1;

xlRange = 'A1';

xlswrite(fullpathname,PlantInfo_DataCell,sheet,xlRange);
