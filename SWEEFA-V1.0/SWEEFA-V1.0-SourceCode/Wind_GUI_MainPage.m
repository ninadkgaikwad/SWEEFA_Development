function varargout = Wind_GUI_MainPage(varargin)
% WIND_GUI_MAINPAGE MATLAB code for Wind_GUI_MainPage.fig
%      WIND_GUI_MAINPAGE, by itself, creates a new WIND_GUI_MAINPAGE or raises the existing
%      singleton*.
%
%      H = WIND_GUI_MAINPAGE returns the handle to a new WIND_GUI_MAINPAGE or the handle to
%      the existing singleton*.
%
%      WIND_GUI_MAINPAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WIND_GUI_MAINPAGE.M with the given input arguments.
%
%      WIND_GUI_MAINPAGE('Property','Value',...) creates a new WIND_GUI_MAINPAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Wind_GUI_MainPage_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Wind_GUI_MainPage_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Wind_GUI_MainPage

% Last Modified by GUIDE v2.5 02-Nov-2017 14:27:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Wind_GUI_MainPage_OpeningFcn, ...
                   'gui_OutputFcn',  @Wind_GUI_MainPage_OutputFcn, ...
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


% --- Executes just before Wind_GUI_MainPage is made visible.
function Wind_GUI_MainPage_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Wind_GUI_MainPage (see VARARGIN)

% Choose default command line output for Wind_GUI_MainPage
handles.output = hObject;

% Initializing the GUI

set(handles.PrjName,'String','');

set(handles.PlantCapacity,'String','');

set(handles.Lat,'String','');

set(handles.Long,'String','');

set(handles.Altitude,'String','');

set(handles.StartYear,'String','');

set(handles.LpYear,'Value',1);
set(handles.NLpYear,'Value',0);

set(handles.StartMonth,'Value',1);

set(handles.StartDay,'Value',1);

set(handles.EndMonth,'Value',12);

set(handles.EndDay,'Value',31);

set(handles.Res,'String','');

set(handles.Sim1,'Value',1);
set(handles.Sim2,'Value',0);

set(handles.b1,'Enable','off');
set(handles.b2,'Enable','off');
set(handles.b3,'Enable','off');
set(handles.b4,'Enable','off');
set(handles.b7,'Enable','on');

% Update handles structure
guidata(hObject, handles);

setappdata(0,'Wind_GUI_MainPage',gcf);

% UIWAIT makes Wind_GUI_MainPage wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Wind_GUI_MainPage_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing the Current GUI and All Others

hf1=findobj('Name','Wind_Loss_Parameters_GUI');
close(hf1);

hf2=findobj('Name','Wake_Model_GUI');
close(hf2);

hf3=findobj('Name','Wind_WeibullDistribution_GUI');
close(hf3);

close;

% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting WorkSpaces of Wind App GUI's

Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

Wind_GUI_1=getappdata(0,'Wind_GUI_1');

Wind_Loss_Parameters_GUI=getappdata(0,'Wind_Loss_Parameters_GUI');

% Getting Data from Wind_GUI_1
AllParameters=getappdata(Wind_GUI_1,'AllParameters');

% Getting Data from Wind_GUI_MainPage

% Getting User Data from the Step 1
PrjName=get(handles.PrjName,'String');
setappdata(Wind_GUI_MainPage,'PrjName',PrjName);

PlantCapacity=get(handles.PlantCapacity,'String');
setappdata(Wind_GUI_MainPage,'PlantCapacity',PlantCapacity);

Lat=get(handles.Lat,'String');
setappdata(Wind_GUI_MainPage,'Lat',Lat);
Lat=str2double(Lat);

Long=get(handles.Long,'String');
setappdata(Wind_GUI_MainPage,'Long',Long);
Long=str2double(Long);

Altitude=get(handles.Altitude,'String');
setappdata(Wind_GUI_MainPage,'Long',Long);
Altitude=str2double(Altitude);

% Getting User Data from the Step 2
lpy=get(handles.LpYear,'Value');

nolpy=get(handles.NLpYear,'Value');

StartMonth=get(handles.StartMonth,'Value');

StartDay=get(handles.StartDay,'Value');

EndMonth=get(handles.EndMonth,'Value');

EndDay=get(handles.EndDay,'Value');

StartYear=get(handles.StartYear,'String');
StartYear=str2double(StartYear);

% Getting User Data from the Step 3

Res=get(handles.Res,'String');
Res=str2double(Res);

Sim1=get(handles.Sim1,'Value'); % Rayleigh Simulation

Sim2=get(handles.Sim2,'Value'); % Real Simulation

Temp=getappdata(Wind_GUI_MainPage,'TempFile');%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

WS=getappdata(Wind_GUI_MainPage,'WindSpeedFile');%%%%%%%%%%%%%%%%%%%%%%%%%%

ActiveTurbines_File=getappdata(Wind_GUI_MainPage,'ActiveTurbines_File'); % [Modification]

% Combining All User Input from Wind_GUI_MainPage in a Single Cell

SimParameters={PrjName,PlantCapacity,Lat,Long,Altitude,lpy,nolpy,StartMonth,StartDay,EndMonth,EndDay,StartYear,Res,Sim1,Sim2,Temp,WS};

% Getting Data from Wind_Loss_Parameters_GUI

WindLossParameters=getappdata(Wind_Loss_Parameters_GUI,'WindLossParameters');%%%%%%%%%%%%%%%%%%%%%%%%%

% [Modification]

ActiveTurbines_T1_File=ActiveTurbines_File; % [Modification]

ActiveTurbines_T1(1,1)={ActiveTurbines_T1_File}; % [Modification]

ActiveTurbines(1,1)=ActiveTurbines_T1; % [Modification]

WindLossParameters(1,11)=ActiveTurbines; % [Modification]

% Using External Function for Energy Estimation of the Wind Power Plant

[TotalWTGOut,TotalWTGPGrid,TotalWTGOhmicLoss,TotalWTGTransLoss,MonthWTGOut,MonthWTGPGrid,MonthWTGOhmicLoss,MonthWTGTransLoss] = WTGEnergySimulation( SimParameters,AllParameters,WindLossParameters );

% Total Energies
TotalWTGOut=num2str(TotalWTGOut);
setappdata(Wind_GUI_MainPage,'TotalWTGOut',TotalWTGOut);

TotalWTGPGrid=num2str(TotalWTGPGrid);
setappdata(Wind_GUI_MainPage,'TotalWTGPGrid',TotalWTGPGrid);

TotalWTGOhmicLoss=num2str(TotalWTGOhmicLoss);
setappdata(Wind_GUI_MainPage,'TotalWTGOhmicLoss',TotalWTGOhmicLoss);

TotalWTGTransLoss=num2str(TotalWTGTransLoss);
setappdata(Wind_GUI_MainPage,'TotalWTGTransLoss',TotalWTGTransLoss);

% Mont-Wise Energies
MonthWTGOut=(MonthWTGOut);
setappdata(Wind_GUI_MainPage,'MonthWTGOut',MonthWTGOut);

MonthWTGPGrid=(MonthWTGPGrid);
setappdata(Wind_GUI_MainPage,'MonthWTGPGrid',MonthWTGPGrid);

MonthWTGOhmicLoss=(MonthWTGOhmicLoss);
setappdata(Wind_GUI_MainPage,'MonthWTGOhmicLoss',MonthWTGOhmicLoss);

MonthWTGTransLoss=(MonthWTGTransLoss);
setappdata(Wind_GUI_MainPage,'MonthWTGTransLoss',MonthWTGTransLoss);

% Opening Simulation Report GUI

Wind_FinalRepot_GUI;


% --- Executes on button press in b6.
function b6_Callback(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting the GUI

set(handles.PrjName,'String','');

set(handles.PlantCapacity,'String','');

set(handles.Lat,'String','');

set(handles.Long,'String','');

set(handles.Altitude,'String','');

set(handles.StartYear,'String','');

set(handles.LpYear,'Value',1);
set(handles.NLpYear,'Value',0);

set(handles.StartMonth,'Value',1);

set(handles.StartDay,'Value',1);

set(handles.EndMonth,'Value',12);

set(handles.EndDay,'Value',31);

set(handles.Res,'String','');

set(handles.Sim1,'Value',1);
set(handles.Sim2,'Value',0);

set(handles.b1,'Enable','off');
set(handles.b2,'Enable','off');
set(handles.b3,'Enable','off');
set(handles.b4,'Enable','off');
set(handles.b7,'Enable','on');

% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Wind Loss Parameters GUI
Wind_Loss_Parameters_GUI;


function Res_Callback(hObject, eventdata, handles)
% hObject    handle to Res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Res as text
%        str2double(get(hObject,'String')) returns contents of Res as a double


% --- Executes during object creation, after setting all properties.
function Res_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function StartYear_Callback(hObject, eventdata, handles)
% hObject    handle to StartYear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StartYear as text
%        str2double(get(hObject,'String')) returns contents of StartYear as a double


% --- Executes during object creation, after setting all properties.
function StartYear_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartYear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in EndDay.
function EndDay_Callback(hObject, eventdata, handles)
% hObject    handle to EndDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns EndDay contents as cell array
%        contents{get(hObject,'Value')} returns selected item from EndDay


% --- Executes during object creation, after setting all properties.
function EndDay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EndDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in StartDay.
function StartDay_Callback(hObject, eventdata, handles)
% hObject    handle to StartDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns StartDay contents as cell array
%        contents{get(hObject,'Value')} returns selected item from StartDay


% --- Executes during object creation, after setting all properties.
function StartDay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in EndMonth.
function EndMonth_Callback(hObject, eventdata, handles)
% hObject    handle to EndMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns EndMonth contents as cell array
%        contents{get(hObject,'Value')} returns selected item from EndMonth


% --- Executes during object creation, after setting all properties.
function EndMonth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EndMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in StartMonth.
function StartMonth_Callback(hObject, eventdata, handles)
% hObject    handle to StartMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns StartMonth contents as cell array
%        contents{get(hObject,'Value')} returns selected item from StartMonth


% --- Executes during object creation, after setting all properties.
function StartMonth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Loading Temperature File into Simulation
[filename,pathname]=uigetfile({'*.*'},'Temperature File Selector');
fullpathname=strcat(pathname, filename);
TempFile=xlsread(fullpathname);
setappdata(Wind_GUI_MainPage,'TempFile',TempFile);

assignin('base','temp',TempFile); % For Debugging


% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Loading Wind Speed File into Simulation
% [filename,pathname]=uigetfile({'*.*'},'Wind Speed File Selector');
% fullpathname=strcat(pathname, filename);
% WindSpeedFile=xlsread(fullpathname);

% Loading Single-Input File into Simulation
[filename,pathname]=uigetfile({'*.*'},'WTG Input-File Selector');
fullpathname=strcat(pathname, filename);
WTGInputFile=xlsread(fullpathname);

WindSpeedFile=WTGInputFile(:,5);
TempFile=WTGInputFile(:,6);
ActiveTurbines_File=WTGInputFile(:,8);

setappdata(Wind_GUI_MainPage,'WindSpeedFile',WindSpeedFile);
setappdata(Wind_GUI_MainPage,'TempFile',TempFile);
setappdata(Wind_GUI_MainPage,'ActiveTurbines_File',ActiveTurbines_File);

assignin('base','ws',WindSpeedFile); % For Debugging



function Altitude_Callback(hObject, eventdata, handles)
% hObject    handle to Altitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Altitude as text
%        str2double(get(hObject,'String')) returns contents of Altitude as a double


% --- Executes during object creation, after setting all properties.
function Altitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Altitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b7.
function b7_Callback(hObject, eventdata, handles)
% hObject    handle to b7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles 

% Getting Current GUI WorkSpace name
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Setting Data into Workspace

LpYear=get(handles.LpYear,'Value');
setappdata(Wind_GUI_MainPage,'LpYear',LpYear);

NLpYear=get(handles.NLpYear,'Value');
setappdata(Wind_GUI_MainPage,'NLpYear',NLpYear);

Altitude=get(handles.Altitude,'String');
Altitude=str2double(Altitude);
setappdata(Wind_GUI_MainPage,'Altitude',Altitude);

% Opening Rayleigh Distribution GUI
Wind_WeibullDistribution_GUI;


% --- Executes when selected object is changed in uipanel9.
function uipanel9_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel9 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Getting Radio Button Values
Sim1=get(handles.Sim1,'Value');
Sim2=get(handles.Sim2,'Value');

% Modifying behaviour of GUI Elements in accordance with radio button values
if (Sim1==1)

set(handles.b7,'Enable','on');

set(handles.b1,'Enable','off');
set(handles.b2,'Enable','off');
set(handles.b3,'Enable','off');
set(handles.b4,'Enable','off');

elseif (Sim2==1)

set(handles.b1,'Enable','on');
set(handles.b2,'Enable','on');
set(handles.b3,'Enable','on');
set(handles.b4,'Enable','on');

set(handles.b7,'Enable','off');

end


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Getting Radio Button Values
Sim1=get(handles.Sim1,'Value');
Sim2=get(handles.Sim2,'Value');

% Modifying behaviour of GUI Elements in accordance with radio button values
if (Sim1==1)

set(handles.b7,'Enable','on');

set(handles.b1,'Enable','off');
set(handles.b2,'Enable','off');
set(handles.b3,'Enable','off');
set(handles.b4,'Enable','off');

elseif (Sim2==1)

set(handles.b1,'Enable','on');
set(handles.b2,'Enable','on');
set(handles.b3,'Enable','on');
set(handles.b4,'Enable','on');

set(handles.b7,'Enable','off');

end


% --- Executes on button press in b8.
function b8_Callback(hObject, eventdata, handles)
% hObject    handle to b8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Getting Plant Info File from User

[filename,pathname]=uigetfile({'*.xlsx';'*.xls';'*.xlsb';'*.xlsm'},'Plant Info File Selector');

fullpathname=strcat(pathname, filename);

[~,~,PlantInfo_DataCell] =xlsread(fullpathname);

%% Putting PlantInfo_DataCell in GUI WorkSpace

Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

setappdata(Wind_GUI_MainPage,'PlantInfo_DataCell',PlantInfo_DataCell);

%% Setting Current GUI Properties according to PlantInfo_DataCell

% Site Data Iformation
PrjName=PlantInfo_DataCell{2,2};
set(handles.PrjName,'String',PrjName);

PlantCapacity=PlantInfo_DataCell{3,2};
set(handles.PlantCapacity,'String',PlantCapacity);

Lat=PlantInfo_DataCell{4,2};
set(handles.Lat,'String',Lat);

Long=PlantInfo_DataCell{5,2};
set(handles.Long,'String',Long);

Altitude=PlantInfo_DataCell{6,2};
set(handles.Altitude,'String',Altitude);

% Simulation Period Information
StartYear=PlantInfo_DataCell{51,2};
set(handles.StartYear,'String',StartYear);

lpy=PlantInfo_DataCell{52,2};
set(handles.lpy,'Value',lpy);

nolpy=PlantInfo_DataCell{53,2};
set(handles.nolpy,'Value',nolpy);

StartMonth=PlantInfo_DataCell{54,2};
set(handles.popupmenu1,'Value',StartMonth);

StartDay=PlantInfo_DataCell{55,2};
set(handles.popupmenu2,'Value',StartDay);

EndMonth=PlantInfo_DataCell{56,2};
set(handles.popupmenu3,'Value',EndMonth);

EndDay=PlantInfo_DataCell{57,2};
set(handles.popupmenu4,'Value',EndDay);

% Computaion Options Information

Sim1=PlantInfo_DataCell{60,2};
set(handles.Sim1,'Value',Sim1);

Sim2=PlantInfo_DataCell{61,2};
set(handles.Sim2,'Value',Sim2);

if (Sim1==1)
    
    set(handles.b7,'Enable','on');
    
    set(handles.b1,'Enable','off');
    set(handles.b2,'Enable','off');
    set(handles.b3,'Enable','off');
    set(handles.b4,'Enable','off');
    
    % Opening the Required GUI
    Wind_WeibullDistribution_GUI;
    
elseif (Sim2==1)
    
    set(handles.b1,'Enable','on');    
    set(handles.b2,'Enable','on');
    set(handles.b3,'Enable','on');
    set(handles.b4,'Enable','on');   
    
    set(handles.b7,'Enable','off');        
    
end

% Opening the Required GUI
Wind_GUI_1;
Wind_Loss_Parameters_GUI;


% --- Executes on button press in b9.
function b9_Callback(hObject, eventdata, handles)
% hObject    handle to b9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Getting User Data

% Getting GUI Workspaces
Wind_GUI_1=getappdata(0,'Wind_GUI_1');

Wind_Loss_Parameters_GUI=getappdata(0,'Wind_Loss_Parameters_GUI');

Wind_WeibullDistribution_GUI=getappdata(0,'Wind_WeibullDistribution_GUI');

% Getting User Data from Wind Energy Esitimation App
PrjName=get(handles.PrjName,'String');

PlantCapacity=get(handles.PlantCapacity,'String');

Lat=get(handles.Lat,'String');

Long=get(handles.Long,'String');

Altitude=get(handles.Altitude,'String');

% Getting User Data from the Step 2
lpy=get(handles.LpYear,'Value');

nolpy=get(handles.NLpYear,'Value');

StartMonth=get(handles.StartMonth,'Value');

StartDay=get(handles.StartDay,'Value');

EndMonth=get(handles.EndMonth,'Value');

EndDay=get(handles.EndDay,'Value');

StartYear=get(handles.StartYear,'String');

% Getting User Data from the Step 3

Res=get(handles.Res,'String');

Sim1=get(handles.Sim1,'Value'); % Rayleigh Simulation

Sim2=get(handles.Sim2,'Value'); % Real Simulation

% Getting User Data from Wind Data Acquisition App
AllParameters=getappdata(Wind_GUI_1,'AllParameters');

% Getting User Data from Wind Loss Parameters GUI
WindLossParameters=getappdata(Wind_Loss_Parameters_GUI,'WindLossParameters');

% Getting User Data from Wind Weibull Distribution GUI
if (Sim1==1)
    
    Weibull_Parameters=getappdata(Wind_WeibullDistribution_GUI,'Weibull_Parameters');
    
    % Disintegrating Cell Weibull_Parameters
    WRes=Weibull_Parameters{1,1};
    k=Weibull_Parameters{1,2};
    YrWs=Weibull_Parameters{1,3};
    YrTemp=Weibull_Parameters{1,4};
    MrWs=Weibull_Parameters{1,5};
    MrTemp=Weibull_Parameters{1,6};
    months=Weibull_Parameters{1,7};
    yr=Weibull_Parameters{1,8};
    mr=Weibull_Parameters{1,9};
    
elseif (Sim2==1)
    
    Weibull_Parameters={'NA','NA','NA','NA','NA','NA',['NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA','NA'],'NA','NA'};
    
    % Disintegrating Cell Weibull_Parameters
    WRes=Weibull_Parameters{1,1};
    k=Weibull_Parameters{1,2};
    YrWs=Weibull_Parameters{1,3};
    YrTemp=Weibull_Parameters{1,4};
    MrWs=Weibull_Parameters{1,5};
    MrTemp=Weibull_Parameters{1,6};
    months=Weibull_Parameters{1,7};
    yr=Weibull_Parameters{1,8};
    mr=Weibull_Parameters{1,9};
    
end

%% Disintegrating All Cell Parameters

% Disintegrating Cell AllParameters
WG_TurbineType=AllParameters{1,1} ;
Parameters_T1=AllParameters{1,2} ;
Parameters_T2=AllParameters{1,3} ;
Parameters_T3=AllParameters{1,4} ;
Parameters_T4=AllParameters{1,5} ;
SimPowerCurve=AllParameters{1,6} ;
UserPowerCurve=AllParameters{1,7} ;

% Disintegrating WG_TurbineType
T1=WG_TurbineType(1,1) ;
T2=WG_TurbineType(1,2) ;
T3=WG_TurbineType(1,3) ;
T4=WG_TurbineType(1,4) ;

% Disintegrating Parameters_T1
sub_T1=Parameters_T1{1,1} ;
sub_T1=num2str(sub_T1);

subnum_T1=Parameters_T1{1,2} ;
subnum_T1 = sprintf('%f,' , subnum_T1);
subnum_T1 = subnum_T1(1:end-1);

hub_T1=Parameters_T1{1,3} ;
hub_T1 = sprintf('%f,' , hub_T1);
hub_T1 = hub_T1(1:end-1);

cutin_T1=Parameters_T1{1,5} ;
cutin_T1 = sprintf('%f,' , cutin_T1);
cutin_T1 = cutin_T1(1:end-1);

cutout_T1=Parameters_T1{1,7} ;
cutout_T1 = sprintf('%f,' , cutout_T1);
cutout_T1 = cutout_T1(1:end-1);

rotrad_T1=Parameters_T1{1,8} ;
rotrad_T1 = sprintf('%f,' , rotrad_T1);
rotrad_T1 = rotrad_T1(1:end-1);

% Disintegrating Parameters_T2
sub_T2=Parameters_T2{1,1} ;
sub_T2=num2str(sub_T2);

subnum_T2=Parameters_T2{1,2} ;
subnum_T2 = sprintf('%f,' , subnum_T2);
subnum_T2 = subnum_T2(1:end-1);

hub_T2=Parameters_T2{1,3} ;
hub_T2 = sprintf('%f,' , hub_T2);
hub_T2 = hub_T2(1:end-1);

cutin_T2=Parameters_T2{1,5} ;
cutin_T2 = sprintf('%f,' , cutin_T2);
cutin_T2 = cutin_T2(1:end-1);

cutout_T2=Parameters_T2{1,7} ;
cutout_T2 = sprintf('%f,' , cutout_T2);
cutout_T2 = cutout_T2(1:end-1);

rotrad_T2=Parameters_T2{1,8} ;
rotrad_T2 = sprintf('%f,' , rotrad_T2);
rotrad_T2 = rotrad_T2(1:end-1);

% Disintegrating Parameters_T3
sub_T3=Parameters_T3{1,1} ;
sub_T3=num2str(sub_T3);

subnum_T3=Parameters_T3{1,2} ;
subnum_T3 = sprintf('%f,' , subnum_T3);
subnum_T3 = subnum_T3(1:end-1);

hub_T3=Parameters_T3{1,3} ;
hub_T3 = sprintf('%f,' , hub_T3);
hub_T3 = hub_T3(1:end-1);

cutin_T3=Parameters_T3{1,5} ;
cutin_T3 = sprintf('%f,' , cutin_T3);
cutin_T3 = cutin_T3(1:end-1);

cutout_T3=Parameters_T3{1,7} ;
cutout_T3 = sprintf('%f,' , cutout_T3);
cutout_T3 = cutout_T3(1:end-1);

rotrad_T3=Parameters_T3{1,8} ;
rotrad_T3 = sprintf('%f,' , rotrad_T3);
rotrad_T3 = rotrad_T3(1:end-1);

% Disintegrating Parameters_T4
sub_T4=Parameters_T4{1,1} ;
sub_T4=num2str(sub_T4);

subnum_T4=Parameters_T4{1,2} ;
subnum_T4 = sprintf('%f,' , subnum_T4);
subnum_T4 = subnum_T4(1:end-1);

hub_T4=Parameters_T4{1,3} ;
hub_T4 = sprintf('%f,' , hub_T4);
hub_T4 = hub_T4(1:end-1);

cutin_T4=Parameters_T4{1,5} ;
cutin_T4 = sprintf('%f,' , cutin_T4);
cutin_T4 = cutin_T4(1:end-1);

cutout_T4=Parameters_T4{1,7} ;
cutout_T4 = sprintf('%f,' , cutout_T4);
cutout_T4 = cutout_T4(1:end-1);

rotrad_T4=Parameters_T4{1,8} ;
rotrad_T4 = sprintf('%f,' , rotrad_T4);
rotrad_T4 = rotrad_T4(1:end-1);

% Disintegrating Cell WindLossParameters
Wake1=WindLossParameters{1,1} ;
Wake2=WindLossParameters{1,2} ;

DenSTC=WindLossParameters{1,3} ;
DenSTC=num2str(DenSTC);

OhmicLoss=WindLossParameters{1,4} ;
OhmicLoss=num2str(OhmicLoss);

TransLoss=WindLossParameters{1,5} ;
TransLoss=num2str(TransLoss);

WakeLoss=WindLossParameters{1,6} ;
WakeLoss=num2str(WakeLoss);

WakeModelParameters=WindLossParameters{1,7} ;

Perf_Rat=WindLossParameters{1,8} ;
Turbine_File=WindLossParameters{1,9} ;

PR=WindLossParameters{1,10} ;
PR=num2str(PR);

Terrain=WindLossParameters{1,12} ;
Terrain=num2str(Terrain);

HeightAnemometer=WindLossParameters{1,13} ;
HeightAnemometer=num2str(HeightAnemometer);

Default=WindLossParameters{1,14} ;
User_Def=WindLossParameters{1,15} ;

TempSTC=WindLossParameters{1,16} ;
PresSTC=WindLossParameters{1,17} ;
AltiSTC=WindLossParameters{1,18} ;

% Disintegrating Cell WakeModelParameters
Jensen=WakeModelParameters{1,1} ; 
Frandsen=WakeModelParameters{1,2} ; 

a_J=WakeModelParameters{1,3} ; 
a_J=num2str(a_J);

k_J=WakeModelParameters{1,4} ; 
k_J=num2str(k_J);

x_J=WakeModelParameters{1,5} ;
x_J=num2str(x_J);

a_F=WakeModelParameters{1,6} ; 
a_F=num2str(a_F);

k_F=WakeModelParameters{1,7} ; 
k_F=num2str(k_F);

x_F=WakeModelParameters{1,8} ; 
x_F=num2str(x_F);

alpha=WakeModelParameters{1,9} ; 
alpha=num2str(alpha);



%% Creating Cell Array for Writing in the Excel File

% Intalizing Plant Info Data Cell

PlantInfo_DataCell=cell(111,2);

% Formatting the PlantInfo_DataCell with Plant Information

% Site Data
PlantInfo_DataCell(1,1:2)={'Site Data','Values'};

PlantInfo_DataCell(2,1:2)={'Project Name',PrjName};

PlantInfo_DataCell(3,1:2)={'Plant Capacity (kW)',PlantCapacity};

PlantInfo_DataCell(4,1:2)={'Latitude (Degree)',Lat};

PlantInfo_DataCell(5,1:2)={'Longitude (Degree)',Long};

PlantInfo_DataCell(6,1:2)={'Altitude (m)',Altitude};

% Mode Information

PlantInfo_DataCell(8,1)={'Mode'};

PlantInfo_DataCell(9,1:2)={'Simulate Wind Turbine Power Curves',SimPowerCurve};

PlantInfo_DataCell(10,1:2)={'User has Wind Turbine Power Curves',UserPowerCurve};

% Wind Generator Type Information

PlantInfo_DataCell(12,1)={'Wind Generator Type'};

PlantInfo_DataCell(13,1:2)={'Type 1',T1};

PlantInfo_DataCell(14,1:2)={'Type 2',T2};

PlantInfo_DataCell(15,1:2)={'Type 3',T3};

PlantInfo_DataCell(16,1:2)={'Type 4',T4};

% Wind Generator Submodel Numbers Information

PlantInfo_DataCell(18,1)={'Wind Generator Submodel Numbers'};

PlantInfo_DataCell(19,1:2)={'Type 1 Submodels Number',sub_T1};

PlantInfo_DataCell(20,1:2)={'Type 2 Submodels Number',sub_T2};

PlantInfo_DataCell(21,1:2)={'Type 3 Submodels Number',sub_T3};

PlantInfo_DataCell(22,1:2)={'Type 4 Submodels Number',sub_T4};

% Total Number of Wind Turbines Information

PlantInfo_DataCell(24,1)={'Total Number of Wind Turbines'};

PlantInfo_DataCell(25,1:2)={'Type 1 Total Number of Turbines',subnum_T1};

PlantInfo_DataCell(26,1:2)={'Type 2 Total Number of Turbines',subnum_T2};

PlantInfo_DataCell(27,1:2)={'Type 3 Total Number of Turbines',subnum_T3};

PlantInfo_DataCell(28,1:2)={'Type 4 Total Number of Turbines',subnum_T4};

% Cut-In/Cut-Out Wind Speeds of the Turbines Information

PlantInfo_DataCell(30,1)={'Cut-In/Cut-Out Wind Speeds of the Turbines'};

PlantInfo_DataCell(31,1:2)={'Type 1 Cut-In Wind Speed (m/s)',cutin_T1};

PlantInfo_DataCell(32,1:2)={'Type 2 Cut-In Wind Speed (m/s)',cutin_T2};

PlantInfo_DataCell(33,1:2)={'Type 3 Cut-In Wind Speed (m/s)',cutin_T3};

PlantInfo_DataCell(34,1:2)={'Type 4 Cut-In Wind Speed (m/s)',cutin_T4};

PlantInfo_DataCell(35,1:2)={'Type 1 Cut-Out Wind Speed (m/s)',cutout_T1};

PlantInfo_DataCell(36,1:2)={'Type 2 Cut-Out Wind Speed (m/s)',cutout_T2};

PlantInfo_DataCell(37,1:2)={'Type 3 Cut-Out Wind Speed (m/s)',cutout_T3};

PlantInfo_DataCell(38,1:2)={'Type 4 Cut-Out Wind Speed (m/s)',cutout_T4};

% Hub-Height and Rotor Radius of Wind Turbines Information

PlantInfo_DataCell(40,1)={'Hub-Height and Rotor Radius of Wind Turbines'};

PlantInfo_DataCell(41,1:2)={'Type 1 Hub Height (m)',hub_T1};

PlantInfo_DataCell(42,1:2)={'Type 2 Hub Height (m)',hub_T2};

PlantInfo_DataCell(43,1:2)={'Type 3 Hub Height (m)',hub_T3};

PlantInfo_DataCell(44,1:2)={'Type 4 Hub Height (m)',hub_T4};

PlantInfo_DataCell(45,1:2)={'Type 1 Rotor Radius (m)',rotrad_T1};

PlantInfo_DataCell(46,1:2)={'Type 2 Rotor Radius (m)',rotrad_T2};

PlantInfo_DataCell(47,1:2)={'Type 3 Rotor Radius (m)',rotrad_T3};

PlantInfo_DataCell(48,1:2)={'Type 4 Rotor Radius (m)',rotrad_T4};

% Simulation Period Information
PlantInfo_DataCell(50,1)={'Simulation Period'}; 

PlantInfo_DataCell(51,1:2)={'Year',StartYear};

PlantInfo_DataCell(52,1:2)={'Leap Year',lpy};

PlantInfo_DataCell(53,1:2)={'Non-Leap Year',nolpy};

PlantInfo_DataCell(54,1:2)={'Start Month',StartMonth};

PlantInfo_DataCell(55,1:2)={'Start Day',StartDay};

PlantInfo_DataCell(56,1:2)={'End Month',EndMonth};

PlantInfo_DataCell(57,1:2)={'End Day',EndDay};

% Computation Options Information
PlantInfo_DataCell(59,1)={'Computation Options'}; 

PlantInfo_DataCell(60,1:2)={'Simulation Resolution (minutes)',Res};

PlantInfo_DataCell(61,1:2)={'Using Weibull Distribution',Sim1};

PlantInfo_DataCell(62,1:2)={'Using Weather Files',Sim2};

% Loss Parameters Information

PlantInfo_DataCell(64,1)={'Loss Parameters'};

PlantInfo_DataCell(65,1:2)={'Default',Default};

PlantInfo_DataCell(66,1:2)={'User-Defined',User_Def};

PlantInfo_DataCell(67,1:2)={'STC Air Density (kg/m6(3))',DenSTC};

PlantInfo_DataCell(68,1:2)={'STC Air Temperature (Degree Celsius)',TempSTC};

PlantInfo_DataCell(69,1:2)={'STC Air Pressure (atm)',PresSTC};

PlantInfo_DataCell(70,1:2)={'Altitude of Turbine Testing Facility (m)',AltiSTC};

PlantInfo_DataCell(71,1:2)={'Ohmic Loss (%)',OhmicLoss};

PlantInfo_DataCell(72,1:2)={'Trasformer Loss (%)',TransLoss};

PlantInfo_DataCell(73,1:2)={'Wake Loss Percentage Mode',Wake1};

PlantInfo_DataCell(74,1:2)={'Wake Loss (%)',WakeLoss};

PlantInfo_DataCell(75,1:2)={'Wake Loss Model Mode',Wake2};

PlantInfo_DataCell(76,1:2)={'Jensen Model',Jensen};

PlantInfo_DataCell(77,1:2)={'Turbine Induction Factor (a)',a_J};

PlantInfo_DataCell(78,1:2)={'Wake Decay Constant (k)',k_J};

PlantInfo_DataCell(79,1:2)={'Axial Distance Between Turbines (m)',x_J};

PlantInfo_DataCell(80,1:2)={'Frandsen Model',Frandsen};

PlantInfo_DataCell(81,1:2)={'Turbine Induction Factor (a)',a_F};

PlantInfo_DataCell(82,1:2)={'Wake Decay Constant (k)',k_F};

PlantInfo_DataCell(83,1:2)={'Axial Distance Between Turbines (m)',x_F};

PlantInfo_DataCell(84,1:2)={'Initial Wake Expansion Coefficient',alpha};

PlantInfo_DataCell(85,1:2)={'Performance Ratio Mode',Perf_Rat};

PlantInfo_DataCell(86,1:2)={'Performance Ratio',PR};

PlantInfo_DataCell(87,1:2)={'Active Turbines File Mode',Turbine_File};

PlantInfo_DataCell(88,1:2)={'Terrain Coefficient',Terrain};

PlantInfo_DataCell(89,1:2)={'Height of Anemometer (m)',HeightAnemometer};

% Weibull Wind Probability Analysis Information

PlantInfo_DataCell(91,1)={'Weibull Wind Probability Analysis'};

PlantInfo_DataCell(92,1:2)={'Wind Speed Resolution (m/s)',WRes};

PlantInfo_DataCell(93,1:2)={'Weibull Shape Factor',k};

PlantInfo_DataCell(94,1:2)={'Yearly Data Mode',yr};

PlantInfo_DataCell(95,1:2)={'Yearly Mean Wind Speed (m/s)',YrWs};

PlantInfo_DataCell(96,1:2)={'Yearly Mean Temperature (Degree Celsius)',YrTemp};

PlantInfo_DataCell(97,1:2)={'Monthly Data Mode',mr};

PlantInfo_DataCell(98,1:2)={'Monthly Mean Wind Speed (m/s)',MrWs};

PlantInfo_DataCell(99,1:2)={'Monthly Mean Temperature (Degree Celsius)',MrTemp};

PlantInfo_DataCell(100,1:2)={'January',months(1,1)};

PlantInfo_DataCell(101,1:2)={'February',months(1,2)};

PlantInfo_DataCell(102,1:2)={'March',months(1,3)};

PlantInfo_DataCell(103,1:2)={'April',months(1,4)};

PlantInfo_DataCell(104,1:2)={'May',months(1,5)};

PlantInfo_DataCell(105,1:2)={'June',months(1,6)};

PlantInfo_DataCell(106,1:2)={'July',months(1,7)};

PlantInfo_DataCell(107,1:2)={'August',months(1,8)};

PlantInfo_DataCell(108,1:2)={'September',months(1,9)};

PlantInfo_DataCell(109,1:2)={'October',months(1,10)};

PlantInfo_DataCell(110,1:2)={'November',months(1,11)};

PlantInfo_DataCell(111,1:2)={'December',months(1,12)};


%% Getting File Name from User for Saving Plant Info

[file,path] = uiputfile({'*.xlsx';'*.xls';'*.xlsb';'*.xlsm'},'Save Solar Plant Information As');

%% Saving the Plant Info in Excel File

fullpathname=strcat(path, file);

sheet = 1;

xlRange = 'A1';

xlswrite(fullpathname,PlantInfo_DataCell,sheet,xlRange);
