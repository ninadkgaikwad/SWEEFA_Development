function varargout = Wind_App_GUI(varargin)
% WIND_APP_GUI MATLAB code for Wind_App_GUI.fig
%      WIND_APP_GUI, by itself, creates a new WIND_APP_GUI or raises the existing
%      singleton*.
%
%      H = WIND_APP_GUI returns the handle to a new WIND_APP_GUI or the handle to
%      the existing singleton*.
%
%      WIND_APP_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WIND_APP_GUI.M with the given input arguments.
%
%      WIND_APP_GUI('Property','Value',...) creates a new WIND_APP_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Wind_App_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Wind_App_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Wind_App_GUI

% Last Modified by GUIDE v2.5 15-Nov-2016 19:05:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Wind_App_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Wind_App_GUI_OutputFcn, ...
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


% --- Executes just before Wind_App_GUI is made visible.
function Wind_App_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Wind_App_GUI (see VARARGIN)

% Choose default command line output for Wind_App_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Wind_App_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Wind_App_GUI_OutputFcn(hObject, eventdata, handles) 
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

% Opening Energy Estimation Application
Wind_GUI_MainPage


% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Data Acquisition Application
Wind_GUI_1


% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Cp Curve Generator Application
Cp_Curve_Generator_GUI

% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing Window

hf1=findobj('Name','Wake_Model_GUI');
close(hf1);
hf2=findobj('Name','Wind_Loss_Parameters_GUI');
close(hf2);
hf3=findobj('Name','Wind_WeibullDistribution_GUI');
close(hf3);
hf4=findobj('Name','Wind_Power_Curve_Graph_GUI');
close(hf4);
hf5=findobj('Name','Wind_GUI_MainPage');
close(hf5);
hf6=findobj('Name','Wind_GUI_1');
close(hf6);
hf7=findobj('Name','Cp_Curve_Generator_GUI');
close(hf7);

close ;


% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Help File
winopen('SWEEFA-HelpFile.pdf');
