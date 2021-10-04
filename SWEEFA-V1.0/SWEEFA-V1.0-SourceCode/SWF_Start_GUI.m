function varargout = SWF_Start_GUI(varargin)
% SWF_START_GUI MATLAB code for SWF_Start_GUI.fig
%      SWF_START_GUI, by itself, creates a new SWF_START_GUI or raises the existing
%      singleton*.
%
%      H = SWF_START_GUI returns the handle to a new SWF_START_GUI or the handle to
%      the existing singleton*.
%
%      SWF_START_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SWF_START_GUI.M with the given input arguments.
%
%      SWF_START_GUI('Property','Value',...) creates a new SWF_START_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SWF_Start_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SWF_Start_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SWF_Start_GUI

% Last Modified by GUIDE v2.5 15-Nov-2016 19:04:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SWF_Start_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SWF_Start_GUI_OutputFcn, ...
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


% --- Executes just before SWF_Start_GUI is made visible.
function SWF_Start_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SWF_Start_GUI (see VARARGIN)

% Choose default command line output for SWF_Start_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SWF_Start_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SWF_Start_GUI_OutputFcn(hObject, eventdata, handles) 
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

% Closing Solar Energy Application Windows

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
hf38=findobj('Name','SolarFinancialModule_Inputs_GUI');
close(hf38);
hf39=findobj('Name','SolarFinancialModule_Results_GUI');
close(hf39);
hf18=findobj('Name','Solar_App_GUI');
close(hf18);

% Closing Wind Energy Application Windows

hf19=findobj('Name','Wake_Model_GUI');
close(hf19);
hf20=findobj('Name','Wind_Loss_Parameters_GUI');
close(hf20);
hf21=findobj('Name','Wind_WeibullDistribution_GUI');
close(hf21);
hf22=findobj('Name','Wind_Power_Curve_Graph_GUI');
close(hf22);
hf23=findobj('Name','Wind_GUI_MainPage');
close(hf23);
hf24=findobj('Name','Wind_GUI_1');
close(hf24);
hf25=findobj('Name','Cp_Curve_Generator_GUI');
close(hf25);

hf38=findobj('Name','Wind_App_GUI');
close(hf38);

% Closing Forecasting Application Windows

% Closing ANN Forecasting Application GUI

hf26=findobj('Name','ANN_Performance_Plots');
close(hf26);
hf27=findobj('Name','ANN_Forecasting_GUI_1');
close(hf27);

% close(1);
% close(2);
% close(3);
% close(4);

% Closing ARIMA Forecasting Application GUI

hf28=findobj('Name','ARIMA_ModelForecast_GUI');
close(hf28);
hf29=findobj('Name','ARIMA_ModelEstimateViewer_GUI');
close(hf29);
hf30=findobj('Name','ARIMA_ModelEstimation_GUI');
close(hf30);
hf31=findobj('Name','ARIMA_ModelSimulation_GUI');
close(hf31);
hf32=findobj('Name','ARIMA_ModelCreation_GUI');
close(hf32);
hf33=findobj('Name','ARIMA_ModelIdentification_GUI');
close(hf33);
hf34=findobj('Name','ARIMA_DataAcquisition_GUI');
close(hf34);


% Closing NETCDF-WRF Forecasting Application GUI

hf35=findobj('Name','NETCDF_TEST_GUI');
close(hf35);

% Closing Forecasting App Start GUI

hf37=findobj('Name','Forecasting_App_GUI');
close(hf37);

% Closing NETCDF-WRF Forecasting Application GUI

hf36=findobj('Name','Data_PreProcSys_GUI');
close(hf36);
hf36=findobj('Name','PlantInfo_GUI');
close(hf36);

% Closing Window
close ; 

% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Forecasting Application Start GUI
Forecasting_App_GUI

% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Wind Eenrgy Application Start GUI
Wind_App_GUI ;

% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Solar Eenrgy Application Start GUI
Solar_App_GUI ;


% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Data Pre processing Application Window

Data_PreProcSys_GUI ;


% --- Executes on button press in b6.
function b6_Callback(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Help File
winopen('SWEEFA-HelpFile.pdf');
