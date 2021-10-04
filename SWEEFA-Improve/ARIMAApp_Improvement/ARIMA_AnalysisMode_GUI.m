function varargout = ARIMA_AnalysisMode_GUI(varargin)
% ARIMA_ANALYSISMODE_GUI MATLAB code for ARIMA_AnalysisMode_GUI.fig
%      ARIMA_ANALYSISMODE_GUI, by itself, creates a new ARIMA_ANALYSISMODE_GUI or raises the existing
%      singleton*.
%
%      H = ARIMA_ANALYSISMODE_GUI returns the handle to a new ARIMA_ANALYSISMODE_GUI or the handle to
%      the existing singleton*.
%
%      ARIMA_ANALYSISMODE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARIMA_ANALYSISMODE_GUI.M with the given input arguments.
%
%      ARIMA_ANALYSISMODE_GUI('Property','Value',...) creates a new ARIMA_ANALYSISMODE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ARIMA_AnalysisMode_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ARIMA_AnalysisMode_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ARIMA_AnalysisMode_GUI

% Last Modified by GUIDE v2.5 23-May-2018 14:11:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ARIMA_AnalysisMode_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ARIMA_AnalysisMode_GUI_OutputFcn, ...
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


% --- Executes just before ARIMA_AnalysisMode_GUI is made visible.
function ARIMA_AnalysisMode_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ARIMA_AnalysisMode_GUI (see VARARGIN)

% Initializing the Current GUI Elements

% Step 1
set(handles.WindPlant,'Value',0);
set(handles.SolarPlant,'Value',0);
set(handles.PlantName,'String','');

% Step 2
set(handles.Res,'String','');

% Step 3
set(handles.TrainingDataSeries_Duration,'String','');
set(handles.ForecastedDataSeries_Duration,'String','');

% Step 4
set(handles.DetrendingLag_Convoluted,'Value',0);
set(handles.DetrendingLag_NonConvoluted,'Value',0);
set(handles.Single_LagNumber_Vector,'String','');
set(handles.Seasonal_LagNumber_Vector,'String','');

% Step 4
set(handles.ARIMA_ModelOrder_Convoluted,'Value',0);
set(handles.ARIMA_ModelOrder_NonConvoluted,'Value',0);
set(handles.AR_LagNumber_Vector,'String','');
set(handles.MA_LagNumber_Vector,'String','');

% Choose default command line output for ARIMA_AnalysisMode_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Creating Current GUI Workspace

setappdata(0,'ARIMA_AnalysiMode_GUI',gcf);

% UIWAIT makes ARIMA_AnalysisMode_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ARIMA_AnalysisMode_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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



function TrainingDataSeries_Duration_Callback(hObject, eventdata, handles)
% hObject    handle to TrainingDataSeries_Duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TrainingDataSeries_Duration as text
%        str2double(get(hObject,'String')) returns contents of TrainingDataSeries_Duration as a double


% --- Executes during object creation, after setting all properties.
function TrainingDataSeries_Duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TrainingDataSeries_Duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ForecastedDataSeries_Duration_Callback(hObject, eventdata, handles)
% hObject    handle to ForecastedDataSeries_Duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ForecastedDataSeries_Duration as text
%        str2double(get(hObject,'String')) returns contents of ForecastedDataSeries_Duration as a double


% --- Executes during object creation, after setting all properties.
function ForecastedDataSeries_Duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ForecastedDataSeries_Duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AR_LagNumber_Vector_Callback(hObject, eventdata, handles)
% hObject    handle to AR_LagNumber_Vector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AR_LagNumber_Vector as text
%        str2double(get(hObject,'String')) returns contents of AR_LagNumber_Vector as a double


% --- Executes during object creation, after setting all properties.
function AR_LagNumber_Vector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AR_LagNumber_Vector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MA_LagNumber_Vector_Callback(hObject, eventdata, handles)
% hObject    handle to MA_LagNumber_Vector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MA_LagNumber_Vector as text
%        str2double(get(hObject,'String')) returns contents of MA_LagNumber_Vector as a double


% --- Executes during object creation, after setting all properties.
function MA_LagNumber_Vector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MA_LagNumber_Vector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Single_LagNumber_Vector_Callback(hObject, eventdata, handles)
% hObject    handle to Single_LagNumber_Vector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Single_LagNumber_Vector as text
%        str2double(get(hObject,'String')) returns contents of Single_LagNumber_Vector as a double


% --- Executes during object creation, after setting all properties.
function Single_LagNumber_Vector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Single_LagNumber_Vector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Seasonal_LagNumber_Vector_Callback(hObject, eventdata, handles)
% hObject    handle to Seasonal_LagNumber_Vector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Seasonal_LagNumber_Vector as text
%        str2double(get(hObject,'String')) returns contents of Seasonal_LagNumber_Vector as a double


% --- Executes during object creation, after setting all properties.
function Seasonal_LagNumber_Vector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Seasonal_LagNumber_Vector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on button press in B2.
function B2_Callback(hObject, eventdata, handles)
% hObject    handle to B2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the Current GUI WorkSpace

ARIMA_AnalysisMode_GUI=getappdata(0,'ARIMA_AnalysisMode_GUI');

% Getting the Folder Path from the User to Store the ARIMA Analysis Files

ARIMA_AnalysisMode_FolderPath = uigetdir;

% Getting Step 1 Data

WindPlant=get(handles.WindPlant,'Value');
SolarPlant=get(handles.SolarPlant,'Value');

PlantName=get(handles.PlantName,'String');

% Getting Step 2 Data

Plant_HistoricalDataFile_Cell=getappdata(ARIMA_AnalysisMode_GUI,'Plant_HistoricalDataFile_Cell');

Res=get(handles.Res,'String');
Res=str2num(Res);

% Getting Step 3 Data

TrainingDataSeries_Duration=get(handles.TrainingDataSeries_Duration,'String'); 
TrainingDataSeries_Duration=strread(TrainingDataSeries_Duration,'%f','delimiter',',');
TrainingDataSeries_Duration=TrainingDataSeries_Duration'; 

ForecastedDataSeries_Duration=get(handles.ForecastedDataSeries_Duration,'String'); 
ForecastedDataSeries_Duration=strread(ForecastedDataSeries_Duration,'%f','delimiter',',');
ForecastedDataSeries_Duration=ForecastedDataSeries_Duration'; 

% Getting Step 4 Data

DetrendingLag_Convoluted=get(handles.DetrendingLag_Convoluted,'Value');
DetrendingLag_NonConvoluted=get(handles.DetrendingLag_NonConvoluted,'Value');

Single_LagNumber_Vector=get(handles.Single_LagNumber_Vector,'String'); 
Single_LagNumber_Vector=strread(Single_LagNumber_Vector,'%f','delimiter',',');
Single_LagNumber_Vector=Single_LagNumber_Vector'; 

Seasonal_LagNumber_Vector=get(handles.Seasonal_LagNumber_Vector,'String'); 
Seasonal_LagNumber_Vector=strread(Seasonal_LagNumber_Vector,'%f','delimiter',',');
Seasonal_LagNumber_Vector=Seasonal_LagNumber_Vector'; 

% Getting Step 5 Data

ARIMA_ModelOrder_Convoluted=get(handles.ARIMA_ModelOrder_Convoluted,'Value');
ARIMA_ModelOrder_NonConvoluted=get(handles.ARIMA_ModelOrder_NonConvoluted,'Value');

AR_LagNumber_Vector=get(handles.AR_LagNumber_Vector,'String'); 
AR_LagNumber_Vector=strread(AR_LagNumber_Vector,'%f','delimiter',',');
AR_LagNumber_Vector=AR_LagNumber_Vector'; 

MA_LagNumber_Vector=get(handles.MA_LagNumber_Vector,'String'); 
MA_LagNumber_Vector=strread(MA_LagNumber_Vector,'%f','delimiter',',');
MA_LagNumber_Vector=MA_LagNumber_Vector';  

% Creating a Cell Structure for holding all the Data

ARIMA_AnalysisMode_InputData_Cell={ARIMA_AnalysisMode_FolderPath,WindPlant,SolarPlant,PlantName,Plant_HistoricalDataFile_Cell,Res,TrainingDataSeries_Duration,ForecastedDataSeries_Duration,DetrendingLag_Convoluted,DetrendingLag_NonConvoluted,Single_LagNumber_Vector,Seasonal_LagNumber_Vector,ARIMA_ModelOrder_Convoluted,ARIMA_ModelOrder_NonConvoluted,AR_LagNumber_Vector,MA_LagNumber_Vector};

% Analyzing ARIMA Model Configurations using External Function

[ARIMA_AnalysisMode_Report_Cell]=ARIMA_AnalysisMode_AnalysisGenerator(ARIMA_AnalysisMode_InputData_Cell);

% --- Executes on button press in B3.
function B3_Callback(hObject, eventdata, handles)
% hObject    handle to B3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting the Current GUI Elements

% Step 1
set(handles.WindPlant,'Value',0);
set(handles.SolarPlant,'Value',0);
set(handles.PlantName,'String','');

% Step 2
set(handles.Res,'String','');

% Step 3
set(handles.TrainingDataSeries_Duration,'String','');
set(handles.ForecastedDataSeries_Duration,'String','');

% Step 4
set(handles.DetrendingLag_Convoluted,'Value',0);
set(handles.DetrendingLag_NonConvoluted,'Value',0);
set(handles.Single_LagNumber_Vector,'String','');
set(handles.Seasonal_LagNumber_Vector,'String','');

% Step 4
set(handles.ARIMA_ModelOrder_Convoluted,'Value',0);
set(handles.ARIMA_ModelOrder_NonConvoluted,'Value',0);
set(handles.AR_LagNumber_Vector,'String','');
set(handles.MA_LagNumber_Vector,'String','');

% --- Executes on button press in B4.
function B4_Callback(hObject, eventdata, handles)
% hObject    handle to B4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing the Current GUI

close;


% --- Executes on button press in B1.
function B1_Callback(hObject, eventdata, handles)
% hObject    handle to B1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the Current GUI WorkSpace

ARIMA_AnalysisMode_GUI=getappdata(0,'ARIMA_AnalysisMode_GUI');

% Getting Radio Button Values

WindPlant=get(handles.WindPlant,'Value');
SolarPlant=get(handles.SolarPlant,'Value');

% Getting the Historical Plant Data File

if (WindPlant==1) % Wind Plant is Selected
    
    [Filename,Pathname]=uigetfile({'*.*'},'Wind Plant Historical Data File Selector');
    
elseif (SolarPlant==1) % Solar Plant is Selected
    
    [Filename,Pathname]=uigetfile({'*.*'},'Solar Plant Historical Data File Selector');
    
end

Fullpathname=strcat(Pathname,Filename);

[~,sheets] = xlsfinfo(Fullpathname);

DataFile_Cell_Len=sheets;

for i=1:DataFile_Cell_Len

   [~ ,~,DataFile1]=xlsread(Fullpathname,i); 

   Plant_HistoricalDataFile_Cell(1,i)={DataFile1};

end

% Setting the Historical Plant Data File in the Current GUI WorkSpace

setappdata(ARIMA_AnalysisMode_GUI,'Plant_HistoricalDataFile_Cell',Plant_HistoricalDataFile_Cell);
