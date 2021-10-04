function varargout = Wind_PlantInfo_GUI(varargin)
% WIND_PLANTINFO_GUI MATLAB code for Wind_PlantInfo_GUI.fig
%      WIND_PLANTINFO_GUI, by itself, creates a new WIND_PLANTINFO_GUI or raises the existing
%      singleton*.
%
%      H = WIND_PLANTINFO_GUI returns the handle to a new WIND_PLANTINFO_GUI or the handle to
%      the existing singleton*.
%
%      WIND_PLANTINFO_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WIND_PLANTINFO_GUI.M with the given input arguments.
%
%      WIND_PLANTINFO_GUI('Property','Value',...) creates a new WIND_PLANTINFO_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Wind_PlantInfo_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Wind_PlantInfo_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Wind_PlantInfo_GUI

% Last Modified by GUIDE v2.5 12-Feb-2018 18:11:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Wind_PlantInfo_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Wind_PlantInfo_GUI_OutputFcn, ...
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


% --- Executes just before Wind_PlantInfo_GUI is made visible.
function Wind_PlantInfo_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Wind_PlantInfo_GUI (see VARARGIN)

% Choose default command line output for Wind_PlantInfo_GUI
handles.output = hObject;
         
% Initialization:

set(handles.p1, 'Visible', 'on');
set(handles.p2, 'Visible', 'on');
set(handles.p3, 'Visible', 'on');
set(handles.p4, 'Visible', 'on');

set(handles.T1, 'Value', 0);
set(handles.T2, 'Value', 0);
set(handles.T3, 'Value', 0);
set(handles.T4, 'Value', 0);

set(handles.b1, 'Enable', 'off');
set(handles.b2, 'Enable', 'off');
set(handles.b3, 'Enable', 'off');
set(handles.b4, 'Enable', 'off');

%set(handles.b16, 'Enable', 'off');
%set(handles.b9, 'Enable', 'off');
%set(handles.b10, 'Enable', 'off');
%set(handles.b11, 'Enable', 'off');

set(handles.b12, 'Enable', 'off');
set(handles.b13, 'Enable', 'off');
set(handles.b14, 'Enable', 'off');
set(handles.b15, 'Enable', 'off');

set(handles.sub_T1, 'Enable', 'off');
set(handles.sub_T2, 'Enable', 'off');
set(handles.sub_T3, 'Enable', 'off');
set(handles.sub_T4, 'Enable', 'off');

set(handles.subnum_T1, 'Enable', 'off');
set(handles.subnum_T2, 'Enable', 'off');
set(handles.subnum_T3, 'Enable', 'off');
set(handles.subnum_T4, 'Enable', 'off');

set(handles.hub_T1, 'Enable', 'off');
set(handles.hub_T2, 'Enable', 'off');
set(handles.hub_T3, 'Enable', 'off');
set(handles.hub_T4, 'Enable', 'off');

set(handles.rotrad_T1, 'Enable', 'off');
set(handles.rotrad_T2, 'Enable', 'off');
set(handles.rotrad_T3, 'Enable', 'off');
set(handles.rotrad_T4, 'Enable', 'off');

set(handles.cutin_T1, 'Enable', 'off');
set(handles.cutin_T2, 'Enable', 'off');
set(handles.cutin_T3, 'Enable', 'off');
set(handles.cutin_T4, 'Enable', 'off');

set(handles.cutout_T1, 'Enable', 'off');
set(handles.cutout_T2, 'Enable', 'off');
set(handles.cutout_T3, 'Enable', 'off');
set(handles.cutout_T4, 'Enable', 'off');

set(handles.sub_T1, 'String', '');
set(handles.sub_T2, 'String', '');
set(handles.sub_T3, 'String', '');
set(handles.sub_T4, 'String', '');

set(handles.subnum_T1, 'String', '');
set(handles.subnum_T2, 'String', '');
set(handles.subnum_T3, 'String', '');
set(handles.subnum_T4, 'String', '');

set(handles.hub_T1, 'String', '');
set(handles.hub_T2, 'String', '');
set(handles.hub_T3, 'String', '');
set(handles.hub_T4, 'String', '');

set(handles.rotrad_T1, 'String', '');
set(handles.rotrad_T2, 'String', '');
set(handles.rotrad_T3, 'String', '');
set(handles.rotrad_T4, 'String', '');

set(handles.cutin_T1, 'String', '');
set(handles.cutin_T2, 'String', '');
set(handles.cutin_T3, 'String', '');
set(handles.cutin_T4, 'String', '');

set(handles.cutout_T1, 'String', '');
set(handles.cutout_T2, 'String', '');
set(handles.cutout_T3, 'String', '');
set(handles.cutout_T4, 'String', '');

set(handles.b1, 'String', 'WG T1 Data');
set(handles.b2, 'String', 'WG T2 Data');
set(handles.b3, 'String', 'WG T3 Data');
set(handles.b4, 'String', 'WG T4 Data');       
    
% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'Wind_PlantInfo_GUI',gcf);

% UIWAIT makes Wind_PlantInfo_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Wind_PlantInfo_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in T1.
function T1_Callback(hObject, eventdata, handles)
% hObject    handle to T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of T1

% Getting Data_PreProcSys_GUI Workspace
Data_PreProcSys_GUI=getappdata(0,'Data_PreProcSys_GUI');

NormalMode=getappdata(Data_PreProcSys_GUI,'NormalMode');
ForecastMode=getappdata(Data_PreProcSys_GUI,'ForecastMode');

T1 = get(handles.T1, 'Value');

% Writing selection change function:

if T1 == 1
    
    set(handles.b1, 'Enable', 'on');

    %set(handles.b16, 'Enable', 'on');
    
    if (NormalMode==1) % Normal Mode is Selected
        
        set(handles.b12, 'Enable', 'on');
        
    elseif (ForecastMode==1) % Forecast Mode is Selected
    
        set(handles.b12, 'Enable', 'on');
        
    end

    set(handles.sub_T1, 'Enable', 'on');

    set(handles.subnum_T1, 'Enable', 'on');

    set(handles.hub_T1, 'Enable', 'on');

    set(handles.rotrad_T1, 'Enable', 'on');

    set(handles.cutin_T1, 'Enable', 'on');

    set(handles.cutout_T1, 'Enable', 'on');        

elseif T1 == 0
    
    set(handles.b1, 'Enable', 'off');

    %set(handles.b16, 'Enable', 'off');
    
    set(handles.b12, 'Enable', 'off');

    set(handles.sub_T1, 'Enable', 'off');

    set(handles.subnum_T1, 'Enable', 'off');

    set(handles.hub_T1, 'Enable', 'off');

    set(handles.rotrad_T1, 'Enable', 'off');

    set(handles.cutin_T1, 'Enable', 'off');

    set(handles.cutout_T1, 'Enable', 'off');

end
        
    

    
    
    



% --- Executes on button press in T2.
function T2_Callback(hObject, eventdata, handles)
% hObject    handle to T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of T2

T2 = get(handles.T2, 'Value');  

% Getting Data_PreProcSys_GUI Workspace
Data_PreProcSys_GUI=getappdata(0,'Data_PreProcSys_GUI');

NormalMode=getappdata(Data_PreProcSys_GUI,'NormalMode');
ForecastMode=getappdata(Data_PreProcSys_GUI,'ForecastMode');
    
if T2 == 1

    set(handles.b2, 'Enable', 'on');

    %set(handles.b9, 'Enable', 'on');
    
    if (NormalMode==1) % Normal Mode is Selected
        
        set(handles.b13, 'Enable', 'on');
        
    elseif (ForecastMode==1) % Forecast Mode is Selected
    
        set(handles.b13, 'Enable', 'on');
        
    end     
   
    set(handles.sub_T2, 'Enable', 'on');

    set(handles.subnum_T2, 'Enable', 'on');

    set(handles.hub_T2, 'Enable', 'on');

    set(handles.rotrad_T2, 'Enable', 'on');

    set(handles.cutin_T2, 'Enable', 'on');

    set(handles.cutout_T2, 'Enable', 'on');          

elseif T2 == 0

    set(handles.b2, 'Enable', 'off');

    %set(handles.b9, 'Enable', 'off');
    
    set(handles.b13, 'Enable', 'off');

    set(handles.sub_T2, 'Enable', 'off');

    set(handles.subnum_T2, 'Enable', 'off');

    set(handles.hub_T2, 'Enable', 'off');

    set(handles.rotrad_T2, 'Enable', 'off');

    set(handles.cutin_T2, 'Enable', 'off');

    set(handles.cutout_T2, 'Enable', 'off');   

end       
    
    



% --- Executes on button press in T3.
function T3_Callback(hObject, eventdata, handles)
% hObject    handle to T3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of T3


T3 = get(handles.T3, 'Value');  


% Getting Data_PreProcSys_GUI Workspace
Data_PreProcSys_GUI=getappdata(0,'Data_PreProcSys_GUI');

NormalMode=getappdata(Data_PreProcSys_GUI,'NormalMode');
ForecastMode=getappdata(Data_PreProcSys_GUI,'ForecastMode');
    
if T3 == 1

    set(handles.b3, 'Enable', 'on');

    %set(handles.b10, 'Enable', 'on');
    
    if (NormalMode==1) % Normal Mode is Selected
        
        set(handles.b14, 'Enable', 'on');
        
    elseif (ForecastMode==1) % Forecast Mode is Selected
    
        set(handles.b14, 'Enable', 'on');
        
    end       

    set(handles.sub_T3, 'Enable', 'on');

    set(handles.subnum_T3, 'Enable', 'on');

    set(handles.hub_T3, 'Enable', 'on');

    set(handles.rotrad_T3, 'Enable', 'on');

    set(handles.cutin_T3, 'Enable', 'on');

    set(handles.cutout_T3, 'Enable', 'on');         

elseif T3 == 0

    set(handles.b3, 'Enable', 'off');

    %set(handles.b10, 'Enable', 'off');
    
    set(handles.b14, 'Enable', 'off');

    set(handles.sub_T3, 'Enable', 'off');

    set(handles.subnum_T3, 'Enable', 'off');

    set(handles.hub_T3, 'Enable', 'off');

    set(handles.rotrad_T3, 'Enable', 'off');

    set(handles.cutin_T3, 'Enable', 'off');

    set(handles.cutout_T3, 'Enable', 'off'); 

end
        
  





% --- Executes on button press in T4.
function T4_Callback(~, eventdata, handles)
% hObject    handle to T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of T4


T4 = get(handles.T4, 'Value');   
  
% Getting Data_PreProcSys_GUI Workspace
Data_PreProcSys_GUI=getappdata(0,'Data_PreProcSys_GUI');

NormalMode=getappdata(Data_PreProcSys_GUI,'NormalMode');
ForecastMode=getappdata(Data_PreProcSys_GUI,'ForecastMode');
    
if T4 == 1

    set(handles.b4, 'Enable', 'on');

    %set(handles.b11, 'Enable', 'on');

    if (NormalMode==1) % Normal Mode is Selected
        
        set(handles.b15, 'Enable', 'on');
        
    elseif (ForecastMode==1) % Forecast Mode is Selected
    
        set(handles.b15, 'Enable', 'on');
        
    end        
    
    set(handles.sub_T4, 'Enable', 'on');

    set(handles.subnum_T4, 'Enable', 'on');

    set(handles.hub_T4, 'Enable', 'on');

    set(handles.rotrad_T4, 'Enable', 'on');

    set(handles.cutin_T4, 'Enable', 'on');

    set(handles.cutout_T4, 'Enable', 'on');          

elseif T4 == 0

    set(handles.b4, 'Enable', 'off');

    %set(handles.b11, 'Enable', 'off');
    
    set(handles.b15, 'Enable', 'off');

    set(handles.sub_T4, 'Enable', 'off');

    set(handles.subnum_T4, 'Enable', 'off');

    set(handles.hub_T4, 'Enable', 'off');

    set(handles.rotrad_T4, 'Enable', 'off');

    set(handles.cutin_T4, 'Enable', 'off');

    set(handles.cutout_T4, 'Enable', 'off'); 

end      
   
    

% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_PlantInfo_GUI=getappdata(0,'Wind_PlantInfo_GUI');  

% Getting Data_PreProcSys_GUI Workspace
Data_PreProcSys_GUI=getappdata(0,'Data_PreProcSys_GUI');
    
% Getting Algorithm Option
       
WTGGenCleanAlgorithm=getappdata(Data_PreProcSys_GUI,'WTGGenCleanAlgorithm'); 

% Getting Power Curve based on Algorithm Option

if (WTGGenCleanAlgorithm==2) % Use Standard Power Curve
    
    sub_T1 = get(handles.sub_T1, 'String');

    sub_T1 = str2double(sub_T1);

    % Initializing Cell Structure For Power Curve:

    PowerCurve_T1 = cell(1,sub_T1);

    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T1 [Standard Power Curves]');   

    fullpathname=strcat(pathname, filename);

    for i = 1:sub_T1   

        TempFile=xlsread(fullpathname, i);

        PowerCurve_T1(1,i) = {TempFile};

    end

    setappdata(Wind_PlantInfo_GUI,'PowerCurve_T1',PowerCurve_T1);       
    
elseif (WTGGenCleanAlgorithm==3) % Use Averaged Power Curve Per Turbine
    
    subnum_T1 = get(handles.subnum_T1, 'String');
    subnum_T1 = strread(subnum_T1, '%f', 'delimiter', ',');
    subnum_T1 = subnum_T1';

    % Getting Total Number of Turbines

    subnum_Total_T1=sum(subnum_T1);

    % Initializing Cell Structure For Power Curve:

    PowerCurve_T1 = cell(1,subnum_Total_T1);

    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T1 [Real Averaged Power Curves per Turbine]');   

    fullpathname=strcat(pathname, filename);

    for i = 1:subnum_Total_T1  

        TempFile=xlsread(fullpathname, i);

        PowerCurve_T1(1,i) = {TempFile};

    end

    setappdata(Wind_PlantInfo_GUI,'PowerCurve_T1',PowerCurve_T1);       
    
elseif (WTGGenCleanAlgorithm==4) % Use Averaged Power Curve for Plant
    
    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T1 [Real Averaged Power Curve for the Plant]');   

    fullpathname=strcat(pathname, filename);         

    TempFile=xlsread(fullpathname);

    PowerCurve_T1 = {TempFile};        

    setappdata(Wind_PlantInfo_GUI,'PowerCurve_T1',PowerCurve_T1);      
    
end

% assignin('base','temp',TempFile); % For Debugging




% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_PlantInfo_GUI=getappdata(0,'Wind_PlantInfo_GUI');  

% Getting Data_PreProcSys_GUI Workspace
Data_PreProcSys_GUI=getappdata(0,'Data_PreProcSys_GUI');
    
% Getting Algorithm Option
       
WTGGenCleanAlgorithm=getappdata(Data_PreProcSys_GUI,'WTGGenCleanAlgorithm'); 

% Getting Power Curve based on Algorithm Option

if (WTGGenCleanAlgorithm==2) % Use Standard Power Curve
    
    sub_T2 = get(handles.sub_T2, 'String');

    sub_T2 = str2double(sub_T2);

    % Initializing Cell Structure For Power Curve:

    PowerCurve_T2 = cell(1,sub_T2);

    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T2 [Standard Power Curves]');   

    fullpathname=strcat(pathname, filename);

    for i = 1:sub_T2   

        TempFile=xlsread(fullpathname, i);

        PowerCurve_T2(1,i) = {TempFile};

    end

    setappdata(Wind_PlantInfo_GUI,'PowerCurve_T2',PowerCurve_T2);       
    
elseif (WTGGenCleanAlgorithm==3) % Use Averaged Power Curve Per Turbine
    
    subnum_T2 = get(handles.subnum_T2, 'String');
    subnum_T2 = strread(subnum_T2, '%f', 'delimiter', ',');
    subnum_T2 = subnum_T2';

    % Getting Total Number of Turbines

    subnum_Total_T2=sum(subnum_T2);

    % Initializing Cell Structure For Power Curve:

    PowerCurve_T2 = cell(1,subnum_Total_T2);

    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T2 [Real Averaged Power Curves per Turbine]');   

    fullpathname=strcat(pathname, filename);

    for i = 1:subnum_Total_T2  

        TempFile=xlsread(fullpathname, i);

        PowerCurve_T2(1,i) = {TempFile};

    end

    setappdata(Wind_PlantInfo_GUI,'PowerCurve_T2',PowerCurve_T2);       
    
elseif (WTGGenCleanAlgorithm==4) % Use Averaged Power Curve for Plant
    
    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T2 [Real Averaged Power Curve for the Plant]');   

    fullpathname=strcat(pathname, filename);         

    TempFile=xlsread(fullpathname);

    PowerCurve_T2 = {TempFile};        

    setappdata(Wind_PlantInfo_GUI,'PowerCurve_T2',PowerCurve_T2);      
    
end

% assignin('base','temp',TempFile); % For Debugging    
    



% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_PlantInfo_GUI=getappdata(0,'Wind_PlantInfo_GUI');  

% Getting Data_PreProcSys_GUI Workspace
Data_PreProcSys_GUI=getappdata(0,'Data_PreProcSys_GUI');
    
% Getting Algorithm Option
       
WTGGenCleanAlgorithm=getappdata(Data_PreProcSys_GUI,'WTGGenCleanAlgorithm'); 

% Getting Power Curve based on Algorithm Option

if (WTGGenCleanAlgorithm==2) % Use Standard Power Curve
    
    sub_T3 = get(handles.sub_T3, 'String');

    sub_T3 = str2double(sub_T3);

    % Initializing Cell Structure For Power Curve:

    PowerCurve_T3 = cell(1,sub_T3);

    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T3 [Standard Power Curves]');   

    fullpathname=strcat(pathname, filename);

    for i = 1:sub_T3   

        TempFile=xlsread(fullpathname, i);

        PowerCurve_T3(1,i) = {TempFile};

    end

    setappdata(Wind_PlantInfo_GUI,'PowerCurve_T3',PowerCurve_T3);       
    
elseif (WTGGenCleanAlgorithm==3) % Use Averaged Power Curve Per Turbine
    
    subnum_T3 = get(handles.subnum_T3, 'String');
    subnum_T3 = strread(subnum_T3, '%f', 'delimiter', ',');
    subnum_T3 = subnum_T3';

    % Getting Total Number of Turbines

    subnum_Total_T3=sum(subnum_T3);

    % Initializing Cell Structure For Power Curve:

    PowerCurve_T3 = cell(1,subnum_Total_T3);

    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T3 [Real Averaged Power Curves per Turbine]');   

    fullpathname=strcat(pathname, filename);

    for i = 1:subnum_Total_T3  

        TempFile=xlsread(fullpathname, i);

        PowerCurve_T3(1,i) = {TempFile};

    end

    setappdata(Wind_PlantInfo_GUI,'PowerCurve_T3',PowerCurve_T3);       
    
elseif (WTGGenCleanAlgorithm==4) % Use Averaged Power Curve for Plant
    
    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T3 [Real Averaged Power Curve for the Plant]');   

    fullpathname=strcat(pathname, filename);         

    TempFile=xlsread(fullpathname);

    PowerCurve_T3 = {TempFile};        

    setappdata(Wind_PlantInfo_GUI,'PowerCurve_T3',PowerCurve_T3);      
    
end

% assignin('base','temp',TempFile); % For Debugging    
    



% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_PlantInfo_GUI=getappdata(0,'Wind_PlantInfo_GUI');  

% Getting Data_PreProcSys_GUI Workspace
Data_PreProcSys_GUI=getappdata(0,'Data_PreProcSys_GUI');
    
% Getting Algorithm Option
       
WTGGenCleanAlgorithm=getappdata(Data_PreProcSys_GUI,'WTGGenCleanAlgorithm'); 

% Getting Power Curve based on Algorithm Option

if (WTGGenCleanAlgorithm==2) % Use Standard Power Curve
    
    sub_T4 = get(handles.sub_T4, 'String');

    sub_T4 = str2double(sub_T4);

    % Initializing Cell Structure For Power Curve:

    PowerCurve_T4 = cell(1,sub_T4);

    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T4 [Standard Power Curves]');   

    fullpathname=strcat(pathname, filename);

    for i = 1:sub_T4   

        TempFile=xlsread(fullpathname, i);

        PowerCurve_T4(1,i) = {TempFile};

    end

    setappdata(Wind_PlantInfo_GUI,'PowerCurve_T4',PowerCurve_T4);       
    
elseif (WTGGenCleanAlgorithm==3) % Use Averaged Power Curve Per Turbine
    
    subnum_T4 = get(handles.subnum_T4, 'String');
    subnum_T4 = strread(subnum_T4, '%f', 'delimiter', ',');
    subnum_T4 = subnum_T4';

    % Getting Total Number of Turbines

    subnum_Total_T4=sum(subnum_T4);

    % Initializing Cell Structure For Power Curve:

    PowerCurve_T4 = cell(1,subnum_Total_T4);

    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T4 [Real Averaged Power Curves per Turbine]');   

    fullpathname=strcat(pathname, filename);

    for i = 1:subnum_Total_T4  

        TempFile=xlsread(fullpathname, i);

        PowerCurve_T4(1,i) = {TempFile};

    end

    setappdata(Wind_PlantInfo_GUI,'PowerCurve_T4',PowerCurve_T4);       
    
elseif (WTGGenCleanAlgorithm==4) % Use Averaged Power Curve for Plant
    
    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T4 [Real Averaged Power Curve for the Plant]');   

    fullpathname=strcat(pathname, filename);         

    TempFile=xlsread(fullpathname);

    PowerCurve_T4 = {TempFile};        

    setappdata(Wind_PlantInfo_GUI,'PowerCurve_T4',PowerCurve_T4);      
    
end

 % assignin('base','temp',TempFile); % For Debugging
    



% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Wind_PlantInfo_GUI = getappdata(0,'Wind_PlantInfo_GUI');

Wind_Loss_Parameters_GUI = getappdata(0,'Wind_Loss_Parameters_GUI');

Data_PreProcSys_GUI=getappdata(0,'Data_PreProcSys_GUI');

% Getting Normal and Forecast Mode Info

NormalMode=getappdata(Data_PreProcSys_GUI,'NormalMode');
ForecastMode=getappdata(Data_PreProcSys_GUI,'ForecastMode');

% Getting values of radio buttons from the user:

T1 = get(handles.T1, 'Value');

T2 = get(handles.T2, 'Value');

T3 = get(handles.T3, 'Value');

T4 = get(handles.T4, 'Value');

WG_TurbineType = [T1 T2 T3 T4];

% Setting-up conditions for radio buttons:
   
if (T1 == 1) && (T2 == 0) && (T3 == 0) && (T4 == 0)

   % Type1 Data:

   sub_T1 = get(handles.sub_T1, 'String');
   sub_T1 = str2double(sub_T1);

   subnum_T1 = get(handles.subnum_T1, 'String');
   subnum_T1 = strread(subnum_T1, '%f', 'delimiter', ',');
   subnum_T1 = subnum_T1';

   hub_T1 = get(handles.hub_T1, 'String');
   hub_T1 = strread(hub_T1, '%f', 'delimiter', ',');
   hub_T1 = hub_T1';

   rotrad_T1 = get(handles.rotrad_T1, 'String');
   rotrad_T1 = strread(rotrad_T1, '%f', 'delimiter', ',');
   rotrad_T1 = rotrad_T1';       

   cutin_T1 = get(handles.cutin_T1, 'String');
   cutin_T1 = strread(cutin_T1, '%f', 'delimiter', ',');
   cutin_T1 = cutin_T1'; 

   cutout_T1 = get(handles.cutout_T1, 'String');
   cutout_T1 = strread(cutout_T1, '%f', 'delimiter', ',');
   cutout_T1 = cutout_T1';

   rated_T1 = 0;

   Power_T1 = getappdata(Wind_GUI_1,'PowerCurve_T1');
   

       
       LatLongAlt_T1=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T1');
       
   

   Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1,rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};

   setappdata(Wind_PlantInfo_GUI,'Parameters_T1',Parameters_T1);

   % Type2 data:

   sub_T2 = 1;

   subnum_T2 = 0;

   Power_T2 = 0;
   
   LatLongAlt_T2=0;

   hub_T2 = 0;

   rotrad_T2 = 0;

   cutin_T2 = 0;

   cutout_T2 = 0;

   rated_T2 = 0;

   Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2,rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};

   setappdata(Wind_PlantInfo_GUI,'Parameters_T2',Parameters_T2);

   % Type3 data:

   sub_T3 = 1;

   subnum_T3 = 0;

   Power_T3 = 0;
   
   LatLongAlt_T3=0;

   hub_T3 = 0;

   rotrad_T3 = 0;

   cutin_T3 = 0;

   cutout_T3 = 0;

   rated_T3 = 0;

   Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3,rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};

   setappdata(Wind_PlantInfo_GUI,'Parameters_T3',Parameters_T3);

   % Type4 data:

   sub_T4 = 1;

   subnum_T4 = 0;

   Power_T4 = 0;
   
   LatLongAlt_T4=0;

   hub_T4 = 0;

   rotrad_T4 = 0;

   cutin_T4 = 0;

   cutout_T4 = 0;

   rated_T4 = 0;

   Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};

   setappdata(Wind_PlantInfo_GUI,'Parameters_T4',Parameters_T4);

   %% Cell for all parameters:

   AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

   setappdata(Wind_PlantInfo_GUI,'AllParameters', AllParameters);

elseif (T1 == 0) && (T2 == 1) && (T3 == 0) && (T4 == 0)

    % Type1 data:

    sub_T1 = 1;

    subnum_T1 = 0;

    Power_T1 = 0;
    
    LatLongAlt_T1=0;

    hub_T1 = 0;

    rotrad_T1 = 0;

    cutin_T1 = 0;

    cutout_T1 = 0;

    rated_T1 = 0;

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T1',Parameters_T1);

    % Type2 Data:
    sub_T2 = get(handles.sub_T2, 'String');
    sub_T2 = str2double(sub_T2);

    subnum_T2 = get(handles.subnum_T2, 'String');
    subnum_T2 = strread(subnum_T2, '%f', 'delimiter', ',');
    subnum_T2 = subnum_T2';

    hub_T2 = get(handles.hub_T2, 'String');
    hub_T2 = strread(hub_T2, '%f', 'delimiter', ',');
    hub_T2 = hub_T2';

   rotrad_T2 = get(handles.rotrad_T2, 'String');
   rotrad_T2 = strread(rotrad_T2, '%f', 'delimiter', ',');
   rotrad_T2 = rotrad_T2';         

   cutin_T2 = get(handles.cutin_T2, 'String');
   cutin_T2 = strread(cutin_T2, '%f', 'delimiter', ',');
   cutin_T2 = cutin_T2'; 

   cutout_T2 = get(handles.cutout_T2, 'String');
   cutout_T2 = strread(cutout_T2, '%f', 'delimiter', ',');
   cutout_T2 = cutout_T2';

   rated_T2 = 0;

    Power_T2 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T2');
    
 
       
       LatLongAlt_T2=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T2');
       
   

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T2',Parameters_T2);

    % Type3 data:

    sub_T3 = 1;

    subnum_T3 = 0;

    Power_T3 = 0;
    
    LatLongAlt_T3=0;

    hub_T3 = 0;

    rotrad_T3 = 0;

    cutin_T3 = 0;

    cutout_T3 = 0;

    rated_T3 = 0;

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T3',Parameters_T3);

    % Type4 data:

    sub_T4 = 1;

    subnum_T4 = 0;

    Power_T4 = 0;
    
    LatLongAlt_T4=0;

    hub_T4 = 0;

    rotrad_T4 = 0;

    cutin_T4 = 0;

    cutout_T4 = 0;

    rated_T4 = 0;

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_PlantInfo_GUI,'AllParameters', AllParameters);

elseif (T1 == 1) && (T2 == 1) && (T3 == 0) && (T4 == 0)

    % Type1 Data:
    sub_T1 = get(handles.sub_T1, 'String');
    sub_T1 = str2double(sub_T1);

    subnum_T1 = get(handles.subnum_T1, 'String');
    subnum_T1 = strread(subnum_T1, '%f', 'delimiter', ',');
    subnum_T1 = subnum_T1';

    hub_T1 = get(handles.hub_T1, 'String');
    hub_T1 = strread(hub_T1, '%f', 'delimiter', ',');
    hub_T1 = hub_T1';

   rotrad_T1 = get(handles.rotrad_T1, 'String');
   rotrad_T1 = strread(rotrad_T1, '%f', 'delimiter', ',');
   rotrad_T1 = rotrad_T1';         

   cutin_T1 = get(handles.cutin_T1, 'String');
   cutin_T1 = strread(cutin_T1, '%f', 'delimiter', ',');
   cutin_T1 = cutin_T1'; 

   cutout_T1 = get(handles.cutout_T1, 'String');
   cutout_T1 = strread(cutout_T1, '%f', 'delimiter', ',');
   cutout_T1 = cutout_T1';

   rated_T1 = 0;

    Power_T1 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T1');
    

       
       LatLongAlt_T1=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T1');
       
   

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T1',Parameters_T1);

    % Type2 Data:
    sub_T2 = get(handles.sub_T2, 'String');
    sub_T2 = str2double(sub_T2);

    subnum_T2 = get(handles.subnum_T2, 'String');
    subnum_T2 = strread(subnum_T2, '%f', 'delimiter', ',');
    subnum_T2 = subnum_T2';

    hub_T2 = get(handles.hub_T2, 'String');
    hub_T2 = strread(hub_T2, '%f', 'delimiter', ',');
    hub_T2 = hub_T2';

   rotrad_T2 = get(handles.rotrad_T2, 'String');
   rotrad_T2 = strread(rotrad_T2, '%f', 'delimiter', ',');
   rotrad_T2 = rotrad_T2';         

   cutin_T2 = get(handles.cutin_T2, 'String');
   cutin_T2 = strread(cutin_T2, '%f', 'delimiter', ',');
   cutin_T2 = cutin_T2'; 

   cutout_T2 = get(handles.cutout_T2, 'String');
   cutout_T2 = strread(cutout_T2, '%f', 'delimiter', ',');
   cutout_T2 = cutout_T2';

   rated_T2 = 0;

    Power_T2 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T2');
    
      
       LatLongAlt_T2=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T2');
       

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T2',Parameters_T2);

    % Type3 data:

    sub_T3 = 1;

    subnum_T3 = 0;

    Power_T3 = 0;
    
    LatLongAlt_T3=0;

    hub_T3 = 0;

    rotrad_T3 = 0;

    cutin_T3 = 0;

    cutout_T3 = 0;

    rated_T3 = 0;

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T3',Parameters_T3);

    % Type4 data:

    sub_T4 = 1;

    subnum_T4 = 0;

    Power_T4 = 0;
    
    LatLongAlt_T4=0;

    hub_T4 = 0;

    rotrad_T4 = 0;

    cutin_T4 = 0;

    cutout_T4 = 0;

    rated_T4 = 0;

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_PlantInfo_GUI,'AllParameters', AllParameters);

elseif (T1 == 0) && (T2 == 0) && (T3 == 1) && (T4 == 0)

    % Type1 data:

    sub_T1 = 1;

    subnum_T1 = 0;

    Power_T1 = 0;
    
    LatLongAlt_T1=0;

    hub_T1 = 0;

    rotrad_T1 = 0;

    cutin_T1 = 0;

    cutout_T1 = 0;

    rated_T1 = 0;

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T1',Parameters_T1);

    % Type2 data:

    sub_T2 = 1;

    subnum_T2 = 0;

    Power_T2 = 0;
    
    LatLongAlt_T2=0;

    hub_T2 = 0;

    rotrad_T2 = 0;

    cutin_T2 = 0;

    cutout_T2 = 0;

    rated_T2 = 0;

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T2',Parameters_T2);

    % Type3 Data:
    sub_T3 = get(handles.sub_T3, 'String');
    sub_T3 = str2double(sub_T3);

    subnum_T3 = get(handles.subnum_T3, 'String');
    subnum_T3 = strread(subnum_T3, '%f', 'delimiter', ',');
    subnum_T3 = subnum_T3';

    hub_T3 = get(handles.hub_T3, 'String');
    hub_T3 = strread(hub_T3, '%f', 'delimiter', ',');
    hub_T3 = hub_T3';

   rotrad_T3 = get(handles.rotrad_T3, 'String');
   rotrad_T3 = strread(rotrad_T3, '%f', 'delimiter', ',');
   rotrad_T3 = rotrad_T3';         

   cutin_T3 = get(handles.cutin_T3, 'String');
   cutin_T3 = strread(cutin_T3, '%f', 'delimiter', ',');
   cutin_T3 = cutin_T3'; 

   cutout_T3 = get(handles.cutout_T3, 'String');
   cutout_T3 = strread(cutout_T3, '%f', 'delimiter', ',');
   cutout_T3 = cutout_T3';

   rated_T3 = 0;

    Power_T3 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T3');
    
  

    LatLongAlt_T3=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T3');



    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T3',Parameters_T3);

    % Type4 data:

    sub_T4 = 1;

    subnum_T4 = 0;

    Power_T4 = 0;
    
    LatLongAlt_T4=0;

    hub_T4 = 0;

    rotrad_T4 = 0;

    cutin_T4 = 0;

    cutout_T4 = 0;

    rated_T4 = 0;

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_PlantInfo_GUI,'AllParameters', AllParameters);

elseif (T1 == 1) && (T2 == 0) && (T3 == 1) && (T4 == 0)

    % Type1 Data:
    sub_T1 = get(handles.sub_T1, 'String');
    sub_T1 = str2double(sub_T1);

    subnum_T1 = get(handles.subnum_T1, 'String');
    subnum_T1 = strread(subnum_T1, '%f', 'delimiter', ',');
    subnum_T1 = subnum_T1';

    hub_T1 = get(handles.hub_T1, 'String');
    hub_T1 = strread(hub_T1, '%f', 'delimiter', ',');
    hub_T1 = hub_T1';

   rotrad_T1 = get(handles.rotrad_T1, 'String');
   rotrad_T1 = strread(rotrad_T1, '%f', 'delimiter', ',');
   rotrad_T1 = rotrad_T1';         

   cutin_T1 = get(handles.cutin_T1, 'String');
   cutin_T1 = strread(cutin_T1, '%f', 'delimiter', ',');
   cutin_T1 = cutin_T1'; 

   cutout_T1 = get(handles.cutout_T1, 'String');
   cutout_T1 = strread(cutout_T1, '%f', 'delimiter', ',');
   cutout_T1 = cutout_T1';

   rated_T1 = 0;

    Power_T1 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T1');
    


    LatLongAlt_T1=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T1');

 

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T1',Parameters_T1);

    % Type2 data:

    sub_T2 = 1;

    subnum_T2 = 0;

    Power_T2 = 0;
    
    LatLongAlt_T2=0;

    hub_T2 = 0;

    rotrad_T2 = 0;

    cutin_T2 = 0;

    cutout_T2 = 0;

    rated_T2 = 0;

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T2',Parameters_T2);

    % Type3 Data:
    sub_T3 = get(handles.sub_T3, 'String');
    sub_T3 = str2double(sub_T3);

    subnum_T3 = get(handles.subnum_T3, 'String');
    subnum_T3 = strread(subnum_T3, '%f', 'delimiter', ',');
    subnum_T3 = subnum_T3';

    hub_T3 = get(handles.hub_T3, 'String');
    hub_T3 = strread(hub_T3, '%f', 'delimiter', ',');
    hub_T3 = hub_T3';

   rotrad_T3 = get(handles.rotrad_T3, 'String');
   rotrad_T3 = strread(rotrad_T3, '%f', 'delimiter', ',');
   rotrad_T3 = rotrad_T3';         

   cutin_T3= get(handles.cutin_T3, 'String');
   cutin_T3 = strread(cutin_T3, '%f', 'delimiter', ',');
   cutin_T3 = cutin_T3'; 

   cutout_T3 = get(handles.cutout_T3, 'String');
   cutout_T3 = strread(cutout_T3, '%f', 'delimiter', ',');
   cutout_T3 = cutout_T3';

   rated_T3 = 0;


    Power_T3 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T3');
    
 

    LatLongAlt_T3=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T3');
   

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T3',Parameters_T3);

    % Type4 data:

    sub_T4 = 1;

    subnum_T4 = 0;

    Power_T4 = 0;
    
    LatLongAlt_T4=0;

    hub_T4 = 0;

    rotrad_T4 = 0;

    cutin_T4 = 0;

    cutout_T4 = 0;

    rated_T4 = 0;

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_PlantInfo_GUI,'AllParameters', AllParameters);

elseif (T1 == 0) && (T2 == 1) && (T3 == 1) && (T4 == 0)

    % Type1 data:

    sub_T1 = 1;

    subnum_T1 = 0;

    Power_T1 = 0;
    
    LatLongAlt_T1=0;

    hub_T1 = 0;

    rotrad_T1 = 0;

    cutin_T1 = 0;

    cutout_T1 = 0;

    rated_T1 = 0;

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T1',Parameters_T1);

    % Type2 Data:
    sub_T2 = get(handles.sub_T2, 'String');
    sub_T2 = str2double(sub_T2);

    subnum_T2 = get(handles.subnum_T2, 'String');
    subnum_T2 = strread(subnum_T2, '%f', 'delimiter', ',');
    subnum_T2 = subnum_T2';

    hub_T2 = get(handles.hub_T2, 'String');
    hub_T2 = strread(hub_T2, '%f', 'delimiter', ',');
    hub_T2 = hub_T2';

   rotrad_T2 = get(handles.rotrad_T2, 'String');
   rotrad_T2 = strread(rotrad_T2, '%f', 'delimiter', ',');
   rotrad_T2 = rotrad_T2';         

   cutin_T2= get(handles.cutin_T2, 'String');
   cutin_T2 = strread(cutin_T2, '%f', 'delimiter', ',');
   cutin_T2 = cutin_T2'; 

   cutout_T2 = get(handles.cutout_T2, 'String');
   cutout_T2 = strread(cutout_T2, '%f', 'delimiter', ',');
   cutout_T2 = cutout_T2';

   rated_T2 = 0;

    Power_T2 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T2');
    


    LatLongAlt_T2=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T2');

      

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T2',Parameters_T2);

    % Type3 Data:
    sub_T3 = get(handles.sub_T3, 'String');
    sub_T3 = str2double(sub_T3);

    subnum_T3 = get(handles.subnum_T3, 'String');
    subnum_T3 = strread(subnum_T3, '%f', 'delimiter', ',');
    subnum_T3 = subnum_T3';

    hub_T3 = get(handles.hub_T3, 'String');
    hub_T3 = strread(hub_T3, '%f', 'delimiter', ',');
    hub_T3 = hub_T3';

   rotrad_T3 = get(handles.rotrad_T3, 'String');
   rotrad_T3 = strread(rotrad_T3, '%f', 'delimiter', ',');
   rotrad_T3 = rotrad_T3';         

   cutin_T3= get(handles.cutin_T3, 'String');
   cutin_T3 = strread(cutin_T3, '%f', 'delimiter', ',');
   cutin_T3 = cutin_T3'; 

   cutout_T3 = get(handles.cutout_T3, 'String');
   cutout_T3 = strread(cutout_T3, '%f', 'delimiter', ',');
   cutout_T3 = cutout_T3';

   rated_T3 = 0;


    Power_T3 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T3');
    


    LatLongAlt_T3=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T3');

   

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T3',Parameters_T3);

    % Type4 data:

    sub_T4 = 1;

    subnum_T4 = 0;

    Power_T4 = 0;
    
    LatLongAlt_T4=0;

    hub_T4 = 0;

    rotrad_T4 = 0;

    cutin_T4 = 0;

    cutout_T4 = 0;

    rated_T4 = 0;

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_PlantInfo_GUI,'AllParameters', AllParameters);

elseif (T1 == 1) && (T2 == 1) && (T3 == 1) && (T4 == 0)

    % Type1 Data:
    sub_T1 = get(handles.sub_T1, 'String');
    sub_T1 = str2double(sub_T1);

    subnum_T1 = get(handles.subnum_T1, 'String');
    subnum_T1 = strread(subnum_T1, '%f', 'delimiter', ',');
    subnum_T1 = subnum_T1';

    hub_T1 = get(handles.hub_T1, 'String');
    hub_T1 = strread(hub_T1, '%f', 'delimiter', ',');
    hub_T1 = hub_T1';

   rotrad_T1 = get(handles.rotrad_T1, 'String');
   rotrad_T1 = strread(rotrad_T1, '%f', 'delimiter', ',');
   rotrad_T1 = rotrad_T1';         

   cutin_T1= get(handles.cutin_T1, 'String');
   cutin_T1 = strread(cutin_T1, '%f', 'delimiter', ',');
   cutin_T1 = cutin_T1'; 

   cutout_T1 = get(handles.cutout_T1, 'String');
   cutout_T1 = strread(cutout_T1, '%f', 'delimiter', ',');
   cutout_T1 = cutout_T1';

   rated_T1 = 0;

    Power_T1 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T1');
    


    LatLongAlt_T1=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T1');



    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T1',Parameters_T1);

    % Type2 Data:
    sub_T2 = get(handles.sub_T2, 'String');
    sub_T2 = str2double(sub_T2);

    subnum_T2 = get(handles.subnum_T2, 'String');
    subnum_T2 = strread(subnum_T2, '%f', 'delimiter', ',');
    subnum_T2 = subnum_T2';

    hub_T2 = get(handles.hub_T2, 'String');
    hub_T2 = strread(hub_T2, '%f', 'delimiter', ',');
    hub_T2 = hub_T2';

   rotrad_T2 = get(handles.rotrad_T2, 'String');
   rotrad_T2 = strread(rotrad_T2, '%f', 'delimiter', ',');
   rotrad_T2 = rotrad_T2';         

   cutin_T2= get(handles.cutin_T2, 'String');
   cutin_T2 = strread(cutin_T2, '%f', 'delimiter', ',');
   cutin_T2 = cutin_T2'; 

   cutout_T2 = get(handles.cutout_T2, 'String');
   cutout_T2 = strread(cutout_T2, '%f', 'delimiter', ',');
   cutout_T2 = cutout_T2';

   rated_T2 = 0;

    Power_T2 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T2');
    


    LatLongAlt_T2=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T2');



    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T2',Parameters_T2);

    % Type3 Data:
    sub_T3 = get(handles.sub_T3, 'String');
    sub_T3 = str2double(sub_T3);

    subnum_T3 = get(handles.subnum_T3, 'String');
    subnum_T3 = strread(subnum_T3, '%f', 'delimiter', ',');
    subnum_T3 = subnum_T3';

    hub_T3 = get(handles.hub_T3, 'String');
    hub_T3 = strread(hub_T3, '%f', 'delimiter', ',');
    hub_T3 = hub_T3';

   rotrad_T3 = get(handles.rotrad_T3, 'String');
   rotrad_T3 = strread(rotrad_T3, '%f', 'delimiter', ',');
   rotrad_T3 = rotrad_T3';         

   cutin_T3= get(handles.cutin_T3, 'String');
   cutin_T3 = strread(cutin_T3, '%f', 'delimiter', ',');
   cutin_T3 = cutin_T3'; 

   cutout_T3 = get(handles.cutout_T3, 'String');
   cutout_T3 = strread(cutout_T3, '%f', 'delimiter', ',');
   cutout_T3 = cutout_T3';

   rated_T3 = 0;

    Power_T3 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T3');
    

    LatLongAlt_T3=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T3');
 

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T3',Parameters_T3);

    % Type4 data:

    sub_T4 = 1;

    subnum_T4 = 0;

    Power_T4 = 0;
    
    LatLongAlt_T4=0;

    hub_T4 = 0;

    rotrad_T4 = 0;

    cutin_T4 = 0;

    rated_T4 = 0;

    cutout_T4 = 0;

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_PlantInfo_GUI,'AllParameters', AllParameters);

elseif (T1 == 0) && (T2 == 0) && (T3 == 0) && (T4 == 1)

    % Type1 data:

    sub_T1 = 1;

    subnum_T1 = 0;

    Power_T1 = 0;
    
    LatLongAlt_T1=0;

    hub_T1 = 0;

    rotrad_T1 = 0;

    cutin_T1 = 0;

    rated_T1 = 0;

    cutout_T1 = 0;

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T1',Parameters_T1);

    % Type2 data:

    sub_T2 = 1;

    subnum_T2 = 0;

    Power_T2 = 0;
    
    LatLongAlt_T2=0;

    hub_T2 = 0;

    rotrad_T2 = 0;

    cutin_T2 = 0;

    rated_T2 = 0;

    cutout_T2 = 0;

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T2',Parameters_T2);

    % Type3 data:

    sub_T3 = 1;

    subnum_T3 = 0;

    Power_T3 = 0;
    
    LatLongAlt_T3=0;

    hub_T3 = 0;

    rotrad_T3 = 0;

    cutin_T3 = 0;

    rated_T3 = 0;

    cutout_T3 = 0;

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T3',Parameters_T3);

    % Type4 Data:
    sub_T4 = get(handles.sub_T4, 'String');
    sub_T4 = str2double(sub_T4);

    subnum_T4 = get(handles.subnum_T4, 'String');
    subnum_T4 = strread(subnum_T4, '%f', 'delimiter', ',');
    subnum_T4 = subnum_T4';

    hub_T4 = get(handles.hub_T4, 'String');
    hub_T4 = strread(hub_T4, '%f', 'delimiter', ',');
    hub_T4 = hub_T4';

   rotrad_T4 = get(handles.rotrad_T4, 'String');
   rotrad_T4 = strread(rotrad_T4, '%f', 'delimiter', ',');
   rotrad_T4 = rotrad_T4';         

   cutin_T4= get(handles.cutin_T4, 'String');
   cutin_T4 = strread(cutin_T4, '%f', 'delimiter', ',');
   cutin_T4 = cutin_T4'; 

   cutout_T4 = get(handles.cutout_T4, 'String');
   cutout_T4 = strread(cutout_T4, '%f', 'delimiter', ',');
   cutout_T4 = cutout_T4';

   rated_T4 = 0;

    Power_T4 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T4');
    


    LatLongAlt_T4=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T4');

  

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_PlantInfo_GUI,'AllParameters', AllParameters);

elseif (T1 == 1) && (T2 == 0) && (T3 == 0) && (T4 == 1)

    % Type1 Data:
    sub_T1 = get(handles.sub_T1, 'String');
    sub_T1 = str2double(sub_T1);

    subnum_T1 = get(handles.subnum_T1, 'String');
    subnum_T1 = strread(subnum_T1, '%f', 'delimiter', ',');
    subnum_T1 = subnum_T1';

    hub_T1 = get(handles.hub_T1, 'String');
    hub_T1 = strread(hub_T1, '%f', 'delimiter', ',');
    hub_T1 = hub_T1';

   rotrad_T1 = get(handles.rotrad_T1, 'String');
   rotrad_T1 = strread(rotrad_T1, '%f', 'delimiter', ',');
   rotrad_T1 = rotrad_T1';            

   cutin_T1= get(handles.cutin_T1, 'String');
   cutin_T1 = strread(cutin_T1, '%f', 'delimiter', ',');
   cutin_T1 = cutin_T1'; 

   cutout_T1 = get(handles.cutout_T1, 'String');
   cutout_T1 = strread(cutout_T1, '%f', 'delimiter', ',');
   cutout_T1 = cutout_T1';

   rated_T1 = 0;

    Power_T1 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T1');
    


    LatLongAlt_T1=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T1');

    

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T1',Parameters_T1);

    % Type2 data:

    sub_T2 = 1;

    subnum_T2 = 0;

    Power_T2 = 0;
    
    LatLongAlt_T2=0;

    hub_T2 = 0;

    rotrad_T2 = 0;

    cutin_T2 = 0;

    rated_T2 = 0;

    cutout_T2 = 0;

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T2',Parameters_T2);

    % Type3 data:

    sub_T3 = 1;

    subnum_T3 = 0;

    Power_T3 = 0;
    
    LatLongAlt_T3=0;

    hub_T3 = 0;

    rotrad_T3 = 0;

    cutin_T3 = 0;

    rated_T3 = 0;

    cutout_T3 = 0;

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T3',Parameters_T3);

    % Type4 Data:
    sub_T4 = get(handles.sub_T4, 'String');
    sub_T4 = str2double(sub_T4);

    subnum_T4 = get(handles.subnum_T4, 'String');
    subnum_T4 = strread(subnum_T4, '%f', 'delimiter', ',');
    subnum_T4 = subnum_T4';

    hub_T4 = get(handles.hub_T4, 'String');
    hub_T4 = strread(hub_T4, '%f', 'delimiter', ',');
    hub_T4 = hub_T4';

   rotrad_T4 = get(handles.rotrad_T4, 'String');
   rotrad_T4 = strread(rotrad_T4, '%f', 'delimiter', ',');
   rotrad_T4 = rotrad_T4';            

   cutin_T4= get(handles.cutin_T4, 'String');
   cutin_T4 = strread(cutin_T4, '%f', 'delimiter', ',');
   cutin_T4 = cutin_T4'; 

   cutout_T4 = get(handles.cutout_T4, 'String');
   cutout_T4 = strread(cutout_T4, '%f', 'delimiter', ',');
   cutout_T4 = cutout_T4';

   rated_T4 = 0;


    Power_T4 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T4');
    


    LatLongAlt_T4=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T4');

  

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_PlantInfo_GUI,'AllParameters', AllParameters);

elseif (T1 == 0) && (T2 == 1) && (T3 == 0) && (T4 == 1)

    % Type1 data:

    sub_T1 = 1;

    subnum_T1 = 0;

    Power_T1 = 0;
    
    LatLongAlt_T1=0;

    hub_T1 = 0;

    rotrad_T1 = 0;

    cutin_T1 = 0;

    rated_T1 = 0;

    cutout_T1 = 0;

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T1',Parameters_T1);

    % Type2 Data:
    sub_T2 = get(handles.sub_T2, 'String');
    sub_T2 = str2double(sub_T2);

    subnum_T2 = get(handles.subnum_T2, 'String');
    subnum_T2 = strread(subnum_T2, '%f', 'delimiter', ',');
    subnum_T2 = subnum_T2';

    hub_T2 = get(handles.hub_T2, 'String');
    hub_T2 = strread(hub_T2, '%f', 'delimiter', ',');
    hub_T2 = hub_T2';

   rotrad_T2 = get(handles.rotrad_T2, 'String');
   rotrad_T2 = strread(rotrad_T2, '%f', 'delimiter', ',');
   rotrad_T2 = rotrad_T2';            

   cutin_T2= get(handles.cutin_T2, 'String');
   cutin_T2 = strread(cutin_T2, '%f', 'delimiter', ',');
   cutin_T2 = cutin_T2'; 

   cutout_T2 = get(handles.cutout_T2, 'String');
   cutout_T2 = strread(cutout_T2, '%f', 'delimiter', ',');
   cutout_T2 = cutout_T2';

   rated_T2 = 0;

    Power_T2 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T2');
    


    LatLongAlt_T2=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T2');



    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T2',Parameters_T2);

    % Type3 data:

    sub_T3 = 1;

    subnum_T3 = 0;

    Power_T3 = 0;
    
    LatLongAlt_T3=0;

    hub_T3 = 0;

    rotrad_T3 = 0;

    cutin_T3 = 0;

    rated_T3 = 0;

    cutout_T3 = 0;

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T3',Parameters_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3);

    % Type4 Data:
    sub_T4 = get(handles.sub_T4, 'String');
    sub_T4 = str2double(sub_T4);

    subnum_T4 = get(handles.subnum_T4, 'String');
    subnum_T4 = strread(subnum_T4, '%f', 'delimiter', ',');
    subnum_T4 = subnum_T4';

    hub_T4 = get(handles.hub_T4, 'String');
    hub_T4 = strread(hub_T4, '%f', 'delimiter', ',');
    hub_T4 = hub_T4';

   rotrad_T4 = get(handles.rotrad_T4, 'String');
   rotrad_T4 = strread(rotrad_T4, '%f', 'delimiter', ',');
   rotrad_T4 = rotrad_T4';            

   cutin_T4= get(handles.cutin_T4, 'String');
   cutin_T4 = strread(cutin_T4, '%f', 'delimiter', ',');
   cutin_T4 = cutin_T4'; 

   cutout_T4 = get(handles.cutout_T4, 'String');
   cutout_T4 = strread(cutout_T4, '%f', 'delimiter', ',');
   cutout_T4 = cutout_T4';

   rated_T4 = 0;

    Power_T4 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T4');
    


    LatLongAlt_T4=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T4');



    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_PlantInfo_GUI,'AllParameters', AllParameters);

elseif (T1 == 1) && (T2 == 1) && (T3 == 0) && (T4 == 1)

    % Type1 Data:
    sub_T1 = get(handles.sub_T1, 'String');
    sub_T1 = str2double(sub_T1);

    subnum_T1 = get(handles.subnum_T1, 'String');
    subnum_T1 = strread(subnum_T1, '%f', 'delimiter', ',');
    subnum_T1 = subnum_T1';

    hub_T1 = get(handles.hub_T1, 'String');
    hub_T1 = strread(hub_T1, '%f', 'delimiter', ',');
    hub_T1 = hub_T1';

   rotrad_T1 = get(handles.rotrad_T1, 'String');
   rotrad_T1 = strread(rotrad_T1, '%f', 'delimiter', ',');
   rotrad_T1 = rotrad_T1';            

   cutin_T1= get(handles.cutin_T1, 'String');
   cutin_T1 = strread(cutin_T1, '%f', 'delimiter', ',');
   cutin_T1 = cutin_T1'; 

   cutout_T1 = get(handles.cutout_T1, 'String');
   cutout_T1 = strread(cutout_T1, '%f', 'delimiter', ',');
   cutout_T1 = cutout_T1';

   rated_T1 = 0;

    Power_T1 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T1');
    


    LatLongAlt_T1=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T1');

 

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T1',Parameters_T1);

    % Type2 Data:
    sub_T2 = get(handles.sub_T2, 'String');
    sub_T2 = str2double(sub_T2);

    subnum_T2 = get(handles.subnum_T2, 'String');
    subnum_T2 = strread(subnum_T2, '%f', 'delimiter', ',');
    subnum_T2 = subnum_T2';

    hub_T2 = get(handles.hub_T2, 'String');
    hub_T2 = strread(hub_T2, '%f', 'delimiter', ',');
    hub_T2 = hub_T2';

   rotrad_T2 = get(handles.rotrad_T2, 'String');
   rotrad_T2 = strread(rotrad_T2, '%f', 'delimiter', ',');
   rotrad_T2 = rotrad_T2';            

   cutin_T2= get(handles.cutin_T2, 'String');
   cutin_T2 = strread(cutin_T2, '%f', 'delimiter', ',');
   cutin_T2 = cutin_T2'; 

   cutout_T2 = get(handles.cutout_T2, 'String');
   cutout_T2 = strread(cutout_T2, '%f', 'delimiter', ',');
   cutout_T2 = cutout_T2';

   rated_T2 = 0;

    Power_T2 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T2');
    


    LatLongAlt_T2=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T2');

   

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T2',Parameters_T2);

    % Type3 data:

    sub_T3 = 1;

    subnum_T3 = 0;

    Power_T3 = 0;
    
    LatLongAlt_T3=0;

    hub_T3 = 0;

    rotrad_T3 = 0;

    cutin_T3 = 0;

    rated_T3 = 0;

    cutout_T3 = 0;       


    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T3',Parameters_T3);

    % Type4 Data:
    sub_T4 = get(handles.sub_T4, 'String');
    sub_T4 = str2double(sub_T4);

    subnum_T4 = get(handles.subnum_T4, 'String');
    subnum_T4 = strread(subnum_T4, '%f', 'delimiter', ',');
    subnum_T4 = subnum_T4';

    hub_T4 = get(handles.hub_T4, 'String');
    hub_T4 = strread(hub_T4, '%f', 'delimiter', ',');
    hub_T4 = hub_T4';

   rotrad_T4 = get(handles.rotrad_T4, 'String');
   rotrad_T4 = strread(rotrad_T4, '%f', 'delimiter', ',');
   rotrad_T4 = rotrad_T4';            

   cutin_T4= get(handles.cutin_T4, 'String');
   cutin_T4 = strread(cutin_T4, '%f', 'delimiter', ',');
   cutin_T4 = cutin_T4'; 

   cutout_T4 = get(handles.cutout_T4, 'String');
   cutout_T4 = strread(cutout_T4, '%f', 'delimiter', ',');
   cutout_T4 = cutout_T4';

   rated_T4 = 0;


    Power_T4 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T4');
    

    LatLongAlt_T4=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T4');

  

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_PlantInfo_GUI,'AllParameters', AllParameters);

elseif (T1 == 0) && (T2 == 0) && (T3 == 1) && (T4 == 1)

    % Type1 data:

    sub_T1 = 1;

    subnum_T1 = 0;

    Power_T1 = 0;
    
    LatLongAlt_T1=0;

    hub_T1 = 0;

    rotrad_T1 = 0;

    cutin_T1 = 0;

    rated_T1 = 0;

    cutout_T1 = 0; 

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T1',Parameters_T1);

    % Type2 data:

    sub_T2 = 1;

    subnum_T2 = 0;

    Power_T2 = 0;
    
    LatLongAlt_T2=0;

    hub_T2 = 0;

    rotrad_T2 = 0;

    cutin_T2 = 0;

    rated_T2 = 0;

    cutout_T2 = 0; 

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T2',Parameters_T2);

    % Type3 Data:
    sub_T3 = get(handles.sub_T3, 'String');
    sub_T3 = str2double(sub_T3);

    subnum_T3 = get(handles.subnum_T3, 'String');
    subnum_T3 = strread(subnum_T3, '%f', 'delimiter', ',');
    subnum_T3 = subnum_T3';

    hub_T3 = get(handles.hub_T3, 'String');
    hub_T3 = strread(hub_T3, '%f', 'delimiter', ',');
    hub_T3 = hub_T3';

   rotrad_T3 = get(handles.rotrad_T3, 'String');
   rotrad_T3 = strread(rotrad_T3, '%f', 'delimiter', ',');
   rotrad_T3 = rotrad_T3';            

   cutin_T3= get(handles.cutin_T3, 'String');
   cutin_T3 = strread(cutin_T3, '%f', 'delimiter', ',');
   cutin_T3 = cutin_T3'; 

   cutout_T3 = get(handles.cutout_T3, 'String');
   cutout_T3 = strread(cutout_T3, '%f', 'delimiter', ',');
   cutout_T3 = cutout_T3';

   rated_T3 = 0;

    Power_T3 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T3');
    


    LatLongAlt_T3=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T3');

  

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T3',Parameters_T3);

    % Type4 Data:
    sub_T4 = get(handles.sub_T4, 'String');
    sub_T4 = str2double(sub_T4);

    subnum_T4 = get(handles.subnum_T4, 'String');
    subnum_T4 = strread(subnum_T4, '%f', 'delimiter', ',');
    subnum_T4 = subnum_T4';

    hub_T4 = get(handles.hub_T4, 'String');
    hub_T4 = strread(hub_T4, '%f', 'delimiter', ',');
    hub_T4 = hub_T4';

   rotrad_T4 = get(handles.rotrad_T4, 'String');
   rotrad_T4 = strread(rotrad_T4, '%f', 'delimiter', ',');
   rotrad_T4 = rotrad_T4';            

   cutin_T4= get(handles.cutin_T4, 'String');
   cutin_T4 = strread(cutin_T4, '%f', 'delimiter', ',');
   cutin_T4 = cutin_T4'; 

   cutout_T4 = get(handles.cutout_T4, 'String');
   cutout_T4 = strread(cutout_T4, '%f', 'delimiter', ',');
   cutout_T4 = cutout_T4';

   rated_T4 = 0;

    Power_T4 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T4');
    


    LatLongAlt_T4=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T4');

  

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_PlantInfo_GUI,'AllParameters', AllParameters);

elseif (T1 == 1) && (T2 == 0) && (T3 == 1) && (T4 == 1)

    % Type1 Data:
    sub_T1 = get(handles.sub_T1, 'String');
    sub_T1 = str2double(sub_T1);

    subnum_T1 = get(handles.subnum_T1, 'String');
    subnum_T1 = strread(subnum_T1, '%f', 'delimiter', ',');
    subnum_T1 = subnum_T1';

    hub_T1 = get(handles.hub_T1, 'String');
    hub_T1 = strread(hub_T1, '%f', 'delimiter', ',');
    hub_T1 = hub_T1';

   rotrad_T1 = get(handles.rotrad_T1, 'String');
   rotrad_T1 = strread(rotrad_T1, '%f', 'delimiter', ',');
   rotrad_T1 = rotrad_T1';            

   cutin_T1= get(handles.cutin_T1, 'String');
   cutin_T1 = strread(cutin_T1, '%f', 'delimiter', ',');
   cutin_T1 = cutin_T1'; 

   cutout_T1 = get(handles.cutout_T1, 'String');
   cutout_T1 = strread(cutout_T1, '%f', 'delimiter', ',');
   cutout_T1 = cutout_T1';

   rated_T1 = 0;

    Power_T1 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T1');
 

    LatLongAlt_T1=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T1');


    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T1',Parameters_T1);

    % Type2 data:

    sub_T2 = 1;

    subnum_T2 = 0;

    Power_T2 = 0;
    
    LatLongAlt_T2=0;

    hub_T2 = 0;

    rotrad_T2 = 0;

    cutin_T2 = 0;

    rated_T2 = 0;

    cutout_T2 = 0; 

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T2',Parameters_T2);


    % Type3 Data:
    sub_T3 = get(handles.sub_T3, 'String');
    sub_T3 = str2double(sub_T3);

    subnum_T3 = get(handles.subnum_T3, 'String');
    subnum_T3 = strread(subnum_T3, '%f', 'delimiter', ',');
    subnum_T3 = subnum_T3';

    hub_T3 = get(handles.hub_T3, 'String');
    hub_T3 = strread(hub_T3, '%f', 'delimiter', ',');
    hub_T3 = hub_T3';

   rotrad_T3 = get(handles.rotrad_T3, 'String');
   rotrad_T3 = strread(rotrad_T3, '%f', 'delimiter', ',');
   rotrad_T3 = rotrad_T3';            

   cutin_T3= get(handles.cutin_T3, 'String');
   cutin_T3 = strread(cutin_T3, '%f', 'delimiter', ',');
   cutin_T3 = cutin_T3'; 

   cutout_T3 = get(handles.cutout_T3, 'String');
   cutout_T3 = strread(cutout_T3, '%f', 'delimiter', ',');
   cutout_T3 = cutout_T3';

   rated_T3 = 0;

    Power_T3 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T3');
    


    LatLongAlt_T3=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T3');
     

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T3',Parameters_T3);

    % Type4 Data:
    sub_T4 = get(handles.sub_T4, 'String');
    sub_T4 = str2double(sub_T4);

    subnum_T4 = get(handles.subnum_T4, 'String');
    subnum_T4 = strread(subnum_T4, '%f', 'delimiter', ',');
    subnum_T4 = subnum_T4';

    hub_T4 = get(handles.hub_T4, 'String');
    hub_T4 = strread(hub_T4, '%f', 'delimiter', ',');
    hub_T4 = hub_T4';

   rotrad_T4 = get(handles.rotrad_T4, 'String');
   rotrad_T4 = strread(rotrad_T4, '%f', 'delimiter', ',');
   rotrad_T4 = rotrad_T4';            

   cutin_T4= get(handles.cutin_T4, 'String');
   cutin_T4 = strread(cutin_T4, '%f', 'delimiter', ',');
   cutin_T4 = cutin_T4'; 

   cutout_T4 = get(handles.cutout_T4, 'String');
   cutout_T4 = strread(cutout_T4, '%f', 'delimiter', ',');
   cutout_T4 = cutout_T4';

   rated_T4 = 0;

    Power_T4 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T4');


    LatLongAlt_T4=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T4');
   

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T4',Parameters_T4);

            %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_PlantInfo_GUI,'AllParameters', AllParameters);

elseif (T1 == 0) && (T2 == 1) && (T3 == 1) && (T4 == 1)

    % Type1 data:

    sub_T1 = 1;

    subnum_T1 = 0;

    Power_T1 = 0;
    
    LatLongAlt_T1=0;

    hub_T1 = 0;

    rotrad_T1 = 0;

    cutin_T1 = 0;

    rated_T1 = 0;

    cutout_T1 = 0; 

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};

    setappdata(Wind_PlantInfo_GUI,'Parameters_T1',Parameters_T1);

    % Type2 Data:
    sub_T2 = get(handles.sub_T2, 'String');
    sub_T2 = str2double(sub_T2);

    subnum_T2 = get(handles.subnum_T2, 'String');
    subnum_T2 = strread(subnum_T2, '%f', 'delimiter', ',');
    subnum_T2 = subnum_T2';

    hub_T2 = get(handles.hub_T2, 'String');
    hub_T2 = strread(hub_T2, '%f', 'delimiter', ',');
    hub_T2 = hub_T2';

   rotrad_T2 = get(handles.rotrad_T2, 'String');
   rotrad_T2 = strread(rotrad_T2, '%f', 'delimiter', ',');
   rotrad_T2 = rotrad_T2';            

   cutin_T2= get(handles.cutin_T2, 'String');
   cutin_T2 = strread(cutin_T2, '%f', 'delimiter', ',');
   cutin_T2 = cutin_T2'; 

   cutout_T2 = get(handles.cutout_T2, 'String');
   cutout_T2 = strread(cutout_T2, '%f', 'delimiter', ',');
   cutout_T2 = cutout_T2';

   rated_T2 = 0;

    Power_T2 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T2');
    

    LatLongAlt_T2=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T2');

    

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T2',Parameters_T2);

    % Type3 Data:
    sub_T3 = get(handles.sub_T3, 'String');
    sub_T3 = str2double(sub_T3);

    subnum_T3 = get(handles.subnum_T3, 'String');
    subnum_T3 = strread(subnum_T3, '%f', 'delimiter', ',');
    subnum_T3 = subnum_T3';

    hub_T3 = get(handles.hub_T3, 'String');
    hub_T3 = strread(hub_T3, '%f', 'delimiter', ',');
    hub_T3 = hub_T3';

   rotrad_T3 = get(handles.rotrad_T3, 'String');
   rotrad_T3 = strread(rotrad_T3, '%f', 'delimiter', ',');
   rotrad_T3 = rotrad_T3';            

   cutin_T3= get(handles.cutin_T3, 'String');
   cutin_T3 = strread(cutin_T3, '%f', 'delimiter', ',');
   cutin_T3 = cutin_T3'; 

   cutout_T3 = get(handles.cutout_T3, 'String');
   cutout_T3 = strread(cutout_T3, '%f', 'delimiter', ',');
   cutout_T3 = cutout_T3';

   rated_T3 = 0;

    Power_T3 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T3');
    


    LatLongAlt_T3=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T3');



    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T3',Parameters_T3);

    % Type4 Data:
    sub_T4 = get(handles.sub_T4, 'String');
    sub_T4 = str2double(sub_T4);

    subnum_T4 = get(handles.subnum_T4, 'String');
    subnum_T4 = strread(subnum_T4, '%f', 'delimiter', ',');
    subnum_T4 = subnum_T4';

    hub_T4 = get(handles.hub_T4, 'String');
    hub_T4 = strread(hub_T4, '%f', 'delimiter', ',');
    hub_T4 = hub_T4';

   rotrad_T4 = get(handles.rotrad_T4, 'String');
   rotrad_T4 = strread(rotrad_T4, '%f', 'delimiter', ',');
   rotrad_T4 = rotrad_T4';            

   cutin_T4= get(handles.cutin_T4, 'String');
   cutin_T4 = strread(cutin_T4, '%f', 'delimiter', ',');
   cutin_T4 = cutin_T4'; 

   cutout_T4 = get(handles.cutout_T4, 'String');
   cutout_T4 = strread(cutout_T4, '%f', 'delimiter', ',');
   cutout_T4 = cutout_T4';

   rated_T4 = 0;


    Power_T4 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T4');
    


    LatLongAlt_T4=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T4');

    

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_PlantInfo_GUI,'AllParameters', AllParameters);

elseif (T1 == 1) && (T2 == 1) && (T3 == 1) && (T4 == 1)        

    % Type1 Data:
    sub_T1 = get(handles.sub_T1, 'String');
    sub_T1 = str2double(sub_T1);

    subnum_T1 = get(handles.subnum_T1, 'String');
    subnum_T1 = strread(subnum_T1, '%f', 'delimiter', ',');
    subnum_T1 = subnum_T1';

    hub_T1 = get(handles.hub_T1, 'String');
    hub_T1 = strread(hub_T1, '%f', 'delimiter', ',');
    hub_T1 = hub_T1';

   rotrad_T1 = get(handles.rotrad_T1, 'String');
   rotrad_T1 = strread(rotrad_T1, '%f', 'delimiter', ',');
   rotrad_T1 = rotrad_T1';          

   cutin_T1= get(handles.cutin_T1, 'String');
   cutin_T1 = strread(cutin_T1, '%f', 'delimiter', ',');
   cutin_T1 = cutin_T1'; 

   cutout_T1 = get(handles.cutout_T1, 'String');
   cutout_T1 = strread(cutout_T1, '%f', 'delimiter', ',');
   cutout_T1 = cutout_T1';

   rated_T1 = 0;

    Power_T1 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T1');
    


    LatLongAlt_T1=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T1');
   

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T1',Parameters_T1);

    % Type2 Data:
    sub_T2 = get(handles.sub_T2, 'String');
    sub_T2 = str2double(sub_T2);

    subnum_T2 = get(handles.subnum_T2, 'String');
    subnum_T2 = strread(subnum_T2, '%f', 'delimiter', ',');
    subnum_T2 = subnum_T2';

    hub_T2 = get(handles.hub_T2, 'String');
    hub_T2 = strread(hub_T2, '%f', 'delimiter', ',');
    hub_T2 = hub_T2';

   rotrad_T2 = get(handles.rotrad_T2, 'String');
   rotrad_T2 = strread(rotrad_T2, '%f', 'delimiter', ',');
   rotrad_T2 = rotrad_T2';            

   cutin_T2= get(handles.cutin_T2, 'String');
   cutin_T2 = strread(cutin_T2, '%f', 'delimiter', ',');
   cutin_T2 = cutin_T2'; 

   cutout_T2 = get(handles.cutout_T2, 'String');
   cutout_T2 = strread(cutout_T2, '%f', 'delimiter', ',');
   cutout_T2 = cutout_T2';

   rated_T2 = 0;

    Power_T2 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T2');
    


    LatLongAlt_T2=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T2');

     

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T2',Parameters_T2);

    % Type3 Data:
    sub_T3 = get(handles.sub_T3, 'String');
    sub_T3 = str2double(sub_T3);

    subnum_T3 = get(handles.subnum_T3, 'String');
    subnum_T3 = strread(subnum_T3, '%f', 'delimiter', ',');
    subnum_T3 = subnum_T3';

    hub_T3 = get(handles.hub_T3, 'String');
    hub_T3 = strread(hub_T3, '%f', 'delimiter', ',');
    hub_T3 = hub_T3';

   rotrad_T3 = get(handles.rotrad_T3, 'String');
   rotrad_T3 = strread(rotrad_T3, '%f', 'delimiter', ',');
   rotrad_T3 = rotrad_T3';            

   cutin_T3= get(handles.cutin_T3, 'String');
   cutin_T3 = strread(cutin_T3, '%f', 'delimiter', ',');
   cutin_T3 = cutin_T3'; 

   cutout_T3 = get(handles.cutout_T3, 'String');
   cutout_T3 = strread(cutout_T3, '%f', 'delimiter', ',');
   cutout_T3 = cutout_T3';

   rated_T3 = 0;

    Power_T3 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T3');
    


    LatLongAlt_T3=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T3');

   

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T3',Parameters_T3);

    % Type4 Data:
    sub_T4 = get(handles.sub_T4, 'String');
    sub_T4 = str2double(sub_T4);

    subnum_T4 = get(handles.subnum_T4, 'String');
    subnum_T4 = strread(subnum_T4, '%f', 'delimiter', ',');
    subnum_T4 = subnum_T4';

    hub_T4 = get(handles.hub_T4, 'String');
    hub_T4 = strread(hub_T4, '%f', 'delimiter', ',');
    hub_T4 = hub_T4';

   rotrad_T4 = get(handles.rotrad_T4, 'String');
   rotrad_T4 = strread(rotrad_T4, '%f', 'delimiter', ',');
   rotrad_T4 = rotrad_T4';            

   cutin_T4= get(handles.cutin_T4, 'String');
   cutin_T4 = strread(cutin_T4, '%f', 'delimiter', ',');
   cutin_T4 = cutin_T4'; 

   cutout_T4 = get(handles.cutout_T4, 'String');
   cutout_T4 = strread(cutout_T4, '%f', 'delimiter', ',');
   cutout_T4 = cutout_T4';

   rated_T4 = 0;

    Power_T4 = getappdata(Wind_PlantInfo_GUI,'PowerCurve_T4');
    


    LatLongAlt_T4=getappdata(Wind_PlantInfo_GUI,'LatLongAlt_T4');

    

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};
    setappdata(Wind_PlantInfo_GUI,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4,r1,r2};

    setappdata(Wind_PlantInfo_GUI,'AllParameters', AllParameters);

end

WindLossParameters = getappdata(Wind_Loss_Parameters_GUI,'WindLossParameters');

setappdata(Wind_PlantInfo_GUI,'WindLossParameters', WindLossParameters);

%% Opening Power Curve Graph GUI
Wind_Power_Curve_Graph_GUI ;





% --- Executes on button press in b6.
function b6_Callback(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting the values of Checkboxes and Buttons:

% Resetting:

set(handles.p1, 'Visible', 'on');
set(handles.p2, 'Visible', 'on');
set(handles.p3, 'Visible', 'on');
set(handles.p4, 'Visible', 'on');

set(handles.T1, 'Value', 0);
set(handles.T2, 'Value', 0);
set(handles.T3, 'Value', 0);
set(handles.T4, 'Value', 0);

set(handles.b1, 'Enable', 'off');
set(handles.b2, 'Enable', 'off');
set(handles.b3, 'Enable', 'off');
set(handles.b4, 'Enable', 'off');

%set(handles.b16, 'Enable', 'off');
%set(handles.b9, 'Enable', 'off');
%set(handles.b10, 'Enable', 'off');
%set(handles.b11, 'Enable', 'off');

set(handles.b12, 'Enable', 'off');
set(handles.b13, 'Enable', 'off');
set(handles.b14, 'Enable', 'off');
set(handles.b15, 'Enable', 'off');

set(handles.sub_T1, 'Enable', 'off');
set(handles.sub_T2, 'Enable', 'off');
set(handles.sub_T3, 'Enable', 'off');
set(handles.sub_T4, 'Enable', 'off');

set(handles.subnum_T1, 'Enable', 'off');
set(handles.subnum_T2, 'Enable', 'off');
set(handles.subnum_T3, 'Enable', 'off');
set(handles.subnum_T4, 'Enable', 'off');

set(handles.hub_T1, 'Enable', 'off');
set(handles.hub_T2, 'Enable', 'off');
set(handles.hub_T3, 'Enable', 'off');
set(handles.hub_T4, 'Enable', 'off');

set(handles.rotrad_T1, 'Enable', 'off');
set(handles.rotrad_T2, 'Enable', 'off');
set(handles.rotrad_T3, 'Enable', 'off');
set(handles.rotrad_T4, 'Enable', 'off');

set(handles.cutin_T1, 'Enable', 'off');
set(handles.cutin_T2, 'Enable', 'off');
set(handles.cutin_T3, 'Enable', 'off');
set(handles.cutin_T4, 'Enable', 'off');

set(handles.cutout_T1, 'Enable', 'off');
set(handles.cutout_T2, 'Enable', 'off');
set(handles.cutout_T3, 'Enable', 'off');
set(handles.cutout_T4, 'Enable', 'off');

set(handles.sub_T1, 'String', '');
set(handles.sub_T2, 'String', '');
set(handles.sub_T3, 'String', '');
set(handles.sub_T4, 'String', '');

set(handles.subnum_T1, 'String', '');
set(handles.subnum_T2, 'String', '');
set(handles.subnum_T3, 'String', '');
set(handles.subnum_T4, 'String', '');

set(handles.hub_T1, 'String', '');
set(handles.hub_T2, 'String', '');
set(handles.hub_T3, 'String', '');
set(handles.hub_T4, 'String', '');

set(handles.rotrad_T1, 'String', '');
set(handles.rotrad_T2, 'String', '');
set(handles.rotrad_T3, 'String', '');
set(handles.rotrad_T4, 'String', '');

set(handles.cutin_T1, 'String', '');
set(handles.cutin_T2, 'String', '');
set(handles.cutin_T3, 'String', '');
set(handles.cutin_T4, 'String', '');

set(handles.cutout_T1, 'String', '');
set(handles.cutout_T2, 'String', '');
set(handles.cutout_T3, 'String', '');
set(handles.cutout_T4, 'String', '');

set(handles.b1, 'String', 'WG T1 Data');
set(handles.b2, 'String', 'WG T2 Data');
set(handles.b3, 'String', 'WG T3 Data');
set(handles.b4, 'String', 'WG T4 Data'); 

% --- Executes on button press in b7.
function b7_Callback(hObject, eventdata, ~)
% hObject    handle to b7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing GUI

hf1=findobj('Name','Wind_Loss_Parameters_GUI');
close(hf1);

hf2=findobj('Name','Wake_Model_GUI');
close(hf2);

close;

function subnum_T2_Callback(hObject, eventdata, handles)
% hObject    handle to subnum_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subnum_T2 as text
%        str2double(get(hObject,'String')) returns contents of subnum_T2 as a double


% --- Executes during object creation, after setting all properties.
function subnum_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subnum_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function subnum_T3_Callback(hObject, eventdata, handles)
% hObject    handle to subnum_T3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subnum_T3 as text
%        str2double(get(hObject,'String')) returns contents of subnum_T3 as a double


% --- Executes during object creation, after setting all properties.
function subnum_T3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subnum_T3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function subnum_T4_Callback(hObject, eventdata, handles)
% hObject    handle to subnum_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subnum_T4 as text
%        str2double(get(hObject,'String')) returns contents of subnum_T4 as a double


% --- Executes during object creation, after setting all properties.
function subnum_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subnum_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function subnum_T1_Callback(hObject, eventdata, handles)
% hObject    handle to subnum_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subnum_T1 as text
%        str2double(get(hObject,'String')) returns contents of subnum_T1 as a double


% --- Executes during object creation, after setting all properties.
function subnum_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subnum_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hub_T2_Callback(hObject, eventdata, handles)
% hObject    handle to hub_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hub_T2 as text
%        str2double(get(hObject,'String')) returns contents of hub_T2 as a double


% --- Executes during object creation, after setting all properties.
function hub_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hub_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hub_T3_Callback(hObject, eventdata, handles)
% hObject    handle to hub_T3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hub_T3 as text
%        str2double(get(hObject,'String')) returns contents of hub_T3 as a double


% --- Executes during object creation, after setting all properties.
function hub_T3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hub_T3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hub_T4_Callback(hObject, eventdata, handles)
% hObject    handle to hub_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hub_T4 as text
%        str2double(get(hObject,'String')) returns contents of hub_T4 as a double


% --- Executes during object creation, after setting all properties.
function hub_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hub_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hub_T1_Callback(hObject, eventdata, handles)
% hObject    handle to hub_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hub_T1 as text
%        str2double(get(hObject,'String')) returns contents of hub_T1 as a double


% --- Executes during object creation, after setting all properties.
function hub_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hub_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)





function cutin_T2_Callback(hObject, eventdata, handles)
% hObject    handle to cutin_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutin_T2 as text
%        str2double(get(hObject,'String')) returns contents of cutin_T2 as a double


% --- Executes during object creation, after setting all properties.
function cutin_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutin_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cutin_T3_Callback(hObject, eventdata, handles)
% hObject    handle to cutin_T3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutin_T3 as text
%        str2double(get(hObject,'String')) returns contents of cutin_T3 as a double


% --- Executes during object creation, after setting all properties.
function cutin_T3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutin_T3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cutin_T4_Callback(hObject, eventdata, handles)
% hObject    handle to cutin_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutin_T4 as text
%        str2double(get(hObject,'String')) returns contents of cutin_T4 as a double


% --- Executes during object creation, after setting all properties.
function cutin_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutin_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cutin_T1_Callback(hObject, eventdata, handles)
% hObject    handle to cutin_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutin_T1 as text
%        str2double(get(hObject,'String')) returns contents of cutin_T1 as a double


% --- Executes during object creation, after setting all properties.
function cutin_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutin_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cutout_T2_Callback(hObject, eventdata, handles)
% hObject    handle to cutout_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutout_T2 as text
%        str2double(get(hObject,'String')) returns contents of cutout_T2 as a double


% --- Executes during object creation, after setting all properties.
function cutout_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutout_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cutout_T3_Callback(hObject, eventdata, handles)
% hObject    handle to cutout_T3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutout_T3 as text
%        str2double(get(hObject,'String')) returns contents of cutout_T3 as a double


% --- Executes during object creation, after setting all properties.
function cutout_T3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutout_T3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cutout_T4_Callback(hObject, eventdata, handles)
% hObject    handle to cutout_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutout_T4 as text
%        str2double(get(hObject,'String')) returns contents of cutout_T4 as a double


% --- Executes during object creation, after setting all properties.
function cutout_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutout_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cutout_T1_Callback(hObject, eventdata, handles)
% hObject    handle to cutout_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutout_T1 as text
%        str2double(get(hObject,'String')) returns contents of cutout_T1 as a double


% --- Executes during object creation, after setting all properties.
function cutout_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutout_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b16.
function b16_Callback(hObject, eventdata, handles)
% hObject    handle to b16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_PlantInfo_GUI=getappdata(0,'Wind_PlantInfo_GUI');

% Initializing Variable For Altitude File:

Altitude_T1 = 0;   

% Loading Wind Power File into Simulation:
[filename,pathname]=uigetfile({'*.*'},'Altitude File Selector For WG_T1');
fullpathname=strcat(pathname, filename);
TempFile=xlsread(fullpathname);

Altitude_T1  = TempFile;

setappdata(Wind_PlantInfo_GUI,'Altitude_T1',Altitude_T1);


function rotrad_T2_Callback(hObject, eventdata, handles)
% hObject    handle to rotrad_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotrad_T2 as text
%        str2double(get(hObject,'String')) returns contents of rotrad_T2 as a double


% --- Executes during object creation, after setting all properties.
function rotrad_T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotrad_T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotrad_T3_Callback(hObject, eventdata, handles)
% hObject    handle to rotrad_T3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotrad_T3 as text
%        str2double(get(hObject,'String')) returns contents of rotrad_T3 as a double


% --- Executes during object creation, after setting all properties.
function rotrad_T3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotrad_T3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotrad_T4_Callback(hObject, eventdata, handles)
% hObject    handle to rotrad_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotrad_T4 as text
%        str2double(get(hObject,'String')) returns contents of rotrad_T4 as a double


% --- Executes during object creation, after setting all properties.
function rotrad_T4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotrad_T4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rotrad_T1_Callback(hObject, eventdata, handles)
% hObject    handle to rotrad_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotrad_T1 as text
%        str2double(get(hObject,'String')) returns contents of rotrad_T1 as a double


% --- Executes during object creation, after setting all properties.
function rotrad_T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotrad_T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b16.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to b16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in b9.
function b9_Callback(hObject, eventdata, handles)
% hObject    handle to b9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_PlantInfo_GUI=getappdata(0,'Wind_PlantInfo_GUI');

% Initializing Variable For Altitude File:

Altitude_T2 = 0;   

% Loading Wind Power File into Simulation:
[filename,pathname]=uigetfile({'*.*'},'Altitude File Selector For WG_T1');
fullpathname=strcat(pathname, filename);
TempFile=xlsread(fullpathname);

Altitude_T2  = TempFile;

setappdata(Wind_PlantInfo_GUI,'Altitude_T2',Altitude_T2);

% --- Executes on button press in b10.
function b10_Callback(hObject, eventdata, handles)
% hObject    handle to b10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_PlantInfo_GUI=getappdata(0,'Wind_PlantInfo_GUI');

% Initializing Variable For Altitude File:

Altitude_T3 = 0;   

% Loading Wind Power File into Simulation:
[filename,pathname]=uigetfile({'*.*'},'Altitude File Selector For WG_T1');
fullpathname=strcat(pathname, filename);
TempFile=xlsread(fullpathname);

Altitude_T3  = TempFile;

setappdata(Wind_PlantInfo_GUI,'Altitude_T3',Altitude_T3);

% --- Executes on button press in b11.
function b11_Callback(hObject, eventdata, handles)
% hObject    handle to b11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_PlantInfo_GUI=getappdata(0,'Wind_PlantInfo_GUI');

% Initializing Variable For Altitude File:

Altitude_T4 = 0;   

% Loading Wind Power File into Simulation:
[filename,pathname]=uigetfile({'*.*'},'Altitude File Selector For WG_T1');
fullpathname=strcat(pathname, filename);
TempFile=xlsread(fullpathname);

Altitude_T4  = TempFile;

setappdata(Wind_PlantInfo_GUI,'Altitude_T4',Altitude_T4);

% --- Executes on button press in b12.
function b12_Callback(hObject, eventdata, handles)
% hObject    handle to b12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_PlantInfo_GUI=getappdata(0,'Wind_PlantInfo_GUI');

% Initializing Variable For Location File:

Location_Altitude_T1 = 0;   

% Loading Wind Power File into Simulation:
[filename,pathname]=uigetfile({'*.*'},'Location-Altitude File Selector For WG_T1');
fullpathname=strcat(pathname, filename);
TempFile=xlsread(fullpathname);

Location_Altitude_T1  = TempFile;

setappdata(Wind_PlantInfo_GUI,'Location_Altitude_T1',Location_Altitude_T1);

% --- Executes on button press in b13.
function b13_Callback(hObject, eventdata, handles)
% hObject    handle to b13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_PlantInfo_GUI=getappdata(0,'Wind_PlantInfo_GUI');

% Initializing Variable For Location File:

Location_Altitude_T2 = 0;   

% Loading Wind Power File into Simulation:
[filename,pathname]=uigetfile({'*.*'},'Location-Altitude File Selector For WG_T1');
fullpathname=strcat(pathname, filename);
TempFile=xlsread(fullpathname);

Location_Altitude_T2  = TempFile;

setappdata(Wind_PlantInfo_GUI,'Location_Altitude_T2',Location_Altitude_T2);

% --- Executes on button press in b14.
function b14_Callback(hObject, eventdata, handles)
% hObject    handle to b14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_PlantInfo_GUI=getappdata(0,'Wind_PlantInfo_GUI');

% Initializing Variable For Location File:

Location_Altitude_T3 = 0;   

% Loading Wind Power File into Simulation:
[filename,pathname]=uigetfile({'*.*'},'Location-Altitude File Selector For WG_T1');
fullpathname=strcat(pathname, filename);
TempFile=xlsread(fullpathname);

Location_Altitude_T3  = TempFile;

setappdata(Wind_PlantInfo_GUI,'Location_Altitude_T3',Location_Altitude_T3);

% --- Executes on button press in b15.
function b15_Callback(hObject, eventdata, handles)
% hObject    handle to b15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_PlantInfo_GUI=getappdata(0,'Wind_PlantInfo_GUI');

% Initializing Variable For Location File:

Location_Altitude_T4 = 0;   

% Loading Wind Power File into Simulation:
[filename,pathname]=uigetfile({'*.*'},'Location-Altitude File Selector For WG_T1');
fullpathname=strcat(pathname, filename);
TempFile=xlsread(fullpathname);

Location_Altitude_T4  = TempFile;

setappdata(Wind_PlantInfo_GUI,'Location_Altitude_T4',Location_Altitude_T4);

% --- Executes on button press in b17.
function b17_Callback(hObject, eventdata, handles)
% hObject    handle to b17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening the Wind_Loss_Parameters_GUI

Wind_Loss_Parameters_GUI;
