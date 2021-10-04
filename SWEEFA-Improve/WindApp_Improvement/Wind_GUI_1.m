function varargout = Wind_GUI_1(varargin)
% WIND_GUI_1 MATLAB code for Wind_GUI_1.fig
%      WIND_GUI_1, by itself, creates a new WIND_GUI_1 or raises the existing
%      singleton*.
%
%      H = WIND_GUI_1 returns the handle to a new WIND_GUI_1 or the handle to
%      the existing singleton*.
%
%      WIND_GUI_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WIND_GUI_1.M with the given input arguments.
%
%      WIND_GUI_1('Property','Value',...) creates a new WIND_GUI_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Wind_GUI_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Wind_GUI_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Wind_GUI_1

% Last Modified by GUIDE v2.5 08-Mar-2018 15:09:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Wind_GUI_1_OpeningFcn, ...
                   'gui_OutputFcn',  @Wind_GUI_1_OutputFcn, ...
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


% --- Executes just before Wind_GUI_1 is made visible.
function Wind_GUI_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Wind_GUI_1 (see VARARGIN)

% Choose default command line output for Wind_GUI_1
handles.output = hObject;

% Getting Required GUI Workspace Name
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Getting Normal and Forecast Mode Info

NormalMode=getappdata(Wind_GUI_MainPage,'NormalMode');
ForecastMode=getappdata(Wind_GUI_MainPage,'ForecastMode');

if (isappdata(0,'Wind_GUI_MainPage') && isappdata(Wind_GUI_MainPage,'PlantInfo_DataCell'))
    
    % Getting Data fro Solar_App_Main_GUI Workspace    
    PlantInfo_DataCell=getappdata(Wind_GUI_MainPage,'PlantInfo_DataCell');   
            
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
    
    set(handles.b9, 'Enable', 'off');
    set(handles.b10, 'Enable', 'off');
    set(handles.b11, 'Enable', 'off');
    set(handles.b12, 'Enable', 'off');

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

    % Getting Relevant Data from Plant Info

    T1=PlantInfo_DataCell{13,2};
    set(handles.T1,'Value',T1);

    T2=PlantInfo_DataCell{14,2};
    set(handles.T2,'Value',T2);     

    T3=PlantInfo_DataCell{15,2};
    set(handles.T3,'Value',T3);    

    T4=PlantInfo_DataCell{16,2};
    set(handles.T4,'Value',T4); 

    % Changing GUI Behaviour according to T1, T2, T3 and T4 Values
    if (T1==1)

        % Relevant Data Parsing from the Backend Plant Info Excel Sheet
        sub_T1=PlantInfo_DataCell{19,2};
        set(handles.sub_T1,'String',sub_T1);

        subnum_T1=PlantInfo_DataCell{25,2};
        set(handles.subnum_T1,'String',subnum_T1);

        cutin_T1=PlantInfo_DataCell{31,2};
        set(handles.cutin_T1,'String',cutin_T1);

        cutout_T1=PlantInfo_DataCell{35,2};
        set(handles.cutout_T1,'String',cutout_T1);       

        hub_T1=PlantInfo_DataCell{41,2};
        set(handles.hub_T1,'String',hub_T1);   

        rotrad_T1=PlantInfo_DataCell{45,2};
        set(handles.rotrad_T1,'String',rotrad_T1);  

        % Relevant GUI Behaviour
        set(handles.b1, 'Enable', 'on');
        if (NormalMode==1)
            
            set(handles.b9, 'Enable', 'off');
            
        elseif (ForecastMode==1)
            
            set(handles.b9, 'Enable', 'on');
            
        end
        set(handles.sub_T1, 'Enable', 'on');
        set(handles.subnum_T1, 'Enable', 'on');
        set(handles.hub_T1, 'Enable', 'on');
        set(handles.rotrad_T1, 'Enable', 'on');
        set(handles.cutin_T1, 'Enable', 'on');
        set(handles.cutout_T1, 'Enable', 'on');        


    end


    if (T2==1)

        % Relevant Data Parsing from the Backend Plant Info Excel Sheet
        sub_T2=PlantInfo_DataCell{20,2};
        set(handles.sub_T2,'String',sub_T2);  

        subnum_T2=PlantInfo_DataCell{26,2};
        set(handles.subnum_T2,'String',subnum_T2);  

        cutin_T2=PlantInfo_DataCell{32,2};
        set(handles.cutin_T2,'String',cutin_T2);  

        cutout_T2=PlantInfo_DataCell{36,2};
        set(handles.cutout_T2,'String',cutout_T2); 

        hub_T2=PlantInfo_DataCell{42,2};
        set(handles.hub_T2,'String',hub_T2); 

        rotrad_T2=PlantInfo_DataCell{46,2};
        set(handles.rotrad_T2,'String',rotrad_T2);  

        % Relevant GUI Behaviour
        set(handles.b2, 'Enable', 'on');
        if (NormalMode==1)
            
            set(handles.b10, 'Enable', 'off');
            
        elseif (ForecastMode==1)
            
            set(handles.b10, 'Enable', 'on');
            
        end        
        set(handles.sub_T2, 'Enable', 'on');
        set(handles.subnum_T2, 'Enable', 'on');
        set(handles.hub_T2, 'Enable', 'on');
        set(handles.rotrad_T2, 'Enable', 'on');
        set(handles.cutin_T2, 'Enable', 'on');
        set(handles.cutout_T2, 'Enable', 'on');   


    end

    if (T3==1)

        % Relevant Data Parsing from the Backend Plant Info Excel Sheet
        sub_T3=PlantInfo_DataCell{21,2};
        set(handles.sub_T3,'String',sub_T3);      

        subnum_T3=PlantInfo_DataCell{27,2};
        set(handles.subnum_T3,'String',subnum_T3); 

        cutin_T3=PlantInfo_DataCell{33,2};
        set(handles.cutin_T3,'String',cutin_T3); 

        cutout_T3=PlantInfo_DataCell{37,2};
        set(handles.cutout_T3,'String',cutout_T3);   

        hub_T3=PlantInfo_DataCell{43,2};
        set(handles.hub_T3,'String',hub_T3); 

        rotrad_T3=PlantInfo_DataCell{47,2};
        set(handles.rotrad_T3,'String',rotrad_T3);  

        % Relevant GUI Behaviour
        set(handles.b3, 'Enable', 'on');
        if (NormalMode==1)
            
            set(handles.b11, 'Enable', 'off');
            
        elseif (ForecastMode==1)
            
            set(handles.b11, 'Enable', 'on');
            
        end        
        set(handles.sub_T3, 'Enable', 'on');
        set(handles.subnum_T3, 'Enable', 'on');
        set(handles.hub_T3, 'Enable', 'on');
        set(handles.rotrad_T3, 'Enable', 'on');
        set(handles.cutin_T3, 'Enable', 'on');
        set(handles.cutout_T3, 'Enable', 'on');      


    end

    if (T4==1)

        % Relevant Data Parsing from the Backend Plant Info Excel Sheet
        sub_T4=PlantInfo_DataCell{22,2};
        set(handles.sub_T4,'String',sub_T4);  

        subnum_T4=PlantInfo_DataCell{28,2};
        set(handles.subnum_T4,'String',subnum_T4);  

        cutin_T4=PlantInfo_DataCell{34,2};
        set(handles.cutin_T4,'String',cutin_T4);  

        cutout_T4=PlantInfo_DataCell{38,2};
        set(handles.cutout_T4,'String',cutout_T4);

        hub_T4=PlantInfo_DataCell{44,2};
        set(handles.hub_T4,'String',hub_T4); 

        rotrad_T4=PlantInfo_DataCell{48,2};
        set(handles.rotrad_T4,'String',rotrad_T4);  

        % Relevant GUI Behaviour            
        set(handles.b4, 'Enable', 'on');
        if (NormalMode==1)
            
            set(handles.b12, 'Enable', 'off');
            
        elseif (ForecastMode==1)
            
            set(handles.b12, 'Enable', 'on');
            
        end        
        set(handles.sub_T4, 'Enable', 'on');
        set(handles.subnum_T4, 'Enable', 'on');
        set(handles.hub_T4, 'Enable', 'on');
        set(handles.rotrad_T4, 'Enable', 'on');
        set(handles.cutin_T4, 'Enable', 'on');
        set(handles.cutout_T4, 'Enable', 'on');     

    end  
                  
   
else
    
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
    
    set(handles.b9, 'Enable', 'off');
    set(handles.b10, 'Enable', 'off');
    set(handles.b11, 'Enable', 'off');
    set(handles.b12, 'Enable', 'off');    

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
    
end

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'Wind_GUI_1',gcf);

% UIWAIT makes Wind_GUI_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Wind_GUI_1_OutputFcn(hObject, eventdata, handles) 
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

% Getting Required GUI Workspace Name
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Getting Normal and Forecast Mode Info

NormalMode=getappdata(Wind_GUI_MainPage,'NormalMode');
ForecastMode=getappdata(Wind_GUI_MainPage,'ForecastMode');

T1 = get(handles.T1, 'Value');

if T1 == 1

    set(handles.b1, 'Enable', 'on');
    
    if (NormalMode==1)

    set(handles.b9, 'Enable', 'off');

    elseif (ForecastMode==1)

    set(handles.b9, 'Enable', 'on');

    end      

    set(handles.sub_T1, 'Enable', 'on');

    set(handles.subnum_T1, 'Enable', 'on');

    set(handles.hub_T1, 'Enable', 'on');

    set(handles.rotrad_T1, 'Enable', 'on');

    set(handles.cutin_T1, 'Enable', 'on');

    set(handles.cutout_T1, 'Enable', 'on');        

elseif T1 == 0

    set(handles.b1, 'Enable', 'off');
    
    set(handles.b9, 'Enable', 'off');

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

% Getting Required GUI Workspace Name
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Getting Normal and Forecast Mode Info

NormalMode=getappdata(Wind_GUI_MainPage,'NormalMode');
ForecastMode=getappdata(Wind_GUI_MainPage,'ForecastMode');

T2 = get(handles.T2, 'Value');
   
if T2 == 1

    set(handles.b2, 'Enable', 'on');
    
    if (NormalMode==1)

    set(handles.b10, 'Enable', 'off');

    elseif (ForecastMode==1)

    set(handles.b10, 'Enable', 'on');

    end       

    set(handles.sub_T2, 'Enable', 'on');

    set(handles.subnum_T2, 'Enable', 'on');

    set(handles.hub_T2, 'Enable', 'on');

    set(handles.rotrad_T2, 'Enable', 'on');

    set(handles.cutin_T2, 'Enable', 'on');

    set(handles.cutout_T2, 'Enable', 'on');          

elseif T2 == 0

    set(handles.b2, 'Enable', 'off');
    
    set(handles.b10, 'Enable', 'off');

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


% Getting Required GUI Workspace Name
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Getting Normal and Forecast Mode Info

NormalMode=getappdata(Wind_GUI_MainPage,'NormalMode');
ForecastMode=getappdata(Wind_GUI_MainPage,'ForecastMode');

T3 = get(handles.T3, 'Value');
    
if T3 == 1

    set(handles.b3, 'Enable', 'on');
    
    if (NormalMode==1)

    set(handles.b11, 'Enable', 'off');

    elseif (ForecastMode==1)

    set(handles.b11, 'Enable', 'on');

    end    

    set(handles.sub_T3, 'Enable', 'on');

    set(handles.subnum_T3, 'Enable', 'on');

    set(handles.hub_T3, 'Enable', 'on');

    set(handles.rotrad_T3, 'Enable', 'on');

    set(handles.cutin_T3, 'Enable', 'on');

    set(handles.cutout_T3, 'Enable', 'on');         

elseif T3 == 0

    set(handles.b3, 'Enable', 'off');
    
    set(handles.b11, 'Enable', 'off');

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

% Getting Required GUI Workspace Name
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Getting Normal and Forecast Mode Info

NormalMode=getappdata(Wind_GUI_MainPage,'NormalMode');
ForecastMode=getappdata(Wind_GUI_MainPage,'ForecastMode');

T4 = get(handles.T4, 'Value');

    
if T4 == 1

    set(handles.b4, 'Enable', 'on');
    
    if (NormalMode==1)

    set(handles.b12, 'Enable', 'off');

    elseif (ForecastMode==1)

    set(handles.b12, 'Enable', 'on');

    end

    set(handles.sub_T4, 'Enable', 'on');

    set(handles.subnum_T4, 'Enable', 'on');

    set(handles.hub_T4, 'Enable', 'on');

    set(handles.rotrad_T4, 'Enable', 'on');

    set(handles.cutin_T4, 'Enable', 'on');

    set(handles.cutout_T4, 'Enable', 'on');          

elseif T4 == 0

    set(handles.b4, 'Enable', 'off');
    
    set(handles.b12, 'Enable', 'off');

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
Wind_GUI_1=getappdata(0,'Wind_GUI_1');

% Getting Required GUI Workspace Name
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Getting Normal and Forecast Mode Info

NormalMode=getappdata(Wind_GUI_MainPage,'NormalMode');
ForecastMode=getappdata(Wind_GUI_MainPage,'ForecastMode');

% Setting-up conditions according to Radiobutton selection:

if (NormalMode==1)
    
    sub_T1 = get(handles.sub_T1, 'String');
    
    sub_T1 = str2double(sub_T1);
    
    % Initializing Cell Structure For Power Curve:
    
    PowerCurve_T1 = cell(1,sub_T1);
    
    for i = 1:sub_T1        
    
        % Loading Wind Power File into Simulation:
        [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T1');
        fullpathname=strcat(pathname, filename);
        TempFile=xlsread(fullpathname);

        PowerCurve_T1(1,i) = {TempFile};
    
    end
    
    setappdata(Wind_GUI_1,'PowerCurve_T1',PowerCurve_T1);
    
   % assignin('base','temp',TempFile); % For Debugging
    
elseif (ForecastMode==1)
    
    % Getting Computation Option
    
    ComputationOptionsMenu=getappdata(Wind_GUI_MainPage,'ComputationOptionsMenu');
    
    if (ComputationOptionsMenu==2) % Get Standard Power Curves
        
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

        setappdata(Wind_GUI_1,'PowerCurve_T1',PowerCurve_T1);        
        
    elseif (ComputationOptionsMenu==3) % Get Real Averaged Power Curves per Turbine
        
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

        setappdata(Wind_GUI_1,'PowerCurve_T1',PowerCurve_T1);        
        
    elseif (ComputationOptionsMenu==4) % Get Real Real Averaged power Curve for the Plant
        
        % Loading Wind Power File into Simulation:
        [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T1 [Real Averaged Power Curve for the Plant]');   
        
        fullpathname=strcat(pathname, filename);         
        
        TempFile=xlsread(fullpathname);

        PowerCurve_T1 = {TempFile};        

        setappdata(Wind_GUI_1,'PowerCurve_T1',PowerCurve_T1);          
        
    end
    
end


% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_GUI_1=getappdata(0,'Wind_GUI_1');

% Getting Required GUI Workspace Name
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Getting Normal and Forecast Mode Info

NormalMode=getappdata(Wind_GUI_MainPage,'NormalMode');
ForecastMode=getappdata(Wind_GUI_MainPage,'ForecastMode');

% Setting-up conditions according to Radiobutton selection:

if (NormalMode==1)
    
    sub_T2 = get(handles.sub_T2, 'String');
    
    sub_T2 = str2double(sub_T2);
    
    % Initializing Cell Structure For Power Curve
    
    PowerCurve_T2 = cell(1,sub_T2);    
      
    for i = 1:sub_T2        
    
        % Loading Wind Power File into Simulation
        [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T2');
        fullpathname=strcat(pathname, filename);
        TempFile=xlsread(fullpathname);

        PowerCurve_T2(1,i) = {TempFile};
    
    end
    
    setappdata(Wind_GUI_1,'PowerCurve_T2',PowerCurve_T2);
    
    % assignin('base','temp',TempFile); % For Debugging 
    
elseif (ForecastMode==1)
    
    % Getting Computation Option
    
    ComputationOptionsMenu=getappdata(Wind_GUI_MainPage,'ComputationOptionsMenu');
    
    if (ComputationOptionsMenu==2) % Get Standard Power Curves
        
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

        setappdata(Wind_GUI_1,'PowerCurve_T2',PowerCurve_T2);        
        
    elseif (ComputationOptionsMenu==3) % Get Real Averaged Power Curves per Turbine
        
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

        setappdata(Wind_GUI_1,'PowerCurve_T2',PowerCurve_T2);        
        
    elseif (ComputationOptionsMenu==4) % Get Real Real Averaged power Curve for the Plant
        
        % Loading Wind Power File into Simulation:
        [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T2 [Real Averaged Power Curve for the Plant]');   
        
        fullpathname=strcat(pathname, filename);         
        
        TempFile=xlsread(fullpathname);

        PowerCurve_T2 = {TempFile};        

        setappdata(Wind_GUI_1,'PowerCurve_T2',PowerCurve_T2);          
        
    end   
    
end


% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_GUI_1=getappdata(0,'Wind_GUI_1');

% Getting Required GUI Workspace Name
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Getting Normal and Forecast Mode Info

NormalMode=getappdata(Wind_GUI_MainPage,'NormalMode');
ForecastMode=getappdata(Wind_GUI_MainPage,'ForecastMode');

% Setting-up conditions according to Radiobutton selection:

if (NormalMode==1)
    
    sub_T3 = get(handles.sub_T3, 'String');
    
    sub_T3 = str2double(sub_T3);
    
    % Initializing Cell Structure For Power Curve
    
    PowerCurve_T3 = cell(1,sub_T3);
    
    for i = 1:sub_T3        
    
        % Loading Wind Power File into Simulation
        [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T3');
        fullpathname=strcat(pathname, filename);
        TempFile=xlsread(fullpathname);

        PowerCurve_T3(1,i) = {TempFile};
    
    end
    
    setappdata(Wind_GUI_1,'PowerCurve_T3',PowerCurve_T3);
    
    % assignin('base','temp',TempFile); % For Debugging  
    
elseif (ForecastMode==1)
    
    % Getting Computation Option
    
    ComputationOptionsMenu=getappdata(Wind_GUI_MainPage,'ComputationOptionsMenu');
    
    if (ComputationOptionsMenu==2) % Get Standard Power Curves
        
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

        setappdata(Wind_GUI_1,'PowerCurve_T3',PowerCurve_T3);        
        
    elseif (ComputationOptionsMenu==3) % Get Real Averaged Power Curves per Turbine
        
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

        setappdata(Wind_GUI_1,'PowerCurve_T3',PowerCurve_T3);        
        
    elseif (ComputationOptionsMenu==4) % Get Real Real Averaged power Curve for the Plant
        
        % Loading Wind Power File into Simulation:
        [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T3 [Real Averaged Power Curve for the Plant]');   
        
        fullpathname=strcat(pathname, filename);         
        
        TempFile=xlsread(fullpathname);

        PowerCurve_T3 = {TempFile};        

        setappdata(Wind_GUI_1,'PowerCurve_T3',PowerCurve_T3);          
        
    end  
    
end


% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_GUI_1=getappdata(0,'Wind_GUI_1');

% Getting Required GUI Workspace Name
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Getting Normal and Forecast Mode Info

NormalMode=getappdata(Wind_GUI_MainPage,'NormalMode');
ForecastMode=getappdata(Wind_GUI_MainPage,'ForecastMode');

% Setting-up conditions according to Radiobutton selection:

if (NormalMode==1)
    
    sub_T4 = get(handles.sub_T4, 'String');
    
    sub_T4 = str2double(sub_T4);
    
    % Initializing Cell Structure For Power Curve
    
    PowerCurve_T4 = cell(1,sub_T4);
    
    for i = 1:sub_T4        
    
        % Loading Wind Power File into Simulation
        [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T4');
        fullpathname=strcat(pathname, filename);
        TempFile=xlsread(fullpathname);

        PowerCurve_T4(1,i) = {TempFile};
    
    end
    
    setappdata(Wind_GUI_1,'PowerCurve_T4',PowerCurve_T4); 
    
     % assignin('base','temp',TempFile); % For Debugging
    
elseif (ForecastMode==1)
    
    % Getting Computation Option
    
    ComputationOptionsMenu=getappdata(Wind_GUI_MainPage,'ComputationOptionsMenu');
    
    if (ComputationOptionsMenu==2) % Get Standard Power Curves
        
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

        setappdata(Wind_GUI_1,'PowerCurve_T4',PowerCurve_T4);        
        
    elseif (ComputationOptionsMenu==3) % Get Real Averaged Power Curves per Turbine
        
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

        setappdata(Wind_GUI_1,'PowerCurve_T4',PowerCurve_T4);        
        
    elseif (ComputationOptionsMenu==4) % Get Real Real Averaged power Curve for the Plant
        
        % Loading Wind Power File into Simulation:
        [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T4 [Real Averaged Power Curve for the Plant]');   
        
        fullpathname=strcat(pathname, filename);         
        
        TempFile=xlsread(fullpathname);

        PowerCurve_T4 = {TempFile};        

        setappdata(Wind_GUI_1,'PowerCurve_T4',PowerCurve_T4);          
        
    end
    
end


% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Required GUI Workspace Name
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

% Getting Normal and Forecast Mode Info

NormalMode=getappdata(Wind_GUI_MainPage,'NormalMode');
ForecastMode=getappdata(Wind_GUI_MainPage,'ForecastMode');

Wind_GUI_1 = getappdata(0,'Wind_GUI_1');

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
   
   if (NormalMode==1)
       
       LatLongAlt_T1=getappdata(Wind_GUI_1,'LatLongAlt_T1');
       
   elseif (ForecastMode==1)
       
       LatLongAlt_T1=0;
       
   end     

   Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1,rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};

   setappdata(Wind_GUI_1,'Parameters_T1',Parameters_T1);

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

   setappdata(Wind_GUI_1,'Parameters_T2',Parameters_T2);

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

   setappdata(Wind_GUI_1,'Parameters_T3',Parameters_T3);

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

   setappdata(Wind_GUI_1,'Parameters_T4',Parameters_T4);

   %% Cell for all parameters:

   AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

   setappdata(Wind_GUI_1,'AllParameters', AllParameters);

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

    setappdata(Wind_GUI_1,'Parameters_T1',Parameters_T1);

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

    Power_T2 = getappdata(Wind_GUI_1,'PowerCurve_T2');
    
   if (NormalMode==1)
       
       LatLongAlt_T2=getappdata(Wind_GUI_1,'LatLongAlt_T2');
       
   elseif (ForecastMode==1)
       
       LatLongAlt_T2=0;
       
   end      

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};

    setappdata(Wind_GUI_1,'Parameters_T2',Parameters_T2);

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

    setappdata(Wind_GUI_1,'Parameters_T3',Parameters_T3);

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

    setappdata(Wind_GUI_1,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_GUI_1,'AllParameters', AllParameters);

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

    Power_T1 = getappdata(Wind_GUI_1,'PowerCurve_T1');
    
   if (NormalMode==1)
       
       LatLongAlt_T1=getappdata(Wind_GUI_1,'LatLongAlt_T1');
       
   elseif (ForecastMode==1)
       
       LatLongAlt_T1=0;
       
   end      

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};
    setappdata(Wind_GUI_1,'Parameters_T1',Parameters_T1);

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

    Power_T2 = getappdata(Wind_GUI_1,'PowerCurve_T2');
    
   if (NormalMode==1)
       
       LatLongAlt_T2=getappdata(Wind_GUI_1,'LatLongAlt_T2');
       
   elseif (ForecastMode==1)
       
       LatLongAlt_T2=0;
       
   end      

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};
    setappdata(Wind_GUI_1,'Parameters_T2',Parameters_T2);

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

    setappdata(Wind_GUI_1,'Parameters_T3',Parameters_T3);

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

    setappdata(Wind_GUI_1,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_GUI_1,'AllParameters', AllParameters);

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

    setappdata(Wind_GUI_1,'Parameters_T1',Parameters_T1);

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

    setappdata(Wind_GUI_1,'Parameters_T2',Parameters_T2);

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

    Power_T3 = getappdata(Wind_GUI_1,'PowerCurve_T3');
    
    if (NormalMode==1)

    LatLongAlt_T3=getappdata(Wind_GUI_1,'LatLongAlt_T3');

    elseif (ForecastMode==1)

    LatLongAlt_T3=0;

    end  

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};
    setappdata(Wind_GUI_1,'Parameters_T3',Parameters_T3);

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

    setappdata(Wind_GUI_1,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_GUI_1,'AllParameters', AllParameters);

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

    Power_T1 = getappdata(Wind_GUI_1,'PowerCurve_T1');
    
    if (NormalMode==1)

    LatLongAlt_T1=getappdata(Wind_GUI_1,'LatLongAlt_T1');

    elseif (ForecastMode==1)

    LatLongAlt_T1=0;

    end      

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};
    setappdata(Wind_GUI_1,'Parameters_T1',Parameters_T1);

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

    setappdata(Wind_GUI_1,'Parameters_T2',Parameters_T2);

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


    Power_T3 = getappdata(Wind_GUI_1,'PowerCurve_T3');
    
    if (NormalMode==1)

    LatLongAlt_T3=getappdata(Wind_GUI_1,'LatLongAlt_T3');

    elseif (ForecastMode==1)

    LatLongAlt_T3=0;

    end      

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};
    setappdata(Wind_GUI_1,'Parameters_T3',Parameters_T3);

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

    setappdata(Wind_GUI_1,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_GUI_1,'AllParameters', AllParameters);

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

    setappdata(Wind_GUI_1,'Parameters_T1',Parameters_T1);

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

    Power_T2 = getappdata(Wind_GUI_1,'PowerCurve_T2');
    
    if (NormalMode==1)

    LatLongAlt_T2=getappdata(Wind_GUI_1,'LatLongAlt_T2');

    elseif (ForecastMode==1)

    LatLongAlt_T2=0;

    end        

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};
    setappdata(Wind_GUI_1,'Parameters_T2',Parameters_T2);

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


    Power_T3 = getappdata(Wind_GUI_1,'PowerCurve_T3');
    
    if (NormalMode==1)

    LatLongAlt_T3=getappdata(Wind_GUI_1,'LatLongAlt_T3');

    elseif (ForecastMode==1)

    LatLongAlt_T3=0;

    end      

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};
    setappdata(Wind_GUI_1,'Parameters_T3',Parameters_T3);

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

    setappdata(Wind_GUI_1,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_GUI_1,'AllParameters', AllParameters);

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

    Power_T1 = getappdata(Wind_GUI_1,'PowerCurve_T1');
    
    if (NormalMode==1)

    LatLongAlt_T1=getappdata(Wind_GUI_1,'LatLongAlt_T1');

    elseif (ForecastMode==1)

    LatLongAlt_T1=0;

    end     

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};
    setappdata(Wind_GUI_1,'Parameters_T1',Parameters_T1);

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

    Power_T2 = getappdata(Wind_GUI_1,'PowerCurve_T2');
    
    if (NormalMode==1)

    LatLongAlt_T2=getappdata(Wind_GUI_1,'LatLongAlt_T2');

    elseif (ForecastMode==1)

    LatLongAlt_T2=0;

    end      

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};
    setappdata(Wind_GUI_1,'Parameters_T2',Parameters_T2);

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

    Power_T3 = getappdata(Wind_GUI_1,'PowerCurve_T3');
    
    if (NormalMode==1)

    LatLongAlt_T3=getappdata(Wind_GUI_1,'LatLongAlt_T3');

    elseif (ForecastMode==1)

    LatLongAlt_T3=0;

    end      

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};
    setappdata(Wind_GUI_1,'Parameters_T3',Parameters_T3);

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

    setappdata(Wind_GUI_1,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_GUI_1,'AllParameters', AllParameters);

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

    setappdata(Wind_GUI_1,'Parameters_T1',Parameters_T1);

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

    setappdata(Wind_GUI_1,'Parameters_T2',Parameters_T2);

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

    setappdata(Wind_GUI_1,'Parameters_T3',Parameters_T3);

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

    Power_T4 = getappdata(Wind_GUI_1,'PowerCurve_T4');
    
    if (NormalMode==1)

    LatLongAlt_T4=getappdata(Wind_GUI_1,'LatLongAlt_T4');

    elseif (ForecastMode==1)

    LatLongAlt_T4=0;

    end      

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};
    setappdata(Wind_GUI_1,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_GUI_1,'AllParameters', AllParameters);

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

    Power_T1 = getappdata(Wind_GUI_1,'PowerCurve_T1');
    
    if (NormalMode==1)

    LatLongAlt_T1=getappdata(Wind_GUI_1,'LatLongAlt_T1');

    elseif (ForecastMode==1)

    LatLongAlt_T1=0;

    end        

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};
    setappdata(Wind_GUI_1,'Parameters_T1',Parameters_T1);

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

    setappdata(Wind_GUI_1,'Parameters_T2',Parameters_T2);

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

    setappdata(Wind_GUI_1,'Parameters_T3',Parameters_T3);

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


    Power_T4 = getappdata(Wind_GUI_1,'PowerCurve_T4');
    
    if (NormalMode==1)

    LatLongAlt_T4=getappdata(Wind_GUI_1,'LatLongAlt_T4');

    elseif (ForecastMode==1)

    LatLongAlt_T4=0;

    end      

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};
    setappdata(Wind_GUI_1,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_GUI_1,'AllParameters', AllParameters);

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

    setappdata(Wind_GUI_1,'Parameters_T1',Parameters_T1);

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

    Power_T2 = getappdata(Wind_GUI_1,'PowerCurve_T2');
    
    if (NormalMode==1)

    LatLongAlt_T2=getappdata(Wind_GUI_1,'LatLongAlt_T2');

    elseif (ForecastMode==1)

    LatLongAlt_T2=0;

    end     

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};
    setappdata(Wind_GUI_1,'Parameters_T2',Parameters_T2);

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

    setappdata(Wind_GUI_1,'Parameters_T3',Parameters_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3);

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

    Power_T4 = getappdata(Wind_GUI_1,'PowerCurve_T4');
    
    if (NormalMode==1)

    LatLongAlt_T4=getappdata(Wind_GUI_1,'LatLongAlt_T4');

    elseif (ForecastMode==1)

    LatLongAlt_T4=0;

    end     

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};
    setappdata(Wind_GUI_1,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_GUI_1,'AllParameters', AllParameters);

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

    Power_T1 = getappdata(Wind_GUI_1,'PowerCurve_T1');
    
    if (NormalMode==1)

    LatLongAlt_T1=getappdata(Wind_GUI_1,'LatLongAlt_T1');

    elseif (ForecastMode==1)

    LatLongAlt_T1=0;

    end     

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};
    setappdata(Wind_GUI_1,'Parameters_T1',Parameters_T1);

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

    Power_T2 = getappdata(Wind_GUI_1,'PowerCurve_T2');
    
    if (NormalMode==1)

    LatLongAlt_T2=getappdata(Wind_GUI_1,'LatLongAlt_T2');

    elseif (ForecastMode==1)

    LatLongAlt_T2=0;

    end    

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};
    setappdata(Wind_GUI_1,'Parameters_T2',Parameters_T2);

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

    setappdata(Wind_GUI_1,'Parameters_T3',Parameters_T3);

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


    Power_T4 = getappdata(Wind_GUI_1,'PowerCurve_T4');
    
    if (NormalMode==1)

    LatLongAlt_T4=getappdata(Wind_GUI_1,'LatLongAlt_T4');

    elseif (ForecastMode==1)

    LatLongAlt_T4=0;

    end      

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};
    setappdata(Wind_GUI_1,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_GUI_1,'AllParameters', AllParameters);

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

    setappdata(Wind_GUI_1,'Parameters_T1',Parameters_T1);

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

    setappdata(Wind_GUI_1,'Parameters_T2',Parameters_T2);

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

    Power_T3 = getappdata(Wind_GUI_1,'PowerCurve_T3');
    
    if (NormalMode==1)

    LatLongAlt_T3=getappdata(Wind_GUI_1,'LatLongAlt_T3');

    elseif (ForecastMode==1)

    LatLongAlt_T3=0;

    end     

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};
    setappdata(Wind_GUI_1,'Parameters_T3',Parameters_T3);

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

    Power_T4 = getappdata(Wind_GUI_1,'PowerCurve_T4');
    
    if (NormalMode==1)

    LatLongAlt_T4=getappdata(Wind_GUI_1,'LatLongAlt_T4');

    elseif (ForecastMode==1)

    LatLongAlt_T4=0;

    end     

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};
    setappdata(Wind_GUI_1,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_GUI_1,'AllParameters', AllParameters);

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

    Power_T1 = getappdata(Wind_GUI_1,'PowerCurve_T1');
    
    if (NormalMode==1)

    LatLongAlt_T1=getappdata(Wind_GUI_1,'LatLongAlt_T1');

    elseif (ForecastMode==1)

    LatLongAlt_T1=0;

    end     

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};
    setappdata(Wind_GUI_1,'Parameters_T1',Parameters_T1);

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

    setappdata(Wind_GUI_1,'Parameters_T2',Parameters_T2);


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

    Power_T3 = getappdata(Wind_GUI_1,'PowerCurve_T3');
    
    if (NormalMode==1)

    LatLongAlt_T3=getappdata(Wind_GUI_1,'LatLongAlt_T3');

    elseif (ForecastMode==1)

    LatLongAlt_T3=0;

    end        

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};
    setappdata(Wind_GUI_1,'Parameters_T3',Parameters_T3);

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

    Power_T4 = getappdata(Wind_GUI_1,'PowerCurve_T4');
    
    if (NormalMode==1)

    LatLongAlt_T4=getappdata(Wind_GUI_1,'LatLongAlt_T4');

    elseif (ForecastMode==1)

    LatLongAlt_T4=0;

    end      

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};
    setappdata(Wind_GUI_1,'Parameters_T4',Parameters_T4);

            %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_GUI_1,'AllParameters', AllParameters);

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

    setappdata(Wind_GUI_1,'Parameters_T1',Parameters_T1);

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

    Power_T2 = getappdata(Wind_GUI_1,'PowerCurve_T2');
    
    if (NormalMode==1)

    LatLongAlt_T2=getappdata(Wind_GUI_1,'LatLongAlt_T2');

    elseif (ForecastMode==1)

    LatLongAlt_T2=0;

    end      

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};
    setappdata(Wind_GUI_1,'Parameters_T2',Parameters_T2);

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

    Power_T3 = getappdata(Wind_GUI_1,'PowerCurve_T3');
    
    if (NormalMode==1)

    LatLongAlt_T3=getappdata(Wind_GUI_1,'LatLongAlt_T3');

    elseif (ForecastMode==1)

    LatLongAlt_T3=0;

    end     

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};
    setappdata(Wind_GUI_1,'Parameters_T3',Parameters_T3);

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


    Power_T4 = getappdata(Wind_GUI_1,'PowerCurve_T4');
    
    if (NormalMode==1)

    LatLongAlt_T4=getappdata(Wind_GUI_1,'LatLongAlt_T4');

    elseif (ForecastMode==1)

    LatLongAlt_T4=0;

    end      

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};
    setappdata(Wind_GUI_1,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};

    setappdata(Wind_GUI_1,'AllParameters', AllParameters);

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

    Power_T1 = getappdata(Wind_GUI_1,'PowerCurve_T1');
    
    if (NormalMode==1)

    LatLongAlt_T1=getappdata(Wind_GUI_1,'LatLongAlt_T1');

    elseif (ForecastMode==1)

    LatLongAlt_T1=0;

    end      

    Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1,LatLongAlt_T1};
    setappdata(Wind_GUI_1,'Parameters_T1',Parameters_T1);

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

    Power_T2 = getappdata(Wind_GUI_1,'PowerCurve_T2');
    
    if (NormalMode==1)

    LatLongAlt_T2=getappdata(Wind_GUI_1,'LatLongAlt_T2');

    elseif (ForecastMode==1)

    LatLongAlt_T2=0;

    end      

    Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2,LatLongAlt_T2};
    setappdata(Wind_GUI_1,'Parameters_T2',Parameters_T2);

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

    Power_T3 = getappdata(Wind_GUI_1,'PowerCurve_T3');
    
    if (NormalMode==1)

    LatLongAlt_T3=getappdata(Wind_GUI_1,'LatLongAlt_T3');

    elseif (ForecastMode==1)

    LatLongAlt_T3=0;

    end      

    Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3,LatLongAlt_T3};
    setappdata(Wind_GUI_1,'Parameters_T3',Parameters_T3);

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

    Power_T4 = getappdata(Wind_GUI_1,'PowerCurve_T4');
    
    if (NormalMode==1)

    LatLongAlt_T4=getappdata(Wind_GUI_1,'LatLongAlt_T4');

    elseif (ForecastMode==1)

    LatLongAlt_T4=0;

    end      

    Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4,LatLongAlt_T4};
    setappdata(Wind_GUI_1,'Parameters_T4',Parameters_T4);

    %% Cell for all parameters:

    AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4,r1,r2};

    setappdata(Wind_GUI_1,'AllParameters', AllParameters);

end

% Opening Power Curve Graph GUI
Wind_Power_Curve_Graph_GUI ;
    






% --- Executes on button press in b6.
function b6_Callback(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting the values of Checkboxes and Buttons:

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

set(handles.b9, 'Enable', 'off');
set(handles.b10, 'Enable', 'off');
set(handles.b11, 'Enable', 'off');
set(handles.b12, 'Enable', 'off');    

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

% --- Executes on button press in b7.
function b7_Callback(hObject, eventdata, ~)
% hObject    handle to b7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing GUI

hf1=findobj('Name','Wind_Power_Curve_Graph_GUI');
close(hf1);

close;


    


% --- Executes when selected object is changed in uipanel5.
function uipanel5_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel5 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Getting values for RadioButtons:

r1 = get(handles.r1,'Value');

r2 = get(handles.r2,'Value');

% Setting conditions for panel p1:

if r1 == 1
    
    set(handles.b1, 'String', 'WG T1 Data');

    set(handles.b2, 'String', 'WG T2 Data');
    
    set(handles.b3, 'String', 'WG T3 Data');
    
    set(handles.b4, 'String', 'WG T4 Data');
    
    set(handles.p1, 'Visible', 'off');
    
    set(handles.p2, 'Visible', 'off');
    
    set(handles.p3, 'Visible', 'off');
    
    set(handles.p4, 'Visible', 'off');    
    
elseif r2 == 1
    
    set(handles.b1, 'String', 'WG T1 Excel File');

    set(handles.b2, 'String', 'WG T2 Excel File');
    
    set(handles.b3, 'String', 'WG T3 Excel File');
    
    set(handles.b4, 'String', 'WG T4 Excel File');
    
    set(handles.p1, 'Visible', 'on');
    
    set(handles.p2, 'Visible', 'on');
    
    set(handles.p3, 'Visible', 'on');
    
    set(handles.p4, 'Visible', 'on');
    
end
    



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


% --- Executes on button press in b8.
function b8_Callback(hObject, eventdata, handles)
% hObject    handle to b8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Wind_GUI_MainPage;

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


% --- Executes on button press in b9.
function b9_Callback(hObject, eventdata, handles)
% hObject    handle to b9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_GUI_1=getappdata(0,'Wind_GUI_1');

% Initializing Variable For Altitude File:

LatLongAlt_T1 = 0;   

% Loading Wind Power File into Simulation:
[filename,pathname]=uigetfile({'*.*'},'Lat-Long-Alt File Selector For WG_T1');
fullpathname=strcat(pathname, filename);
TempFile=xlsread(fullpathname);

LatLongAlt_T1  = {TempFile};

setappdata(Wind_GUI_1,'LatLongAlt_T1',LatLongAlt_T1);


% --- Executes on button press in b10.
function b10_Callback(hObject, eventdata, handles)
% hObject    handle to b10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_GUI_1=getappdata(0,'Wind_GUI_1');

% Initializing Variable For Altitude File:

LatLongAlt_T2 = 0;   

% Loading Wind Power File into Simulation:
[filename,pathname]=uigetfile({'*.*'},'Lat-Long-Alt File Selector For WG_T2');
fullpathname=strcat(pathname, filename);
TempFile=xlsread(fullpathname);

LatLongAlt_T2  = {TempFile};

setappdata(Wind_GUI_1,'LatLongAlt_T2',LatLongAlt_T2);

% --- Executes on button press in b11.
function b11_Callback(hObject, eventdata, handles)
% hObject    handle to b11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_GUI_1=getappdata(0,'Wind_GUI_1');

% Initializing Variable For Altitude File:

LatLongAlt_T3 = 0;   

% Loading Wind Power File into Simulation:
[filename,pathname]=uigetfile({'*.*'},'Lat-Long-Alt File Selector For WG_T3');
fullpathname=strcat(pathname, filename);
TempFile=xlsread(fullpathname);

LatLongAlt_T3  = {TempFile};

setappdata(Wind_GUI_1,'LatLongAlt_T3',LatLongAlt_T3);

% --- Executes on button press in b12.
function b12_Callback(hObject, eventdata, handles)
% hObject    handle to b12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_GUI_1=getappdata(0,'Wind_GUI_1');

% Initializing Variable For Altitude File:

LatLongAlt_T4 = 0;   

% Loading Wind Power File into Simulation:
[filename,pathname]=uigetfile({'*.*'},'Lat-Long-Alt File Selector For WG_T4');
fullpathname=strcat(pathname, filename);
TempFile=xlsread(fullpathname);

LatLongAlt_T4  = {TempFile};

setappdata(Wind_GUI_1,'LatLongAlt_T4',LatLongAlt_T4);
