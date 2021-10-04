function varargout = Solar_App_GUI(varargin)
% SOLAR_APP_GUI MATLAB code for Solar_App_GUI.fig
%      SOLAR_APP_GUI, by itself, creates a new SOLAR_APP_GUI or raises the existing
%      singleton*.
%
%      H = SOLAR_APP_GUI returns the handle to a new SOLAR_APP_GUI or the handle to
%      the existing singleton*.
%
%      SOLAR_APP_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOLAR_APP_GUI.M with the given input arguments.
%
%      SOLAR_APP_GUI('Property','Value',...) creates a new SOLAR_APP_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Solar_App_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Solar_App_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Solar_App_GUI

% Last Modified by GUIDE v2.5 07-Dec-2016 12:13:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Solar_App_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Solar_App_GUI_OutputFcn, ...
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


% --- Executes just before Solar_App_GUI is made visible.
function Solar_App_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Solar_App_GUI (see VARARGIN)

% Choose default command line output for Solar_App_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Solar_App_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Solar_App_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in PB1.
function PB1_Callback(hObject, eventdata, handles)
% hObject    handle to PB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Solar_APP_Main_GUI;


% --- Executes on button press in PB2.
function PB2_Callback(hObject, eventdata, handles)
% hObject    handle to PB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening String/Inverter Sizing Window
Strin_Sizing

% --- Executes on button press in PB3.
function PB3_Callback(hObject, eventdata, handles)
% hObject    handle to PB3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Pv I-V & P-V Curve Generator Window
PV_IV_Curve_GUI

% --- Executes on button press in PB4.
function PB4_Callback(hObject, eventdata, handles)
% hObject    handle to PB4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Sun Path Diagram Application Window
Sun_Path_Diagram

% --- Executes on button press in PB5.
function PB5_Callback(hObject, eventdata, handles)
% hObject    handle to PB5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Clock Application Window
Solar_Local_Clock



% --- Executes on button press in PB6.
function PB6_Callback(hObject, eventdata, handles)
% hObject    handle to PB6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% To Close all open Application Windows

hf1=findobj('Name','Loss_Parameters');
close(hf1);
hf2=findobj('Name','Rainy_Snowy_Months');
close(hf2);
hf3=findobj('Name','Fixed_Tilt_Data');
close(hf3);
hf4=findobj('Name','Seasonal_Tilt_Data');
close(hf4);
hf5=findobj('Name','SingleAxis_EW_Data');
close(hf5);
hf6=findobj('Name','SingleAxis_NS_Data');
close(hf6);
hf7=findobj('Name','DoubleAxis_Data');
close(hf7);
hf8=findobj('Name','Solar_App_FinalReport_GUI');
close(hf8);
hf9=findobj('Name','ohmic_losses_figure');
close(hf9);
hf17=findobj('Name','Solar_App_FinalReport_GUI');
close(hf17);
hf10=findobj('Name','Solar_APP_Main_GUI');
close(hf10);
hf11=findobj('Name','Sun_Path_Diagram');
close(hf11);
hf12=findobj('Name','Strin_Sizing');
close(hf12);
hf13=findobj('Name','Solar_Local_Clock');
close(hf13);
hf14=findobj('Name','PV_IV_Curve_GUI');
close(hf14);
hf15=findobj('Name','Angstorm_figure');
close(hf15);
hf16=findobj('Name','Perez_Figure');
close(hf16);
hf17=findobj('Name','SolarFinancialModule_Inputs_GUI');
close(hf17);
hf18=findobj('Name','SolarFinancialModule_Results_GUI');
close(hf18);

close;


% --- Executes on button press in PB8.
function PB8_Callback(hObject, eventdata, handles)
% hObject    handle to PB8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Perez Model GUI
Perez_Figure ;

% --- Executes on button press in PB7.
function PB7_Callback(hObject, eventdata, handles)
% hObject    handle to PB7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Angstorm Model GUI
Angstrom_figure ;


% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Help File
winopen('SWEEFA-HelpFile.pdf');


% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Solar PV Financial Model GUI

SolarFinancialModule_Inputs_GUI;
