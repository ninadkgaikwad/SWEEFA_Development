function varargout = SingleAxis_NS_Data(varargin)
% SINGLEAXIS_NS_DATA MATLAB code for SingleAxis_NS_Data.fig
%      SINGLEAXIS_NS_DATA, by itself, creates a new SINGLEAXIS_NS_DATA or raises the existing
%      singleton*.
%
%      H = SINGLEAXIS_NS_DATA returns the handle to a new SINGLEAXIS_NS_DATA or the handle to
%      the existing singleton*.
%
%      SINGLEAXIS_NS_DATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SINGLEAXIS_NS_DATA.M with the given input arguments.
%
%      SINGLEAXIS_NS_DATA('Property','Value',...) creates a new SINGLEAXIS_NS_DATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SingleAxis_NS_Data_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SingleAxis_NS_Data_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SingleAxis_NS_Data

% Last Modified by GUIDE v2.5 01-Nov-2015 11:52:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SingleAxis_NS_Data_OpeningFcn, ...
                   'gui_OutputFcn',  @SingleAxis_NS_Data_OutputFcn, ...
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


% --- Executes just before SingleAxis_NS_Data is made visible.
function SingleAxis_NS_Data_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SingleAxis_NS_Data (see VARARGIN)

% Getting Required GUI Workspace Name
Solar_App_Main_GUI=getappdata(0,'Solar_App_Main_GUI');

if (isappdata(0,'Solar_App_Main_GUI') && isappdata(Solar_App_Main_GUI,'PlantInfo_DataCell'))
    
    % Getting Data fro Solar_App_Main_GUI Workspace
    
    PlantInfo_DataCell=getappdata(Solar_App_Main_GUI,'PlantInfo_DataCell');
    
    % Initializing Loss Parameter Values to Data from Plant Info

    tiltmax=PlantInfo_DataCell{27,2};
    set(handles.tiltmax,'String',tiltmax);
    
    tiltmin=PlantInfo_DataCell{28,2};
    set(handles.tiltmin,'String',tiltmin);  
    
    phic=PlantInfo_DataCell{22,2};
    set(handles.phic,'String',phic);    
    
else
    
    % Initializing the GUI    
    
    set(handles.tiltmax,'String','');    
    set(handles.tiltmin,'String','');
    set(handles.phic,'String','');         
    
end

% Choose default command line output for SingleAxis_NS_Data
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'SingleAxis_NS_Data',gcf);

% UIWAIT makes SingleAxis_NS_Data wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SingleAxis_NS_Data_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function tiltmax_Callback(hObject, eventdata, handles)
% hObject    handle to tiltmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tiltmax as text
%        str2double(get(hObject,'String')) returns contents of tiltmax as a double


% --- Executes during object creation, after setting all properties.
function tiltmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tiltmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tiltmin_Callback(hObject, eventdata, handles)
% hObject    handle to tiltmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tiltmin as text
%        str2double(get(hObject,'String')) returns contents of tiltmin as a double


% --- Executes during object creation, after setting all properties.
function tiltmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tiltmin (see GCBO)
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

SingleAxis_NS_Data=getappdata(0,'SingleAxis_NS_Data');

tiltmax=get(handles.tiltmax,'String');
tiltmax=str2double(tiltmax);
setappdata(SingleAxis_NS_Data,'tiltmax',tiltmax);
tiltmin=get(handles.tiltmin,'String');
tiltmin=str2double(tiltmin);
setappdata(SingleAxis_NS_Data,'tiltmin',tiltmin);
phic=get(handles.phic,'String');
phic=str2double(phic);
setappdata(SingleAxis_NS_Data,'phic',phic);


% --- Executes on button press in PB2.
function PB2_Callback(hObject, eventdata, handles)
% hObject    handle to PB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting Figure Values
set(handles.tiltmax,'String','');
set(handles.tiltmin,'String','');
set(handles.phic,'String','');
