function varargout = Wind_Loss_Parameters_GUI(varargin)
% WIND_LOSS_PARAMETERS_GUI MATLAB code for Wind_Loss_Parameters_GUI.fig
%      WIND_LOSS_PARAMETERS_GUI, by itself, creates a new WIND_LOSS_PARAMETERS_GUI or raises the existing
%      singleton*.
%
%      H = WIND_LOSS_PARAMETERS_GUI returns the handle to a new WIND_LOSS_PARAMETERS_GUI or the handle to
%      the existing singleton*.
%
%      WIND_LOSS_PARAMETERS_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WIND_LOSS_PARAMETERS_GUI.M with the given input arguments.
%
%      WIND_LOSS_PARAMETERS_GUI('Property','Value',...) creates a new WIND_LOSS_PARAMETERS_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Wind_Loss_Parameters_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Wind_Loss_Parameters_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Wind_Loss_Parameters_GUI

% Last Modified by GUIDE v2.5 21-Mar-2018 13:49:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Wind_Loss_Parameters_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Wind_Loss_Parameters_GUI_OutputFcn, ...
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


% --- Executes just before Wind_Loss_Parameters_GUI is made visible.
function Wind_Loss_Parameters_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Wind_Loss_Parameters_GUI (see VARARGIN)

% Choose default command line output for Wind_Loss_Parameters_GUI
handles.output = hObject;

% Getting Main GUI Workspace Name
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Getting the Normal and Forecast Mode Radio Button values from Wind_GUI_MainPage Workspace

NormalMode=getappdata(Wind_GUI_MainPage,'NormalMode');
ForecastMode=getappdata(Wind_GUI_MainPage,'ForecastMode');

if (isappdata(0,'Wind_GUI_MainPage') && isappdata(Wind_GUI_MainPage,'PlantInfo_DataCell'))
    
    % Getting Data from Wind_GUI_MainPage Workspace   
    
    PlantInfo_DataCell=getappdata(Wind_GUI_MainPage,'PlantInfo_DataCell');
    
    % Initializing Loss Parameter Values to Data from Plant Info

    r1=PlantInfo_DataCell{65,2};
    set(handles.r1,'Value',r1);
    
    r2=PlantInfo_DataCell{66,2};
    set(handles.r2,'Value',r2);  
    
    DenSTC=PlantInfo_DataCell{67,2};
    set(handles.DenSTC,'String',DenSTC);
    
    TempSTC=PlantInfo_DataCell{68,2};
    set(handles.TempSTC,'String',TempSTC);    
    
    PresTemp=PlantInfo_DataCell{69,2};
    set(handles.PresTemp,'String',PresTemp);
    
    AltiSTC=PlantInfo_DataCell{70,2};
    set(handles.AltiSTC,'String',AltiSTC);  
    
    OhmicLoss=PlantInfo_DataCell{71,2};
    set(handles.OhmicLoss,'String',OhmicLoss);
    
    TransLoss=PlantInfo_DataCell{72,2};
    set(handles.TransLoss,'String',TransLoss);  
    
    Wake1=PlantInfo_DataCell{73,2};
    set(handles.Wake1,'Value',Wake1);
    
    WakeLoss=PlantInfo_DataCell{74,2};
    set(handles.WakeLoss,'String',WakeLoss);  
    
    Wake2=PlantInfo_DataCell{75,2};
    set(handles.Wake2,'Value',Wake2);
    
    Perf_Rat=PlantInfo_DataCell{85,2};
    set(handles.Perf_Rat,'Value',Perf_Rat); 
    
    PR=PlantInfo_DataCell{86,2};
    set(handles.PR,'String',PR);
    
    Turbine_File=PlantInfo_DataCell{87,2};
    set(handles.Turbine_File,'Value',Turbine_File);  
    
    Terrain=PlantInfo_DataCell{88,2};
    set(handles.Terrain,'String',Terrain);
    
    HeightAnemometer=PlantInfo_DataCell{89,2};
    set(handles.HeightAnemometer,'String',HeightAnemometer); 
     
    % Modifying GUI Behaviour in accordance with Wake1 and Wake2 values
    if (Wake1==1)
        
        % Nothing Happens
        
    elseif (Wake2==1)
        
        % Opening Required GUI
        Wake_Model_GUI;
        
    end
    
    % Modifying GUI Behaviour in accordance with r1 and r2 values
    if (r1==1)
        
        set(handles.DenSTC, 'Enable', 'off');

        set(handles.TempSTC, 'Enable', 'off');

        set(handles.PresSTC, 'Enable', 'off');

        set(handles.AltiSTC, 'Enable', 'off');
        
        set(handles.b1, 'Enable', 'off');

        set(handles.OhmicLoss, 'Enable', 'off');

        set(handles.TransLoss, 'Enable', 'off');
        
        set(handles.WakeLoss, 'Enable', 'off');

        set(handles.b2, 'Enable', 'off');

        set(handles.Terrain, 'Enable', 'off');

        set(handles.HeightAnemometer, 'Enable', 'off');
        
        set(handles.PR,'Enable','off');

        set(handles.b5,'Enable','off');

        set(handles.b6,'Enable','off');

        set(handles.b7,'Enable','off');

        set(handles.b8,'Enable','off');         
        
    elseif (r2==1)
        
        set(handles.DenSTC, 'Enable', 'on');

        set(handles.TempSTC, 'Enable', 'on');

        set(handles.PresSTC, 'Enable', 'on');

        set(handles.AltiSTC, 'Enable', 'on');
        
        set(handles.b1, 'Enable', 'on');

        set(handles.OhmicLoss, 'Enable', 'on');

        set(handles.TransLoss, 'Enable', 'on');       
        
        if (Wake1==1)
            
            set(handles.WakeLoss, 'Enable', 'on');

            set(handles.b2, 'Enable', 'off'); 
            
        elseif (Wake2==1)
            
            set(handles.WakeLoss, 'Enable', 'off');

            set(handles.b2, 'Enable', 'on');
            
        end      
        
        set(handles.Terrain, 'Enable', 'on');

        set(handles.HeightAnemometer, 'Enable', 'on');
        
        if (Perf_Rat==1)
            
            set(handles.PR,'Enable','on');

            set(handles.b5,'Enable','off');
            set(handles.b6,'Enable','off');
            set(handles.b7,'Enable','off');
            set(handles.b8,'Enable','off');             
            
        elseif (Turbine_File==1)
            
            set(handles.PR,'Enable','off');

            set(handles.b5,'Enable','on');
            set(handles.b6,'Enable','on');
            set(handles.b7,'Enable','on');
            set(handles.b8,'Enable','on');             
            
        end
        
       
        
    end
    
    Friction_Table = cell(6,2);
    Friction_Table = {'Smooth Hard Ground, Calm Water', 0.10;
                      'Tall Grass On Level Ground', 0.15;
                      'High Crops, Hedges And Shrubs', 0.2;
                      'Wooded Countryside, Many Trees', 0.25;
                      'Small Town With Trees And Shrubs', 0.3;
                      'Large City With Tall Buildings', 0.4};
    set(handles.Friction_Table,'Data',Friction_Table);  
    
else
    
    % Initialization:

    set(handles.r1, 'Value', 1);
    
    set(handles.r2, 'Value', 0);
    
    set(handles.DenSTC, 'Enable', 'off');

    set(handles.TempSTC, 'Enable', 'off');

    set(handles.PresSTC, 'Enable', 'off');

    set(handles.AltiSTC, 'Enable', 'off');

    set(handles.b1, 'Enable', 'off');

    set(handles.OhmicLoss, 'Enable', 'off');

    set(handles.TransLoss, 'Enable', 'off');

    set(handles.Wake1, 'Value', 1);

    set(handles.Wake2, 'Value', 0);

    set(handles.WakeLoss, 'Enable', 'off');

    set(handles.b2, 'Enable', 'off');

    set(handles.Terrain, 'Enable', 'off');

    set(handles.HeightAnemometer, 'Enable', 'off');

    set(handles.DenSTC, 'String', 1.225);

    set(handles.TempSTC, 'String', 15);

    set(handles.PresSTC, 'String', 1);

    set(handles.AltiSTC, 'String', 0);

    set(handles.OhmicLoss, 'String', 3);

    set(handles.TransLoss, 'String', 1);

    set(handles.WakeLoss, 'String', 5);

    set(handles.Perf_Rat,'Value',1);

    set(handles.Turbine_File,'Value',0);

    set(handles.PR,'String','0.7');

    set(handles.PR,'Enable','off');

    set(handles.b5,'Enable','off');

    set(handles.b6,'Enable','off');

    set(handles.b7,'Enable','off');

    set(handles.b8,'Enable','off');

    set(handles.Terrain, 'String', 0.1);
    
    if (NormalMode==1) % Normal Mode is Selected

        set(handles.HeightAnemometer, 'String', 2.5);
        
    elseif (ForecastMode==1) % Forecast Mode is Selected
        
        set(handles.HeightAnemometer, 'String', '');
        
    end


    Friction_Table = cell(6,2);
    Friction_Table = {'Smooth Hard Ground, Calm Water', 0.10;
                      'Tall Grass On Level Ground', 0.15;
                      'High Crops, Hedges And Shrubs', 0.2;
                      'Wooded Countryside, Many Trees', 0.25;
                      'Small Town With Trees And Shrubs', 0.3;
                      'Large City With Tall Buildings', 0.4};
    set(handles.Friction_Table,'Data',Friction_Table);              

    
end

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'Wind_Loss_Parameters_GUI',gcf);


% UIWAIT makes Wind_Loss_Parameters_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Wind_Loss_Parameters_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function WakeLoss_Callback(hObject, eventdata, handles)
% hObject    handle to WakeLoss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WakeLoss as text
%        str2double(get(hObject,'String')) returns contents of WakeLoss as a double


% --- Executes during object creation, after setting all properties.
function WakeLoss_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WakeLoss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OhmicLoss_Callback(hObject, eventdata, handles)
% hObject    handle to OhmicLoss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OhmicLoss as text
%        str2double(get(hObject,'String')) returns contents of OhmicLoss as a double


% --- Executes during object creation, after setting all properties.
function OhmicLoss_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OhmicLoss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TransLoss_Callback(hObject, eventdata, handles)
% hObject    handle to TransLoss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TransLoss as text
%        str2double(get(hObject,'String')) returns contents of TransLoss as a double


% --- Executes during object creation, after setting all properties.
function TransLoss_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TransLoss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DenSTC_Callback(hObject, eventdata, handles)
% hObject    handle to DenSTC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DenSTC as text
%        str2double(get(hObject,'String')) returns contents of DenSTC as a double


% --- Executes during object creation, after setting all properties.
function DenSTC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DenSTC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TempSTC_Callback(hObject, eventdata, handles)
% hObject    handle to TempSTC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TempSTC as text
%        str2double(get(hObject,'String')) returns contents of TempSTC as a double


% --- Executes during object creation, after setting all properties.
function TempSTC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TempSTC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PresSTC_Callback(hObject, eventdata, handles)
% hObject    handle to PresSTC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PresSTC as text
%        str2double(get(hObject,'String')) returns contents of PresSTC as a double


% --- Executes during object creation, after setting all properties.
function PresSTC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PresSTC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AltiSTC_Callback(hObject, eventdata, handles)
% hObject    handle to AltiSTC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AltiSTC as text
%        str2double(get(hObject,'String')) returns contents of AltiSTC as a double


% --- Executes during object creation, after setting all properties.
function AltiSTC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AltiSTC (see GCBO)
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

% Getting Main GUI Workspace Name
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Getting the Normal and Forecast Mode Radio Button values from Wind_GUI_MainPage Workspace

NormalMode=getappdata(Wind_GUI_MainPage,'NormalMode');
ForecastMode=getappdata(Wind_GUI_MainPage,'ForecastMode');

% Resetting the GUI

set(handles.r1,'Value',1);

set(handles.r2,'Value',0);

    set(handles.DenSTC, 'Enable', 'off');
    
    set(handles.TempSTC, 'Enable', 'off');
    
    set(handles.PresSTC, 'Enable', 'off');
    
    set(handles.AltiSTC, 'Enable', 'off');
    
    set(handles.b1, 'Enable', 'off');
    
    set(handles.OhmicLoss, 'Enable', 'off');
    
    set(handles.TransLoss, 'Enable', 'off');
    
    set(handles.Wake1, 'Value', 1);
    
    set(handles.Wake2, 'Value', 0);
    
    set(handles.WakeLoss, 'Enable', 'off');
    
    set(handles.b2, 'Enable', 'off');
    
    set(handles.Perf_Rat,'Value',1);

    set(handles.Turbine_File,'Value',0);

    set(handles.PR,'String','0.7');

    set(handles.PR,'Enable','off');

    set(handles.b5,'Enable','off');

    set(handles.b6,'Enable','off');

    set(handles.b7,'Enable','off');

    set(handles.b8,'Enable','off');

    
    set(handles.Terrain, 'Enable', 'off');
    
    set(handles.HeightAnemometer, 'Enable', 'off');
    
    set(handles.DenSTC, 'String', 1.225);
    
    set(handles.TempSTC, 'String', 15);
    
    set(handles.PresSTC, 'String', 1);
    
    set(handles.AltiSTC, 'String', 0);
    
    set(handles.OhmicLoss, 'String', 3);
    
    set(handles.TransLoss, 'String', 1);
    
    set(handles.WakeLoss, 'String', 5);
    
    set(handles.Terrain, 'String', 0.1);
    
     if (NormalMode==1) % Normal Mode is Selected

        set(handles.HeightAnemometer, 'String', 2.5);
        
    elseif (ForecastMode==1) % Forecast Mode is Selected
        
        set(handles.HeightAnemometer, 'String', '');
        
    end

% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the Wind_GUI_MainPage Workspace

Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Getting the Normal and Forecast Mode Radio Button values from Wind_GUI_MainPage Workspace

NormalMode=getappdata(Wind_GUI_MainPage,'NormalMode');
ForecastMode=getappdata(Wind_GUI_MainPage,'ForecastMode');

% Getting the Wake_Model_GUI Workspace

Wake_Model_GUI=getappdata(0,'Wake_Model_GUI');
Wind_Loss_Parameters_GUI = getappdata(0,'Wind_Loss_Parameters_GUI');

% Getting Data from WIND_GUI_1 Workspace

Wind_GUI_1=getappdata(0,'Wind_GUI_1');
AllParameters=getappdata(Wind_GUI_1,'AllParameters');

Parameters_T1=AllParameters{1,2} ;
Parameters_T2=AllParameters{1,3} ;
Parameters_T3=AllParameters{1,4} ;
Parameters_T4=AllParameters{1,5} ;

sub_T1=Parameters_T1{1,1} ;
sub_T2=Parameters_T2{1,1} ;
sub_T3=Parameters_T3{1,1} ;
sub_T4=Parameters_T4{1,1} ;

% Disintegrating Cell AllParameters

WG_TurbineType=AllParameters{1,1} ;

% Disintegrating WG_TurbineType

T1=WG_TurbineType(1,1) ;
T2=WG_TurbineType(1,2) ;
T3=WG_TurbineType(1,3) ;
T4=WG_TurbineType(1,4) ;

% Getting Data From Current GUI and Wake Model GUI

DenSTC=get(handles.DenSTC,'String');
DenSTC=str2double(DenSTC);

TempSTC=get(handles.TempSTC,'String');
PresSTC=get(handles.PresSTC,'String');
AltiSTC=get(handles.AltiSTC,'String');

OhmicLoss=get(handles.OhmicLoss,'String');
OhmicLoss=str2double(OhmicLoss);

TransLoss=get(handles.TransLoss,'String');
TransLoss=str2double(TransLoss);

Wake1=get(handles.Wake1,'Value');
Wake2=get(handles.Wake2,'Value');

if Wake1==1
    
   WakeLoss=get(handles.WakeLoss,'String');
   WakeLoss=str2double(WakeLoss);
   
   WakeModelParameters={0,0,0,0,0,0,0,0,0};
    
elseif Wake2==1
    
    WakeLoss=0;
    
    WakeModelParameters=getappdata(Wake_Model_GUI, 'WakeModelParameters');

    
end

Perf_Rat=get(handles.Perf_Rat,'Value');
Turbine_File=get(handles.Turbine_File,'Value');

if (NormalMode==1) % Normal Mode is Selected

    if (Perf_Rat==1)

        PR=get(handles.PR,'String');
        PR=str2double(PR);

         ActiveTurbines_T1=cell(1,sub_T1);
         ActiveTurbines_T2=cell(1,sub_T2);
         ActiveTurbines_T3=cell(1,sub_T3);
         ActiveTurbines_T4=cell(1,sub_T4);

         ActiveTurbines={ActiveTurbines_T1,ActiveTurbines_T2,ActiveTurbines_T3,ActiveTurbines_T4};    

    elseif (Turbine_File==1)

        PR=0;

        if (T1==1)

            ActiveTurbines_T1=getappdata(Wind_Loss_Parameters_GUI,'ActiveTurbines_T1');

        elseif(T1==0)

             ActiveTurbines_T1=cell(1,sub_T1);

        end

        if (T2==1)

            ActiveTurbines_T2=getappdata(Wind_Loss_Parameters_GUI,'ActiveTurbines_T2');

        elseif(T2==0)

             ActiveTurbines_T2=cell(1,sub_T2);

        end  

        if (T3==1)

           ActiveTurbines_T3=getappdata(Wind_Loss_Parameters_GUI,'ActiveTurbines_T3');

        elseif(T3==0)

            ActiveTurbines_T3=cell(1,sub_T3);

        end  

        if (T4==1)

            ActiveTurbines_T4=getappdata(Wind_Loss_Parameters_GUI,'ActiveTurbines_T4');

        elseif(T4==0)

             ActiveTurbines_T4=cell(1,sub_T4);

        end        


        ActiveTurbines={ActiveTurbines_T1,ActiveTurbines_T2,ActiveTurbines_T3,ActiveTurbines_T4};

    end

elseif (NormalMode==1) % Normal Mode is Selected 
    
    if (Perf_Rat==1)
        
        PR=get(handles.PR,'String');
        PR=str2double(PR);

        ActiveTurbines_T1=cell(1,sub_T1);
        ActiveTurbines_T2=cell(1,sub_T2);
        ActiveTurbines_T3=cell(1,sub_T3);
        ActiveTurbines_T4=cell(1,sub_T4);

        ActiveTurbines={ActiveTurbines_T1,ActiveTurbines_T2,ActiveTurbines_T3,ActiveTurbines_T4};         
        
    elseif (Turbine_File==1)
        
        PR=0;

        if ((T1==1)||(T1==0))

             ActiveTurbines_T1=cell(1,1);

        end 

        if ((T2==1)||(T2==0))

             ActiveTurbines_T2=cell(1,1);

        end 

        if ((T3==1)||(T3==0))

             ActiveTurbines_T3=cell(1,1);

        end 

        if ((T4==1)||(T4==0))

             ActiveTurbines_T4=cell(1,1);

        end        


        ActiveTurbines={ActiveTurbines_T1,ActiveTurbines_T2,ActiveTurbines_T3,ActiveTurbines_T4};        
        
    end
    
end
    
Terrain=get(handles.Terrain,'String');
Terrain=str2double(Terrain);

HeightAnemometer=get(handles.HeightAnemometer,'String');
HeightAnemometer=str2double(HeightAnemometer);

Default=get(handles.r1,'Value');
User_Def=get(handles.r2,'Value');

WindLossParameters={Wake1,Wake2,DenSTC,OhmicLoss,TransLoss,WakeLoss,WakeModelParameters,Perf_Rat,Turbine_File,PR,ActiveTurbines,Terrain,HeightAnemometer,Default,User_Def,TempSTC,PresSTC,AltiSTC};

setappdata(Wind_Loss_Parameters_GUI,'WindLossParameters',WindLossParameters);

function Terrain_Callback(hObject, eventdata, handles)
% hObject    handle to Terrain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Terrain as text
%        str2double(get(hObject,'String')) returns contents of Terrain as a double


% --- Executes during object creation, after setting all properties.
function Terrain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Terrain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HeightAnemometer_Callback(hObject, eventdata, handles)
% hObject    handle to HeightAnemometer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HeightAnemometer as text
%        str2double(get(hObject,'String')) returns contents of HeightAnemometer as a double


% --- Executes during object creation, after setting all properties.
function HeightAnemometer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HeightAnemometer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Computing New Air Density

TempSTC=get(handles.TempSTC,'String');
TempSTC=str2double(TempSTC);

AltiSTC=get(handles.AltiSTC,'String');
AltiSTC=str2double(AltiSTC);

% Computing Pressure at the given Altitude using External Function
[ Pressure ] = PressureAtHeight( AltiSTC );

% Computing Air Density at Computed Pressure and Given Temperature using External Function
[ DenSTC ] = AirDensity( Pressure, TempSTC);

DenSTC=num2str(DenSTC);
set(handles.DenSTC,'String',DenSTC);

% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Wake Model GUI
Wake_Model_GUI;

% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

r1=get(handles.r1,'Value');

r2=get(handles.r2,'Value');

if r1==1
    
    set(handles.DenSTC, 'Enable', 'off');
    
    set(handles.TempSTC, 'Enable', 'off');
    
    set(handles.PresSTC, 'Enable', 'off');
    
    set(handles.AltiSTC, 'Enable', 'off');
    
    set(handles.b1, 'Enable', 'off');
    
    set(handles.OhmicLoss, 'Enable', 'off');
    
    set(handles.TransLoss, 'Enable', 'off');
    
    set(handles.Wake1, 'Value', 1);
    
    set(handles.Wake2, 'Value', 0);
    
    set(handles.WakeLoss, 'Enable', 'off');
    
    set(handles.b2, 'Enable', 'off');    
    
    set(handles.Perf_Rat, 'Value', 1);
    
    set(handles.Turbine_File, 'Value', 0); 
    
    set(handles.PR,'Enable','off');
    
    set(handles.b5,'Enable','off');
    
    set(handles.b6,'Enable','off');
    
    set(handles.b7,'Enable','off');
    
    set(handles.b8,'Enable','off');
    
    set(handles.Terrain, 'Enable', 'off');
    
    set(handles.HeightAnemometer, 'Enable', 'off');
    
    set(handles.DenSTC, 'String', 1.225);
    
    set(handles.TempSTC, 'String', 15);
    
    set(handles.PresSTC, 'String', 1);
    
    set(handles.AltiSTC, 'String', 0);
    
    set(handles.OhmicLoss, 'String', 3);
    
    set(handles.TransLoss, 'String', 1);
    
    set(handles.WakeLoss, 'String', 5);
    
    set(handles.PR,'String',0.7);
    
    set(handles.Terrain, 'String', 0.1);
    
    set(handles.HeightAnemometer, 'String', 2.5);
    
    
elseif r2==1
    
    set(handles.DenSTC, 'Enable', 'on');
    
    set(handles.TempSTC, 'Enable', 'on');
    
    set(handles.PresSTC, 'Enable', 'on');
    
    set(handles.AltiSTC, 'Enable', 'on');
    
    set(handles.b1, 'Enable', 'on');
    
    set(handles.OhmicLoss, 'Enable', 'on');
    
    set(handles.TransLoss, 'Enable', 'on');  

    set(handles.WakeLoss, 'Enable', 'on');   
   
    set(handles.PR,'Enable','on');
    
    set(handles.Terrain, 'Enable', 'on');
    
    set(handles.HeightAnemometer, 'Enable', 'on');  

    
  
    
end


% --- Executes when selected object is changed in uipanel10.
function uipanel10_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel10 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
Wake1=get(handles.Wake1,'Value');

Wake2=get(handles.Wake2,'Value');

if Wake1==1
    
    set(handles.WakeLoss,'Enable','on');
    set(handles.b2,'Enable','off');
    
elseif Wake2==1
    
    set(handles.WakeLoss,'Enable','off');
    set(handles.b2,'Enable','on');    
    
end



function PR_Callback(hObject, eventdata, handles)
% hObject    handle to PR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PR as text
%        str2double(get(hObject,'String')) returns contents of PR as a double


% --- Executes during object creation, after setting all properties.
function PR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PR (see GCBO)
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

% Getting Current GUI Workspace

Wind_Loss_Parameters_GUI=getappdata(0,'Wind_Loss_Parameters_GUI');

% Getting Data from Wind_GUI_1 GUI Window

Wind_GUI_1=getappdata(0,'Wind_GUI_1');
AllParameters=getappdata(Wind_GUI_1,'AllParameters');

Parameters_T1=AllParameters{1,2} ;

sub_T1=Parameters_T1{1,1} ;


% Initializing Cell Structure For Active Turbine File:
    
    ActiveTurbines_T1 = cell(1,sub_T1);
    
    for i = 1:sub_T1        
    
    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Active Turbines File Selector For WG_T1');
    fullpathname=strcat(pathname, filename);
    TempFile=xlsread(fullpathname);
    
    ActiveTurbines_T1(1,i) = {TempFile};
    
    end
    
    setappdata(Wind_Loss_Parameters_GUI,'ActiveTurbines_T1',ActiveTurbines_T1);

% --- Executes on button press in b6.
function b6_Callback(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI Workspace

Wind_Loss_Parameters_GUI=getappdata(0,'Wind_Loss_Parameters_GUI');

% Getting Data from Wind_GUI_1 GUI Window

Wind_GUI_1=getappdata(0,'Wind_GUI_1');
AllParameters=getappdata(Wind_GUI_1,'AllParameters');

Parameters_T2=AllParameters{1,3} ;

sub_T2=Parameters_T2{1,1} ;


% Initializing Cell Structure For Active Turbine File:
    
    ActiveTurbines_T2 = cell(1,sub_T2);
    
    for i = 1:sub_T2        
    
    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Active Turbines File Selector For WG_T2');
    fullpathname=strcat(pathname, filename);
    TempFile=xlsread(fullpathname);
    
    ActiveTurbines_T2(1,i) = {TempFile};
    
    end
    
    setappdata(Wind_Loss_Parameters_GUI,'ActiveTurbines_T2',ActiveTurbines_T2);

% --- Executes on button press in b8.
function b8_Callback(hObject, eventdata, handles)
% hObject    handle to b8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI Workspace

Wind_Loss_Parameters_GUI=getappdata(0,'Wind_Loss_Parameters_GUI');

% Getting Data from Wind_GUI_1 GUI Window

Wind_GUI_1=getappdata(0,'Wind_GUI_1');
AllParameters=getappdata(Wind_GUI_1,'AllParameters');

Parameters_T4=AllParameters{1,5} ;

sub_T4=Parameters_T4{1,1} ;


% Initializing Cell Structure For Active Turbine File:
    
    ActiveTurbines_T4 = cell(1,sub_T4);
    
    for i = 1:sub_T4        
    
    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Active Turbines File Selector For WG_T4');
    fullpathname=strcat(pathname, filename);
    TempFile=xlsread(fullpathname);
    
    ActiveTurbines_T4(1,i) = {TempFile};
    
    end
    
    setappdata(Wind_Loss_Parameters_GUI,'ActiveTurbines_T4',ActiveTurbines_T4);

% --- Executes on button press in b7.
function b7_Callback(hObject, eventdata, handles)
% hObject    handle to b7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI Workspace

Wind_Loss_Parameters_GUI=getappdata(0,'Wind_Loss_Parameters_GUI');

% Getting Data from Wind_GUI_1 GUI Window

Wind_GUI_1=getappdata(0,'Wind_GUI_1');
AllParameters=getappdata(Wind_GUI_1,'AllParameters');

Parameters_T3=AllParameters{1,4} ;

sub_T3=Parameters_T3{1,1} ;


% Initializing Cell Structure For Active Turbine File:
    
    ActiveTurbines_T3 = cell(1,sub_T3);
    
    for i = 1:sub_T3        
    
    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Active Turbines File Selector For WG_T3');
    fullpathname=strcat(pathname, filename);
    TempFile=xlsread(fullpathname);
    
    ActiveTurbines_T3(1,i) = {TempFile};
    
    end
    
    setappdata(Wind_Loss_Parameters_GUI,'ActiveTurbines_T3',ActiveTurbines_T3);

% --- Executes when selected object is changed in uipanel15.
function uipanel15_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel15 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Getting Current Wind_GUI_MainPage Workspace

Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Getting Normal and Forecast Mode Radio Button Values from Wind_GUI_MainPage Workspace

NormalMode=getappdata(Wind_GUI_MainPage,'NormalMode');
ForecastMode=getappdata(Wind_GUI_MainPage,'ForecastMode');

% Selection Change to GUI Elements

% Getting Radio Button Values
Perf_Rat=get(handles.Perf_Rat,'Value');
Turbine_File=get(handles.Turbine_File,'Value');

% Getting Data from Wind_GUI_1 GUI Window

Wind_GUI_1=getappdata(0,'Wind_GUI_1');
AllParameters=getappdata(Wind_GUI_1,'AllParameters');

WG_TurbineType=AllParameters{1,1} ;

T1=WG_TurbineType(1,1) ;
T2=WG_TurbineType(1,2) ;
T3=WG_TurbineType(1,3) ;
T4=WG_TurbineType(1,4) ;

% % For Testing
% T1=1 ;
% T2= 0;
% T3=1 ;
% T4=0;

if (NormalMode==1) % Normal Mode is Selected

    % Conditional Gui Effects
    if (Perf_Rat==1)

        set(handles.b5,'Enable','off');
        set(handles.b6,'Enable','off');
        set(handles.b7,'Enable','off');
        set(handles.b8,'Enable','off');

    elseif (Turbine_File==1)

        if (T1==1)

            set(handles.b5,'Enable','on');

        elseif(T1==0)

            set(handles.b5,'Enable','off');

        end

        if (T2==1)

            set(handles.b6,'Enable','on');

        elseif(T2==0)

            set(handles.b6,'Enable','off');

        end  

        if (T3==1)

           set(handles.b7,'Enable','on');

        elseif(T3==0)

           set(handles.b7,'Enable','off');

        end  

        if (T4==1)

            set(handles.b8,'Enable','on'); 

        elseif(T4==0)

            set(handles.b8,'Enable','off'); 

        end




    end
    
elseif (ForecastMode==1) % Forecast Mode is Selected
    
    set(handles.b5,'Enable','off');
    set(handles.b6,'Enable','off');
    set(handles.b7,'Enable','off');
    set(handles.b8,'Enable','off');
    
end
    


% --- Executes on button press in Turbine_File.
function Turbine_File_Callback(hObject, eventdata, handles)
% hObject    handle to Turbine_File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Turbine_File
