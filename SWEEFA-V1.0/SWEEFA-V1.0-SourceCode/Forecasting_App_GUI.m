function varargout = Forecasting_App_GUI(varargin)
% FORECASTING_APP_GUI MATLAB code for Forecasting_App_GUI.fig
%      FORECASTING_APP_GUI, by itself, creates a new FORECASTING_APP_GUI or raises the existing
%      singleton*.
%
%      H = FORECASTING_APP_GUI returns the handle to a new FORECASTING_APP_GUI or the handle to
%      the existing singleton*.
%
%      FORECASTING_APP_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORECASTING_APP_GUI.M with the given input arguments.
%
%      FORECASTING_APP_GUI('Property','Value',...) creates a new FORECASTING_APP_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Forecasting_App_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Forecasting_App_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Forecasting_App_GUI

% Last Modified by GUIDE v2.5 15-Nov-2016 19:06:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Forecasting_App_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Forecasting_App_GUI_OutputFcn, ...
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


% --- Executes just before Forecasting_App_GUI is made visible.
function Forecasting_App_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Forecasting_App_GUI (see VARARGIN)

% Choose default command line output for Forecasting_App_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Forecasting_App_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Forecasting_App_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening WRF-NETCDF Visualization and Extraction App

NETCDF_TEST_GUI;

% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening ARIM Forecasting App (Data Acquisition GUI)

ARIMA_DataAcquisition_GUI;

% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening ANN Forecasting App

ANN_Forecasting_GUI_1 ;

% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing ANN Forecasting Application GUI

hf1=findobj('Name','ANN_Performance_Plots');
close(hf1);
hf2=findobj('Name','ANN_Forecasting_GUI_1');
close(hf2);

% close(1);
% close(2);
% close(3);
% close(4);

% Closing ARIMA Forecasting Application GUI

hf3=findobj('Name','ARIMA_ModelForecast_GUI');
close(hf3);
hf4=findobj('Name','ARIMA_ModelEstimateViewer_GUI');
close(hf4);
hf5=findobj('Name','ARIMA_ModelEstimation_GUI');
close(hf5);
hf6=findobj('Name','ARIMA_ModelSimulation_GUI');
close(hf6);
hf7=findobj('Name','ARIMA_ModelCreation_GUI');
close(hf7);
hf8=findobj('Name','ARIMA_ModelIdentification_GUI');
close(hf8);
hf9=findobj('Name','ARIMA_DataAcquisition_GUI');
close(hf9);


% Closing NETCDF-WRF Forecasting Application GUI

hf10=findobj('Name','NETCDF_TEST_GUI');
close(hf10);

% Closing GUI

close;


% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Help File
winopen('SWEEFA-HelpFile.pdf');
