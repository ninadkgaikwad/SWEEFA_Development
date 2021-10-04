function varargout = ARIMA_ForecastMode_GUI(varargin)
% ARIMA_FORECASTMODE_GUI MATLAB code for ARIMA_ForecastMode_GUI.fig
%      ARIMA_FORECASTMODE_GUI, by itself, creates a new ARIMA_FORECASTMODE_GUI or raises the existing
%      singleton*.
%
%      H = ARIMA_FORECASTMODE_GUI returns the handle to a new ARIMA_FORECASTMODE_GUI or the handle to
%      the existing singleton*.
%
%      ARIMA_FORECASTMODE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARIMA_FORECASTMODE_GUI.M with the given input arguments.
%
%      ARIMA_FORECASTMODE_GUI('Property','Value',...) creates a new ARIMA_FORECASTMODE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ARIMA_ForecastMode_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ARIMA_ForecastMode_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ARIMA_ForecastMode_GUI

% Last Modified by GUIDE v2.5 22-May-2018 14:38:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ARIMA_ForecastMode_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ARIMA_ForecastMode_GUI_OutputFcn, ...
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


% --- Executes just before ARIMA_ForecastMode_GUI is made visible.
function ARIMA_ForecastMode_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ARIMA_ForecastMode_GUI (see VARARGIN)

% Initializing the Current GUI Elements

% Step 1
set(handles.WindPlant,'Value',0);
set(handles.SolarPlant,'Value',0);
set(handles.PlantName,'String','');

% Step 2
set(handles.Res,'String','');

% Choose default command line output for ARIMA_ForecastMode_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Creating the Workspace for Current GUI

setappdata(0,'ARIMA_ForecastMode_GUI',gcf);

% UIWAIT makes ARIMA_ForecastMode_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ARIMA_ForecastMode_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in B2.
function B2_Callback(hObject, eventdata, handles)
% hObject    handle to B2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B3.
function B3_Callback(hObject, eventdata, handles)
% hObject    handle to B3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in B4.
function B4_Callback(hObject, eventdata, handles)
% hObject    handle to B4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting the Current GUI Elements

% Step 1
set(handles.WindPlant,'Value',0);
set(handles.SolarPlant,'Value',0);
set(handles.PlantName,'String','');

% Step 2
set(handles.Res,'String','');

% --- Executes on button press in B5.
function B5_Callback(hObject, eventdata, handles)
% hObject    handle to B5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing the Current GUi

close;


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



function PlantName_Callback(hObject, eventdata, handles)
% hObject    handle to PlantName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PlantName as text
%        str2double(get(hObject,'String')) returns contents of PlantName as a double


% --- Executes during object creation, after setting all properties.
function PlantName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PlantName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in B1.
function B1_Callback(hObject, eventdata, handles)
% hObject    handle to B1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
