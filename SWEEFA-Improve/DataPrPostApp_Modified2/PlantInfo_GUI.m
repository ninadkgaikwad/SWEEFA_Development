function varargout = PlantInfo_GUI(varargin)
% PLANTINFO_GUI MATLAB code for PlantInfo_GUI.fig
%      PLANTINFO_GUI, by itself, creates a new PLANTINFO_GUI or raises the existing
%      singleton*.
%
%      H = PLANTINFO_GUI returns the handle to a new PLANTINFO_GUI or the handle to
%      the existing singleton*.
%
%      PLANTINFO_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLANTINFO_GUI.M with the given input arguments.
%
%      PLANTINFO_GUI('Property','Value',...) creates a new PLANTINFO_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PlantInfo_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PlantInfo_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PlantInfo_GUI

% Last Modified by GUIDE v2.5 18-Nov-2016 03:45:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PlantInfo_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @PlantInfo_GUI_OutputFcn, ...
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


% --- Executes just before PlantInfo_GUI is made visible.
function PlantInfo_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PlantInfo_GUI (see VARARGIN)

% Initializing the GUI

set(handles.Pmod,'String','');
set(handles.PVTech,'String','');
set(handles.ModNum,'String','');
set(handles.ModTemCF,'String','');

set(handles.yr,'Value',1);
set(handles.mr,'Value',0);
set(handles.RainSnowMonths,'String','');
set(handles.YearRain,'String','');
set(handles.MonthRain,'String','');
set(handles.YearRain,'Enable','on');
set(handles.MonthRain,'Enable','off');

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);
set(handles.SF,'String','2');
set(handles.LID,'String','2');
set(handles.LS,'String','3');
set(handles.Arraymismat,'String','2');
set(handles.OhmicLoss,'String','3');
set(handles.rho,'String','0.2');
set(handles.INVeff,'String','98');
set(handles.TransLoss,'String','1');
set(handles.Uo,'String','25');
set(handles.U1,'String','6.84');
set(handles.Shading,'String','1');
set(handles.bo,'String','0.05');
set(handles.SF,'Enable','off');
set(handles.LID,'Enable','off');
set(handles.LS,'Enable','off');
set(handles.Arraymismat,'Enable','off');
set(handles.OhmicLoss,'Enable','off');
set(handles.rho,'Enable','off');
set(handles.INVeff,'Enable','off');
set(handles.TransLoss,'Enable','off');
set(handles.Uo,'Enable','off');
set(handles.U1,'Enable','off');
set(handles.Shading,'Enable','off');
set(handles.bo,'Enable','off');

set(handles.OrientationType,'String','');
set(handles.OrientationParameters,'String','');

% Choose default command line output for PlantInfo_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Creating Current GUI WorkSpace Name

setappdata(0,'PlantInfo_GUI',gcf);

% UIWAIT makes PlantInfo_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PlantInfo_GUI_OutputFcn(hObject, eventdata, handles) 
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



function ModNum_Callback(hObject, eventdata, handles)
% hObject    handle to PVTech (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PVTech as text
%        str2double(get(hObject,'String')) returns contents of PVTech as a double


% --- Executes during object creation, after setting all properties.
function ModNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PVTech (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function YearRain_Callback(hObject, eventdata, handles)
% hObject    handle to YearRain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of YearRain as text
%        str2double(get(hObject,'String')) returns contents of YearRain as a double


% --- Executes during object creation, after setting all properties.
function YearRain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YearRain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MonthRain_Callback(hObject, eventdata, handles)
% hObject    handle to MonthRain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MonthRain as text
%        str2double(get(hObject,'String')) returns contents of MonthRain as a double


% --- Executes during object creation, after setting all properties.
function MonthRain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MonthRain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RainSnowMonths_Callback(hObject, eventdata, handles)
% hObject    handle to RainSnowMonths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RainSnowMonths as text
%        str2double(get(hObject,'String')) returns contents of RainSnowMonths as a double


% --- Executes during object creation, after setting all properties.
function RainSnowMonths_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RainSnowMonths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting the GUI

set(handles.Pmod,'String','');
set(handles.PVTech,'String','');
set(handles.ModNum,'String','');
set(handles.ModTemCF,'String','');

set(handles.yr,'Value',1);
set(handles.mr,'Value',0);
set(handles.RainSnowMonths,'String','');
set(handles.YearRain,'String','');
set(handles.MonthRain,'String','');
set(handles.YearRain,'Enable','on');
set(handles.MonthRain,'Enable','off');

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);
set(handles.SF,'String','2');
set(handles.LID,'String','2');
set(handles.LS,'String','3');
set(handles.Arraymismat,'String','2');
set(handles.OhmicLoss,'String','3');
set(handles.rho,'String','0.2');
set(handles.INVeff,'String','98');
set(handles.TransLoss,'String','1');
set(handles.Uo,'String','25');
set(handles.U1,'String','6.84');
set(handles.Shading,'String','1');
set(handles.bo,'String','0.05');
set(handles.SF,'Enable','off');
set(handles.LID,'Enable','off');
set(handles.LS,'Enable','off');
set(handles.Arraymismat,'Enable','off');
set(handles.OhmicLoss,'Enable','off');
set(handles.rho,'Enable','off');
set(handles.INVeff,'Enable','off');
set(handles.TransLoss,'Enable','off');
set(handles.Uo,'Enable','off');
set(handles.U1,'Enable','off');
set(handles.Shading,'Enable','off');
set(handles.bo,'Enable','off');

set(handles.OrientationType,'String','');
set(handles.OrientationParameters,'String','');

function OrientationType_Callback(hObject, eventdata, handles)
% hObject    handle to OrientationType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OrientationType as text
%        str2double(get(hObject,'String')) returns contents of OrientationType as a double


% --- Executes during object creation, after setting all properties.
function OrientationType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OrientationType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OrientationParameters_Callback(hObject, eventdata, handles)
% hObject    handle to OrientationParameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OrientationParameters as text
%        str2double(get(hObject,'String')) returns contents of OrientationParameters as a double


% --- Executes during object creation, after setting all properties.
function OrientationParameters_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OrientationParameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SF_Callback(hObject, eventdata, handles)
% hObject    handle to SF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SF as text
%        str2double(get(hObject,'String')) returns contents of SF as a double


% --- Executes during object creation, after setting all properties.
function SF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LID_Callback(hObject, eventdata, handles)
% hObject    handle to LID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LID as text
%        str2double(get(hObject,'String')) returns contents of LID as a double


% --- Executes during object creation, after setting all properties.
function LID_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LS_Callback(hObject, eventdata, handles)
% hObject    handle to LS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LS as text
%        str2double(get(hObject,'String')) returns contents of LS as a double


% --- Executes during object creation, after setting all properties.
function LS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Arraymismat_Callback(hObject, eventdata, handles)
% hObject    handle to Arraymismat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Arraymismat as text
%        str2double(get(hObject,'String')) returns contents of Arraymismat as a double


% --- Executes during object creation, after setting all properties.
function Arraymismat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Arraymismat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function INVeff_Callback(hObject, eventdata, handles)
% hObject    handle to INVeff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of INVeff as text
%        str2double(get(hObject,'String')) returns contents of INVeff as a double


% --- Executes during object creation, after setting all properties.
function INVeff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to INVeff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TransLoss_Callback(hObject, eventdata, handles)
% hObject    handle to TransLoss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TransLoss as text
%        str2double(get(hObject,'String')) returns contents of TransLoss as a double


% --- Executes during object creation, after setting all properties.
function TransLoss_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TransLoss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Uo_Callback(hObject, eventdata, handles)
% hObject    handle to Uo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Uo as text
%        str2double(get(hObject,'String')) returns contents of Uo as a double


% --- Executes during object creation, after setting all properties.
function Uo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Uo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function U1_Callback(hObject, eventdata, handles)
% hObject    handle to U1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of U1 as text
%        str2double(get(hObject,'String')) returns contents of U1 as a double


% --- Executes during object creation, after setting all properties.
function U1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to U1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OhmicLoss_Callback(hObject, eventdata, handles)
% hObject    handle to OhmicLoss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OhmicLoss as text
%        str2double(get(hObject,'String')) returns contents of OhmicLoss as a double


% --- Executes during object creation, after setting all properties.
function OhmicLoss_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OhmicLoss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rho_Callback(hObject, eventdata, handles)
% hObject    handle to rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rho as text
%        str2double(get(hObject,'String')) returns contents of rho as a double


% --- Executes during object creation, after setting all properties.
function rho_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Shading_Callback(hObject, eventdata, handles)
% hObject    handle to Shading (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Shading as text
%        str2double(get(hObject,'String')) returns contents of Shading as a double


% --- Executes during object creation, after setting all properties.
function Shading_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Shading (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bo_Callback(hObject, eventdata, handles)
% hObject    handle to bo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bo as text
%        str2double(get(hObject,'String')) returns contents of bo as a double


% --- Executes during object creation, after setting all properties.
function bo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel4.
function uipanel4_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel4 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Getting Radio Button Values

r1=get(handles.yr,'Value');
r2=get(handles.mr,'Value');

% Programming GUI Element behaviour according to Radio Button values

if (r1==1)
    
    set(handles.YearRain,'Enable','on');
    set(handles.MonthRain,'Enable','off');
    
elseif (r2==1)
    
    set(handles.YearRain,'Enable','off');
    set(handles.MonthRain,'Enable','on');   
    
end


% --- Executes when selected object is changed in uipanel7.
function uipanel7_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel7 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Getting Radio Button Values

r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');

% Programming GUI Element behaviour according to Radio Button values

if (r1==1) % Default-Values
    
    set(handles.SF,'String','2');
    set(handles.LID,'String','2');
    set(handles.LS,'String','3');
    set(handles.Arraymismat,'String','2');
    set(handles.OhmicLoss,'String','3');
    set(handles.rho,'String','0.2');
    set(handles.INVeff,'String','98');
    set(handles.TransLoss,'String','1');
    set(handles.Uo,'String','25');
    set(handles.U1,'String','6.84');
    set(handles.Shading,'String','1');
    set(handles.bo,'String','0.05');
    set(handles.SF,'Enable','off');
    set(handles.LID,'Enable','off');
    set(handles.LS,'Enable','off');
    set(handles.Arraymismat,'Enable','off');
    set(handles.OhmicLoss,'Enable','off');
    set(handles.rho,'Enable','off');
    set(handles.INVeff,'Enable','off');
    set(handles.TransLoss,'Enable','off');
    set(handles.Uo,'Enable','off');
    set(handles.U1,'Enable','off');
    set(handles.Shading,'Enable','off');
    set(handles.bo,'Enable','off');
    
elseif (r2==1) % Userdefined-Values
    
    set(handles.LID,'Enable','on');
    set(handles.LS,'Enable','on');
    set(handles.Arraymismat,'Enable','on');
    set(handles.OhmicLoss,'Enable','on');
    set(handles.rho,'Enable','on');
    set(handles.INVeff,'Enable','on');
    set(handles.TransLoss,'Enable','on');
    set(handles.Uo,'Enable','on');
    set(handles.U1,'Enable','on');
    set(handles.Shading,'Enable','on');
    set(handles.bo,'Enable','on');
    
end


% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI Workspace Name

PlantInfo_GUI=getappdata(0,'PlantInfo_GUI');

% Getting User Data from GUI

% PV Module Info
Pmod=get(handles.Pmod,'String');
Pmod=strread(Pmod,'%f','delimiter',',');
Pmod=Pmod';

PVTech=get(handles.PVTech,'String');
PVTech=strread(PVTech,'%f','delimiter',',');
PVTech=PVTech';

ModNum=get(handles.ModNum,'String');
ModNum=strread(ModNum,'%f','delimiter',',');
ModNum=ModNum';

ModTemCF=get(handles.ModTemCF,'String');
ModTemCF=strread(ModTemCF,'%f','delimiter',',');
ModTemCF=ModTemCF';

% Rainfall Info
RainSnowMonths=get(handles.RainSnowMonths,'String');
RainSnowMonths=strread(RainSnowMonths,'%f','delimiter',',');
RainSnowMonths=RainSnowMonths';

yr=get(handles.yr,'Value');
mr=get(handles.mr,'Value');

MonthRain=get(handles.MonthRain,'String');
MonthRain=strread(MonthRain,'%f','delimiter',',');
MonthRain=MonthRain';

YearRain=get(handles.YearRain,'String');
YearRain=str2double(YearRain);

% Orientation Info
OrientationParameters=get(handles.OrientationParameters,'String');
OrientationParameters=strread(OrientationParameters,'%f','delimiter',',');
OrientationParameters=OrientationParameters';

OrientationType=get(handles.OrientationType,'String');
OrientationType=str2double(OrientationType);

% Loss Parameters
SF=get(handles.SF,'String');
SF=str2double(SF);

LID=get(handles.LID,'String');
LID=str2double(LID);

LS=get(handles.LS,'String');
LS=str2double(LS);

Arraymismat=get(handles.Arraymismat,'String');
Arraymismat=str2double(Arraymismat);

OhmicLoss=get(handles.OhmicLoss,'String');
OhmicLoss=str2double(OhmicLoss);

rho=get(handles.rho,'String');
rho=str2double(rho);

INVeff=get(handles.INVeff,'String');
INVeff=str2double(INVeff);

TransLoss=get(handles.TransLoss,'String');
TransLoss=str2double(TransLoss);

Shading=get(handles.Shading,'String');
Shading=str2double(Shading);

Uo=get(handles.Uo,'String');
Uo=str2double(Uo);

U1=get(handles.U1,'String');
U1=str2double(U1);

bo=get(handles.bo,'String');
bo=str2double(bo);

% Creating a Cell Array of all the Plant Info Data

PlantInfo_Parameters={Pmod,ModNum,PVTech,ModTemCF,RinSnowMonths,yr,mr,YearRain,MonthRain,OrientationType,OrientationParameters,SF,LID,LS,Arraymismat,OhmicLoss,rho,INVeff,TranLoss,Uo,U1,Shading,bo};

% Setting all Plant Info Parameter Cell Array to the Current GUI Workspace

setappdata(PlantInfo_GUI,'PlantInfo_Parameters',PlantInfo_Parameters);
