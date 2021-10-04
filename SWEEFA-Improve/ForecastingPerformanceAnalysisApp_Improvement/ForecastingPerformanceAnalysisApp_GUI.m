function varargout = ForecastingPerformanceAnalysisApp_GUI(varargin)
% FORECASTINGPERFORMANCEANALYSISAPP_GUI MATLAB code for ForecastingPerformanceAnalysisApp_GUI.fig
%      FORECASTINGPERFORMANCEANALYSISAPP_GUI, by itself, creates a new FORECASTINGPERFORMANCEANALYSISAPP_GUI or raises the existing
%      singleton*.
%
%      H = FORECASTINGPERFORMANCEANALYSISAPP_GUI returns the handle to a new FORECASTINGPERFORMANCEANALYSISAPP_GUI or the handle to
%      the existing singleton*.
%
%      FORECASTINGPERFORMANCEANALYSISAPP_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORECASTINGPERFORMANCEANALYSISAPP_GUI.M with the given input arguments.
%
%      FORECASTINGPERFORMANCEANALYSISAPP_GUI('Property','Value',...) creates a new FORECASTINGPERFORMANCEANALYSISAPP_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ForecastingPerformanceAnalysisApp_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ForecastingPerformanceAnalysisApp_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ForecastingPerformanceAnalysisApp_GUI

% Last Modified by GUIDE v2.5 25-Apr-2018 11:26:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ForecastingPerformanceAnalysisApp_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ForecastingPerformanceAnalysisApp_GUI_OutputFcn, ...
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


% --- Executes just before ForecastingPerformanceAnalysisApp_GUI is made visible.
function ForecastingPerformanceAnalysisApp_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ForecastingPerformanceAnalysisApp_GUI (see VARARGIN)

% Choose default command line output for ForecastingPerformanceAnalysisApp_GUI
handles.output = hObject;

% Initializing the Current GUI

% Step 1:
set(handles.WindPlant,'Value',1);
set(handles.SolarPlant,'Value',0);

% Step 2:
set(handles.ForecastFiles_Num,'String','');
set(handles.ForecastFiles_Num,'Enable','on');

% Step 3:
set(handles.ForecastFile_B,'Enable','on');
set(handles.ActualFile_B,'Enable','on');

% Step 4:
set(handles.ForecastFile_Names,'String','');
set(handles.ForecastFile_Names,'Enable','on');

set(handles.FileColumnStructure,'String','');
set(handles.FileColumnStructure,'Enable','on');

set(handles.PlantCapacity,'String','');
set(handles.PlantCapacity,'Enable','on');

set(handles.Res,'String','');
set(handles.Res,'Enable','on');

set(handles.Process_B1,'Enable','on');

% Step 5:

set(handles.SelectFile_Popup,'Enable','off');
SelectFile_Popup_String={'Select File'};
set(handles.SelectFile_Popup,'String',SelectFile_Popup_String);

set(handles.SelectSheet_Popup,'Enable','off');
SelectSheet_Popup_String={'Select Sheet'};
set(handles.SelectSheet_Popup,'String',SelectSheet_Popup_String);

set(handles.StartYear,'String','');
set(handles.StartYear,'Enable','off');

set(handles.EndYear,'String','');
set(handles.EndYear,'Enable','off');

set(handles.StartMonth,'String','');
set(handles.StartMonth,'Enable','off');

set(handles.EndMonth,'String','');
set(handles.EndMonth,'Enable','off');

set(handles.StartDay,'String','');
set(handles.StartDay,'Enable','off');

set(handles.EndDay,'String','');
set(handles.EndDay,'Enable','off');

set(handles.Process_B2,'Enable','off');

set(handles.SelectYear_Popup,'Enable','off');
SelectYear_Popup_String={'Select Year'};
set(handles.SelectYear_Popup,'String',SelectYear_Popup_String);

set(handles.SelectMonth_Popup,'Enable','off');
SelectMonth_Popup_String={'Select Month'};
set(handles.SelectMonth_Popup,'String',SelectMonth_Popup_String);

set(handles.SelectDay_Popup,'Enable','off');
SelectDay_Popup_String={'Select Day'};
set(handles.SelectDay_Popup,'String',SelectDay_Popup_String);

set(handles.SelectVariablePair_Popup,'Enable','off');
SelectVariablePair_Popup_String={'Select Variable-Pair'};
set(handles.SelectVariablePair_Popup,'String',SelectVariablePair_Popup_String);

set(handles.Process_B3,'Enable','off');

% Step 6:

axes(handles.ComparisonGraph);
cla reset;

set(handles.Plot_B,'Enable','off');
set(handles.Next_B,'Enable','off');
set(handles.Previous_B,'Enable','off');

set(handles.MAE_Gui,'String','');
set(handles.MAE_Gui,'Enable','off');

set(handles.MSE_Gui,'String','');
set(handles.MSE_Gui,'Enable','off');

set(handles.RMSE_Gui,'String','');
set(handles.RMSE_Gui,'Enable','off');

% Final Step

set(handles.CreateReport_B,'Enable','on');
set(handles.Reset_B,'Enable','on');
set(handles.Close_B,'Enable','on');

% Initializing the Global Button Indicator (Next, Previous)



% Update handles structure
guidata(hObject, handles);

% Creating Workspace for Current GUI
setappdata(0,'ForecastingPerformanceAnalysisApp_GUI',gcf);

% UIWAIT makes ForecastingPerformanceAnalysisApp_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ForecastingPerformanceAnalysisApp_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function MAE_Gui_Callback(hObject, eventdata, handles)
% hObject    handle to MAE_Gui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MAE_Gui as text
%        str2double(get(hObject,'String')) returns contents of MAE_Gui as a double


% --- Executes during object creation, after setting all properties.
function MAE_Gui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MAE_Gui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MSE_Gui_Callback(hObject, eventdata, handles)
% hObject    handle to MSE_Gui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MSE_Gui as text
%        str2double(get(hObject,'String')) returns contents of MSE_Gui as a double


% --- Executes during object creation, after setting all properties.
function MSE_Gui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MSE_Gui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RMSE_Gui_Callback(hObject, eventdata, handles)
% hObject    handle to RMSE_Gui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RMSE_Gui as text
%        str2double(get(hObject,'String')) returns contents of RMSE_Gui as a double


% --- Executes during object creation, after setting all properties.
function RMSE_Gui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RMSE_Gui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ForecastFiles_Num_Callback(hObject, eventdata, handles)
% hObject    handle to ForecastFiles_Num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ForecastFiles_Num as text
%        str2double(get(hObject,'String')) returns contents of ForecastFiles_Num as a double


% --- Executes during object creation, after setting all properties.
function ForecastFiles_Num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ForecastFiles_Num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ActualFile_B.
function ActualFile_B_Callback(hObject, eventdata, handles)
% hObject    handle to ActualFile_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI WorkSpace

ForecastingPerformanceAnalysisApp_GUI=getappdata(0,'ForecastingPerformanceAnalysisApp_GUI');

% Get the Actual File

[Filename,Pathname]=uigetfile({'*.*'},'Actual Plant Data File Selector');

Fullpathname=strcat(Pathname,Filename);

[~,sheets] = xlsfinfo(Fullpathname);

DataFile_Cell_Len=sheets;

for i=1:DataFile_Cell_Len

   [~ ,~,DataFile1]=xlsread(Fullpathname,i); 

   ActualDataFile_Cell(1,i)={DataFile1};

end

% Putting the ActualDataFile_Cell in Current GUI WorkSpace

setappdata(ForecastingPerformanceAnalysisApp_GUI,'ActualDataFile_Cell',ActualDataFile_Cell);


% --- Executes on button press in ForecastFile_B.
function ForecastFile_B_Callback(hObject, eventdata, handles)
% hObject    handle to ForecastFile_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI WorkSpace

ForecastingPerformanceAnalysisApp_GUI=getappdata(0,'ForecastingPerformanceAnalysisApp_GUI');

% Getting Number of Forecast File from the User

ForecastFiles_Num=get(handles.ForecastFiles_Num,'String');
ForecastFiles_Num=str2num(ForecastFiles_Num);

% Getting Multiple Forecast Files

for j=1:ForecastFiles_Num

    % Get the Single Forecast File/Files

    [Filename,Pathname]=uigetfile({'*.*'},'Forecast Plant Data File Selector');

    Fullpathname=strcat(Pathname,Filename);

    [~,sheets] = xlsfinfo(Fullpathname);

    DataFile_Cell_Len=sheets;

    for i=1:DataFile_Cell_Len

       [~ ,~,DataFile1]=xlsread(Fullpathname,i); 

       ForecastDataSingleFile_Cell(1,i)={DataFile1};

    end
    
    % Putting ForecastDataSingleFile_Cell into ForecastDataMultiFile_Cell
    
    ForecastDataMultiFile_Cell(1,j)={ForecastDataSingleFile_Cell};
    
end

% Putting the ActualDataFile_Cell in Current GUI WorkSpace

setappdata(ForecastingPerformanceAnalysisApp_GUI,'ForecastDataMultiFile_Cell',ForecastDataMultiFile_Cell);


% --- Executes on button press in CreateReport_B.
function CreateReport_B_Callback(hObject, eventdata, handles)
% hObject    handle to CreateReport_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI WorkSpace

ForecastingPerformanceAnalysisApp_GUI=getappdata(0,'ForecastingPerformanceAnalysisApp_GUI');


% Getting Relevant Variables from the current GUI WorkSpace

PerformanceAnalysis_Database=getappdata(ForecastingPerformanceAnalysisApp_GUI,'PerformanceAnalysis_Database');
PerformanceAnalysis_StdErrors=getappdata(ForecastingPerformanceAnalysisApp_GUI,'PerformanceAnalysis_StdErrors');
PerformanceAnalysis_Database_Header=getappdata(ForecastingPerformanceAnalysisApp_GUI,'PerformanceAnalysis_Database_Header');
PerformanceAnalysis_StdErrors_HeaderHorz=getappdata(ForecastingPerformanceAnalysisApp_GUI,'PerformanceAnalysis_StdErrors_HeaderHorz');
PerformanceAnalysis_StdErrors_HeaderVert=getappdata(ForecastingPerformanceAnalysisApp_GUI,'PerformanceAnalysis_StdErrors_HeaderVert');
ForecastFile_Names=getappdata(ForecastingPerformanceAnalysisApp_GUI,'ForecastFile_Names');

% Creating Excel Report based on the output from Process_B1

% PerformanceAnalysisDatabase Report Generation
for i=1:length(PerformanceAnalysis_Database) % For Each File
    
    PerformanceAnalysis_Database_File=PerformanceAnalysis_Database{1,i};
    
    filename = ['PerformanceAnalysisDatabase_' ForecastFile_Names{1,i} '_File.xlsx'];
    
    for j=1:length(PerformanceAnalysis_Database_File) % For Each Sheet
        
        PerformanceAnalysis_Database_Sheet=PerformanceAnalysis_Database_File{1,j};
        
        sheet = j;

        xlRange1 = 'A1';

        xlswrite(filename,PerformanceAnalysis_Database_Header,sheet,xlRange1);           

        xlRange2 = 'A2';

        xlswrite(filename,PerformanceAnalysis_Database_Sheet,sheet,xlRange2); 
        
    end
    
end

% PerformanceAnalysisStdErrors Report Generation
for i=1:length(PerformanceAnalysis_StdErrors) % For Each File
    
    PerformanceAnalysis_StdErrors_File=PerformanceAnalysis_StdErrors{1,i};
    
    filename = ['PerformanceAnalysis_StdErrors_' ForecastFile_Names{1,i} '_File.xlsx'];
    
    for j=1:length(PerformanceAnalysis_StdErrors_File) % For Each Sheet
        
        PerformanceAnalysis_StdErrors_Sheet=PerformanceAnalysis_StdErrors_File{1,j};
        
        sheet = j;
        
        xlRange1 = 'B1';

        xlswrite(filename,PerformanceAnalysis_StdErrors_HeaderHorz,sheet,xlRange1);          

        xlRange2 = 'A2';

        xlswrite(filename,PerformanceAnalysis_StdErrors_HeaderVert,sheet,xlRange2);           

        xlRange3 = 'B2';

        xlswrite(filename,PerformanceAnalysis_StdErrors_Sheet,sheet,xlRange3); 
        
    end
    
end


% --- Executes on button press in Reset_B.
function Reset_B_Callback(hObject, eventdata, handles)
% hObject    handle to Reset_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting the Current GUI

% Step 1:
set(handles.WindPlant,'Value',1);
set(handles.SolarPlant,'Value',0);

% Step 2:
set(handles.ForecastFiles_Num,'String','');
set(handles.ForecastFiles_Num,'Enable','on');

% Step 3:
set(handles.ForecastFile_B,'Enable','on');
set(handles.ActualFile_B,'Enable','on');

% Step 4:
set(handles.ForecastFile_Names,'String','');
set(handles.ForecastFile_Names,'Enable','on');

set(handles.FileColumnStructure,'String','');
set(handles.FileColumnStructure,'Enable','on');

set(handles.PlantCapacity,'String','');
set(handles.PlantCapacity,'Enable','on');

set(handles.Res,'String','');
set(handles.Res,'Enable','on');

set(handles.Process_B1,'Enable','on');

% Step 5:

set(handles.SelectFile_Popup,'Enable','off');
SelectFile_Popup_String={'Select File'};
set(handles.SelectFile_Popup,'String',SelectFile_Popup_String);

set(handles.SelectSheet_Popup,'Enable','off');
SelectSheet_Popup_String={'Select Sheet'};
set(handles.SelectSheet_Popup,'String',SelectSheet_Popup_String);

set(handles.StartYear,'String','');
set(handles.StartYear,'Enable','off');

set(handles.EndYear,'String','');
set(handles.EndYear,'Enable','off');

set(handles.StartMonth,'String','');
set(handles.StartMonth,'Enable','off');

set(handles.EndMonth,'String','');
set(handles.EndMonth,'Enable','off');

set(handles.StartDay,'String','');
set(handles.StartDay,'Enable','off');

set(handles.EndDay,'String','');
set(handles.EndDay,'Enable','off');

set(handles.Process_B2,'Enable','off');

set(handles.SelectYear_Popup,'Enable','off');
SelectYear_Popup_String={'Select Year'};
set(handles.SelectYear_Popup,'String',SelectYear_Popup_String);

set(handles.SelectMonth_Popup,'Enable','off');
SelectMonth_Popup_String={'Select Month'};
set(handles.SelectMonth_Popup,'String',SelectMonth_Popup_String);

set(handles.SelectDay_Popup,'Enable','off');
SelectDay_Popup_String={'Select Day'};
set(handles.SelectDay_Popup,'String',SelectDay_Popup_String);

set(handles.SelectVariablePair_Popup,'Enable','off');
SelectVariablePair_Popup_String={'Select Variable-Pair'};
set(handles.SelectVariablePair_Popup,'String',SelectVariablePair_Popup_String);

set(handles.Process_B3,'Enable','off');

% Step 6:

axes(handles.ComparisonGraph);
cla reset;

set(handles.Plot_B,'Enable','off');
set(handles.Next_B,'Enable','off');
set(handles.Previous_B,'Enable','off');

set(handles.MAE_Gui,'String','');
set(handles.MAE_Gui,'Enable','off');

set(handles.MSE_Gui,'String','');
set(handles.MSE_Gui,'Enable','off');

set(handles.RMSE_Gui,'String','');
set(handles.RMSE_Gui,'Enable','off');

% Final Step

set(handles.CreateReport_B,'Enable','on');
set(handles.Reset_B,'Enable','on');
set(handles.Close_B,'Enable','on');

% --- Executes on button press in Close_B.
function Close_B_Callback(hObject, eventdata, handles)
% hObject    handle to Close_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing the Current GUI

close;


function ForecastFile_Names_Callback(hObject, eventdata, handles)
% hObject    handle to ForecastFile_Names (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ForecastFile_Names as text
%        str2double(get(hObject,'String')) returns contents of ForecastFile_Names as a double


% --- Executes during object creation, after setting all properties.
function ForecastFile_Names_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ForecastFile_Names (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PlantCapacity_Callback(hObject, eventdata, handles)
% hObject    handle to PlantCapacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PlantCapacity as text
%        str2double(get(hObject,'String')) returns contents of PlantCapacity as a double


% --- Executes during object creation, after setting all properties.
function PlantCapacity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PlantCapacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FileColumnStructure_Callback(hObject, eventdata, handles)
% hObject    handle to FileColumnStructure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FileColumnStructure as text
%        str2double(get(hObject,'String')) returns contents of FileColumnStructure as a double


% --- Executes during object creation, after setting all properties.
function FileColumnStructure_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FileColumnStructure (see GCBO)
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


% --- Executes on button press in Process_B1.
function Process_B1_Callback(hObject, eventdata, handles)
% hObject    handle to Process_B1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI WorkSpace

ForecastingPerformanceAnalysisApp_GUI=getappdata(0,'ForecastingPerformanceAnalysisApp_GUI');

% Getting User Data from Step 4

ForecastFile_Names=get(handles.ForecastFile_Names,'String');
ForecastFile_Names=strread(ForecastFile_Names,'%s','delimiter',',');
ForecastFile_Names=ForecastFile_Names';

FileColumnStructure=get(handles.FileColumnStructure,'String');
FileColumnStructure=strread(FileColumnStructure,'%s','delimiter',';');
FileColumnStructure=FileColumnStructure';

for i=1:2
   
    FileColumnStructure1=strread(FileColumnStructure{1,i},'%f','delimiter',',');
    FileColumnStructure1=FileColumnStructure1';
    
    FileColumnStructure_Cell(1,i)={FileColumnStructure1};
    
end

% Setting-Up FileColumnStructure_Cell in the Current GUI WorkSpace

setappdata(ForecastingPerformanceAnalysisApp_GUI,'FileColumnStructure_Cell',FileColumnStructure_Cell);

PlantCapacity=get(handles.PlantCapacity,'String');
PlantCapacity=str2num(PlantCapacity);

Res=get(handles.Res,'String');
Res=str2num(Res);

% Getting Forecast and Actual File Data from Current GUI WorkSpace

ActualDataFile_Cell=getappdata(ForecastingPerformanceAnalysisApp_GUI,'ActualDataFile_Cell');

ForecastDataMultiFile_Cell=getappdata(ForecastingPerformanceAnalysisApp_GUI,'ForecastDataMultiFile_Cell');

% Creating Strings for SelectFile and SelectSheet PopUp

SelectFile_PopUp_String=['Select File',ForecastFile_Names];

SelectSheet_PopUp_String=cell(1,length(ForecastDataMultiFile_Cell));

for i=1:length(ForecastDataMultiFile_Cell)
    
    ForecastSingleFile_Cell=ForecastDataMultiFile_Cell{1,i};
    
    Len_ForecastSingleFile_Cell=length(ForecastSingleFile_Cell);
    
    Counter=0; % Initializing
    
    SelectSheet_PopUp_String1={}; % Initializing
    
    for j=1:Len_ForecastSingleFile_Cell
        
        Counter=Counter+1;
        
        Counter1 = Counter;
        
        SelectSheet_PopUp_String1(1,j)={num2str(Counter1)};
        
    end
    
     SelectSheet_PopUp_String(1,i)={['Select Sheet',SelectSheet_PopUp_String1]};
    
end

% Putting the SelectSheet_PopUp_String in Current GUI WorkSpace

setappdata(ForecastingPerformanceAnalysisApp_GUI,'SelectSheet_PopUp_String',SelectSheet_PopUp_String);

% Creating the Complete Forecasting Performance Analysis DataBase using External Function

[PerformanceAnalysis_Database,PerformanceAnalysis_StdErrors,PerformanceAnalysis_Database_Header,PerformanceAnalysis_StdErrors_HeaderHorz,PerformanceAnalysis_StdErrors_HeaderVert] = ForecastPerformanceAnalysis_DataBaseGenerator(ActualDataFile_Cell,ForecastDataMultiFile_Cell,FileColumnStructure_Cell,PlantCapacity,Res);

% Setting the Output of the above Function into the WorkSpace of the Current GUI

setappdata(ForecastingPerformanceAnalysisApp_GUI,'PerformanceAnalysis_Database',PerformanceAnalysis_Database);
setappdata(ForecastingPerformanceAnalysisApp_GUI,'PerformanceAnalysis_StdErrors',PerformanceAnalysis_StdErrors);
setappdata(ForecastingPerformanceAnalysisApp_GUI,'PerformanceAnalysis_Database_Header',PerformanceAnalysis_Database_Header);
setappdata(ForecastingPerformanceAnalysisApp_GUI,'PerformanceAnalysis_StdErrors_HeaderHorz',PerformanceAnalysis_StdErrors_HeaderHorz);
setappdata(ForecastingPerformanceAnalysisApp_GUI,'PerformanceAnalysis_StdErrors_HeaderVert',PerformanceAnalysis_StdErrors_HeaderVert);
setappdata(ForecastingPerformanceAnalysisApp_GUI,'ForecastFile_Names',ForecastFile_Names);

% Process the Forecast File Names and Update String of SelectForecastFile_Popup

set(handles.SelectFile_Popup,'String',SelectFile_PopUp_String);

% Enable GUI Elements in Step 5.1 and 5.2

set(handles.SelectFile_Popup,'Enable','on');

set(handles.SelectSheet_Popup,'Enable','on');


function StartDay_Callback(hObject, eventdata, handles)
% hObject    handle to StartDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StartDay as text
%        str2double(get(hObject,'String')) returns contents of StartDay as a double


% --- Executes during object creation, after setting all properties.
function StartDay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EndDay_Callback(hObject, eventdata, handles)
% hObject    handle to EndDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EndDay as text
%        str2double(get(hObject,'String')) returns contents of EndDay as a double


% --- Executes during object creation, after setting all properties.
function EndDay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EndDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EndMonth_Callback(hObject, eventdata, handles)
% hObject    handle to EndMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EndMonth as text
%        str2double(get(hObject,'String')) returns contents of EndMonth as a double


% --- Executes during object creation, after setting all properties.
function EndMonth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EndMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EndYear_Callback(hObject, eventdata, handles)
% hObject    handle to EndYear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EndYear as text
%        str2double(get(hObject,'String')) returns contents of EndYear as a double


% --- Executes during object creation, after setting all properties.
function EndYear_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EndYear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function StartMonth_Callback(hObject, eventdata, handles)
% hObject    handle to StartMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StartMonth as text
%        str2double(get(hObject,'String')) returns contents of StartMonth as a double


% --- Executes during object creation, after setting all properties.
function StartMonth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function StartYear_Callback(hObject, eventdata, handles)
% hObject    handle to StartYear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StartYear as text
%        str2double(get(hObject,'String')) returns contents of StartYear as a double


% --- Executes during object creation, after setting all properties.
function StartYear_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartYear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in SelectSheet_Popup.
function SelectSheet_Popup_Callback(hObject, eventdata, handles)
% hObject    handle to SelectSheet_Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SelectSheet_Popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SelectSheet_Popup

% Getting the Value of the Current Popup
SelectSheet_Popup_Value=get(handles.SelectSheet_Popup,'Value');

% Changing GUI behaviour according to the above Value
if (SelectSheet_Popup_Value==1) % Turn Off Enable of all other Step 5 Elements except the primary Popups
    
    set(handles.StartYear,'String','');
    set(handles.StartYear,'Enable','off');

    set(handles.EndYear,'String','');
    set(handles.EndYear,'Enable','off');

    set(handles.StartMonth,'String','');
    set(handles.StartMonth,'Enable','off');

    set(handles.EndMonth,'String','');
    set(handles.EndMonth,'Enable','off');

    set(handles.StartDay,'String','');
    set(handles.StartDay,'Enable','off');

    set(handles.EndDay,'String','');
    set(handles.EndDay,'Enable','off');

    set(handles.Process_B2,'Enable','off');

    set(handles.SelectYear_Popup,'Enable','off');
    SelectYear_Popup_String={'Select Year'};
    set(handles.SelectYear_Popup,'String',SelectYear_Popup_String);

    set(handles.SelectMonth_Popup,'Enable','off');
    SelectMonth_Popup_String={'Select Month'};
    set(handles.SelectMonth_Popup,'String',SelectMonth_Popup_String);

    set(handles.SelectDay_Popup,'Enable','off');
    SelectDay_Popup_String={'Select Day'};
    set(handles.SelectDay_Popup,'String',SelectDay_Popup_String);

    set(handles.SelectVariablePair_Popup,'Enable','off');
    SelectVariablePair_Popup_String={'Select Variable-Pair'};
    set(handles.SelectVariablePair_Popup,'String',SelectVariablePair_Popup_String);

    set(handles.Process_B3,'Enable','off');    
    
elseif (SelectSheet_Popup_Value~=1) % Enable Process_B2
    
    % Enable Process_B2
    
    set(handles.Process_B2,'Enable','on');
    
end


% --- Executes during object creation, after setting all properties.
function SelectSheet_Popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SelectSheet_Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in SelectFile_Popup.
function SelectFile_Popup_Callback(hObject, eventdata, handles)
% hObject    handle to SelectFile_Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SelectFile_Popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SelectFile_Popup

% Getting Current GUI WorkSpace

ForecastingPerformanceAnalysisApp_GUI=getappdata(0,'ForecastingPerformanceAnalysisApp_GUI');

% Getting the Current Popup Value
SelectFile_Popup_Value=get(handles.SelectFile_Popup,'Value');

% Changing GUI Behaviour according to the above Value
if (SelectFile_Popup_Value==1) % Turn Off the Enable of all Step 5
    
    set(handles.SelectSheet_Popup,'Enable','off');
    SelectSheet_Popup_String={'Select Sheet'};
    set(handles.SelectSheet_Popup,'String',SelectSheet_Popup_String);

    set(handles.StartYear,'String','');
    set(handles.StartYear,'Enable','off');

    set(handles.EndYear,'String','');
    set(handles.EndYear,'Enable','off');

    set(handles.StartMonth,'String','');
    set(handles.StartMonth,'Enable','off');

    set(handles.EndMonth,'String','');
    set(handles.EndMonth,'Enable','off');

    set(handles.StartDay,'String','');
    set(handles.StartDay,'Enable','off');

    set(handles.EndDay,'String','');
    set(handles.EndDay,'Enable','off');

    set(handles.Process_B2,'Enable','off');

    set(handles.SelectYear_Popup,'Enable','off');
    SelectYear_Popup_String={'Select Year'};
    set(handles.SelectYear_Popup,'String',SelectYear_Popup_String);

    set(handles.SelectMonth_Popup,'Enable','off');
    SelectMonth_Popup_String={'Select Month'};
    set(handles.SelectMonth_Popup,'String',SelectMonth_Popup_String);

    set(handles.SelectDay_Popup,'Enable','off');
    SelectDay_Popup_String={'Select Day'};
    set(handles.SelectDay_Popup,'String',SelectDay_Popup_String);

    set(handles.SelectVariablePair_Popup,'Enable','off');
    SelectVariablePair_Popup_String={'Select Variable-Pair'};
    set(handles.SelectVariablePair_Popup,'String',SelectVariablePair_Popup_String);

    set(handles.Process_B3,'Enable','off');    
    
elseif (SelectFile_Popup_Value~=1) % Turn On Enable of the other Popup and add appropriate Values to it
    
    % Get the String For SelectSheet_Popup
    
    SelectSheet_PopUp_String=getappdata(ForecastingPerformanceAnalysisApp_GUI,'SelectSheet_PopUp_String');
        
    % Getting the Correct SelectSheet_PopUp_String according to SelectFile_Popup_Value
    
    SelectSheet_PopUp_String1=SelectSheet_PopUp_String{1,(SelectFile_Popup_Value-1)};
    
    % Assign above string to SelectSheet_Popup
    
    set(handles.SelectSheet_Popup,'String',SelectSheet_PopUp_String1);
    
    % Enable SelectSheet_Popup
    
    set(handles.SelectSheet_Popup,'Enable','on');
    
    set(handles.Process_B2,'Enable','on');
    
    % 
    
    set(handles.SelectSheet_Popup,'Enable','off');
    SelectSheet_Popup_String={'Select Sheet'};
    set(handles.SelectSheet_Popup,'String',SelectSheet_Popup_String);

    set(handles.StartYear,'String','');
    set(handles.StartYear,'Enable','off');

    set(handles.EndYear,'String','');
    set(handles.EndYear,'Enable','off');

    set(handles.StartMonth,'String','');
    set(handles.StartMonth,'Enable','off');

    set(handles.EndMonth,'String','');
    set(handles.EndMonth,'Enable','off');

    set(handles.StartDay,'String','');
    set(handles.StartDay,'Enable','off');

    set(handles.EndDay,'String','');
    set(handles.EndDay,'Enable','off');

    set(handles.Process_B2,'Enable','on');

    set(handles.SelectYear_Popup,'Enable','off');
    SelectYear_Popup_String={'Select Year'};
    set(handles.SelectYear_Popup,'String',SelectYear_Popup_String);

    set(handles.SelectMonth_Popup,'Enable','off');
    SelectMonth_Popup_String={'Select Month'};
    set(handles.SelectMonth_Popup,'String',SelectMonth_Popup_String);

    set(handles.SelectDay_Popup,'Enable','off');
    SelectDay_Popup_String={'Select Day'};
    set(handles.SelectDay_Popup,'String',SelectDay_Popup_String);

    set(handles.SelectVariablePair_Popup,'Enable','off');
    SelectVariablePair_Popup_String={'Select Variable-Pair'};
    set(handles.SelectVariablePair_Popup,'String',SelectVariablePair_Popup_String);

    set(handles.Process_B3,'Enable','off');     
    
end


% --- Executes during object creation, after setting all properties.
function SelectFile_Popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SelectFile_Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in SelectVariablePair_Popup.
function SelectVariablePair_Popup_Callback(hObject, eventdata, handles)
% hObject    handle to SelectVariablePair_Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SelectVariablePair_Popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SelectVariablePair_Popup

% Getting Current GUI WorkSpace

ForecastingPerformanceAnalysisApp_GUI=getappdata(0,'ForecastingPerformanceAnalysisApp_GUI');

% Getting Step 5.3 Popup Values

SelectYear_Popup_Value=get(handles.SelectYear_Popup,'Value');
SelectMonth_Popup_Value=get(handles.SelectYear_Popup,'Value');
SelectDay_Popup_Value=get(handles.SelectYear_Popup,'Value');

% Changing GUI behaviour according to Popup Values

if (SelectDay_Popup_Value==1)
    
    set(handles.Process_B3,'Enable','off');
    
elseif ((SelectDay_Popup_Value~=1)&&(SelectMonth_Popup_Value~=1)&&(SelectYear_Popup_Value~=1))
    
    set(handles.Process_B3,'Enable','on');
    
end

% --- Executes during object creation, after setting all properties.
function SelectVariablePair_Popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SelectVariablePair_Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in SelectDay_Popup.
function SelectDay_Popup_Callback(hObject, eventdata, handles)
% hObject    handle to SelectDay_Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SelectDay_Popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SelectDay_Popup


% --- Executes during object creation, after setting all properties.
function SelectDay_Popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SelectDay_Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in SelectMonth_Popup.
function SelectMonth_Popup_Callback(hObject, eventdata, handles)
% hObject    handle to SelectMonth_Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SelectMonth_Popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SelectMonth_Popup

% Getting Current GUI WorkSpace Name

ForecastingPerformanceAnalysisApp_GUI=getappdata(0,'ForecastingPerformanceAnalysisApp_GUI');

% Getting PopUp Value

SelectMonth_Popup_Value=get(handles.SelectMonth_Popup,'Value');
SelectYear_Popup_Value=get(handles.SelectYear_Popup,'Value');

% Changing GUI behaviour according to PopUp Value

if (SelectMonth_Popup_Value==1) 
    
    set(handles.SelectDay_Popup,'Enable','off');
    
    set(handles.SelectDay_Popup,'String','Day');
    
elseif ((SelectMonth_Popup_Value~=1)&&(SelectYear_Popup_Value~=1))    
   
    % Getting relevant Variables from the Current GUI WorkSpace   
    
    SelectMonth_Popup_String=getappdata(ForecastingPerformanceAnalysisApp_GUI,'SelectMonth_Popup_String');
    SelectMonth_Popup_Vector=getappdata(ForecastingPerformanceAnalysisApp_GUI,'SelectMonth_Popup_Vector');
    YearVector=getappdata(ForecastingPerformanceAnalysisApp_GUI,'YearVector');    
    
    % Computing SelectDay_Popup_String using External Function

    [SelectDay_Popup_String] = ForecastPerformanceAnalysis_SelectDaypopupStringGenerator(SelectMonth_Popup_Value,SelectMonth_Popup_String,SelectMonth_Popup_Vector,YearVector,SelectYear_Popup_Value);
    
    % Setting String for SlectDay_Popup
    
    set(handles.SelectDay_Popup,'String',SelectDay_Popup_String);
    
end

% --- Executes during object creation, after setting all properties.
function SelectMonth_Popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SelectMonth_Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in SelectYear_Popup.
function SelectYear_Popup_Callback(hObject, eventdata, handles)
% hObject    handle to SelectYear_Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SelectYear_Popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SelectYear_Popup


% --- Executes during object creation, after setting all properties.
function SelectYear_Popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SelectYear_Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Previous_B.
function Previous_B_Callback(hObject, eventdata, handles)
% hObject    handle to Previous_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI WorkSpace

ForecastingPerformanceAnalysisApp_GUI=getappdata(0,'ForecastingPerformanceAnalysisApp_GUI');

% Getting the Aprropriate Data Files/Sheets

Plot_DataCell=getappdata(ForecastingPerformanceAnalysisApp_GUI,'Plot_DataCell');

PerformanceAnalysis_Database_SelectedSheet=Plot_DataCell{1,1};
%Plot_DataMatrix=Plot_DataCell{1,2};
Plot_Index=Plot_DataCell{1,3};
Plot_Title=Plot_DataCell{1,4};
Plot_XAxisLabel=Plot_DataCell{1,5};
Plot_YAxisLabel=Plot_DataCell{1,6};
Selected_Date=Plot_DataCell{1,7};
First_Date=Plot_DataCell{1,8};
Last_Date=Plot_DataCell{1,9};
VariablePair_Index=Plot_DataCell{1,10};
Len_VariablePair_Index=Plot_DataCell{1,11};

% Computing Global Button Indicator according to the Data File/Sheet and Data from the Graph Plotting Information

Selected_Date=Selected_Date-1; % Incrementing the current Selected Date

if (Selected_Date<First_Date) % Checking if Date goes below First Date
    
    Selected_Date=Last_Date;
    
end

Year=Selected_Date.Year;
Month=Selected_Date.Month;
Day=Selected_Date.Dat;

% Getting the Correct Data for Plotting using External Function

[Plot_DataMatrix] = ForecastingPerformanceAnalysis_PlotDataSelector(PerformanceAnalysis_Database_SelectedSheet, Year, Month, Day, Len_VariablePair_Index, VariablePair_Index);


% Plotting the above Data on the Graph acording to Plot_Index

if (Plot_Index==2) % 2 Plots
    
    % Getting the XAxis and YAxis Data
    
    XAxis_Data=Plot_DataMatrix(:,1);
    
    YAxis_Data1=Plot_DataMatrix(:,2);
    
    YAxis_Data2=Plot_DataMatrix(:,3);

    % Plotting
    
    axes(handles.ComparisonGraph);

    grid on
    hold on 

    title(Plot_Title);
    xlabel(Plot_XAxisLabel);
    ylabel(Plot_YAxisLabel);

    plot(XAxis_Data,YAxis_Data1,'-*r');
    plot(XAxis_Data,YAxis_Data2,'-ob'); 

    hold off;  
    
    % Calculating MAE, MSE and RMSE for the Plotted Data using External  Functions    

    [MAE] = ForecastPerformanceAnalysis_MAE(YAxis_Data1, YAxis_Data2); % Computing MAE
    
    [MSE] = ForecastPerformanceAnalysis_MSE(YAxis_Data1, YAxis_Data2); % Computing MSE
    
    [RMSE] = ForecastPerformanceAnalysis_RMSE(YAxis_Data1, YAxis_Data2); % Computing RMSE

    % Displaying MAE, MSE and RMSE in th appropriate Edit Boxes 
    
    set(handles.MAE_Gui,'String',num2str(MAE));
    set(handles.MSE_Gui,'String',num2str(MSE));
    set(handles.RMSE_Gui,'String',num2str(RMSE));       
    
elseif (Plot_Index==1) % 1 Plot
    
    % Getting the XAxis and YAxis Data
    
    XAxis_Data=Plot_DataMatrix(:,1);
    
    YAxis_Data1=Plot_DataMatrix(:,2);
    
    % Plotting
    
    axes(handles.ComparisonGraph);

    grid on
    hold on 

    title(Plot_Title);
    xlabel(Plot_XAxisLabel);
    ylabel(Plot_YAxisLabel);

    plot(XAxis_Data,YAxis_Data1,'-og');

    hold off;  
    
    % Displaying MAE, MSE and RMSE in th appropriate Edit Boxes  
    
    set(handles.MAE_Gui,'String','');
    set(handles.MSE_Gui,'String','');
    set(handles.RMSE_Gui,'String','');    
    
end

% Creating Updating Cell Structure for Plotting

Plot_DataCell={PerformanceAnalysis_Database_SelectedSheet,Plot_DataMatrix, Plot_Index, Plot_Title, Plot_XAxisLabel, Plot_YAxisLabel,Selected_Date, First_Date, Last_Date,VariablePair_Index,length(VariablePair_String)};

setappdata(ForecastingPerformanceAnalysisApp_GUI,'Plot_DataCell',Plot_DataCell);




% --- Executes on button press in Plot_B.
function Plot_B_Callback(hObject, eventdata, handles)
% hObject    handle to Plot_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI WorkSpace

ForecastingPerformanceAnalysisApp_GUI=getappdata(0,'ForecastingPerformanceAnalysisApp_GUI');

% Getting the Aprropriate Data Files/Sheets

Plot_DataCell=getappdata(ForecastingPerformanceAnalysisApp_GUI,'Plot_DataCell');

%PerformanceAnalysis_Database_SelectedSheet=Plot_DataCell{1,1};
Plot_DataMatrix=Plot_DataCell{1,2};
Plot_Index=Plot_DataCell{1,3};
Plot_Title=Plot_DataCell{1,4};
Plot_XAxisLabel=Plot_DataCell{1,5};
Plot_YAxisLabel=Plot_DataCell{1,6};
Selected_Date=Plot_DataCell{1,7};
%First_Date=Plot_DataCell{1,8};
%Last_Date=Plot_DataCell{1,9};
%VariablePair_Index=Plot_DataCell{1,10};
%Len_VariablePair_Index=Plot_DataCell{1,11};

% Computing Global Button Indicator according to the Data File/Sheet and Data from the Graph Plotting Information

% Plotting the above Data on the Graph acording to Plot_Index

if (Plot_Index==2) % 2 Plots
    
    % Getting the XAxis and YAxis Data
    
    XAxis_Data=Plot_DataMatrix(:,1);
    
    YAxis_Data1=Plot_DataMatrix(:,2);
    
    YAxis_Data2=Plot_DataMatrix(:,3);

    % Plotting
    
    axes(handles.ComparisonGraph);

    grid on
    hold on 

    title(Plot_Title);
    xlabel(Plot_XAxisLabel);
    ylabel(Plot_YAxisLabel);

    plot(XAxis_Data,YAxis_Data1,'-*r');
    plot(XAxis_Data,YAxis_Data2,'-ob'); 

    hold off;  
    
    % Calculating MAE, MSE and RMSE for the Plotted Data using External  Functions    

    [MAE] = ForecastPerformanceAnalysis_MAE(YAxis_Data1, YAxis_Data2); % Computing MAE
    
    [MSE] = ForecastPerformanceAnalysis_MSE(YAxis_Data1, YAxis_Data2); % Computing MSE
    
    [RMSE] = ForecastPerformanceAnalysis_RMSE(YAxis_Data1, YAxis_Data2); % Computing RMSE

    % Displaying MAE, MSE and RMSE in th appropriate Edit Boxes 
    
    set(handles.MAE_Gui,'String',num2str(MAE));
    set(handles.MSE_Gui,'String',num2str(MSE));
    set(handles.RMSE_Gui,'String',num2str(RMSE));       
    
elseif (Plot_Index==1) % 1 Plot
    
    % Getting the XAxis and YAxis Data
    
    XAxis_Data=Plot_DataMatrix(:,1);
    
    YAxis_Data1=Plot_DataMatrix(:,2);
    
    % Plotting
    
    axes(handles.ComparisonGraph);

    grid on
    hold on 

    title(Plot_Title);
    xlabel(Plot_XAxisLabel);
    ylabel(Plot_YAxisLabel);

    plot(XAxis_Data,YAxis_Data1,'-og');

    hold off;  
    
    % Displaying MAE, MSE and RMSE in th appropriate Edit Boxes  
    
    set(handles.MAE_Gui,'String','');
    set(handles.MSE_Gui,'String','');
    set(handles.RMSE_Gui,'String','');    
    
end

% Enabling next and Previous Buttons

set(handles.Next_B,'Enable','on');
set(handles.Previous_B,'Enable','on');

% --- Executes on button press in Next_B.
function Next_B_Callback(hObject, eventdata, handles)
% hObject    handle to Next_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI WorkSpace

ForecastingPerformanceAnalysisApp_GUI=getappdata(0,'ForecastingPerformanceAnalysisApp_GUI');

% Getting the Aprropriate Data Files/Sheets

Plot_DataCell=getappdata(ForecastingPerformanceAnalysisApp_GUI,'Plot_DataCell');

PerformanceAnalysis_Database_SelectedSheet=Plot_DataCell{1,1};
%Plot_DataMatrix=Plot_DataCell{1,2};
Plot_Index=Plot_DataCell{1,3};
Plot_Title=Plot_DataCell{1,4};
Plot_XAxisLabel=Plot_DataCell{1,5};
Plot_YAxisLabel=Plot_DataCell{1,6};
Selected_Date=Plot_DataCell{1,7};
First_Date=Plot_DataCell{1,8};
Last_Date=Plot_DataCell{1,9};
VariablePair_Index=Plot_DataCell{1,10};
Len_VariablePair_Index=Plot_DataCell{1,11};

% Computing Global Button Indicator according to the Data File/Sheet and Data from the Graph Plotting Information

Selected_Date=Selected_Date+1; % Incrementing the current Selected Date

if (Selected_Date>Last_Date) % Checking if Date goes beyond End Date
    
    Selected_Date=First_Date;
    
end

Year=Selected_Date.Year;
Month=Selected_Date.Month;
Day=Selected_Date.Dat;

% Getting the Correct Data for Plotting using External Function

[Plot_DataMatrix] = ForecastingPerformanceAnalysis_PlotDataSelector(PerformanceAnalysis_Database_SelectedSheet, Year, Month, Day, Len_VariablePair_Index, VariablePair_Index);


% Plotting the above Data on the Graph acording to Plot_Index

if (Plot_Index==2) % 2 Plots
    
    % Getting the XAxis and YAxis Data
    
    XAxis_Data=Plot_DataMatrix(:,1);
    
    YAxis_Data1=Plot_DataMatrix(:,2);
    
    YAxis_Data2=Plot_DataMatrix(:,3);

    % Plotting
    
    axes(handles.ComparisonGraph);

    grid on
    hold on 

    title(Plot_Title);
    xlabel(Plot_XAxisLabel);
    ylabel(Plot_YAxisLabel);

    plot(XAxis_Data,YAxis_Data1,'-*r');
    plot(XAxis_Data,YAxis_Data2,'-ob'); 

    hold off;  
    
    % Calculating MAE, MSE and RMSE for the Plotted Data using External  Functions    

    [MAE] = ForecastPerformanceAnalysis_MAE(YAxis_Data1, YAxis_Data2); % Computing MAE
    
    [MSE] = ForecastPerformanceAnalysis_MSE(YAxis_Data1, YAxis_Data2); % Computing MSE
    
    [RMSE] = ForecastPerformanceAnalysis_RMSE(YAxis_Data1, YAxis_Data2); % Computing RMSE

    % Displaying MAE, MSE and RMSE in th appropriate Edit Boxes 
    
    set(handles.MAE_Gui,'String',num2str(MAE));
    set(handles.MSE_Gui,'String',num2str(MSE));
    set(handles.RMSE_Gui,'String',num2str(RMSE));       
    
elseif (Plot_Index==1) % 1 Plot
    
    % Getting the XAxis and YAxis Data
    
    XAxis_Data=Plot_DataMatrix(:,1);
    
    YAxis_Data1=Plot_DataMatrix(:,2);
    
    % Plotting
    
    axes(handles.ComparisonGraph);

    grid on
    hold on 

    title(Plot_Title);
    xlabel(Plot_XAxisLabel);
    ylabel(Plot_YAxisLabel);

    plot(XAxis_Data,YAxis_Data1,'-og');

    hold off;  
    
    % Displaying MAE, MSE and RMSE in th appropriate Edit Boxes  
    
    set(handles.MAE_Gui,'String','');
    set(handles.MSE_Gui,'String','');
    set(handles.RMSE_Gui,'String','');    
    
end

% Creating Updating Cell Structure for Plotting

Plot_DataCell={PerformanceAnalysis_Database_SelectedSheet,Plot_DataMatrix, Plot_Index, Plot_Title, Plot_XAxisLabel, Plot_YAxisLabel,Selected_Date, First_Date, Last_Date,VariablePair_Index,length(VariablePair_String)};

setappdata(ForecastingPerformanceAnalysisApp_GUI,'Plot_DataCell',Plot_DataCell);


% --- Executes on button press in Process_B3.
function Process_B3_Callback(hObject, eventdata, handles)
% hObject    handle to Process_B3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI WorkSpace

ForecastingPerformanceAnalysisApp_GUI=getappdata(0,'ForecastingPerformanceAnalysisApp_GUI');

% Getting Popup Values from Step 5.3

SelectYear_Popup_Value=get(handles.SelectYear_Popup,'Value');
SelectMonth_Popup_Value=get(handles.SelectMonth_Popup,'Value');
SelectDay_Popup_Value=get(handles.SelectDay_Popup,'Value');
SelectVariablePair_Popup_Value=get(handles.SelectYear_Popup,'Value');

% Creating Proper Indices for year, Month, Day and Variable-Pair

Year_Index=SelectYear_Popup_Value-1;
Month_Index=SelectMonth_Popup_Value-1;
Day_Index=SelectDay_Popup_Value-1;
VariablePair_Index1=SelectVariablePair_Popup_Value-1;

% Getting Relevant Variables from the current GUI WorkSpace

YearVector=getappdata(ForecastingPerformanceAnalysisApp_GUI,'YearVector');
SelectMonth_Popup_Vector=getappdata(ForecastingPerformanceAnalysisApp_GUI,'SelectMonth_Popup_Vector');
SelectVariablePair_IndexVector_Cell=getappdata(ForecastingPerformanceAnalysisApp_GUI,'SelectVariablePair_IndexVector_Cell');
SelectMonth_Popup_String=getappdata(ForecastingPerformanceAnalysisApp_GUI,'SelectMonth_Popup_String');

PerformanceAnalysis_Database_SelectedSheet=getappdata(ForecastingPerformanceAnalysisApp_GUI,'PerformanceAnalysis_Database_SelectedSheet');

% Computing Year, Month, Day, Variable-Pair-Index and Variable-Pair-String

Year=YearVector(1,Year_Index); % For Row Selection
Month=SelectMonth_Popup_Vector(1,Month_Index); % For Row Selection
Day=Day_Index; % For Row Selection
VariablePair_Index=SelectVariablePair_IndexVector_Cell{1,VariablePair_Index1}; % For Column Selection
VariablePair_String=SelectMonth_Popup_String{1,VariablePair_Index1}; % For Creating Title and Y-Axis Label

% Getting First and Last Date from PerformanceAnalysis_Database_SelectedSheet

First_Year=PerformanceAnalysis_Database_SelectedSheet(1,3);
First_Month=PerformanceAnalysis_Database_SelectedSheet(1,2);
First_Day=PerformanceAnalysis_Database_SelectedSheet(1,1);

Last_Year=PerformanceAnalysis_Database_SelectedSheet(end,3);
Last_Month=PerformanceAnalysis_Database_SelectedSheet(end,2);
Last_Day=PerformanceAnalysis_Database_SelectedSheet(end,1);

% Creating Appropriate Data as per the Graph Plotting Information using External Function

[Plot_DataMatrix, Plot_Index, Plot_Title, Plot_XAxisLabel, Plot_YAxisLabel] = ForecastPerformanceAnalysis_PlotDataGenerator(PerformanceAnalysis_Database_SelectedSheet, PlotData_Matrix, Year, Month, Day, VariablePair_Index, VariablePair_String);

% Creating Selected-Firs-Last Date Object

Selected_Date=datetime(Year,Month,Day);
First_Date=datetime(First_Year,First_Month,First_Day);
Last_Date=datetime(Last_Year,Last_Month,Last_Day);

% Creating Cell Structure for Plotting

Plot_DataCell={PerformanceAnalysis_Database_SelectedSheet,Plot_DataMatrix, Plot_Index, Plot_Title, Plot_XAxisLabel, Plot_YAxisLabel,Selected_Date, First_Date, Last_Date,VariablePair_Index,length(VariablePair_String)};

setappdata(ForecastingPerformanceAnalysisApp_GUI,'Plot_DataCell',Plot_DataCell);

% Enabling the Plot Button in Step 6

set(handles.Plot_B,'Enable','on')

% --- Executes on button press in Process_B2.
function Process_B2_Callback(hObject, eventdata, handles)
% hObject    handle to Process_B2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI WorkSpace

ForecastingPerformanceAnalysisApp_GUI=getappdata(0,'ForecastingPerformanceAnalysisApp_GUI');

% Getting Pop-Up Values from Step 5.1

SelectFile_Popup_Value=get(handles.SelectFile_Popup_Value,'Value');

SelectSheet_Popup_Value=get(handles.SelectSheet_Popup_Value,'Value');

% Computing Performance File and Sheet Indices

PerformanceFile_Index=SelectFile_Popup_Value-1;

PerformanceSheet_Index=SelectSheet_Popup_Value-1;

% Getting the PerformanceAnalysis_Database from the Current GUI WorkSpace

PerformanceAnalysis_Database=getappdata(ForecastingPerformanceAnalysisApp_GUI,'PerformanceAnalysis_Database');

% Getting the Selected File from PerformanceAnalysis_Database

PerformanceAnalysis_Database_SelectedFile=PerformanceAnalysis_Database{1,PerformanceFile_Index};

% Getting the Selected Sheet from the Selected File

PerformanceAnalysis_Database_SelectedSheet=PerformanceAnalysis_Database_SelectedFile{1,PerformanceSheet_Index};

% Setting-Up PerformanceAnalysis_Database_SelectedSheet in Current GUI WorkSpace

setappdata(ForecastingPerformanceAnalysisApp_GUI,'PerformanceAnalysis_Database_SelectedSheet',PerformanceAnalysis_Database_SelectedSheet);

% Computing the Selected File and Sheet Information using External Function

[StartYear,EndYear,StartMonth,EndMonth,StartDay,EndDay, SelectYear_Popup_String,SelectMonth_Popup_String,SelectMonth_Popup_Vector,YearVector] = ForecastingPerformanceAnalysis_SelectedFileSheetInfoGenerator(PerformanceAnalysis_Database_SelectedSheet);

% Setting-Up Relevant variables from Above Function Output to Current GUI Workspace

setappdata(ForecastingPerformanceAnalysisApp_GUI,'SelectMonth_Popup_String',SelectMonth_Popup_String);
setappdata(ForecastingPerformanceAnalysisApp_GUI,'SelectMonth_Popup_Vector',SelectMonth_Popup_Vector);
setappdata(ForecastingPerformanceAnalysisApp_GUI,'YearVector',YearVector);

% Getting Relevant Variables

PerformanceAnalysis_Database_Header=getappdata(ForecastingPerformanceAnalysisApp_GUI,'PerformanceAnalysis_Database_Header');
FileColumnStructure_Cell=getappdata(ForecastingPerformanceAnalysisApp_GUI,'FileColumnStructure_Cell');

% Creating SelectVariablePair_Popup_String using External Function

[SelectVariablePair_Popup_String,SelectVariablePair_IndexVector_Cell] = ForecastPerformanceAnalysis_SelectVariablepopupStringGenerator(PerformanceAnalysis_Database_Header,FileColumnStructure_Cell);

% Setting-Up Outputs of the above Function to the current GUI WorkSpace

setappdata(ForecastingPerformanceAnalysisApp_GUI,'SelectVariablePair_Popup_String',SelectVariablePair_Popup_String);
setappdata(ForecastingPerformanceAnalysisApp_GUI,'SelectVariablePair_IndexVector_Cell',SelectVariablePair_IndexVector_Cell);

% Changing the Strings of the Step 5.2 Edit Elements

set(handles.StartYear,'String',num2str(StartYear));
set(handles.EndYear,'String',num2str(EndYear));
set(handles.StartMonth,'String',num2str(StartMonth));
set(handles.EndMonth,'String',num2str(EndMonth));
set(handles.StartDay,'String',num2str(StartDay));
set(handles.EndDay,'String',num2str(EndDay));

% Changing the Strings of the Step 5.3 Popups

set(handles.SelectYear_Popup,'String',SelectYear_Popup_String);
set(handles.SelectMonth_Popup,'String',SelectMonth_Popup_String);
set(handles.SelectVariablePair_Popup,'String',SelectVariablePair_Popup_String);

% Enabling Elements of Step 5.3

set(handles.SelectYear_Popup,'Enable','on');
set(handles.SelectMonth_Popup,'Enable','on');
set(handles.SelectDay_Popup,'Enable','off');
set(handles.SelectVariablePair_Popup,'Enable','on');

set(handles.Process_B3,'Enable','off');  


% --- Executes when selected object is changed in uibuttongroup12.
function uibuttongroup12_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup12 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton35.
function pushbutton35_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
