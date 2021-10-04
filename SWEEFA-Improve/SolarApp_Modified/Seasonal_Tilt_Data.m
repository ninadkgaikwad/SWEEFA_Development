function varargout = Seasonal_Tilt_Data(varargin)
% SEASONAL_TILT_DATA MATLAB code for Seasonal_Tilt_Data.fig
%      SEASONAL_TILT_DATA, by itself, creates a new SEASONAL_TILT_DATA or raises the existing
%      singleton*.
%
%      H = SEASONAL_TILT_DATA returns the handle to a new SEASONAL_TILT_DATA or the handle to
%      the existing singleton*.
%
%      SEASONAL_TILT_DATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEASONAL_TILT_DATA.M with the given input arguments.
%
%      SEASONAL_TILT_DATA('Property','Value',...) creates a new SEASONAL_TILT_DATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Seasonal_Tilt_Data_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Seasonal_Tilt_Data_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Seasonal_Tilt_Data

% Last Modified by GUIDE v2.5 02-Nov-2015 18:27:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Seasonal_Tilt_Data_OpeningFcn, ...
                   'gui_OutputFcn',  @Seasonal_Tilt_Data_OutputFcn, ...
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


% --- Executes just before Seasonal_Tilt_Data is made visible.
function Seasonal_Tilt_Data_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Seasonal_Tilt_Data (see VARARGIN)

% Getting Required GUI Workspace Name
Solar_App_Main_GUI=getappdata(0,'Solar_App_Main_GUI');

if (isappdata(0,'Solar_App_Main_GUI') && isappdata(Solar_App_Main_GUI,'PlantInfo_DataCell'))
    
    % Getting Data fro Solar_App_Main_GUI Workspace

    PlantInfo_DataCell=getappdata(Solar_App_Main_GUI,'PlantInfo_DataCell');
    
    % Initializing Loss Parameter Values to Data from Plant Info

    tiltsummer=PlantInfo_DataCell{23,2};
    set(handles.tiltsummer,'String',tiltsummer);
    
    tilt=PlantInfo_DataCell{21,2};
    set(handles.tilt,'String',tilt);  
    
    tiltwinter=PlantInfo_DataCell{24,2};
    set(handles.tiltwinter,'String',tiltwinter);
    
    phic=PlantInfo_DataCell{22,2};
    set(handles.phic,'String',phic);    
    
else
    
    % Initializing the GUI
    
    set(handles.tiltsummer,'String','');    
    set(handles.tilt,'String','');
    set(handles.tiltwinter,'String','');    
    set(handles.phic,'String','');    
    
end

% Choose default command line output for Seasonal_Tilt_Data
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'Seasonal_Tilt_Data',gcf);

% UIWAIT makes Seasonal_Tilt_Data wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Seasonal_Tilt_Data_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function tiltsummer_Callback(hObject, eventdata, handles)
% hObject    handle to tiltsummer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tiltsummer as text
%        str2double(get(hObject,'String')) returns contents of tiltsummer as a double


% --- Executes during object creation, after setting all properties.
function tiltsummer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tiltsummer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tilt_Callback(hObject, eventdata, handles)
% hObject    handle to tilt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tilt as text
%        str2double(get(hObject,'String')) returns contents of tilt as a double


% --- Executes during object creation, after setting all properties.
function tilt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tilt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tiltwinter_Callback(hObject, eventdata, handles)
% hObject    handle to tiltwinter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tiltwinter as text
%        str2double(get(hObject,'String')) returns contents of tiltwinter as a double


% --- Executes during object creation, after setting all properties.
function tiltwinter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tiltwinter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function phic_Callback(hObject, eventdata, handles)
% hObject    handle to phic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phic as text
%        str2double(get(hObject,'String')) returns contents of phic as a double


% --- Executes during object creation, after setting all properties.
function phic_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phic (see GCBO)
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

Seasonal_Tilt_Data=getappdata(0,'Seasonal_Tilt_Data');

% Getting User Input and storing it in Figure Workspace
tilt=get(handles.tilt,'String');
tilt=str2double(tilt);
setappdata(Seasonal_Tilt_Data,'tilt',tilt);
tiltsummer=get(handles.tiltsummer,'String');
tiltsummer=str2double(tiltsummer);
setappdata(Seasonal_Tilt_Data,'tiltsummer',tiltsummer);
tiltwinter=get(handles.tiltwinter,'String');
tiltwinter=str2double(tiltwinter);
setappdata(Seasonal_Tilt_Data,'tiltwinter',tiltwinter);
phic=get(handles.phic,'String');
phic=str2double(phic);
setappdata(Seasonal_Tilt_Data,'phic',phic);


% --- Executes on button press in PB2.
function PB2_Callback(hObject, eventdata, handles)
% hObject    handle to PB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting Figure Data
set(handles.tilt,'String','');
set(handles.tiltsummer,'String','');
set(handles.tiltwinter,'String','');
set(handles.phic,'String','');
