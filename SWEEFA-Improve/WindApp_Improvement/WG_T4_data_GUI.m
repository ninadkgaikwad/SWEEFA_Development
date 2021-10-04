function varargout = WG_T4_data_GUI(varargin)
% WG_T4_DATA_GUI MATLAB code for WG_T4_data_GUI.fig
%      WG_T4_DATA_GUI, by itself, creates a new WG_T4_DATA_GUI or raises the existing
%      singleton*.
%
%      H = WG_T4_DATA_GUI returns the handle to a new WG_T4_DATA_GUI or the handle to
%      the existing singleton*.
%
%      WG_T4_DATA_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WG_T4_DATA_GUI.M with the given input arguments.
%
%      WG_T4_DATA_GUI('Property','Value',...) creates a new WG_T4_DATA_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WG_T4_data_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WG_T4_data_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WG_T4_data_GUI

% Last Modified by GUIDE v2.5 24-Mar-2016 11:01:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WG_T4_data_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @WG_T4_data_GUI_OutputFcn, ...
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


% --- Executes just before WG_T4_data_GUI is made visible.
function WG_T4_data_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WG_T4_data_GUI (see VARARGIN)

% Choose default command line output for WG_T4_data_GUI
handles.output = hObject;

% Initialization:
set(handles.r1_T4, 'Value', 1);

set(handles.r2_T4, 'Value', 0);

set(handles.r3_T4, 'Value', 0);

set(handles.Fluxlinkmag_T4, 'Enable', 'on');

set(handles.Vconst_T4, 'Enable', 'off');

set(handles.Tconst_T4, 'Enable', 'off');

set(handles.Fluxlinkmag_T4, 'String', '');

set(handles.Vconst_T4, 'String', '');

set(handles.Tconst_T4, 'String', '');

set(handles.sub_T4, 'String', '');

set(handles.subnum_T4, 'String', '');

set(handles.rotortype_T4, 'String', '');

set(handles.rotorrad_T4, 'String', '');

set(handles.cutin_T4, 'String', '');

set(handles.rated_T4, 'String', '');

set(handles.cutout_T4, 'String', '');

set(handles.hub_T4, 'String', '');

set(handles.rotorspeed_T4, 'String', '');

set(handles.Jt_T4, 'String', '');

set(handles.Jg_T4, 'String', '');

set(handles.Dt_T4, 'String', '');

set(handles.Kt_T4, 'String', '');

set(handles.Dg_T4, 'String', '');

set(handles.Kg_T4, 'String', '');

set(handles.power_T4, 'String', '');

set(handles.voltageline_T4, 'String', '');

set(handles.freq_T4, 'String', '');

set(handles.statres_T4, 'String', '');

set(handles.armatureind_T4, 'String', '');

set(handles.polepairs_T4, 'String', '');

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace:
setappdata(0,'WG_T2_data_GUI',gcf);

% UIWAIT makes WG_T4_data_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WG_T4_data_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Ok_T4.
function Ok_T4_Callback(hObject, eventdata, handles)
% hObject    handle to Ok_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

WG_T4_data_GUI = getappdata(0,'WG_T4_data_GUI');

% Setting-up Ok button functions:

    sub_T4 = get(handles.sub_T4, 'String');
    sub_T4 = str2double(sub_T4);
     setappdata(WG_T4_data_GUI,'sub_T4',sub_T4);
    
    subnum_T4 = get(handles.subnum_T4, 'String');
    subnum_T4 = strread(subnum_T4, '%f', 'delimiter', ',');
    subnum_T4 = subnum_T4';
     setappdata(WG_T4_data_GUI,'subnum_T4',subnum_T4);
    
    rotortype_T4 = get(handles.rotortype_T4, 'String');
    rotortype_T4 = strread(rotortype_T4, '%f', 'delimiter', ',');
    rotortype_T4 = rotortype_T4';
    setappdata(WG_T4_data_GUI,'rotortype_T4',rotortype_T4);
    
    rotorrad_T4 = get(handles.rotorrad_T4, 'String');
    rotorrad_T4 = strread(rotorrad_T4, '%f', 'delimiter', ',');
    rotorrad_T4 = rotorrad_T4';
     setappdata(WG_T4_data_GUI,'rotorrad_T4',rotorrad_T4);
    
    cutin_T4 = get(handles.cutin_T4, 'String');
    cutin_T4 = strread(cutin_T4, '%f', 'delimiter', ',');
    cutin_T4 = cutin_T4';
     setappdata(WG_T4_data_GUI,'cutin_T4',cutin_T4);
     
    rated_T4 = get(handles.rated_T4, 'String');
    rated_T4 = strread(rated_T4, '%f', 'delimiter', ',');
    rated_T4 = rated_T4';
     setappdata(WG_T4_data_GUI,'rated_T4',rated_T4);     
    
    cutout_T4 = get(handles.cutout_T4, 'String');
    cutout_T4 = strread(cutout_T4, '%f', 'delimiter', ',');
    cutout_T4 = cutout_T4';
     setappdata(WG_T4_data_GUI,'cutout_T4',cutout_T4);

    hub_T4 = get(handles.hub_T4, 'String');
    hub_T4 = strread(hub_T4, '%f', 'delimiter', ',');
    hub_T4 = hub_T4';
     setappdata(WG_T4_data_GUI,'hub_T4',hub_T4);
     
    rotorspeed_T4 = get(handles.rotorspeed_T4, 'String');
    rotorspeed_T4 = strread(rotorspeed_T4, '%f', 'delimiter', ',');
    rotorspeed_T4 = rotorspeed_T4';
     setappdata(WG_T4_data_GUI,'rotorspeed_T4',rotorspeed_T4);     

    Jt_T4 = get(handles.Jt_T4, 'String');
    Jt_T4 = strread(Jt_T4, '%f', 'delimiter', ',');
    Jt_T4 = Jt_T4';
     setappdata(WG_T4_data_GUI,'Jt_T4',Jt_T4);
    
    Jg_T4 = get(handles.Jg_T4, 'String');
    Jg_T4 = strread(Jg_T4, '%f', 'delimiter', ',');
    Jg_T4 = Jg_T4';
     setappdata(WG_T4_data_GUI,'Jg_T4',Jg_T4);
    
    Dt_T4 = get(handles.Dt_T4, 'String');
    Dt_T4 = strread(Dt_T4, '%f', 'delimiter', ',');
    Dt_T4 = Dt_T4';
     setappdata(WG_T4_data_GUI,'Dt_T4',Dt_T4);
    
    Kt_T4 = get(handles.Kt_T4, 'String');
    Kt_T4 = strread(Kt_T4, '%f', 'delimiter', ',');
    Kt_T4 = Kt_T4';
     setappdata(WG_T4_data_GUI,'Kt_T4',Kt_T4);
     
    Dg_T4 = get(handles.Dg_T4, 'String');
    Dg_T4 = strread(Dg_T4, '%f', 'delimiter', ',');
    Dg_T4 = Dg_T4';
     setappdata(WG_T4_data_GUI,'Dg_T4',Dg_T4);
    
    Kg_T4 = get(handles.Kg_T4, 'String');
    Kg_T4 = strread(Kg_T4, '%f', 'delimiter', ',');
    Kg_T4 = Kg_T4';
     setappdata(WG_T4_data_GUI,'Kg_T4',Kg_T4);     
    
    power_T4 = get(handles.power_T4, 'String');
    power_T4 = strread(power_T4, '%f', 'delimiter', ',');
    power_T4 = power_T4';
     setappdata(WG_T4_data_GUI,'power_T4',power_T4);
     
    voltageline_T4 = get(handles.voltageline_T4, 'String');
    voltageline_T4 = strread(voltageline_T4, '%f', 'delimiter', ',');
    voltageline_T4 = voltageline_T4';
     setappdata(WG_T4_data_GUI,'voltageline_T4',voltageline_T4);
    
    freq_T4 = get(handles.freq_T4, 'String');
    freq_T4 = strread(freq_T4, '%f', 'delimiter', ',');
    freq_T4 = freq_T4';
     setappdata(WG_T4_data_GUI,'freq_T4',freq_T4);
    
    statres_T4 = get(handles.statres_T4, 'String');
    statres_T4 = strread(statres_T4, '%f', 'delimiter', ',');
    statres_T4 = statres_T4';
     setappdata(WG_T4_data_GUI,'statres_T4',statres_T4);
    
    armatureind_T4 = get(handles.armatureind_T4, 'String');
    armatureind_T4 = strread(armatureind_T4, '%f', 'delimiter', ',');
    armatureind_T4 = armatureind_T4';
     setappdata(WG_T4_data_GUI,'armatureind_T4',armatureind_T4);
        
    polepairs_T4 = get(handles.polepairs_T4, 'String');
    polepairs_T4 = strread(polepairs_T4, '%f', 'delimiter', ',');
    polepairs_T4 = polepairs_T4';
     setappdata(WG_T4_data_GUI,'polepairs_T4',polepairs_T4);
     
     r1_T4 = get(handles.r1_T4, 'Value');
     setappdata(WG_T4_data_GUI,'r1_T4',r1_T4);
     
    
     r2_T4 = get(handles.r2_T4, 'Value');
     setappdata(WG_T4_data_GUI,'r2_T4 ',r2_T4 );

     r3_T4 = get(handles.r3_T4, 'Value');
     setappdata(WG_T4_data_GUI,'r3_T4',r3_T4);
     
     if r1_T4 == 1
         
         Fluxlinkmag_T4 = get(handles.Fluxlinkmag_T4, 'String');         
         Fluxlinkmag_T4 = strread(Fluxlinkmag_T4, '%f', 'delimiter', ',');
         Fluxlinkmag_T4 = Fluxlinkmag_T4';
         setappdata(WG_T4_data_GUI,'Fluxlinkmag_T4',Fluxlinkmag_T4);
         
         setappdata(WG_T4_data_GUI,' Tconst_T4', 0);         
         setappdata(WG_T4_data_GUI,'Vconst_T4',0);
         
     elseif r2_T4 == 1
         
         Vconst_T4 = get(handles.Vconst_T4, 'String');
         Vconst_T4 = strread(Vconst_T4, '%f', 'delimiter', ',');
         Vconst_T4 = Vconst_T4';
         setappdata(WG_T4_data_GUI,'Vconst_T4',Vconst_T4);
         
          setappdata(WG_T4_data_GUI,'Fluxlinkmag_T4',0);
          setappdata(WG_T4_data_GUI,' Tconst_T4', 0);
         
     elseif r3_T4 ==1
         
        Tconst_T4 = get(handles.Tconst_T4, 'String');
        Tconst_T4 = strread( Tconst_T4, '%f', 'delimiter', ',');
        Tconst_T4 =  Tconst_T4';
        setappdata(WG_T4_data_GUI,' Tconst_T4', Tconst_T4);  
        
         setappdata(WG_T4_data_GUI,'Fluxlinkmag_T4',0);
         setappdata(WG_T4_data_GUI,'Vconst_T4',0);
  
     end
% --- Executes on button press in Reset_T4.
function Reset_T4_Callback(hObject, eventdata, handles)
% hObject    handle to Reset_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.r1_T4, 'Value', 1);

set(handles.r2_T4, 'Value', 0);

set(handles.r3_T4, 'Value', 0);

set(handles.Fluxlinkmag_T4, 'Enable', 'on');

set(handles.Vconst_T4, 'Enable', 'off');

set(handles.Tconst_T4, 'Enable', 'off');

set(handles.Fluxlinkmag_T4, 'String', '');

set(handles.Vconst_T4, 'String', '');

set(handles.Tconst_T4, 'String', '');

set(handles.sub_T4, 'String', '');

set(handles.subnum_T4, 'String', '');

set(handles.rotortype_T4, 'String', '');

set(handles.rotorrad_T4, 'String', '');

set(handles.cutin_T4, 'String', '');

set(handles.rated_T4, 'String', '');

set(handles.cutout_T4, 'String', '');

set(handles.hub_T4, 'String', '');

set(handles.rotorspeed_T4, 'String', '');

set(handles.Jt_T4, 'String', '');

set(handles.Jg_T4, 'String', '');

set(handles.Dt_T4, 'String', '');

set(handles.Kt_T4, 'String', '');

set(handles.Dg_T4, 'String', '');

set(handles.Kg_T4, 'String', '');

set(handles.power_T4, 'String', '');

set(handles.voltageline_T4, 'String', '');

set(handles.freq_T4, 'String', '');

set(handles.statres_T4, 'String', '');

set(handles.armatureind_T4, 'String', '');

set(handles.polepairs_T4, 'String', '');




function Jt_T4_Callback(hObject, eventdata, handles)
% hObject    handle to Jt_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Jt_T4 as text
%        str2double(get(hObject,'String')) returns contents of Jt_T4 as a double


% --- Executes during object creation, after setting all properties.
function Jt_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Jt_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Jg_T4_Callback(hObject, eventdata, handles)
% hObject    handle to Jg_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Jg_T4 as text
%        str2double(get(hObject,'String')) returns contents of Jg_T4 as a double


% --- Executes during object creation, after setting all properties.
function Jg_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Jg_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Dt_T4_Callback(hObject, eventdata, handles)
% hObject    handle to Dt_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Dt_T4 as text
%        str2double(get(hObject,'String')) returns contents of Dt_T4 as a double


% --- Executes during object creation, after setting all properties.
function Dt_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Dt_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Kt_T4_Callback(hObject, eventdata, handles)
% hObject    handle to Kt_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Kt_T4 as text
%        str2double(get(hObject,'String')) returns contents of Kt_T4 as a double


% --- Executes during object creation, after setting all properties.
function Kt_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Kt_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotorrad_T4_Callback(hObject, eventdata, handles)
% hObject    handle to rotorrad_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotorrad_T4 as text
%        str2double(get(hObject,'String')) returns contents of rotorrad_T4 as a double


% --- Executes during object creation, after setting all properties.
function rotorrad_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotorrad_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cutin_T4_Callback(hObject, eventdata, handles)
% hObject    handle to cutin_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutin_T4 as text
%        str2double(get(hObject,'String')) returns contents of cutin_T4 as a double


% --- Executes during object creation, after setting all properties.
function cutin_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutin_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cutout_T4_Callback(hObject, eventdata, handles)
% hObject    handle to cutout_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutout_T4 as text
%        str2double(get(hObject,'String')) returns contents of cutout_T4 as a double


% --- Executes during object creation, after setting all properties.
function cutout_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutout_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotortype_T4_Callback(hObject, eventdata, handles)
% hObject    handle to rotortype_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotortype_T4 as text
%        str2double(get(hObject,'String')) returns contents of rotortype_T4 as a double


% --- Executes during object creation, after setting all properties.
function rotortype_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotortype_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sub_T4_Callback(hObject, eventdata, handles)
% hObject    handle to sub_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sub_T4 as text
%        str2double(get(hObject,'String')) returns contents of sub_T4 as a double


% --- Executes during object creation, after setting all properties.
function sub_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sub_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function subnum_T4_Callback(hObject, eventdata, handles)
% hObject    handle to subnum_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subnum_T4 as text
%        str2double(get(hObject,'String')) returns contents of subnum_T4 as a double


% --- Executes during object creation, after setting all properties.
function subnum_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subnum_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function power_T4_Callback(hObject, eventdata, handles)
% hObject    handle to power_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of power_T4 as text
%        str2double(get(hObject,'String')) returns contents of power_T4 as a double


% --- Executes during object creation, after setting all properties.
function power_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to power_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function voltageline_T4_Callback(hObject, eventdata, handles)
% hObject    handle to voltageline_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of voltageline_T4 as text
%        str2double(get(hObject,'String')) returns contents of voltageline_T4 as a double


% --- Executes during object creation, after setting all properties.
function voltageline_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to voltageline_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freq_T4_Callback(hObject, eventdata, handles)
% hObject    handle to freq_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq_T4 as text
%        str2double(get(hObject,'String')) returns contents of freq_T4 as a double


% --- Executes during object creation, after setting all properties.
function freq_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function statres_T4_Callback(hObject, eventdata, handles)
% hObject    handle to statres_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of statres_T4 as text
%        str2double(get(hObject,'String')) returns contents of statres_T4 as a double


% --- Executes during object creation, after setting all properties.
function statres_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to statres_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function armatureind_T4_Callback(hObject, eventdata, handles)
% hObject    handle to armatureind_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of armatureind_T4 as text
%        str2double(get(hObject,'String')) returns contents of armatureind_T4 as a double


% --- Executes during object creation, after setting all properties.
function armatureind_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to armatureind_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function polepairs_T4_Callback(hObject, eventdata, handles)
% hObject    handle to polepairs_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of polepairs_T4 as text
%        str2double(get(hObject,'String')) returns contents of polepairs_T4 as a double


% --- Executes during object creation, after setting all properties.
function polepairs_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to polepairs_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r1_T4_Callback(hObject, eventdata, handles)
% hObject    handle to r1_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r1_T4 as text
%        str2double(get(hObject,'String')) returns contents of r1_T4 as a double


% --- Executes during object creation, after setting all properties.
function r1_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r1_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vconst_T4_Callback(hObject, eventdata, handles)
% hObject    handle to Vconst_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Vconst_T4 as text
%        str2double(get(hObject,'String')) returns contents of Vconst_T4 as a double


% --- Executes during object creation, after setting all properties.
function Vconst_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vconst_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Tconst_T4_Callback(hObject, eventdata, handles)
% hObject    handle to Tconst_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tconst_T4 as text
%        str2double(get(hObject,'String')) returns contents of Tconst_T4 as a double


% --- Executes during object creation, after setting all properties.
function Tconst_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tconst_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel6.
function uipanel6_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel6 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Getting Radiobutton values from the user:

r1_T4 = get(handles.r1_T4, 'Value');

r2_T4 = get(handles.r2_T4, 'Value');

r3_T4 = get(handles.r3_T4, 'Value');

% Enabling conditions according to radiobutton selection:

if r1_T4 == 1
    
    set(handles.Fluxlinkmag_T4, 'Enable', 'on');
    
    set(handles.Vconst_T4, 'Enable', 'off');
    
    set(handles.Tconst_T4, 'Enable', 'off');
    

elseif r2_T4 == 1
    
    set(handles.Fluxlinkmag_T4, 'Enable', 'off');
    
    set(handles.Vconst_T4, 'Enable', 'on');
    
    set(handles.Tconst_T4, 'Enable', 'off');
    


elseif r3_T4 == 1
    
    set(handles.Fluxlinkmag_T4, 'Enable', 'off');
    
    set(handles.Vconst_T4, 'Enable', 'off');
    
    set(handles.Tconst_T4, 'Enable', 'on');
    
end
    



function Fluxlinkmag_T4_Callback(hObject, eventdata, handles)
% hObject    handle to fluxlinkmag_t4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fluxlinkmag_t4 as text
%        str2double(get(hObject,'String')) returns contents of fluxlinkmag_t4 as a double


% --- Executes during object creation, after setting all properties.
function Fluxlinkmag_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fluxlinkmag_t4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hub_T4_Callback(hObject, eventdata, handles)
% hObject    handle to hub_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hub_T4 as text
%        str2double(get(hObject,'String')) returns contents of hub_T4 as a double


% --- Executes during object creation, after setting all properties.
function hub_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hub_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rated_T4_Callback(hObject, eventdata, handles)
% hObject    handle to rated_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rated_T4 as text
%        str2double(get(hObject,'String')) returns contents of rated_T4 as a double


% --- Executes during object creation, after setting all properties.
function rated_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rated_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Dg_T4_Callback(hObject, eventdata, handles)
% hObject    handle to Dg_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Dg_T4 as text
%        str2double(get(hObject,'String')) returns contents of Dg_T4 as a double


% --- Executes during object creation, after setting all properties.
function Dg_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Dg_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Kg_T4_Callback(hObject, eventdata, handles)
% hObject    handle to Kg_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Kg_T4 as text
%        str2double(get(hObject,'String')) returns contents of Kg_T4 as a double


% --- Executes during object creation, after setting all properties.
function Kg_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Kg_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotorspeed_T4_Callback(hObject, eventdata, handles)
% hObject    handle to rotorspeed_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotorspeed_T4 as text
%        str2double(get(hObject,'String')) returns contents of rotorspeed_T4 as a double


% --- Executes during object creation, after setting all properties.
function rotorspeed_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotorspeed_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b3.


% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening PU Converter Window

PUConverter_GUI;
