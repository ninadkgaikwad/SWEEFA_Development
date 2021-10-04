function varargout = Wind_App_Simulation_Completion_GUI(varargin)
% WIND_APP_SIMULATION_COMPLETION_GUI MATLAB code for Wind_App_Simulation_Completion_GUI.fig
%      WIND_APP_SIMULATION_COMPLETION_GUI, by itself, creates a new WIND_APP_SIMULATION_COMPLETION_GUI or raises the existing
%      singleton*.
%
%      H = WIND_APP_SIMULATION_COMPLETION_GUI returns the handle to a new WIND_APP_SIMULATION_COMPLETION_GUI or the handle to
%      the existing singleton*.
%
%      WIND_APP_SIMULATION_COMPLETION_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WIND_APP_SIMULATION_COMPLETION_GUI.M with the given input arguments.
%
%      WIND_APP_SIMULATION_COMPLETION_GUI('Property','Value',...) creates a new WIND_APP_SIMULATION_COMPLETION_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Wind_App_Simulation_Completion_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Wind_App_Simulation_Completion_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Wind_App_Simulation_Completion_GUI

% Last Modified by GUIDE v2.5 14-Mar-2018 10:00:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Wind_App_Simulation_Completion_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Wind_App_Simulation_Completion_GUI_OutputFcn, ...
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


% --- Executes just before Wind_App_Simulation_Completion_GUI is made visible.
function Wind_App_Simulation_Completion_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Wind_App_Simulation_Completion_GUI (see VARARGIN)

% Choose default command line output for Wind_App_Simulation_Completion_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Wind_App_Simulation_Completion_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Wind_App_Simulation_Completion_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Wind_GUI_MainPage Workspace Name
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Getting the Simulation result files folder Path
WindSimResults_FullPath=getappdata(Wind_GUI_MainPage,'WindSimResults_FullPath');

% Opening the Folder in File Explorer
winopen(WindSimResults_FullPath);

% Closing GUI

close;
