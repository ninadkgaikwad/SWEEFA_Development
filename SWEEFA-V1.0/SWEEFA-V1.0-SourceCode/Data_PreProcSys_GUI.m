function varargout = Data_PreProcSys_GUI(varargin)
% DATA_PREPROCSYS_GUI MATLAB code for Data_PreProcSys_GUI.fig
%      DATA_PREPROCSYS_GUI, by itself, creates a new DATA_PREPROCSYS_GUI or raises the existing
%      singleton*.
%
%      H = DATA_PREPROCSYS_GUI returns the handle to a new DATA_PREPROCSYS_GUI or the handle to
%      the existing singleton*.
%
%      DATA_PREPROCSYS_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATA_PREPROCSYS_GUI.M with the given input arguments.
%
%      DATA_PREPROCSYS_GUI('Property','Value',...) creates a new DATA_PREPROCSYS_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Data_PreProcSys_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Data_PreProcSys_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Data_PreProcSys_GUI

% Last Modified by GUIDE v2.5 15-Nov-2016 17:53:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Data_PreProcSys_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Data_PreProcSys_GUI_OutputFcn, ...
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


% --- Executes just before Data_PreProcSys_GUI is made visible.
function Data_PreProcSys_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Data_PreProcSys_GUI (see VARARGIN)

% Choose default command line output for Data_PreProcSys_GUI
handles.output = hObject;

% Initialization

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);
set(handles.r3,'Value',0);
set(handles.r4,'Value',0);

set(handles.Headers,'String','');
set(handles.Res,'String','');
set(handles.DataCols,'String','');
set(handles.hem,'String','');
set(handles.Ltm,'String','');
set(handles.L,'String','');
set(handles.Lat,'String','');
set(handles.N,'String','');
set(handles.GenIrrad,'String','');
set(handles.GenCapacity,'String','');
set(handles.WeatherFileHourlyOrRes,'String','');
set(handles.DataCumulativeOrNot,'String','');
set(handles.RelativeHours,'String','');

set(handles.Headers,'Enable','on');
set(handles.Res,'Enable','on');
set(handles.DataCols,'Enable','on');
set(handles.hem,'Enable','on');
set(handles.Ltm,'Enable','on');
set(handles.L,'Enable','on');
set(handles.Lat,'Enable','on');
set(handles.N,'Enable','on');
set(handles.GenIrrad,'Enable','off');
set(handles.GenCapacity,'Enable','off');
set(handles.WeatherFileHourlyOrRes,'Enable','off');
set(handles.DataCumulativeOrNot,'Enable','off');
set(handles.RelativeHours,'Enable','off');

set(handles.b5,'Enable','off');

set(handles.r5,'Value',1);
set(handles.r6,'Value',0);
set(handles.r7,'Value',0);

set(handles.DataCols1,'String','');
set(handles.Res1,'String','');
set(handles.Res2,'String','');
set(handles.AvgOrAdd,'String','');

set(handles.DataCols1,'Enable','on');
set(handles.Res1,'Enable','on');
set(handles.Res2,'Enable','on');
set(handles.AvgOrAdd,'Enable','on');

set(handles.b3,'String','Weather File Processing');
set(handles.b4,'String','Minute to Minute Conversion');


% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'Data_PreProcSys_GUI',gcf);

% UIWAIT makes Data_PreProcSys_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Data_PreProcSys_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);
set(handles.r3,'Value',0);
set(handles.r4,'Value',0);

set(handles.Headers,'String','');
set(handles.Res,'String','');
set(handles.DataCols,'String','');
set(handles.hem,'String','');
set(handles.Ltm,'String','');
set(handles.L,'String','');
set(handles.Lat,'String','');
set(handles.N,'String','');
set(handles.GenIrrad,'String','');
set(handles.GenCapacity,'String','');
set(handles.WeatherFileHourlyOrRes,'String','');
set(handles.DataCumulativeOrNot,'String','');
set(handles.RelativeHours,'String','');

set(handles.Headers,'Enable','on');
set(handles.Res,'Enable','on');
set(handles.DataCols,'Enable','on');
set(handles.hem,'Enable','on');
set(handles.Ltm,'Enable','on');
set(handles.L,'Enable','on');
set(handles.Lat,'Enable','on');
set(handles.N,'Enable','on');
set(handles.GenIrrad,'Enable','off');
set(handles.GenCapacity,'Enable','off');
set(handles.WeatherFileHourlyOrRes,'Enable','off');
set(handles.DataCumulativeOrNot,'Enable','off');
set(handles.RelativeHours,'Enable','off');

set(handles.b5,'Enable','off');

set(handles.r5,'Value',1);
set(handles.r6,'Value',0);
set(handles.r7,'Value',0);

set(handles.DataCols1,'String','');
set(handles.Res1,'String','');
set(handles.Res2,'String','');
set(handles.AvgOrAdd,'String','');

set(handles.DataCols1,'Enable','on');
set(handles.Res1,'Enable','on');
set(handles.Res2,'Enable','on');
set(handles.AvgOrAdd,'Enable','on');

set(handles.b3,'String','Weather File Processing');
set(handles.b4,'String','Minute to Minute Conversion');

% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing GUI

hf1=findobj('Name','PlantInfo_GUI');
close(hf1);

close ;



% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Radio Button Values

r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');
r3=get(handles.r3,'Value');
r4=get(handles.r4,'Value');

% Programming Button behaviour based on Radio Buton Values

if (r1==1) % Weather File
    
    Headers=get(handles.Headers,'String');
    Headers=str2double(Headers);
    
    Res=get(handles.Res,'String');
    Res=str2double(Res);   
   
    DataCols=get(handles.DataCols,'String');
    DataCols=str2double(DataCols);
    
    hem=get(handles.hem,'String');
    hem=str2double(hem);
    
    Ltm=get(handles.Ltm,'String');
    Ltm=str2double(Ltm);
    
    L=get(handles.L,'String');
    L=str2double(L);
    
    Lat=get(handles.Lat,'String');
    Lat=str2double(Lat);      
   
    N=get(handles.N,'String');
    N=str2double(N);   
    
    % Using external function to process Weather File
    
    [ ProcessedData ] = SolarPVWeatherDataCleaner( Headers,Res,DataCols,hem,Ltm,L,Lat,N );
    
elseif (r2==1) % Irradiance File
    
    % Getting User Input
    
    Headers=get(handles.Headers,'String');
    Headers=str2double(Headers);
    
    Res=get(handles.Res,'String');
    Res=str2double(Res);   
   
    DataCols=get(handles.DataCols,'String');
    DataCols=str2double(DataCols);
    
    hem=get(handles.hem,'String');
    hem=str2double(hem);
    
    Ltm=get(handles.Ltm,'String');
    Ltm=str2double(Ltm);
    
    L=get(handles.L,'String');
    L=str2double(L);
    
    Lat=get(handles.Lat,'String');
    Lat=str2double(Lat);  
    
    GenIrrad=get(handles.GenIrrad,'String'); 
    GenIrrad=strread(GenIrrad,'%f','delimiter',',');
    GenIrrad=GenIrrad';    
    
    % Getting PlantInfo_Parameters from PlantInfo_GUI
    
    PlantInfo_Parameters=getappdata(PlantInfo_GUI,'PlantInfo_Parameters');

    % Using external function to process Irradiance File
    
    [ ProcessedData,~,~ ] = SolarPVIrradianceDataCleaner( Headers,Res,DataCols,hem,Ltm,L,Lat,GenIrrad,PlantInfo_Parameters );
    
elseif(r3==1) % Generation File
    
    % Getting User Input
    
    Headers=get(handles.Headers,'String');
    Headers=str2double(Headers);
    
    Res=get(handles.Res,'String');
    Res=str2double(Res);   
   
    DataCols=get(handles.DataCols,'String');
    DataCols=str2double(DataCols);
    
    hem=get(handles.hem,'String');
    hem=str2double(hem);
    
    Ltm=get(handles.Ltm,'String');
    Ltm=str2double(Ltm);
    
    L=get(handles.L,'String');
    L=str2double(L);
    
    Lat=get(handles.Lat,'String');
    Lat=str2double(Lat);  
    
    GenCapacity=get(handles.GenCapacity,'String'); 
    GenCapacity=strread(GenCapacity,'%f','delimiter',',');
    GenCapacity=GenCapacity';
    
    GenIrrad=get(handles.GenIrrad,'String'); 
    GenIrrad=strread(GenIrrad,'%f','delimiter',',');
    GenIrrad=GenIrrad';   
    
    WeatherFileHourlyOrRes=get(handles.WeatherFileHourlyOrRes,'String');
    WeatherFileHourlyOrRes=str2double(WeatherFileHourlyOrRes);      
    
    DataCumulativeOrNot=get(handles.DataCumulativeOrNot,'String');
    DataCumulativeOrNot=str2double(DataCumulativeOrNot); 
    
    % Getting PlantInfo_Parameters from PlantInfo_GUI
    
    PlantInfo_Parameters=getappdata(PlantInfo_GUI,'PlantInfo_Parameters');    

    % Using external function to process Generation File
    
   [ ProcessedData,~,~ ] = SolarPVGenerationDataCleaner( Headers,Res,DataCols,hem,Ltm,L,Lat,GenCapacity,GenIrrad, WeatherFileHourlyOrRes, DataCumulativeOrNot, PlantInfo_Parameters );    
    
elseif(r4==1) % WRF NETCDF File
    
    % Getting User Input
    
    Headers=get(handles.Headers,'String');
    Headers=str2double(Headers);    
   
    hem=get(handles.hem,'String');
    hem=str2double(hem);
    
    Ltm=get(handles.Ltm,'String');
    Ltm=str2double(Ltm);
    
    L=get(handles.L,'String');
    L=str2double(L);
    
    Lat=get(handles.Lat,'String');
    Lat=str2double(Lat);  
    
    RelativeHours=get(handles.RelativeHours,'String');
    RelativeHours=str2double(RelativeHours); 
        
    % Using external function to process WRF NETCDF File
    
    [ ProcessedData ] = WrfUTC_To_LocalSolarTime( Headers,hem,Ltm,L,Lat,RelativeHours);
    
end


function DataCols_Callback(hObject, eventdata, handles)
% hObject    handle to DataCols (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DataCols as text
%        str2double(get(hObject,'String')) returns contents of DataCols as a double


% --- Executes during object creation, after setting all properties.
function DataCols_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DataCols (see GCBO)
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



function Headers_Callback(hObject, eventdata, handles)
% hObject    handle to Headers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Headers as text
%        str2double(get(hObject,'String')) returns contents of Headers as a double


% --- Executes during object creation, after setting all properties.
function Headers_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Headers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hem_Callback(hObject, eventdata, handles)
% hObject    handle to hem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hem as text
%        str2double(get(hObject,'String')) returns contents of hem as a double


% --- Executes during object creation, after setting all properties.
function hem_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ltm_Callback(hObject, eventdata, handles)
% hObject    handle to Ltm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ltm as text
%        str2double(get(hObject,'String')) returns contents of Ltm as a double


% --- Executes during object creation, after setting all properties.
function Ltm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ltm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L_Callback(hObject, eventdata, handles)
% hObject    handle to L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L as text
%        str2double(get(hObject,'String')) returns contents of L as a double


% --- Executes during object creation, after setting all properties.
function L_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Lat_Callback(hObject, eventdata, handles)
% hObject    handle to Lat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Lat as text
%        str2double(get(hObject,'String')) returns contents of Lat as a double


% --- Executes during object creation, after setting all properties.
function Lat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function N_Callback(hObject, eventdata, handles)
% hObject    handle to N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of N as text
%        str2double(get(hObject,'String')) returns contents of N as a double


% --- Executes during object creation, after setting all properties.
function N_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function GenIrrad_Callback(hObject, eventdata, handles)
% hObject    handle to GenIrrad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GenIrrad as text
%        str2double(get(hObject,'String')) returns contents of GenIrrad as a double


% --- Executes during object creation, after setting all properties.
function GenIrrad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GenIrrad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function GenCapacity_Callback(hObject, eventdata, handles)
% hObject    handle to GenCapacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GenCapacity as text
%        str2double(get(hObject,'String')) returns contents of GenCapacity as a double


% --- Executes during object creation, after setting all properties.
function GenCapacity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GenCapacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function WeatherFileHourlyOrRes_Callback(hObject, eventdata, handles)
% hObject    handle to WeatherFileHourlyOrRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WeatherFileHourlyOrRes as text
%        str2double(get(hObject,'String')) returns contents of WeatherFileHourlyOrRes as a double


% --- Executes during object creation, after setting all properties.
function WeatherFileHourlyOrRes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WeatherFileHourlyOrRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DataCumulativeOrNot_Callback(hObject, eventdata, handles)
% hObject    handle to DataCumulativeOrNot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DataCumulativeOrNot as text
%        str2double(get(hObject,'String')) returns contents of DataCumulativeOrNot as a double


% --- Executes during object creation, after setting all properties.
function DataCumulativeOrNot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DataCumulativeOrNot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Radio Button Values

r5=get(handles.r5,'Value');
r6=get(handles.r6,'Value');
r7=get(handles.r7,'Value');

% Programming Button behaviour based on Radio Button Values

if (r5==1) % Minute to Minute

    % Getting User Input
    DataCols=get(handles.DataCols1,'String');
    DataCols=str2double(DataCols);
    
    ResOriginal=get(handles.Res1,'String');
    ResOriginal=str2double(ResOriginal);    
    
    ResNew=get(handles.Res2,'String');
    ResNew=str2double(ResNew);
    
    AvgOrAdd=get(handles.AvgOrAdd,'String');
    AvgOrAdd=strread(AvgOrAdd,'%f','delimiter',',');
    AvgOrAdd=AvgOrAdd';
    
    % Using External Function to perform Conversion
    
    [ ProcessedData1 ] = minToMINDataCoverter( DataCols,ResOriginal,ResNew,AvgOrAdd );
    
elseif (r6==1) % Minute to Day
    
    % Getting User Input
    DataCols=get(handles.DataCols1,'String');
    DataCols=str2double(DataCols);
    
    Res=get(handles.Res1,'String');
    Res=str2double(Res);      
  
    AvgOrAdd=get(handles.AvgOrAdd,'String');
    AvgOrAdd=strread(AvgOrAdd,'%f','delimiter',',');
    AvgOrAdd=AvgOrAdd';    
    
    % Using External Function to perform Conversion
    
    [ ProcessedData1 ] = MINToDayDataCoverter( DataCols,Res,AvgOrAdd );
    
elseif(r7==1) % Day to Month
    
    % Getting User Input
    DataCols=get(handles.DataCols1,'String');
    DataCols=str2double(DataCols);    
   
    AvgOrAdd=get(handles.AvgOrAdd,'String');
    AvgOrAdd=strread(AvgOrAdd,'%f','delimiter',',');
    AvgOrAdd=AvgOrAdd'; 
    
    % Using External Function to perform Conversion
    
    [ ProcessedData1 ] = DayToMonthDataCoverter( DataCols,AvgOrAdd );
    
end

function Res2_Callback(hObject, eventdata, handles)
% hObject    handle to Res2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Res2 as text
%        str2double(get(hObject,'String')) returns contents of Res2 as a double


% --- Executes during object creation, after setting all properties.
function Res2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Res2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Res1_Callback(hObject, eventdata, handles)
% hObject    handle to Res1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Res1 as text
%        str2double(get(hObject,'String')) returns contents of Res1 as a double


% --- Executes during object creation, after setting all properties.
function Res1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Res1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DataCols1_Callback(hObject, eventdata, handles)
% hObject    handle to DataCols1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DataCols1 as text
%        str2double(get(hObject,'String')) returns contents of DataCols1 as a double


% --- Executes during object creation, after setting all properties.
function DataCols1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DataCols1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AvgOrAdd_Callback(hObject, eventdata, handles)
% hObject    handle to AvgOrAdd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AvgOrAdd as text
%        str2double(get(hObject,'String')) returns contents of AvgOrAdd as a double


% --- Executes during object creation, after setting all properties.
function AvgOrAdd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AvgOrAdd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel8.
function uipanel8_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel8 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Getting Radio Button Values

r5=get(handles.r5,'Value');
r6=get(handles.r6,'Value');
r7=get(handles.r7,'Value');

% Programming GUI Element behaviour based on Radio Button Values

if (r5==1) % Minute to Minute
    
    set(handles.DataCols1,'Enable','on');
    set(handles.Res1,'Enable','on');
    set(handles.Res2,'Enable','on');
    set(handles.AvgOrAdd,'Enable','on');
    
    set(handles.b4,'String','Minute to Minute Conversion');    
    
elseif (r6==1) % Hour to Day
    
    set(handles.DataCols1,'Enable','on');
    set(handles.Res1,'Enable','on');
    set(handles.Res2,'Enable','off');
    set(handles.AvgOrAdd,'Enable','on'); 
    
    set(handles.b4,'String','Minute to Day Conversion');
    
elseif (r7==1) % Day to Month
    
    set(handles.DataCols1,'Enable','on');
    set(handles.Res1,'Enable','off');
    set(handles.Res2,'Enable','off');
    set(handles.AvgOrAdd,'Enable','on');    
    
    set(handles.b4,'String','Day to Month Conversion');
    
end


% --- Executes when selected object is changed in uipanel3.
function uipanel3_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel3 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Getting Radio Button Values

r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');
r3=get(handles.r3,'Value');
r4=get(handles.r4,'Value');

% Programming GUI Element behaviour based on Radio Button Values

if (r1==1) % Weather File
    
    set(handles.Headers,'Enable','on');
    set(handles.Res,'Enable','on');
    set(handles.DataCols,'Enable','on');
    set(handles.hem,'Enable','on');
    set(handles.Ltm,'Enable','on');
    set(handles.L,'Enable','on');
    set(handles.Lat,'Enable','on');
    set(handles.N,'Enable','on');
    set(handles.GenIrrad,'Enable','off');
    set(handles.GenCapacity,'Enable','off');
    set(handles.WeatherFileHourlyOrRes,'Enable','off');
    set(handles.DataCumulativeOrNot,'Enable','off');
    set(handles.RelativeHours,'Enable','off');
    
    set(handles.b3,'String','Weather File Processing');

    set(handles.b5,'Enable','off');
    
elseif (r2==1) % Irradiance File
    
    set(handles.Headers,'Enable','on');
    set(handles.Res,'Enable','on');
    set(handles.DataCols,'Enable','on');
    set(handles.hem,'Enable','on');
    set(handles.Ltm,'Enable','on');
    set(handles.L,'Enable','on');
    set(handles.Lat,'Enable','on');
    set(handles.N,'Enable','off');
    set(handles.GenIrrad,'Enable','on');
    set(handles.GenCapacity,'Enable','off');
    set(handles.WeatherFileHourlyOrRes,'Enable','off');
    set(handles.DataCumulativeOrNot,'Enable','off');
    set(handles.RelativeHours,'Enable','off');
    
    set(handles.b3,'String','Irradiance File Processing');        
    
    set(handles.b5,'Enable','on');
    
elseif (r3==1) % Generation File
    
    set(handles.Headers,'Enable','on');
    set(handles.Res,'Enable','on');
    set(handles.DataCols,'Enable','on');
    set(handles.hem,'Enable','on');
    set(handles.Ltm,'Enable','on');
    set(handles.L,'Enable','on');
    set(handles.Lat,'Enable','on');
    set(handles.N,'Enable','off');
    set(handles.GenIrrad,'Enable','on');
    set(handles.GenCapacity,'Enable','on');
    set(handles.WeatherFileHourlyOrRes,'Enable','on');
    set(handles.DataCumulativeOrNot,'Enable','on');
    set(handles.RelativeHours,'Enable','off');

    set(handles.b3,'String','Solar Generation File Processing');    
    
    set(handles.b5,'Enable','on');
    
elseif (r4==1) % WRF NETCD File
    
    set(handles.Headers,'Enable','on');
    set(handles.Res,'Enable','off');
    set(handles.DataCols,'Enable','off');
    set(handles.hem,'Enable','on');
    set(handles.Ltm,'Enable','on');
    set(handles.L,'Enable','on');
    set(handles.Lat,'Enable','on');
    set(handles.N,'Enable','off');
    set(handles.GenIrrad,'Enable','off');
    set(handles.GenCapacity,'Enable','off');
    set(handles.WeatherFileHourlyOrRes,'Enable','off');
    set(handles.DataCumulativeOrNot,'Enable','off');
    set(handles.RelativeHours,'Enable','on');
    
    set(handles.b3,'String','WRF NETCDF File Processing'); 
    
    set(handles.b5,'Enable','off');
    
end



function RelativeHours_Callback(hObject, eventdata, handles)
% hObject    handle to RelativeHours (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RelativeHours as text
%        str2double(get(hObject,'String')) returns contents of RelativeHours as a double


% --- Executes during object creation, after setting all properties.
function RelativeHours_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RelativeHours (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening PlantInfo GUI

PlantInfo_GUI;
