function varargout = WG_T2_data_GUI(varargin)
% WG_T2_DATA_GUI MATLAB code for WG_T2_data_GUI.fig
%      WG_T2_DATA_GUI, by itself, creates a new WG_T2_DATA_GUI or raises the existing
%      singleton*.
%
%      H = WG_T2_DATA_GUI returns the handle to a new WG_T2_DATA_GUI or the handle to
%      the existing singleton*.
%
%      WG_T2_DATA_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WG_T2_DATA_GUI.M with the given input arguments.
%
%      WG_T2_DATA_GUI('Property','Value',...) creates a new WG_T2_DATA_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WG_T2_data_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WG_T2_data_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WG_T2_data_GUI

% Last Modified by GUIDE v2.5 24-Mar-2016 11:00:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WG_T2_data_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @WG_T2_data_GUI_OutputFcn, ...
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


% --- Executes just before WG_T2_data_GUI is made visible.
function WG_T2_data_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WG_T2_data_GUI (see VARARGIN)

% Choose default command line output for WG_T2_data_GUI
handles.output = hObject;

% Initialization:

set(handles.sub_T2, 'String', '');

set(handles.subnum_T2, 'String', '');

set(handles.rotortype_T2, 'String', '');

set(handles.rotorrad_T2, 'String', '');

set(handles.cutin_T2, 'String', '');

set(handles.rated_T2, 'String', '');

set(handles.cutout_T2, 'String', '');

set(handles.hub_T2, 'String', '');

set(handles.rotorspeed_T2, 'String', '');

set(handles.Jt_T2, 'String', '');

set(handles.Jg_T2, 'String', '');

set(handles.Dt_T2, 'String', '');

set(handles.Kt_T2, 'String', '');

set(handles.Dg_T2, 'String', '');

set(handles.Kg_T2, 'String', '');

set(handles.power_T2, 'String', '');

set(handles.voltageline_T2, 'String', '');

set(handles.freq_T2, 'String', '');

set(handles.statres_T2, 'String', '');

set(handles.statind_T2, 'String', '');

set(handles.rotores_T2, 'String', '');

set(handles.rotoind_T2, 'String', '');

set(handles.polepairs_T2, 'String', '');


% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace:
setappdata(0,'WG_T2_data_GUI',gcf);

% UIWAIT makes WG_T2_data_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WG_T2_data_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Ok_T2.
function Ok_T2_Callback(hObject, eventdata, handles)
% hObject    handle to Ok_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

WG_T2_data_GUI = getappdata(0,'WG_T2_data_GUI');

% Setting-up Ok button functions:

    sub_T2 = get(handles.sub_T2, 'String');
    sub_T2 = str2double(sub_T2);
     setappdata(WG_T2_data_GUI,'sub_T2',sub_T2);
    
    subnum_T2 = get(handles.subnum_T2, 'String');
    subnum_T2 = strread(subnum_T2, '%f', 'delimiter', ',');
    subnum_T2 = subnum_T2';
     setappdata(WG_T2_data_GUI,'subnum_T2',subnum_T2);
    
    rotortype_T2 = get(handles.rotortype_T2, 'String');
    rotortype_T2 = strread(rotortype_T2, '%f', 'delimiter', ',');
    rotortype_T2 = rotortype_T2';
    setappdata(WG_T2_data_GUI,'rotortype_T2',rotortype_T2);
    
    rotorrad_T2 = get(handles.rotorrad_T2, 'String');
    rotorrad_T2 = strread(rotorrad_T2, '%f', 'delimiter', ',');
    rotorrad_T2 = rotorrad_T2';
     setappdata(WG_T2_data_GUI,'rotorrad_T2',rotorrad_T2);
    
    cutin_T2 = get(handles.cutin_T2, 'String');
    cutin_T2 = strread(cutin_T2, '%f', 'delimiter', ',');
    cutin_T2 = cutin_T2';
     setappdata(WG_T2_data_GUI,'cutin_T2',cutin_T2);
     
    rated_T2 = get(handles.rated_T2, 'String');
    rated_T2 = strread(rated_T2, '%f', 'delimiter', ',');
    rated_T2 = rated_T2';
     setappdata(WG_T2_data_GUI,'rated_T2',rated_T2); 
    
    cutout_T2 = get(handles.cutout_T2, 'String');
    cutout_T2 = strread(cutout_T2, '%f', 'delimiter', ',');
    cutout_T2 = cutout_T2';
     setappdata(WG_T2_data_GUI,'cutout_T2',cutout_T2);
     
    hub_T2 = get(handles.hub_T2, 'String');
    hub_T2 = strread(hub_T2, '%f', 'delimiter', ',');
    hub_T2 = hub_T2';
     setappdata(WG_T2_data_GUI,'hub_T2',hub_T2);
     
    rotorspeed_T2 = get(handles.rotorspeed_T2, 'String');
    rotorspeed_T2 = strread(rotorspeed_T2, '%f', 'delimiter', ',');
    rotorspeed_T2 = rotorspeed_T2';
     setappdata(WG_T2_data_GUI,'rotorspeed_T2',rotorspeed_T2);     
    
    Jt_T2 = get(handles.Jt_T2, 'String');
    Jt_T2 = strread(Jt_T2, '%f', 'delimiter', ',');
    Jt_T2 = Jt_T2';
     setappdata(WG_T2_data_GUI,'Jt_T2',Jt_T2);
    
    Jg_T2 = get(handles.Jg_T2, 'String');
    Jg_T2 = strread(Jg_T2, '%f', 'delimiter', ',');
    Jg_T2 = Jg_T2';
     setappdata(WG_T2_data_GUI,'Jg_T2',Jg_T2);
    
    Dt_T2 = get(handles.Dt_T2, 'String');
    Dt_T2 = strread(Dt_T2, '%f', 'delimiter', ',');
    Dt_T2 = Dt_T2';
     setappdata(WG_T2_data_GUI,'Dt_T2',Dt_T2);
    
    Kt_T2 = get(handles.Kt_T2, 'String');
    Kt_T2 = strread(Kt_T2, '%f', 'delimiter', ',');
    Kt_T2 = Kt_T2';
     setappdata(WG_T2_data_GUI,'Kt_T2',Kt_T2);
     
    Dg_T2 = get(handles.Dg_T2, 'String');
    Dg_T2 = strread(Dg_T2, '%f', 'delimiter', ',');
    Dg_T2 = Dg_T2';
     setappdata(WG_T2_data_GUI,'Dg_T2',Dg_T2);
    
    Kg_T2 = get(handles.Kg_T2, 'String');
    Kg_T2 = strread(Kg_T2, '%f', 'delimiter', ',');
    Kg_T2 = Kg_T2';
     setappdata(WG_T2_data_GUI,'Kg_T2',Kg_T2);     
    
    power_T2 = get(handles.power_T2, 'String');
    power_T2 = strread(power_T2, '%f', 'delimiter', ',');
    power_T2 = power_T2';
     setappdata(WG_T2_data_GUI,'power_T2',power_T2);
     
    voltageline_T2 = get(handles.voltageline_T2, 'String');
    voltageline_T2 = strread(voltageline_T2, '%f', 'delimiter', ',');
    voltageline_T2 = voltageline_T2';
     setappdata(WG_T2_data_GUI,'voltageline_T2',voltageline_T2);
    
    freq_T2 = get(handles.freq_T2, 'String');
    freq_T2 = strread(freq_T2, '%f', 'delimiter', ',');
    freq_T2 = freq_T2';
     setappdata(WG_T2_data_GUI,'freq_T2',freq_T2);
    
    statres_T2 = get(handles.statres_T2, 'String');
    statres_T2 = strread(statres_T2, '%f', 'delimiter', ',');
    statres_T2 = statres_T2';
     setappdata(WG_T2_data_GUI,'statres_T2',statres_T2);
    
    statind_T2 = get(handles.statind_T2, 'String');
    statind_T2 = strread(statind_T2, '%f', 'delimiter', ',');
    statind_T2 = statind_T2';
     setappdata(WG_T2_data_GUI,'statind_T2',statind_T2);
    
    rotores_T2 = get(handles.rotores_T2, 'String');
    rotores_T2 = strread(rotores_T2, '%f', 'delimiter', ',');
    rotores_T2 = rotores_T2';
     setappdata(WG_T2_data_GUI,'rotores_T2',rotores_T2);
    
    rotoind_T2 = get(handles.rotoind_T2, 'String');
    rotoind_T2 = strread(rotoind_T2, '%f', 'delimiter', ',');
    rotoind_T2 = rotoind_T2';
     setappdata(WG_T2_data_GUI,'rotoind_T2',rotoind_T2);
    
    polepairs_T2 = get(handles.polepairs_T2, 'String');
    polepairs_T2 = strread(polepairs_T2, '%f', 'delimiter', ',');
    polepairs_T2 = polepairs_T2';
     setappdata(WG_T2_data_GUI,'polepairs_T2',polepairs_T2);



% --- Executes on button press in Reset_T2.
function Reset_T2_Callback(hObject, eventdata, handles)
% hObject    handle to Reset_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.sub_T2, 'String', '');

set(handles.subnum_T2, 'String', '');

set(handles.rotortype_T2, 'String', '');

set(handles.rotorrad_T2, 'String', '');

set(handles.cutin_T2, 'String', '');

set(handles.rated_T2, 'String', '');

set(handles.cutout_T2, 'String', '');

set(handles.hub_T2, 'String', '');

set(handles.rotorspeed_T2, 'String', '');

set(handles.Jt_T2, 'String', '');

set(handles.Jg_T2, 'String', '');

set(handles.Dt_T2, 'String', '');

set(handles.Kt_T2, 'String', '');

set(handles.Dg_T2, 'String', '');

set(handles.Kg_T2, 'String', '');

set(handles.power_T2, 'String', '');

set(handles.voltageline_T2, 'String', '');

set(handles.freq_T2, 'String', '');

set(handles.statres_T2, 'String', '');

set(handles.statind_T2, 'String', '');

set(handles.rotores_T2, 'String', '');

set(handles.rotoind_T2, 'String', '');

set(handles.polepairs_T2, 'String', '');



function Jt_T2_Callback(hObject, eventdata, handles)
% hObject    handle to Jt_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Jt_T2 as text
%        str2double(get(hObject,'String')) returns contents of Jt_T2 as a double


% --- Executes during object creation, after setting all properties.
function Jt_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Jt_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Jg_T2_Callback(hObject, eventdata, handles)
% hObject    handle to Jg_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Jg_T2 as text
%        str2double(get(hObject,'String')) returns contents of Jg_T2 as a double


% --- Executes during object creation, after setting all properties.
function Jg_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Jg_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Dt_T2_Callback(hObject, eventdata, handles)
% hObject    handle to Dt_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Dt_T2 as text
%        str2double(get(hObject,'String')) returns contents of Dt_T2 as a double


% --- Executes during object creation, after setting all properties.
function Dt_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Dt_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Kt_T2_Callback(hObject, eventdata, handles)
% hObject    handle to Kt_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Kt_T2 as text
%        str2double(get(hObject,'String')) returns contents of Kt_T2 as a double


% --- Executes during object creation, after setting all properties.
function Kt_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Kt_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotorrad_T2_Callback(hObject, eventdata, handles)
% hObject    handle to rotorrad_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotorrad_T2 as text
%        str2double(get(hObject,'String')) returns contents of rotorrad_T2 as a double


% --- Executes during object creation, after setting all properties.
function rotorrad_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotorrad_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cutin_T2_Callback(hObject, eventdata, handles)
% hObject    handle to cutin_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutin_T2 as text
%        str2double(get(hObject,'String')) returns contents of cutin_T2 as a double


% --- Executes during object creation, after setting all properties.
function cutin_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutin_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cutout_T2_Callback(hObject, eventdata, handles)
% hObject    handle to cutout_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutout_T2 as text
%        str2double(get(hObject,'String')) returns contents of cutout_T2 as a double


% --- Executes during object creation, after setting all properties.
function cutout_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutout_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotortype_T2_Callback(hObject, eventdata, handles)
% hObject    handle to rotortype_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotortype_T2 as text
%        str2double(get(hObject,'String')) returns contents of rotortype_T2 as a double


% --- Executes during object creation, after setting all properties.
function rotortype_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotortype_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sub_T2_Callback(hObject, eventdata, handles)
% hObject    handle to sub_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sub_T2 as text
%        str2double(get(hObject,'String')) returns contents of sub_T2 as a double


% --- Executes during object creation, after setting all properties.
function sub_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sub_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function subnum_T2_Callback(hObject, eventdata, handles)
% hObject    handle to subnum_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subnum_T2 as text
%        str2double(get(hObject,'String')) returns contents of subnum_T2 as a double


% --- Executes during object creation, after setting all properties.
function subnum_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subnum_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function power_T2_Callback(hObject, eventdata, handles)
% hObject    handle to power_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of power_T2 as text
%        str2double(get(hObject,'String')) returns contents of power_T2 as a double


% --- Executes during object creation, after setting all properties.
function power_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to power_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function voltageline_T2_Callback(hObject, eventdata, handles)
% hObject    handle to voltageline_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of voltageline_T2 as text
%        str2double(get(hObject,'String')) returns contents of voltageline_T2 as a double


% --- Executes during object creation, after setting all properties.
function voltageline_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to voltageline_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freq_T2_Callback(hObject, eventdata, handles)
% hObject    handle to freq_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq_T2 as text
%        str2double(get(hObject,'String')) returns contents of freq_T2 as a double


% --- Executes during object creation, after setting all properties.
function freq_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function statres_T2_Callback(hObject, eventdata, handles)
% hObject    handle to statres_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of statres_T2 as text
%        str2double(get(hObject,'String')) returns contents of statres_T2 as a double


% --- Executes during object creation, after setting all properties.
function statres_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to statres_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function statind_T2_Callback(hObject, eventdata, handles)
% hObject    handle to statind_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of statind_T2 as text
%        str2double(get(hObject,'String')) returns contents of statind_T2 as a double


% --- Executes during object creation, after setting all properties.
function statind_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to statind_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotores_T2_Callback(hObject, eventdata, handles)
% hObject    handle to rotores_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotores_T2 as text
%        str2double(get(hObject,'String')) returns contents of rotores_T2 as a double


% --- Executes during object creation, after setting all properties.
function rotores_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotores_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotoind_T2_Callback(hObject, eventdata, handles)
% hObject    handle to rotoind_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotoind_T2 as text
%        str2double(get(hObject,'String')) returns contents of rotoind_T2 as a double


% --- Executes during object creation, after setting all properties.
function rotoind_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotoind_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function polepairs_T2_Callback(hObject, eventdata, handles)
% hObject    handle to polepairs_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of polepairs_T2 as text
%        str2double(get(hObject,'String')) returns contents of polepairs_T2 as a double


% --- Executes during object creation, after setting all properties.
function polepairs_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to polepairs_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hub_T2_Callback(hObject, eventdata, handles)
% hObject    handle to hub_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hub_T2 as text
%        str2double(get(hObject,'String')) returns contents of hub_T2 as a double


% --- Executes during object creation, after setting all properties.
function hub_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hub_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rated_T2_Callback(hObject, eventdata, handles)
% hObject    handle to rated_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rated_T2 as text
%        str2double(get(hObject,'String')) returns contents of rated_T2 as a double


% --- Executes during object creation, after setting all properties.
function rated_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rated_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Dg_T2_Callback(hObject, eventdata, handles)
% hObject    handle to Dg_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Dg_T2 as text
%        str2double(get(hObject,'String')) returns contents of Dg_T2 as a double


% --- Executes during object creation, after setting all properties.
function Dg_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Dg_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Kg_T2_Callback(hObject, eventdata, handles)
% hObject    handle to Kg_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Kg_T2 as text
%        str2double(get(hObject,'String')) returns contents of Kg_T2 as a double


% --- Executes during object creation, after setting all properties.
function Kg_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Kg_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotorspeed_T2_Callback(hObject, eventdata, handles)
% hObject    handle to rotorspeed_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotorspeed_T2 as text
%        str2double(get(hObject,'String')) returns contents of rotorspeed_T2 as a double


% --- Executes during object creation, after setting all properties.
function rotorspeed_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotorspeed_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 % Opening Pu Converter Window
 
 PUConverter_GUI;