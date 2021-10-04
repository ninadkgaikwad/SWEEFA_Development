function varargout = Solar_Local_Clock(varargin)
% SOLAR_LOCAL_CLOCK MATLAB code for Solar_Local_Clock.fig
%      SOLAR_LOCAL_CLOCK, by itself, creates a new SOLAR_LOCAL_CLOCK or raises the existing
%      singleton*.
%
%      H = SOLAR_LOCAL_CLOCK returns the handle to a new SOLAR_LOCAL_CLOCK or the handle to
%      the existing singleton*.
%
%      SOLAR_LOCAL_CLOCK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOLAR_LOCAL_CLOCK.M with the given input arguments.
%
%      SOLAR_LOCAL_CLOCK('Property','Value',...) creates a new SOLAR_LOCAL_CLOCK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Solar_Local_Clock_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Solar_Local_Clock_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Solar_Local_Clock

% Last Modified by GUIDE v2.5 25-Oct-2015 16:26:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Solar_Local_Clock_OpeningFcn, ...
                   'gui_OutputFcn',  @Solar_Local_Clock_OutputFcn, ...
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


% --- Executes just before Solar_Local_Clock is made visible.
function Solar_Local_Clock_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Solar_Local_Clock (see VARARGIN)

% Choose default command line output for Solar_Local_Clock
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Solar_Local_Clock wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Solar_Local_Clock_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ST2_Callback(hObject, eventdata, handles)
% hObject    handle to ST2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ST2 as text
%        str2double(get(hObject,'String')) returns contents of ST2 as a double


% --- Executes during object creation, after setting all properties.
function ST2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ST2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CT2_Callback(hObject, eventdata, handles)
% hObject    handle to CT2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CT2 as text
%        str2double(get(hObject,'String')) returns contents of CT2 as a double


% --- Executes during object creation, after setting all properties.
function CT2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CT2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB5.
function PB5_Callback(hObject, eventdata, handles)
% hObject    handle to PB5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Data from GUI
n=get(handles.n,'String');
n=str2double(n);
Ltm=get(handles.Ltm,'String');
Ltm=str2double(Ltm);
L=get(handles.L,'String');
L=str2double(L);
hem=get(handles.hem,'String');
hem=str2double(hem);
ST2=get(handles.ST2,'String');
ST2=str2double(ST2);

% Using Pre-defined Functions
[ CT] = SolarToClockTime( n,hem,Ltm,L,ST2);
CT=num2str(CT);
set(handles.CT2,'String',CT);


function CT1_Callback(hObject, eventdata, handles)
% hObject    handle to CT1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CT1 as text
%        str2double(get(hObject,'String')) returns contents of CT1 as a double


% --- Executes during object creation, after setting all properties.
function CT1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CT1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ST1_Callback(hObject, eventdata, handles)
% hObject    handle to ST1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ST1 as text
%        str2double(get(hObject,'String')) returns contents of ST1 as a double


% --- Executes during object creation, after setting all properties.
function ST1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ST1 (see GCBO)
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

% Getting Data from GUI
n=get(handles.n,'String');
n=str2double(n);
Ltm=get(handles.Ltm,'String');
Ltm=str2double(Ltm);
L=get(handles.L,'String');
L=str2double(L);
hem=get(handles.hem,'String');
hem=str2double(hem);
CT1=get(handles.CT1,'String');
CT1=str2double(CT1);

% Using Pre-defined Functions
[ ST] = ClockToSolarTime( n,hem,Ltm,L,CT1);
ST=num2str(ST);
set(handles.ST1,'String',ST);

function Sr_Callback(hObject, eventdata, handles)
% hObject    handle to Sr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Sr as text
%        str2double(get(hObject,'String')) returns contents of Sr as a double


% --- Executes during object creation, after setting all properties.
function Sr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ss_Callback(hObject, eventdata, handles)
% hObject    handle to Ss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ss as text
%        str2double(get(hObject,'String')) returns contents of Ss as a double


% --- Executes during object creation, after setting all properties.
function Ss_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB3.
function PB3_Callback(hObject, eventdata, handles)
% hObject    handle to PB3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Data from GUI
nn=get(handles.n,'String');
nn=str2double(nn);
Lat=get(handles.Lat,'String');
Lat=str2double(Lat);
% Ltm=get(handles.Ltm,'String');
% Ltm=str2double(Ltm);
% L=get(handles.L,'String');
% L=str2double(L);
% hem=get(handles.hem,'String');
% hem=str2double(hem);

% Using Pre-defined Functions
d=Declination(nn);
[Sr,Ss]=SunRiseSet(Lat,d);
Sr=num2str(Sr);
Ss=num2str(Ss);
set(handles.Sr,'String',Sr);
set(handles.Ss,'String',Ss);



function hr2_Callback(hObject, eventdata, handles)
% hObject    handle to hr2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hr2 as text
%        str2double(get(hObject,'String')) returns contents of hr2 as a double


% --- Executes during object creation, after setting all properties.
function hr2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hr2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function min2_Callback(hObject, eventdata, handles)
% hObject    handle to min2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min2 as text
%        str2double(get(hObject,'String')) returns contents of min2 as a double


% --- Executes during object creation, after setting all properties.
function min2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sec2_Callback(hObject, eventdata, handles)
% hObject    handle to sec2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sec2 as text
%        str2double(get(hObject,'String')) returns contents of sec2 as a double


% --- Executes during object creation, after setting all properties.
function sec2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sec2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function deci2_Callback(hObject, eventdata, handles)
% hObject    handle to deci2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of deci2 as text
%        str2double(get(hObject,'String')) returns contents of deci2 as a double


% --- Executes during object creation, after setting all properties.
function deci2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to deci2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB2.
function PB2_Callback(hObject, eventdata, handles)
% hObject    handle to PB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Data from GUI
deci=get(handles.deci2,'String');
deci=str2double(deci);

% Using Pre-defined Function
[ hr,min,sec ] = DeciToHM( deci );
hr=num2str(hr);
min=num2str(min);
sec=num2str(sec);

set(handles.hr2,'String',hr);
set(handles.min2,'String',min);
set(handles.sec2,'String',sec);


function hr1_Callback(hObject, eventdata, handles)
% hObject    handle to hr1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hr1 as text
%        str2double(get(hObject,'String')) returns contents of hr1 as a double


% --- Executes during object creation, after setting all properties.
function hr1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hr1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function min1_Callback(hObject, eventdata, handles)
% hObject    handle to min1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min1 as text
%        str2double(get(hObject,'String')) returns contents of min1 as a double


% --- Executes during object creation, after setting all properties.
function min1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sec1_Callback(hObject, eventdata, handles)
% hObject    handle to sec1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sec1 as text
%        str2double(get(hObject,'String')) returns contents of sec1 as a double


% --- Executes during object creation, after setting all properties.
function sec1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sec1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function deci1_Callback(hObject, eventdata, handles)
% hObject    handle to deci1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of deci1 as text
%        str2double(get(hObject,'String')) returns contents of deci1 as a double


% --- Executes during object creation, after setting all properties.
function deci1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to deci1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB1.
function PB1_Callback(hObject, eventdata, handles)
% hObject    handle to PB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Data from GUI
hr=get(handles.hr1,'String');
hr=str2double(hr); 
min=get(handles.min1,'String');
min=str2double(min);
sec=get(handles.sec1,'String');
sec=str2double(sec);

% Using Data in Pre-defined Function
deci=HMToDeci(hr,min,sec);
deci=num2str(deci);
set(handles.deci1,'String',deci);


function n_Callback(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n as text
%        str2double(get(hObject,'String')) returns contents of n as a double


% --- Executes during object creation, after setting all properties.
function n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L_Callback(hObject, eventdata, handles)
% hObject    handle to L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L as text
%        str2double(get(hObject,'String')) returns contents of L as a double


% --- Executes during object creation, after setting all properties.
function L_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hem_Callback(hObject, eventdata, handles)
% hObject    handle to hem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hem as text
%        str2double(get(hObject,'String')) returns contents of hem as a double


% --- Executes during object creation, after setting all properties.
function hem_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ltm_Callback(hObject, eventdata, handles)
% hObject    handle to Ltm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ltm as text
%        str2double(get(hObject,'String')) returns contents of Ltm as a double


% --- Executes during object creation, after setting all properties.
function Ltm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ltm (see GCBO)
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


% --- Executes on button press in PB6.
function PB6_Callback(hObject, eventdata, handles)
% hObject    handle to PB6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing GUI

close;


% --- Executes on button press in PB7.
function PB7_Callback(hObject, eventdata, handles)
% hObject    handle to PB7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.n,'String','');
set(handles.Lat,'String','');
set(handles.Ltm,'String','');
set(handles.L,'String','');
set(handles.hem,'String','');
set(handles.Sr,'String','');
set(handles.Ss,'String','');
set(handles.CT1,'String','');
set(handles.CT2,'String','');
set(handles.ST1,'String','');
set(handles.ST2,'String','');
set(handles.hr1,'String','');
set(handles.hr2,'String','');
set(handles.min1,'String','');
set(handles.min2,'String','');
set(handles.sec1,'String','');
set(handles.sec2,'String','');
set(handles.deci1,'String','');
set(handles.deci2,'String','');
