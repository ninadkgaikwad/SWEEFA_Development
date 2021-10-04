function varargout = WG_T1_data_GUI(varargin)
% WG_T1_DATA_GUI MATLAB code for WG_T1_data_GUI.fig
%      WG_T1_DATA_GUI, by itself, creates a new WG_T1_DATA_GUI or raises the existing
%      singleton*.
%
%      H = WG_T1_DATA_GUI returns the handle to a new WG_T1_DATA_GUI or the handle to
%      the existing singleton*.
%
%      WG_T1_DATA_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WG_T1_DATA_GUI.M with the given input arguments.
%
%      WG_T1_DATA_GUI('Property','Value',...) creates a new WG_T1_DATA_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WG_T1_data_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WG_T1_data_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WG_T1_data_GUI

% Last Modified by GUIDE v2.5 24-Mar-2016 10:58:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WG_T1_data_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @WG_T1_data_GUI_OutputFcn, ...
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


% --- Executes just before WG_T1_data_GUI is made visible.
function WG_T1_data_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WG_T1_data_GUI (see VARARGIN)

% Choose default command line output for WG_T1_data_GUI
handles.output = hObject;

% Initialization:

set(handles.sub_T1, 'String', '');

set(handles.subnum_T1, 'String', '');

set(handles.rotortype_T1, 'String', '');

set(handles.rotorrad_T1, 'String', '');

set(handles.cutin_T1, 'String', '');

set(handles.rated_T1, 'String', '');

set(handles.cutout_T1, 'String', '');

set(handles.hub_T1, 'String', '');

set(handles.rotorspeed_T1, 'String', '');

set(handles.Jt_T1, 'String', '');

set(handles.Jg_T1, 'String', '');

set(handles.Dt_T1, 'String', '');

set(handles.Kt_T1, 'String', '');

set(handles.Dg_T1, 'String', '');

set(handles.Kg_T1, 'String', '');

set(handles.power_T1, 'String', '');

set(handles.voltageline_T1, 'String', '');

set(handles.freq_T1, 'String', '');

set(handles.statres_T1, 'String', '');

set(handles.statind_T1, 'String', '');

set(handles.rotores_T1, 'String', '');

set(handles.rotoind_T1, 'String', '');

set(handles.polepairs_T1, 'String', '');

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace:
setappdata(0,'WG_T1_data_GUI',gcf);

% UIWAIT makes WG_T1_data_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WG_T1_data_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function rotorrad_T1_Callback(hObject, eventdata, handles)
% hObject    handle to rotorrad_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotorrad_T1 as text
%        str2double(get(hObject,'String')) returns contents of rotorrad_T1 as a double


% --- Executes during object creation, after setting all properties.
function rotorrad_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotorrad_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cutin_T1_Callback(hObject, eventdata, handles)
% hObject    handle to cutin_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutin_T1 as text
%        str2double(get(hObject,'String')) returns contents of cutin_T1 as a double


% --- Executes during object creation, after setting all properties.
function cutin_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutin_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cutout_T1_Callback(hObject, eventdata, handles)
% hObject    handle to cutout_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutout_T1 as text
%        str2double(get(hObject,'String')) returns contents of cutout_T1 as a double


% --- Executes during object creation, after setting all properties.
function cutout_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutout_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Jt_T1_Callback(hObject, eventdata, handles)
% hObject    handle to Jt_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Jt_T1 as text
%        str2double(get(hObject,'String')) returns contents of Jt_T1 as a double


% --- Executes during object creation, after setting all properties.
function Jt_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Jt_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Jg_T1_Callback(hObject, eventdata, handles)
% hObject    handle to Jg_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Jg_T1 as text
%        str2double(get(hObject,'String')) returns contents of Jg_T1 as a double


% --- Executes during object creation, after setting all properties.
function Jg_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Jg_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Dt_T1_Callback(hObject, eventdata, handles)
% hObject    handle to Dt_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Dt_T1 as text
%        str2double(get(hObject,'String')) returns contents of Dt_T1 as a double


% --- Executes during object creation, after setting all properties.
function Dt_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Dt_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Kt_T1_Callback(hObject, eventdata, handles)
% hObject    handle to Kt_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Kt_T1 as text
%        str2double(get(hObject,'String')) returns contents of Kt_T1 as a double


% --- Executes during object creation, after setting all properties.
function Kt_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Kt_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotortype_T1_Callback(hObject, eventdata, handles)
% hObject    handle to rotortype_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotortype_T1 as text
%        str2double(get(hObject,'String')) returns contents of rotortype_T1 as a double


% --- Executes during object creation, after setting all properties.
function rotortype_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotortype_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sub_T1_Callback(hObject, eventdata, handles)
% hObject    handle to sub_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sub_T1 as text
%        str2double(get(hObject,'String')) returns contents of sub_T1 as a double



function subnum_T1_Callback(hObject, eventdata, handles)
% hObject    handle to subnum_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subnum_T1 as text
%        str2double(get(hObject,'String')) returns contents of subnum_T1 as a double


% --- Executes on button press in Ok_T1.
function Ok_T1_Callback(hObject, eventdata, handles)
% hObject    handle to Ok_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

WG_T1_data_GUI = getappdata(0,'WG_T1_data_GUI');

% Setting-up Ok button functions:

    sub_T1 = get(handles.sub_T1, 'String');
    sub_T1 = str2double(sub_T1);
     setappdata(WG_T1_data_GUI,'sub_T1',sub_T1);
    
    subnum_T1 = get(handles.subnum_T1, 'String');
    subnum_T1 = strread(subnum_T1, '%f', 'delimiter', ',');
    subnum_T1 = subnum_T1';
     setappdata(WG_T1_data_GUI,'subnum_T1',subnum_T1);
    
    rotortype_T1 = get(handles.rotortype_T1, 'String');
    rotortype_T1 = strread(rotortype_T1, '%f', 'delimiter', ',');
    rotortype_T1 = rotortype_T1';
    setappdata(WG_T1_data_GUI,'rotortype_T1',rotortype_T1);
    
    rotorrad_T1 = get(handles.rotorrad_T1, 'String');
    rotorrad_T1 = strread(rotorrad_T1, '%f', 'delimiter', ',');
    rotorrad_T1 = rotorrad_T1';
     setappdata(WG_T1_data_GUI,'rotorrad_T1',rotorrad_T1);
    
    cutin_T1 = get(handles.cutin_T1, 'String');
    cutin_T1 = strread(cutin_T1, '%f', 'delimiter', ',');
    cutin_T1 = cutin_T1';
     setappdata(WG_T1_data_GUI,'cutin_T1',cutin_T1);
     
    rated_T1 = get(handles.rated_T1, 'String');
    rated_T1 = strread(rated_T1, '%f', 'delimiter', ',');
    rated_T1 = rated_T1';
     setappdata(WG_T1_data_GUI,'rated_T1',rated_T1);     
    
    cutout_T1 = get(handles.cutout_T1, 'String');
    cutout_T1 = strread(cutout_T1, '%f', 'delimiter', ',');
    cutout_T1 = cutout_T1';
     setappdata(WG_T1_data_GUI,'cutout_T1',cutout_T1);
     
    hub_T1 = get(handles.hub_T1, 'String');
    hub_T1 = strread(hub_T1, '%f', 'delimiter', ',');
    hub_T1 = hub_T1';
     setappdata(WG_T1_data_GUI,'hub_T1',hub_T1);   
     
    rotorspeed_T1 = get(handles.rotorspeed_T1, 'String');
    rotorspeed_T1 = strread(rotorspeed_T1, '%f', 'delimiter', ',');
    rotorspeed_T1 = rotorspeed_T1';
     setappdata(WG_T1_data_GUI,'rotorspeed_T1',rotorspeed_T1); 
    
    
    Jt_T1 = get(handles.Jt_T1, 'String');
    Jt_T1 = strread(Jt_T1, '%f', 'delimiter', ',');
    Jt_T1 = Jt_T1';
     setappdata(WG_T1_data_GUI,'Jt_T1',Jt_T1);
    
    Jg_T1 = get(handles.Jg_T1, 'String');
    Jg_T1 = strread(Jg_T1, '%f', 'delimiter', ',');
    Jg_T1 = Jg_T1';
     setappdata(WG_T1_data_GUI,'Jg_T1',Jg_T1);
    
    Dt_T1 = get(handles.Dt_T1, 'String');
    Dt_T1 = strread(Dt_T1, '%f', 'delimiter', ',');
    Dt_T1 = Dt_T1';
     setappdata(WG_T1_data_GUI,'Dt_T1',Dt_T1);
    
    Kt_T1 = get(handles.Kt_T1, 'String');
    Kt_T1 = strread(Kt_T1, '%f', 'delimiter', ',');
    Kt_T1 = Kt_T1';
     setappdata(WG_T1_data_GUI,'Kt_T1',Kt_T1);
     
    Dg_T1 = get(handles.Dg_T1, 'String');
    Dg_T1 = strread(Dg_T1, '%f', 'delimiter', ',');
    Dg_T1 = Dg_T1';
     setappdata(WG_T1_data_GUI,'Dg_T1',Dg_T1);
    
    Kg_T1 = get(handles.Kg_T1, 'String');
    Kg_T1 = strread(Kg_T1, '%f', 'delimiter', ',');
    Kg_T1 = Kg_T1';
     setappdata(WG_T1_data_GUI,'Kg_T1',Kg_T1);     
    
    power_T1 = get(handles.power_T1, 'String');
    power_T1 = strread(power_T1, '%f', 'delimiter', ',');
    power_T1 = power_T1';
     setappdata(WG_T1_data_GUI,'power_T1',power_T1);
     
    voltageline_T1 = get(handles.voltageline_T1, 'String');
    voltageline_T1 = strread(voltageline_T1, '%f', 'delimiter', ',');
    voltageline_T1 = voltageline_T1';
     setappdata(WG_T1_data_GUI,'voltageline_T1',voltageline_T1);
    
    freq_T1 = get(handles.freq_T1, 'String');
    freq_T1 = strread(freq_T1, '%f', 'delimiter', ',');
    freq_T1 = freq_T1';
     setappdata(WG_T1_data_GUI,'freq_T1',freq_T1);
    
    statres_T1 = get(handles.statres_T1, 'String');
    statres_T1 = strread(statres_T1, '%f', 'delimiter', ',');
    statres_T1 = statres_T1';
     setappdata(WG_T1_data_GUI,'statres_T1',statres_T1);
    
    statind_T1 = get(handles.statind_T1, 'String');
    statind_T1 = strread(statind_T1, '%f', 'delimiter', ',');
    statind_T1 = statind_T1';
     setappdata(WG_T1_data_GUI,'statind_T1',statind_T1);
    
    rotores_T1 = get(handles.rotores_T1, 'String');
    rotores_T1 = strread(rotores_T1, '%f', 'delimiter', ',');
    rotores_T1 = rotores_T1';
     setappdata(WG_T1_data_GUI,'rotores_T1',rotores_T1);
    
    rotoind_T1 = get(handles.rotoind_T1, 'String');
    rotoind_T1 = strread(rotoind_T1, '%f', 'delimiter', ',');
    rotoind_T1 = rotoind_T1';
     setappdata(WG_T1_data_GUI,'rotoind_T1',rotoind_T1);
    
    polepairs_T1 = get(handles.polepairs_T1, 'String');
    polepairs_T1 = strread(polepairs_T1, '%f', 'delimiter', ',');
    polepairs_T1 = polepairs_T1';
     setappdata(WG_T1_data_GUI,'polepairs_T1',polepairs_T1);

% --- Executes on button press in Reset_T1.
function Reset_T1_Callback(hObject, eventdata, handles)
% hObject    handle to Reset_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.sub_T1, 'String', '');

set(handles.subnum_T1, 'String', '');

set(handles.rotortype_T1, 'String', '');

set(handles.rotorrad_T1, 'String', '');

set(handles.cutin_T1, 'String', '');

set(handles.rated_T1, 'String', '');

set(handles.cutout_T1, 'String', '');

set(handles.hub_T1, 'String', '');

set(handles.rotorspeed_T1, 'String', '');

set(handles.Jt_T1, 'String', '');

set(handles.Jg_T1, 'String', '');

set(handles.Dt_T1, 'String', '');

set(handles.Kt_T1, 'String', '');

set(handles.Dg_T1, 'String', '');

set(handles.Kg_T1, 'String', '');

set(handles.power_T1, 'String', '');

set(handles.voltageline_T1, 'String', '');

set(handles.freq_T1, 'String', '');

set(handles.statres_T1, 'String', '');

set(handles.statind_T1, 'String', '');

set(handles.rotores_T1, 'String', '');

set(handles.rotoind_T1, 'String', '');

set(handles.polepairs_T1, 'String', '');



function power_T1_Callback(hObject, eventdata, handles)
% hObject    handle to power_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of power_T1 as text
%        str2double(get(hObject,'String')) returns contents of power_T1 as a double


% --- Executes during object creation, after setting all properties.
function power_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to power_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function voltageline_T1_Callback(hObject, eventdata, handles)
% hObject    handle to voltageline_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of voltageline_T1 as text
%        str2double(get(hObject,'String')) returns contents of voltageline_T1 as a double


% --- Executes during object creation, after setting all properties.
function voltageline_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to voltageline_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freq_T1_Callback(hObject, eventdata, handles)
% hObject    handle to freq_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq_T1 as text
%        str2double(get(hObject,'String')) returns contents of freq_T1 as a double


% --- Executes during object creation, after setting all properties.
function freq_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function statres_T1_Callback(hObject, eventdata, handles)
% hObject    handle to statres_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of statres_T1 as text
%        str2double(get(hObject,'String')) returns contents of statres_T1 as a double


% --- Executes during object creation, after setting all properties.
function statres_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to statres_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function statind_T1_Callback(hObject, eventdata, handles)
% hObject    handle to statind_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of statind_T1 as text
%        str2double(get(hObject,'String')) returns contents of statind_T1 as a double


% --- Executes during object creation, after setting all properties.
function statind_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to statind_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotores_T1_Callback(hObject, eventdata, handles)
% hObject    handle to rotores_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotores_T1 as text
%        str2double(get(hObject,'String')) returns contents of rotores_T1 as a double


% --- Executes during object creation, after setting all properties.
function rotores_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotores_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotoind_T1_Callback(hObject, eventdata, handles)
% hObject    handle to rotoind_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotoind_T1 as text
%        str2double(get(hObject,'String')) returns contents of rotoind_T1 as a double


% --- Executes during object creation, after setting all properties.
function rotoind_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotoind_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function polepairs_T1_Callback(hObject, eventdata, handles)
% hObject    handle to polepairs_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of polepairs_T1 as text
%        str2double(get(hObject,'String')) returns contents of polepairs_T1 as a double


% --- Executes during object creation, after setting all properties.
function polepairs_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to polepairs_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hub_T1_Callback(hObject, eventdata, handles)
% hObject    handle to hub_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hub_T1 as text
%        str2double(get(hObject,'String')) returns contents of hub_T1 as a double


% --- Executes during object creation, after setting all properties.
function hub_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hub_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rated_T1_Callback(hObject, eventdata, handles)
% hObject    handle to rated_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rated_T1 as text
%        str2double(get(hObject,'String')) returns contents of rated_T1 as a double


% --- Executes during object creation, after setting all properties.
function rated_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rated_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Dg_T1_Callback(hObject, eventdata, handles)
% hObject    handle to Dg_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Dg_T1 as text
%        str2double(get(hObject,'String')) returns contents of Dg_T1 as a double


% --- Executes during object creation, after setting all properties.
function Dg_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Dg_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Kg_T1_Callback(hObject, eventdata, handles)
% hObject    handle to Kg_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Kg_T1 as text
%        str2double(get(hObject,'String')) returns contents of Kg_T1 as a double


% --- Executes during object creation, after setting all properties.
function Kg_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Kg_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotorspeed_T1_Callback(hObject, eventdata, handles)
% hObject    handle to rotorspeed_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotorspeed_T1 as text
%        str2double(get(hObject,'String')) returns contents of rotorspeed_T1 as a double


% --- Executes during object creation, after setting all properties.
function rotorspeed_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotorspeed_T1 (see GCBO)
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