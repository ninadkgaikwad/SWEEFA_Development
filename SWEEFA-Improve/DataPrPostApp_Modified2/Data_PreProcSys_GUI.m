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

% Last Modified by GUIDE v2.5 26-Mar-2018 14:09:35

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

set(handles.NormalMode,'Value',1);
set(handles.ForecastMode,'Value',0);

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);
set(handles.r3,'Value',0);
set(handles.r4,'Value',0);
set(handles.r8,'Value',0);
set(handles.r9,'Value',0);

set(handles.r1,'Enable','on');
set(handles.r2,'Enable','on');
set(handles.r3,'Enable','on');
set(handles.r4,'Enable','on');
set(handles.r8,'Enable','on');
set(handles.r9,'Enable','on');

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
set(handles.DateTimeString,'String','');
set(handles.SolarRegionalTime,'String','');
set(handles.WTGGenCleanAlgorithm,'String','');
set(handles.NegativeDataCols,'String','');
set(handles.TurbineStatusVal,'String','');
set(handles.TurbineStatusVal_ErrorPercentBand,'String','');

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
set(handles.DateTimeString,'Enable','on');
set(handles.SolarRegionalTime,'Enable','on');
set(handles.WTGGenCleanAlgorithm,'Enable','off');
set(handles.NegativeDataCols,'Enable','on');
set(handles.TurbineStatusVal,'Enable','off');
set(handles.TurbineStatusVal_ErrorPercentBand,'Enable','off');

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

set(handles.WindPlantData,'Value',1);
set(handles.SolarPlantData,'Value',0);
set(handles.SingleFile,'Value',1);
set(handles.MultiFile,'Value',0);

set(handles.RelevantColumnPositions,'String','');
set(handles.ExtraColumnPositions,'String','');

set(handles.WindPlantData,'Enable','off');
set(handles.SolarPlantData,'Enable','off');
set(handles.SingleFile,'Enable','off');
set(handles.MultiFile,'Enable','off');

set(handles.RelevantColumnPositions,'Enable','off');
set(handles.ExtraColumnPositions,'Enable','off');

set(handles.GenerationIrradiancePower,'String','Generation or Power');



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

set(handles.NormalMode,'Value',1);
set(handles.ForecastMode,'Value',0);

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);
set(handles.r3,'Value',0);
set(handles.r4,'Value',0);
set(handles.r8,'Value',0);
set(handles.r9,'Value',0);

set(handles.r1,'Enable','on');
set(handles.r2,'Enable','on');
set(handles.r3,'Enable','on');
set(handles.r4,'Enable','on');
set(handles.r8,'Enable','on');
set(handles.r9,'Enable','on');

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
set(handles.DateTimeString,'String','');
set(handles.SolarRegionalTime,'String','');
set(handles.WTGGenCleanAlgorithm,'String','');
set(handles.NegativeDataCols,'String','');
set(handles.TurbineStatusVal,'String','');
set(handles.TurbineStatusVal_ErrorPercentBand,'String','');

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
set(handles.DateTimeString,'Enable','on');
set(handles.SolarRegionalTime,'Enable','on');
set(handles.WTGGenCleanAlgorithm,'Enable','off');
set(handles.NegativeDataCols,'Enable','on');
set(handles.TurbineStatusVal,'Enable','off');
set(handles.TurbineStatusVal_ErrorPercentBand,'Enable','off');

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
set(handles.GenerationIrradiancePower,'String','Generation or Irradiance');

set(handles.WindPlantData,'Value',1);
set(handles.SolarPlantData,'Value',0);
set(handles.SingleFile,'Value',1);
set(handles.MultiFile,'Value',0);

set(handles.RelevantColumnPositions,'String','');
set(handles.ExtraColumnPositions,'String','');

set(handles.WindPlantData,'Enable','off');
set(handles.SolarPlantData,'Enable','off');
set(handles.SingleFile,'Enable','off');
set(handles.MultiFile,'Enable','off');

set(handles.RelevantColumnPositions,'Enable','off');
set(handles.ExtraColumnPositions,'Enable','off');

set(handles.GenerationIrradiancePower,'String','Generation or Power');



% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing GUI

hf1=findobj('Name','PlantInfo_GUI');
close(hf1);

hf2=findobj('Name','Wind_PlantInfo_GUI');
close(hf2);

close ;



% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Radio Button Values - Mode Options

NormalMode=get(handles.NormalMode,'Value');
ForecastMode=get(handles.ForecastMode,'Value');

% Programming Button behaviour based on Radio Buton Values

if (NormalMode==1) % Normal Mode is Selected
    
    % Getting Radio Button Values - Normal Mode Options

    r1=get(handles.r1,'Value');
    r2=get(handles.r2,'Value');
    r3=get(handles.r3,'Value');
    r4=get(handles.r4,'Value');
    r9=get(handles.r9,'Value');
    r8=get(handles.r8,'Value');

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

        DateTimeString=get(handles.DateTimeString,'String');

        NegativeCols=get(handles.NegativeCols,'String'); 
        NegativeCols=strread(NegativeCols,'%f','delimiter',',');
        NegativeCols=NegativeCols';  

        SolarRegionalTime=get(handles.SolarRegionalTime,'String');
        SolarRegionalTime=str2double(SolarRegionalTime);     

        % Using external function to process Weather File

        [ ProcessedData ] = SolarPVWeatherDataCleaner( Headers,Res,DataCols,hem,Ltm,L,Lat,N,DateTimeString,NegativeCols,SolarRegionalTime );

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

        %GenIrrad=get(handles.GenIrrad,'String'); 
        %GenIrrad=strread(GenIrrad,'%f','delimiter',',');
        GenIrrad=0; 

        DateTimeString=get(handles.DateTimeString,'String');

        NegativeCols=get(handles.NegativeCols,'String'); 
        NegativeCols=strread(NegativeCols,'%f','delimiter',',');
        NegativeCols=NegativeCols';  

        SolarRegionalTime=get(handles.SolarRegionalTime,'String');
        SolarRegionalTime=str2double(SolarRegionalTime);     

        % Getting PlantInfo_Parameters from PlantInfo_GUI

        PlantInfo_Parameters=getappdata(PlantInfo_GUI,'PlantInfo_Parameters');

        % Using external function to process Irradiance File

        [ ProcessedData,~,~ ] = SolarPVIrradianceDataCleaner( Headers,Res,DataCols,hem,Ltm,L,Lat,GenIrrad,PlantInfo_Parameters,DateTimeString,NegativeCols,SolarRegionalTime );

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

        DateTimeString=get(handles.DateTimeString,'String');

        NegativeCols=get(handles.NegativeCols,'String'); 
        NegativeCols=strread(NegativeCols,'%f','delimiter',',');
        NegativeCols=NegativeCols';      

        SolarRegionalTime=get(handles.SolarRegionalTime,'String');
        SolarRegionalTime=str2double(SolarRegionalTime);     

        % Getting PlantInfo_Parameters from PlantInfo_GUI

        PlantInfo_Parameters=getappdata(PlantInfo_GUI,'PlantInfo_Parameters');    

        % Using external function to process Generation File

       [ ProcessedData,~,~ ] = SolarPVGenerationDataCleaner( Headers,Res,DataCols,hem,Ltm,L,Lat,GenCapacity,GenIrrad, WeatherFileHourlyOrRes, DataCumulativeOrNot, PlantInfo_Parameters,DateTimeString,NegativeCols,SolarRegionalTime  );    

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

    elseif (r9==1) % Wind Power File

        % Getting User Input
        
        Headers=get(handles.Headers,'String');
        Headers=str2double(Headers);

        Res=get(handles.Res,'String');
        Res=str2double(Res);   

        hem=get(handles.hem,'String');
        hem=str2double(hem);

        Ltm=get(handles.Ltm,'String');
        Ltm=str2double(Ltm);  
        
        %GenIrrad=get(handles.GenIrrad,'String'); 
        %GenIrrad=strread(GenIrrad,'%f','delimiter',',');
        GenIrrad=2;  % Indicating Power File 
        
        DataCumulativeOrNot=0; % Indicating Data is Not Culmulative as it is a Power File

        DateTimeString=get(handles.DateTimeString,'String');

        NegativeCols=get(handles.NegativeCols,'String'); 
        NegativeCols=strread(NegativeCols,'%f','delimiter',',');
        NegativeCols=NegativeCols';      
        
        WTGGenCleanAlgorithm=get(handles.WTGGenCleanAlgorithm,'String');
        WTGGenCleanAlgorithm=str2double(WTGGenCleanAlgorithm);   
        
        TurbineStatusVal=get(handles.TurbineStatusVal,'String');
        TurbineStatusVal=str2double(TurbineStatusVal); 
        
        TurbineStatusVal_ErrorPercentBand=get(handles.WTGGenCleanAlgorithm,'String');
        TurbineStatusVal_ErrorPercentBand=str2double(TurbineStatusVal_ErrorPercentBand);         

        % Getting Data from Wind_PlantInfo_GUI 
        
        if (WTGGenCleanAlgorithm==1) % N-Point Average Method
            
            AllParameters={0}; % Initialization [Variable not used]
            
            WindLossParameters={0}; % Initialization [Variable not used]
            
        else % Wind Plant Static Info Data based Maethods
            
            Wind_PlantInfo_GUI = getappdata(0,'Wind_PlantInfo_GUI');

            AllParameters=getappdata(Wind_PlantInfo_GUI,'AllParameters');

            WindLossParameters=getappdata(Wind_PlantInfo_GUI,'WindLossParameters');
            
        end        

        % Using external function to process Wind Power File
        
        [ ProcessedData,~,~ ] = WTGGenerationDataCleaner( Headers,Res,hem,Ltm, DataCumulativeOrNot,GenIrrad, AllParameters,WindLossParameters,DateTimeString,NegativeCols,WTGGenCleanAlgorithm,TurbineStatusVal,TurbineStatusVal_ErrorPercentBand );
        
    elseif (r8==1) % Wind Generation File

        % Getting User Input
        
        Headers=get(handles.Headers,'String');
        Headers=str2double(Headers);

        Res=get(handles.Res,'String');
        Res=str2double(Res);   

        hem=get(handles.hem,'String');
        hem=str2double(hem);

        Ltm=get(handles.Ltm,'String');
        Ltm=str2double(Ltm);  
        
        %GenIrrad=get(handles.GenIrrad,'String'); 
        %GenIrrad=strread(GenIrrad,'%f','delimiter',',');
        GenIrrad=1;  % Indicating Energy File          
        
        DataCumulativeOrNot=get(handles.DataCumulativeOrNot,'String');
        DataCumulativeOrNot=str2double(DataCumulativeOrNot);         

        DateTimeString=get(handles.DateTimeString,'String');

        NegativeCols=get(handles.NegativeCols,'String'); 
        NegativeCols=strread(NegativeCols,'%f','delimiter',',');
        NegativeCols=NegativeCols';      
        
        WTGGenCleanAlgorithm=get(handles.WTGGenCleanAlgorithm,'String');
        WTGGenCleanAlgorithm=str2double(WTGGenCleanAlgorithm);   
        
        TurbineStatusVal=get(handles.TurbineStatusVal,'String');
        TurbineStatusVal=str2double(TurbineStatusVal); 
        
        TurbineStatusVal_ErrorPercentBand=get(handles.WTGGenCleanAlgorithm,'String');
        TurbineStatusVal_ErrorPercentBand=str2double(TurbineStatusVal_ErrorPercentBand);         

        % Getting Data from Wind_PlantInfo_GUI 
        
        Wind_PlantInfo_GUI = getappdata(0,'Wind_PlantInfo_GUI');
        
        AllParameters=getappdata(Wind_PlantInfo_GUI,'AllParameters');
        
        WindLossParameters=getappdata(Wind_PlantInfo_GUI,'WindLossParameters');
         
        % Using external function to process Wind Power File
        
        [ ProcessedData,~,~ ] = WTGGenerationDataCleaner( Headers,Res,hem,Ltm, DataCumulativeOrNot,GenIrrad, AllParameters,WindLossParameters,DateTimeString,NegativeCols,WTGGenCleanAlgorithm,TurbineStatusVal,TurbineStatusVal_ErrorPercentBand );

    end    
    
elseif (ForecastMode==1) % Forecast Mode is Selected
    
    % Getting Radio Button Values - Forecast Mode Options
    
    WindPlantData=get(handles.WindPlantData,'Value');
    SolarPlantData=get(handles.SolarPlantData,'Value');
    
    % Programming Button behaviour based on Radio Buton Values
    
    if (WindPlantData==1) % Wind Plant is Selected
        
        % Getting User Input

        Headers=get(handles.Headers,'String');
        Headers=str2double(Headers);

        Res=get(handles.Res,'String');
        Res=str2double(Res);   

        %DataCols=get(handles.DataCols,'String');
        %DataCols=str2double(DataCols);

        hem=get(handles.hem,'String');
        hem=str2double(hem);

        Ltm=get(handles.Ltm,'String');
        Ltm=str2double(Ltm);

        %L=get(handles.L,'String');
        %L=str2double(L);

        %Lat=get(handles.Lat,'String');
        %Lat=str2double(Lat);  
        
        N=get(handles.N,'String');
        N=str2double(N);         

        %GenCapacity=get(handles.GenCapacity,'String'); 
        %GenCapacity=strread(GenCapacity,'%f','delimiter',',');
        %GenCapacity=GenCapacity';

        GenIrrad=get(handles.GenIrrad,'String'); 
        GenIrrad=strread(GenIrrad,'%f','delimiter',',');
        GenIrrad=GenIrrad';   

        %WeatherFileHourlyOrRes=get(handles.WeatherFileHourlyOrRes,'String');
        %WeatherFileHourlyOrRes=str2double(WeatherFileHourlyOrRes);      

        DataCumulativeOrNot=get(handles.DataCumulativeOrNot,'String');
        DataCumulativeOrNot=str2double(DataCumulativeOrNot);     

        DateTimeString=get(handles.DateTimeString,'String');

        NegativeCols=get(handles.NegativeCols,'String'); 
        NegativeCols=strread(NegativeCols,'%f','delimiter',',');
        NegativeCols=NegativeCols';      

        %SolarRegionalTime=get(handles.SolarRegionalTime,'String');
        %SolarRegionalTime=str2double(SolarRegionalTime); 
        
        WTGGenCleanAlgorithm=get(handles.WTGGenCleanAlgorithm,'String');
        WTGGenCleanAlgorithm=str2double(WTGGenCleanAlgorithm);   
        
        TurbineStatusVal=get(handles.TurbineStatusVal,'String');
        TurbineStatusVal=str2double(TurbineStatusVal); 
        
        TurbineStatusVal_ErrorPercentBand=get(handles.WTGGenCleanAlgorithm,'String');
        TurbineStatusVal_ErrorPercentBand=str2double(TurbineStatusVal_ErrorPercentBand);         

        RelevantColumnPositions=get(handles.RelevantColumnPositions,'String'); 
        RelevantColumnPositions=strread(RelevantColumnPositions,'%f','delimiter',',');
        RelevantColumnPositions=RelevantColumnPositions';
        
        ExtraColumnPositions=get(handles.ExtraColumnPositions,'String'); 
        ExtraColumnPositions=strread(ExtraColumnPositions,'%f','delimiter',',');
        ExtraColumnPositions=ExtraColumnPositions';        

        % Getting Data from Wind_PlantInfo_GUI 
        
        Wind_PlantInfo_GUI = getappdata(0,'Wind_PlantInfo_GUI');
        
        AllParameters=getappdata(Wind_PlantInfo_GUI,'AllParameters');
        
        WindLossParameters=getappdata(Wind_PlantInfo_GUI,'WindLossParameters');
        
        % Using external function to process Wind Plant File  
        
        [ ProcessedData ] = WindPlant_DataCleaner( Headers,Res,hem,Ltm,N,GenIrrad,DataCumulativeOrNot,DateTimeString,NegativeCols,WTGGenCleanAlgorithm,TurbineStatusVal,TurbineStatusVal_ErrorPercentBand,AllParameters,WindLossParameters,RelevantColumnPositions,ExtraColumnPositions );
        
    elseif (SolarPlantData==1) % Solar Plant is Selected
        
        % Getting User Input

        Headers=get(handles.Headers,'String');
        Headers=str2double(Headers);

        Res=get(handles.Res,'String');
        Res=str2double(Res);   

        %DataCols=get(handles.DataCols,'String');
        %DataCols=str2double(DataCols);

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

        GenCapacity=get(handles.GenCapacity,'String'); 
        GenCapacity=strread(GenCapacity,'%f','delimiter',',');
        GenCapacity=GenCapacity';

        GenIrrad=get(handles.GenIrrad,'String'); 
        GenIrrad=strread(GenIrrad,'%f','delimiter',',');
        GenIrrad=GenIrrad';   

        %WeatherFileHourlyOrRes=get(handles.WeatherFileHourlyOrRes,'String');
        %WeatherFileHourlyOrRes=str2double(WeatherFileHourlyOrRes);      

        DataCumulativeOrNot=get(handles.DataCumulativeOrNot,'String');
        DataCumulativeOrNot=str2double(DataCumulativeOrNot);     

        DateTimeString=get(handles.DateTimeString,'String');

        NegativeCols=get(handles.NegativeCols,'String'); 
        NegativeCols=strread(NegativeCols,'%f','delimiter',',');
        NegativeCols=NegativeCols';      

        SolarRegionalTime=get(handles.SolarRegionalTime,'String');
        SolarRegionalTime=str2double(SolarRegionalTime);  
        
        RelevantColumnPositions=get(handles.RelevantColumnPositions,'String'); 
        RelevantColumnPositions=strread(RelevantColumnPositions,'%f','delimiter',',');
        RelevantColumnPositions=RelevantColumnPositions';
        
        ExtraColumnPositions=get(handles.ExtraColumnPositions,'String'); 
        ExtraColumnPositions=strread(ExtraColumnPositions,'%f','delimiter',',');
        ExtraColumnPositions=ExtraColumnPositions';         

        % Getting PlantInfo_Parameters from PlantInfo_GUI

        PlantInfo_GUI1 = getappdata(0,'PlantInfo_GUI');
        
        PlantInfo_Parameters=getappdata(PlantInfo_GUI1,'PlantInfo_Parameters');    

        % Using external function to process Solar Plant File 
        
        [ ProcessedData ] = SolarPlant_DataCleaner( Headers,Res,hem,Ltm,L,Lat,N,GenIrrad,GenCapacity,DataCumulativeOrNot,DateTimeString,NegativeCols,SolarRegionalTime,PlantInfo_Parameters,RelevantColumnPositions,ExtraColumnPositions );
        
    end
    
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

NormalMode=get(handles.NormalMode,'Value');
ForecastMode=get(handles.ForecastMode,'Value');

% Programming Button behaviour based on Radio Button Values

if (r5==1) % Minute to Minute

    % Getting User Input
    Headers=get(handles.Headers,'String');
    Headers=str2double(Headers);
    
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
    
    if (NormalMode==1) % Normal Mode is Selected
        
        [ ProcessedData1 ] = minToMINDataCoverter( DataCols,ResOriginal,ResNew,AvgOrAdd,Headers );
        
    elseif (ForecastMode==1) % Forecast Mode is Selected
        
        [ ProcessedData1 ] = minToMINDataCoverter_ForecastMode( DataCols,ResOriginal,ResNew,AvgOrAdd,Headers );
        
    end   
    
    
elseif (r6==1) % Minute to Day
    
    % Getting User Input
    Headers=get(handles.Headers,'String');
    Headers=str2double(Headers);    
    
    DataCols=get(handles.DataCols1,'String');
    DataCols=str2double(DataCols);
    
    Res=get(handles.Res1,'String');
    Res=str2double(Res);      
  
    AvgOrAdd=get(handles.AvgOrAdd,'String');
    AvgOrAdd=strread(AvgOrAdd,'%f','delimiter',',');
    AvgOrAdd=AvgOrAdd';    
    
    % Using External Function to perform Conversion
    
    if (NormalMode==1) % Normal Mode is Selected
        
        [ ProcessedData1 ] = MINToDayDataCoverter( DataCols,Res,AvgOrAdd,Headers );
        
    elseif (ForecastMode==1) % Forecast Mode is Selected
        
        [ ProcessedData1 ] = MINToDayDataCoverter_ForecastMode( DataCols,Res,AvgOrAdd,Headers );
        
    end       
    
    
elseif(r7==1) % Day to Month
    
    % Getting User Input
    Headers=get(handles.Headers,'String');
    Headers=str2double(Headers);    
    
    DataCols=get(handles.DataCols1,'String');
    DataCols=str2double(DataCols);    
   
    AvgOrAdd=get(handles.AvgOrAdd,'String');
    AvgOrAdd=strread(AvgOrAdd,'%f','delimiter',',');
    AvgOrAdd=AvgOrAdd'; 
    
    % Using External Function to perform Conversion
    
    if (NormalMode==1) % Normal Mode is Selected        
        
        [ ProcessedData1 ] = DayToMonthDataCoverter( DataCols,AvgOrAdd,Headers );
        
    elseif (ForecastMode==1) % Forecast Mode is Selected
                
    [ ProcessedData1 ] = DayToMonthDataCoverter_ForecastMode( DataCols,AvgOrAdd,Headers );
        
    end    
    
    
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
r8=get(handles.r8,'Value');
r9=get(handles.r9,'Value');

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
    set(handles.DateTimeString,'Enable','on');
    set(handles.SolarRegionalTime,'Enable','on');
    set(handles.WTGGenCleanAlgorithm,'Enable','off'); 
    set(handles.NegativeDataCols,'Enable','on');
    set(handles.TurbineStatusVal,'Enable','on');
    set(handles.TurbineStatusVal_ErrorPercentBand,'Enable','on');     
    
    set(handles.b3,'String','Weather File Processing');
    set(handles.GenerationIrradiancePower,'String','Generation or Power');

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
    set(handles.GenIrrad,'Enable','off');
    set(handles.GenCapacity,'Enable','off');
    set(handles.WeatherFileHourlyOrRes,'Enable','off');
    set(handles.DataCumulativeOrNot,'Enable','off');
    set(handles.RelativeHours,'Enable','off');
    set(handles.DateTimeString,'Enable','on');
    set(handles.SolarRegionalTime,'Enable','on');
    set(handles.WTGGenCleanAlgorithm,'Enable','off');
    set(handles.NegativeDataCols,'Enable','on');
    set(handles.TurbineStatusVal,'Enable','off');
    set(handles.TurbineStatusVal_ErrorPercentBand,'Enable','off');     
    
    set(handles.b3,'String','Irradiance File Processing'); 
    set(handles.GenerationIrradiancePower,'String','Generation or Power');   
    
    set(handles.b5,'Enable','on');
    
elseif (r3==1) % Solar Generation File
    
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
    set(handles.DateTimeString,'Enable','on');
    set(handles.SolarRegionalTime,'Enable','on');
    set(handles.WTGGenCleanAlgorithm,'Enable','off');  
    set(handles.NegativeDataCols,'Enable','on');
    set(handles.TurbineStatusVal,'Enable','off');
    set(handles.TurbineStatusVal_ErrorPercentBand,'Enable','off');     

    set(handles.b3,'String','Solar Generation File Processing');  
    set(handles.GenerationIrradiancePower,'String','Generation or Power');
    
    set(handles.b5,'Enable','on');
    
elseif (r4==1) % WRF NETCDF File
    
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
    set(handles.DateTimeString,'Enable','off');
    set(handles.SolarRegionalTime,'Enable','off');
    set(handles.WTGGenCleanAlgorithm,'Enable','off');  
    set(handles.NegativeDataCols,'Enable','off');
    set(handles.TurbineStatusVal,'Enable','off');
    set(handles.TurbineStatusVal_ErrorPercentBand,'Enable','off');     
    
    set(handles.b3,'String','WRF NETCDF File Processing');
    set(handles.GenerationIrradiancePower,'String','Generation or Power');
    
    set(handles.b5,'Enable','off');
    
elseif (r8==1) % Wind Generation File
    
    WTGGenCleanAlgorithm=get(handles.WTGGenCleanAlgorithm,'String');
    WTGGenCleanAlgorithm=str2num(WTGGenCleanAlgorithm);
    
    set(handles.Headers,'Enable','on');
    set(handles.Res,'Enable','on');
    set(handles.DataCols,'Enable','off');
    set(handles.hem,'Enable','on');
    set(handles.Ltm,'Enable','on');
    set(handles.L,'Enable','off');
    set(handles.Lat,'Enable','off');
    set(handles.N,'Enable','on');
    set(handles.GenIrrad,'Enable','off');
    set(handles.GenCapacity,'Enable','off');
    set(handles.WeatherFileHourlyOrRes,'Enable','on');
    set(handles.DataCumulativeOrNot,'Enable','on');
    set(handles.RelativeHours,'Enable','off');
    set(handles.DateTimeString,'Enable','on');
    set(handles.SolarRegionalTime,'Enable','off');
    set(handles.WTGGenCleanAlgorithm,'Enable','on');
    set(handles.NegativeDataCols,'Enable','on');
    set(handles.TurbineStatusVal,'Enable','on');
    set(handles.TurbineStatusVal_ErrorPercentBand,'Enable','on');     
    
    set(handles.b3,'String','Wind Gen File Processing');
    set(handles.GenerationIrradiancePower,'String','Generation or Power');
    
    if (WTGGenCleanAlgorithm~=1) % Cleaning Algorithm requires Plant Info
    
        set(handles.b5,'Enable','on');
        
    else % Cleaning Algorithm does not require Plant Info
        
       set(handles.b5,'Enable','off');
        
    end
    
elseif (r9==1) % Wind Power File
    
    WTGGenCleanAlgorithm=get(handles.WTGGenCleanAlgorithm,'String');
    WTGGenCleanAlgorithm=str2num(WTGGenCleanAlgorithm);    
    
    set(handles.Headers,'Enable','on');
    set(handles.Res,'Enable','on');
    set(handles.DataCols,'Enable','off');
    set(handles.hem,'Enable','on');
    set(handles.Ltm,'Enable','on');
    set(handles.L,'Enable','off');
    set(handles.Lat,'Enable','off');
    set(handles.N,'Enable','on');
    set(handles.GenIrrad,'Enable','off');
    set(handles.GenCapacity,'Enable','off');
    set(handles.WeatherFileHourlyOrRes,'Enable','on');
    set(handles.DataCumulativeOrNot,'Enable','off');
    set(handles.RelativeHours,'Enable','off');
    set(handles.DateTimeString,'Enable','on');
    set(handles.SolarRegionalTime,'Enable','off');
    set(handles.WTGGenCleanAlgorithm,'Enable','on'); 
    set(handles.NegativeDataCols,'Enable','on');
    set(handles.TurbineStatusVal,'Enable','on');
    set(handles.TurbineStatusVal_ErrorPercentBand,'Enable','on');     
    
    set(handles.b3,'String','Wind Power File Processing');
    set(handles.GenerationIrradiancePower,'String','Generation or Power');
    
    if (WTGGenCleanAlgorithm~=1) % Cleaning Algorithm requires Plant Info
    
        set(handles.b5,'Enable','on');
        
    else % Cleaning Algorithm does not require Plant Info
        
       set(handles.b5,'Enable','off');
        
    end
    
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

% Getting Radio Button Values

NormalMode=get(handles.NormalMode,'Value');
ForecastMode=get(handles.ForecastMode,'Value');

% Getting Radio Button values based on the Previous Radio Button Values

if (NormalMode==1)
    
    % Getting the Radio Button Values
    
    r2=get(handles.r2,'Value');
    r3=get(handles.r3,'Value');    
    r8=get(handles.r8,'Value');
    r9=get(handles.r9,'Value');
    
    % Opening particular Plant Info GUi based on the Radio Button Values
    
    if ((r2==1)||(r3==1)) % Solar Plant Info GUI
        
        PlantInfo_GUI;
        
    elseif ((r8==1)||(r9==1)) % Wind Plant Info GUI
       
        % Getting Current GUI Workspace
        Data_PreProcSys_GUI=getappdata(0,'Data_PreProcSys_GUI');
        
        % Getting WTGGenCleanAlgorithm
        WTGGenCleanAlgorithm=get(handles.WTGGenCleanAlgorithm,'String');
        WTGGenCleanAlgorithm=str2num(WTGGenCleanAlgorithm);
                       
        % Setting up WTGGenCleanAlgorithm in Current GUI Workspace
        setappdata(Data_PreProcSys_GUI,'WTGGenCleanAlgorithm',WTGGenCleanAlgorithm);
        
        % Setting up Normal and Forecast Mode in Current GUI Workspace
        setappdata(Data_PreProcSys_GUI,'NormalMode',NormalMode);
        setappdata(Data_PreProcSys_GUI,'ForecastMode',ForecastMode);
        
        Wind_PlantInfo_GUI;
        
    end
    
elseif (ForecastMode==1)
    
    % Getting the Radio Button Values
    
    WindPlantData=get(handles.WindPlantData,'Value');
    SolarPlantData=get(handles.SolarPlantData,'Value');  
    
    % Opening particular Plant Info GUi based on the Radio Button Values
    
    if (SolarPlantData==1) % Solar Plant Info GUI
        
        PlantInfo_GUI;
        
    elseif (WindPlantData==1) % Wind Plant Info GUI
        
        % Getting Current GUI Workspace
        Data_PreProcSys_GUI=getappdata(0,'Data_PreProcSys_GUI');
        
        % Getting WTGGenCleanAlgorithm
        WTGGenCleanAlgorithm=get(handles.WTGGenCleanAlgorithm,'String');
        WTGGenCleanAlgorithm=str2num(WTGGenCleanAlgorithm);
        
        % Setting up WTGGenCleanAlgorithm in Current GUI Workspace
        setappdata(Data_PreProcSys_GUI,'WTGGenCleanAlgorithm',WTGGenCleanAlgorithm); 
        
        % Setting up Normal and Forecast Mode in Current GUI Workspace
        setappdata(Data_PreProcSys_GUI,'NormalMode',NormalMode);
        setappdata(Data_PreProcSys_GUI,'ForecastMode',ForecastMode);        
        
        Wind_PlantInfo_GUI;
        
    end    
    
end


function DateTimeString_Callback(hObject, eventdata, handles)
% hObject    handle to DateTimeString (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DateTimeString as text
%        str2double(get(hObject,'String')) returns contents of DateTimeString as a double


% --- Executes during object creation, after setting all properties.
function DateTimeString_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DateTimeString (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SolarRegionalTime_Callback(hObject, eventdata, handles)
% hObject    handle to SolarRegionalTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SolarRegionalTime as text
%        str2double(get(hObject,'String')) returns contents of SolarRegionalTime as a double


% --- Executes during object creation, after setting all properties.
function SolarRegionalTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SolarRegionalTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function WTGGenCleanAlgorithm_Callback(hObject, eventdata, handles)
% hObject    handle to WTGGenCleanAlgorithm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WTGGenCleanAlgorithm as text
%        str2double(get(hObject,'String')) returns contents of WTGGenCleanAlgorithm as a double


% --- Executes during object creation, after setting all properties.
function WTGGenCleanAlgorithm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WTGGenCleanAlgorithm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ExtraColumnPositions_Callback(hObject, eventdata, handles)
% hObject    handle to ExtraColumnPositions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ExtraColumnPositions as text
%        str2double(get(hObject,'String')) returns contents of ExtraColumnPositions as a double


% --- Executes during object creation, after setting all properties.
function ExtraColumnPositions_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ExtraColumnPositions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RelevantColumnPositions_Callback(hObject, eventdata, handles)
% hObject    handle to RelevantColumnPositions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RelevantColumnPositions as text
%        str2double(get(hObject,'String')) returns contents of RelevantColumnPositions as a double


% --- Executes during object creation, after setting all properties.
function RelevantColumnPositions_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RelevantColumnPositions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Radio Buton Values

NormalMode=get(handles.NormalMode,'Value');
ForecastMode=get(handles.ForecastMode,'Value');

% Changing GUI Element behaviour in accordance with the Radio Button Values

if (NormalMode==1)
    
    set(handles.r1,'Value',1);
    
    set(handles.r1,'Enable','on');
    set(handles.r2,'Enable','on');
    set(handles.r3,'Enable','on');
    set(handles.r4,'Enable','on');   
    set(handles.r8,'Enable','on');
    set(handles.r9,'Enable','on');
    
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
    set(handles.DateTimeString,'Enable','on');
    set(handles.SolarRegionalTime,'Enable','on');
    set(handles.WTGGenCleanAlgorithm,'Enable','off');
    set(handles.NegativeDataCols,'Enable','on');
    set(handles.TurbineStatusVal,'Enable','off');
    set(handles.TurbineStatusVal_ErrorPercentBand,'Enable','off');        

    set(handles.b5,'Enable','off');

    set(handles.DataCols1,'Enable','on');
    set(handles.Res1,'Enable','on');
    set(handles.Res2,'Enable','on');
    set(handles.AvgOrAdd,'Enable','on');

    set(handles.b3,'String','Weather File Processing');
    set(handles.b4,'String','Minute to Minute Conversion');
    set(handles.GenerationIrradiancePower,'String','Generation or Power');

    set(handles.WindPlantData,'Enable','off');
    set(handles.SolarPlantData,'Enable','off');
    set(handles.SingleFile,'Enable','off');
    set(handles.MultiFile,'Enable','off');

    set(handles.RelevantColumnPositions,'Enable','off');
    set(handles.ExtraColumnPositions,'Enable','off');    
    
elseif (ForecastMode==1)
    
    set(handles.WindPlantData,'Value',1);
    
    set(handles.r1,'Enable','off');
    set(handles.r2,'Enable','off');
    set(handles.r3,'Enable','off');
    set(handles.r4,'Enable','off');   
    set(handles.r8,'Enable','off'); 
    set(handles.r9,'Enable','off');
    
    set(handles.Headers,'Enable','on');
    set(handles.Res,'Enable','on');
    set(handles.DataCols,'Enable','off');
    set(handles.hem,'Enable','on');
    set(handles.Ltm,'Enable','on');
    set(handles.L,'Enable','off');
    set(handles.Lat,'Enable','off');
    set(handles.N,'Enable','on');
    set(handles.GenIrrad,'Enable','on');
    set(handles.GenCapacity,'Enable','off');
    set(handles.WeatherFileHourlyOrRes,'Enable','off');
    set(handles.DataCumulativeOrNot,'Enable','on');
    set(handles.RelativeHours,'Enable','off');
    set(handles.DateTimeString,'Enable','on');
    set(handles.SolarRegionalTime,'Enable','off');
    set(handles.WTGGenCleanAlgorithm,'Enable','on');
    set(handles.NegativeDataCols,'Enable','on');
    set(handles.TurbineStatusVal,'Enable','on');
    set(handles.TurbineStatusVal_ErrorPercentBand,'Enable','on');     

    set(handles.b5,'Enable','on');

    set(handles.DataCols1,'Enable','on');
    set(handles.Res1,'Enable','on');
    set(handles.Res2,'Enable','on');
    set(handles.AvgOrAdd,'Enable','on');

    set(handles.b3,'String','Wind File Processing');
    set(handles.b4,'String','Minute to Minute Conversion');
    set(handles.GenerationIrradiancePower,'String','Generation or Power');

    set(handles.WindPlantData,'Enable','on');
    set(handles.SolarPlantData,'Enable','on');
    set(handles.SingleFile,'Enable','on');
    set(handles.MultiFile,'Enable','on');

    set(handles.RelevantColumnPositions,'Enable','on');
    set(handles.ExtraColumnPositions,'Enable','on');    
    
end


% --- Executes when selected object is changed in uibuttongroup4.
function uibuttongroup4_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup4 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Radio Button Values

WindPlantData=get(handles.WindPlantData,'Value');
SolarPlantData=get(handles.SolarPlantData,'Value');

% Changing GUI Element behaviour in accordance with Radio Button Values

if (WindPlantData==1)
    
    set(handles.Headers,'Enable','on');
    set(handles.Res,'Enable','on');
    set(handles.DataCols,'Enable','off');
    set(handles.hem,'Enable','on');
    set(handles.Ltm,'Enable','on');
    set(handles.L,'Enable','off');
    set(handles.Lat,'Enable','off');
    set(handles.N,'Enable','on');
    set(handles.GenIrrad,'Enable','on');
    set(handles.GenCapacity,'Enable','off');
    set(handles.WeatherFileHourlyOrRes,'Enable','off');
    set(handles.DataCumulativeOrNot,'Enable','on');
    set(handles.RelativeHours,'Enable','off');
    set(handles.DateTimeString,'Enable','on');
    set(handles.SolarRegionalTime,'Enable','off');
    set(handles.WTGGenCleanAlgorithm,'Enable','on');
    set(handles.NegativeDataCols,'Enable','on');
    set(handles.TurbineStatusVal,'Enable','on');
    set(handles.TurbineStatusVal_ErrorPercentBand,'Enable','on');     
    
    set(handles.b3,'String','Wind File Processing');
    set(handles.GenerationIrradiancePower,'String','Generation or Power');

    set(handles.b5,'Enable','on');    
    
elseif (SolarPlantData==1)
    
    set(handles.Headers,'Enable','on');
    set(handles.Res,'Enable','on');
    set(handles.DataCols,'Enable','off');
    set(handles.hem,'Enable','on');
    set(handles.Ltm,'Enable','on');
    set(handles.L,'Enable','on');
    set(handles.Lat,'Enable','on');
    set(handles.N,'Enable','on');
    set(handles.GenIrrad,'Enable','on');
    set(handles.GenCapacity,'Enable','on');
    set(handles.WeatherFileHourlyOrRes,'Enable','off');
    set(handles.DataCumulativeOrNot,'Enable','on');
    set(handles.RelativeHours,'Enable','off');
    set(handles.DateTimeString,'Enable','on');
    set(handles.SolarRegionalTime,'Enable','on');
    set(handles.WTGGenCleanAlgorithm,'Enable','off'); 
    set(handles.NegativeDataCols,'Enable','on');
    set(handles.TurbineStatusVal,'Enable','off');
    set(handles.TurbineStatusVal_ErrorPercentBand,'Enable','off');     
    
    set(handles.b3,'String','Solar File Processing');
    set(handles.GenerationIrradiancePower,'String','Generation or Power');

    set(handles.b5,'Enable','on');    
    
end



function NegativeDataCols_Callback(hObject, eventdata, handles)
% hObject    handle to NegativeDataCols (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NegativeDataCols as text
%        str2double(get(hObject,'String')) returns contents of NegativeDataCols as a double


% --- Executes during object creation, after setting all properties.
function NegativeDataCols_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NegativeDataCols (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TurbineStatusVal_Callback(hObject, eventdata, handles)
% hObject    handle to TurbineStatusVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TurbineStatusVal as text
%        str2double(get(hObject,'String')) returns contents of TurbineStatusVal as a double


% --- Executes during object creation, after setting all properties.
function TurbineStatusVal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TurbineStatusVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TurbineStatusVal_ErrorPercentBand_Callback(hObject, eventdata, handles)
% hObject    handle to TurbineStatusVal_ErrorPercentBand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TurbineStatusVal_ErrorPercentBand as text
%        str2double(get(hObject,'String')) returns contents of TurbineStatusVal_ErrorPercentBand as a double


% --- Executes during object creation, after setting all properties.
function TurbineStatusVal_ErrorPercentBand_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TurbineStatusVal_ErrorPercentBand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uibuttongroup7.
function uibuttongroup7_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup7 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
