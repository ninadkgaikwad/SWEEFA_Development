function varargout = Wind_Power_Curve_Graph_GUI(varargin)
% WIND_POWER_CURVE_GRAPH_GUI MATLAB code for Wind_Power_Curve_Graph_GUI.fig
%      WIND_POWER_CURVE_GRAPH_GUI, by itself, creates a new WIND_POWER_CURVE_GRAPH_GUI or raises the existing
%      singleton*.
%
%      H = WIND_POWER_CURVE_GRAPH_GUI returns the handle to a new WIND_POWER_CURVE_GRAPH_GUI or the handle to
%      the existing singleton*.
%
%      WIND_POWER_CURVE_GRAPH_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WIND_POWER_CURVE_GRAPH_GUI.M with the given input arguments.
%
%      WIND_POWER_CURVE_GRAPH_GUI('Property','Value',...) creates a new WIND_POWER_CURVE_GRAPH_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Wind_Power_Curve_Graph_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Wind_Power_Curve_Graph_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Wind_Power_Curve_Graph_GUI

% Last Modified by GUIDE v2.5 12-Apr-2016 12:37:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Wind_Power_Curve_Graph_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Wind_Power_Curve_Graph_GUI_OutputFcn, ...
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


% --- Executes just before Wind_Power_Curve_Graph_GUI is made visible.
function Wind_Power_Curve_Graph_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Wind_Power_Curve_Graph_GUI (see VARARGIN)

% Setting Global Variable for NEXT & Previous Buttons
global next2;
next2=1;

% Choose default command line output for Wind_Power_Curve_Graph_GUI
handles.output = hObject;

set(handles.pb1,'Enable','off');
set(handles.pb2,'Enable','off');

% Initializing Graph 

    axes(handles.G1);
    cla reset;
    
    Wind_GUI_1=getappdata(0,'Wind_GUI_1');

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace:
setappdata(0,'Wind_Power_Curve_Graph_GUI',gcf);

% UIWAIT makes Wind_Power_Curve_Graph_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Wind_Power_Curve_Graph_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pb1.
function pb1_Callback(hObject, eventdata, handles)
% hObject    handle to pb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_Power_Curve_Graph_GUI=getappdata(0,'Wind_Power_Curve_Graph_GUI');
subnum_Total=getappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total');

global next2;
if next2==1
    next2=subnum_Total + 1;
end 
next2=next2-1;

Num=num2str(next2);

% Getting Data from Wind_GUI_1 GUI Window

Wind_GUI_1=getappdata(0,'Wind_GUI_1');
AllParameters=getappdata(Wind_GUI_1,'AllParameters');

% Disintegrating Cell AllParameters

WG_TurbineType=AllParameters{1,1} ;
Parameters_T1=AllParameters{1,2} ;
Parameters_T2=AllParameters{1,3} ;
Parameters_T3=AllParameters{1,4} ;
Parameters_T4=AllParameters{1,5} ;

% Disintegrating WG_TurbineType

T1=WG_TurbineType(1,1) ;
T2=WG_TurbineType(1,2) ;
T3=WG_TurbineType(1,3) ;
T4=WG_TurbineType(1,4) ;

% Disintegrating Parameters_T1

subnum_T1=Parameters_T1{1,1} ;

Power_T1=Parameters_T1{1,4} ;


% Disintegrating Parameters_T2

subnum_T2=Parameters_T2{1,1} ;

Power_T2=Parameters_T2{1,4} ;


% Disintegrating Parameters_T3

subnum_T3=Parameters_T3{1,1} ;

Power_T3=Parameters_T3{1,4} ;


% Disintegrating Parameters_T4

subnum_T4=Parameters_T4{1,1} ;

Power_T4=Parameters_T4{1,4} ;


% All Possible Cases

if (T1 == 0) && (T2 == 0) && (T3 == 0) && (T4 == 1)
    
    subnum=[0,0,0,subnum_T4];  
    a1=subnum_T4;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T4{1,b};
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
         %hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off        
        
         
        
    end
    
       
    
    
   
    
elseif (T1 == 0) && (T2 == 0) && (T3 == 1) && (T4 == 0)

    subnum=[0,0,subnum_T3,0];   
    a1=subnum_T3;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T3{1,b};
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
          %hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         %hold off        
       
        
    end
    
      
    
   
        
    
    
elseif (T1 == 0) && (T2 == 0) && (T3 == 1) && (T4 == 1)
        
    subnum=[0,0,subnum_T3,subnum_T4];    
    a1=subnum_T3;
    a2=subnum_T3+subnum_T4;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T3{1,b};
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off        
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T4{1,b};
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
        
        
        
    end
    
       
    
    
       
    
elseif (T1 == 0) && (T2 == 1) && (T3 == 0) && (T4 == 0)
        
    subnum=[0,subnum_T2,0,0];    
    a1=subnum_T2;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T2{1,b};
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off       
     
        
    end
    
       
    
    
       
    
elseif (T1 == 0) && (T2 == 1) && (T3 == 0) && (T4 == 1)
        
    subnum=[0,subnum_T2,0,subnum_T4]; 
    a1=subnum_T2;
    a2=subnum_T2+subnum_T4;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T2{1,b};
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off        
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T4{1,b};
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
       
        
    end
    
        
    
    
    
elseif (T1 == 0) && (T2 == 1) && (T3 == 1) && (T4 == 0)
        
    subnum=[0,subnum_T2,subnum_T3,0];  
    a1=subnum_T2;
    a2=subnum_T2+subnum_T3;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T2{1,b};
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off         
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T3{1,b};
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off   
        
        
    end
    
      
    
   
       
    
elseif (T1 == 0) && (T2 == 1) && (T3 == 1) && (T4 == 1)
        
    subnum=[0,subnum_T2,subnum_T3,subnum_T4];
    a1=subnum_T2;
    a2=subnum_T2+subnum_T3;
    a3=subnum_T2+subnum_T3+subnum_T4;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T2{1,b};
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off         
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T3{1,b};
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off   
        
    elseif (next2>a2)&&(next2<=a3)
        
        b=next2-a2;
        PowerCurve=Power_T4{1,b};        
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off   
       
        
    end
    
    
    
        
    
elseif (T1 == 1) && (T2 == 0) && (T3 == 0) && (T4 == 0)
        
    subnum=[subnum_T1,0,0,0];  
    a1=subnum_T1;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T1{1,b};
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off         
        
        
    end
    
        
   
       
    
elseif (T1 == 1) && (T2 == 0) && (T3 == 0) && (T4 == 1)
        
    subnum=[subnum_T1,0,0,subnum_T4];    
    a1=subnum_T1;
    a2=subnum_T1+subnum_T4;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T1{1,b};
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off         
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T4{1,b};
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off   
         
        
    end
    
    
        
   
        
    
elseif (T1 == 1) && (T2 == 0) && (T3 == 1) && (T4 == 0)
        
    subnum=[subnum_T1,0,subnum_T3,0];
    a1=subnum_T1;
    a2=subnum_T1+subnum_T3;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T1{1,b};
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off          
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T3{1,b};
        % Ploting Power Curve:

          axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
        
        
    end
       
    
    
        
    
elseif (T1 == 1) && (T2 == 0) && (T3 == 1) && (T4 == 1)
        
    subnum=[subnum_T1,0,subnum_T3,subnum_T4];    
    a1=subnum_T1;
    a2=subnum_T1+subnum_T3;
    a3=subnum_T1+subnum_T3+subnum_T4;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T1{1,b};
        % Ploting Power Curve:
         
        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off       
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T3{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off 
        
    elseif (next2>a2)&&(next2<=a3)
        
        b=next2-a2;
        PowerCurve=Power_T4{1,b};        
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
         
        
    end
    
       
    
    
       
    
elseif (T1 == 1) && (T2 == 1) && (T3 == 0) && (T4 == 0)
        
    subnum=[subnum_T1,subnum_T2,0,0];    
    a1=subnum_T1;
    a2=subnum_T1+subnum_T2;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T1{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off        
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T2{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off 
        
        
    end
    
       
    
   
        
    
    
elseif (T1 == 1) && (T2 == 1) && (T3 == 0) && (T4 == 1)
        
    subnum=[subnum_T1,subnum_T2,0,subnum_T4];    
    
    a1=subnum_T1;
    a2=subnum_T1+subnum_T2;
    a3=subnum_T1+subnum_T2+subnum_T4;
    
      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T1{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off       
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T2{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
        
    elseif (next2>a2)&&(next2<=a3)
        
        b=next2-a2;
        PowerCurve=Power_T4{1,b};        
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off   
        
          
        
    end
     
    
    
      
    
    
elseif (T1 == 1) && (T2 == 1) && (T3 == 1) && (T4 == 0)
        
    subnum=[subnum_T1,subnum_T2,subnum_T3,0];    
    a1=subnum_T1;
    a2=subnum_T1+subnum_T2;
    a3=subnum_T1+subnum_T2+subnum_T3;
          
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T1{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off       
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T2{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
        
    elseif (next2>a2)&&(next2<=a3)
        
        b=next2-a2;
        PowerCurve=Power_T3{1,b};        
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
        
      
        
    end  
    
    
        
    
elseif (T1 == 1) && (T2 == 1) && (T3 == 1) && (T4 == 1)
        
    subnum=[subnum_T1,subnum_T2,subnum_T3,subnum_T4];
    
    a1=subnum_T1;
    a2=subnum_T1+subnum_T2;
    a3=subnum_T1+subnum_T2+subnum_T3;
    a4=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T1{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         %hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         %hold off        
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T2{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
          %hold off  
        
    elseif (next2>a2)&&(next2<=a3)
        
        b=next2-a2;
        PowerCurve=Power_T3{1,b};        
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
          %hold off  
        
    elseif (next2>a3)&&(next2<=a4)
        
        b=next2-a3;
        PowerCurve=Power_T4{1,b};         
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
          %hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
          %hold off          
        
    end
    
   
        
    
    
end



% --- Executes on button press in pb2.
function pb2_Callback(hObject, eventdata, handles)
% hObject    handle to pb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Wind_Power_Curve_Graph_GUI=getappdata(0,'Wind_Power_Curve_Graph_GUI');
subnum_Total=getappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total');

% Proramming NEXT Button
global next2;
if next2==subnum_Total;
    next2=0;
end 
next2=next2+1;

Num=num2str(next2);

% Getting Data from Wind_GUI_1 GUI Window

Wind_GUI_1=getappdata(0,'Wind_GUI_1');
AllParameters=getappdata(Wind_GUI_1,'AllParameters');

% Disintegrating Cell AllParameters

WG_TurbineType=AllParameters{1,1} ;
Parameters_T1=AllParameters{1,2} ;
Parameters_T2=AllParameters{1,3} ;
Parameters_T3=AllParameters{1,4} ;
Parameters_T4=AllParameters{1,5} ;

% Disintegrating WG_TurbineType

T1=WG_TurbineType(1,1) ;
T2=WG_TurbineType(1,2) ;
T3=WG_TurbineType(1,3) ;
T4=WG_TurbineType(1,4) ;

% Disintegrating Parameters_T1

subnum_T1=Parameters_T1{1,1} ;

Power_T1=Parameters_T1{1,4} ;


% Disintegrating Parameters_T2

subnum_T2=Parameters_T2{1,1} ;

Power_T2=Parameters_T2{1,4} ;


% Disintegrating Parameters_T3

subnum_T3=Parameters_T3{1,1} ;

Power_T3=Parameters_T3{1,4} ;


% Disintegrating Parameters_T4

subnum_T4=Parameters_T4{1,1} ;

Power_T4=Parameters_T4{1,4} ;


% All Possible Cases

if (T1 == 0) && (T2 == 0) && (T3 == 0) && (T4 == 1)
    
    subnum=[0,0,0,subnum_T4];  
    a1=subnum_T4;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T4{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off        
        
         
        
    end
    
       
    
    
   
    
elseif (T1 == 0) && (T2 == 0) && (T3 == 1) && (T4 == 0)

    subnum=[0,0,subnum_T3,0];   
    a1=subnum_T3;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T3{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off      
       
        
    end
    
      
    
   
        
    
    
elseif (T1 == 0) && (T2 == 0) && (T3 == 1) && (T4 == 1)
        
    subnum=[0,0,subnum_T3,subnum_T4];    
    a1=subnum_T3;
    a2=subnum_T3+subnum_T4;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T3{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off       
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T4{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
        
        
        
    end
    
       
    
    
       
    
elseif (T1 == 0) && (T2 == 1) && (T3 == 0) && (T4 == 0)
        
    subnum=[0,subnum_T2,0,0];    
    a1=subnum_T2;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T2{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off       
      
        
    end
    
       
    
    
       
    
elseif (T1 == 0) && (T2 == 1) && (T3 == 0) && (T4 == 1)
        
    subnum=[0,subnum_T2,0,subnum_T4]; 
    a1=subnum_T2;
    a2=subnum_T2+subnum_T4;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T2{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off       
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T4{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off 
       
        
    end
    
        
    
    
    
elseif (T1 == 0) && (T2 == 1) && (T3 == 1) && (T4 == 0)
        
    subnum=[0,subnum_T2,subnum_T3,0];  
    a1=subnum_T2;
    a2=subnum_T2+subnum_T3;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T2{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off         
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T3{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
        
        
    end
    
      
    
   
       
    
elseif (T1 == 0) && (T2 == 1) && (T3 == 1) && (T4 == 1)
        
    subnum=[0,subnum_T2,subnum_T3,subnum_T4];
    a1=subnum_T2;
    a2=subnum_T2+subnum_T3;
    a3=subnum_T2+subnum_T3+subnum_T4;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T2{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off       
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T3{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
        
    elseif (next2>a2)&&(next2<=a3)
        
        b=next2-a2;
        PowerCurve=Power_T4{1,b};        
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
       
        
    end
    
    
    
        
    
elseif (T1 == 1) && (T2 == 0) && (T3 == 0) && (T4 == 0)
        
    subnum=[subnum_T1,0,0,0];  
    a1=subnum_T1;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T1{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off        
        
        
    end
    
        
   
       
    
elseif (T1 == 1) && (T2 == 0) && (T3 == 0) && (T4 == 1)
        
    subnum=[subnum_T1,0,0,subnum_T4];    
    a1=subnum_T1;
    a2=subnum_T1+subnum_T4;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T1{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off       
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T4{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
         
        
    end
    
    
        
   
        
    
elseif (T1 == 1) && (T2 == 0) && (T3 == 1) && (T4 == 0)
        
    subnum=[subnum_T1,0,subnum_T3,0];
    a1=subnum_T1;
    a2=subnum_T1+subnum_T3;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T1{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off        
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T3{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
        
        
    end
       
    
    
        
    
elseif (T1 == 1) && (T2 == 0) && (T3 == 1) && (T4 == 1)
        
    subnum=[subnum_T1,0,subnum_T3,subnum_T4];    
    a1=subnum_T1;
    a2=subnum_T1+subnum_T3;
    a3=subnum_T1+subnum_T3+subnum_T4;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T1{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off       
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T3{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
        
    elseif (next2>a2)&&(next2<=a3)
        
        b=next2-a2;
        PowerCurve=Power_T4{1,b};        
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off 
         
        
    end
    
       
    
    
       
    
elseif (T1 == 1) && (T2 == 1) && (T3 == 0) && (T4 == 0)
        
    subnum=[subnum_T1,subnum_T2,0,0];    
    a1=subnum_T1;
    a2=subnum_T1+subnum_T2;

      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T1{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off       
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T2{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off 
        
        
    end
    
       
    
   
        
    
    
elseif (T1 == 1) && (T2 == 1) && (T3 == 0) && (T4 == 1)
        
    subnum=[subnum_T1,subnum_T2,0,subnum_T4];    
    
    a1=subnum_T1;
    a2=subnum_T1+subnum_T2;
    a3=subnum_T1+subnum_T2+subnum_T4;
    
      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T1{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off        
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T2{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
        
    elseif (next2>a2)&&(next2<=a3)
        
        b=next2-a2;
        PowerCurve=Power_T4{1,b};        
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
        
          
        
    end
     
    
    
      
    
    
elseif (T1 == 1) && (T2 == 1) && (T3 == 1) && (T4 == 0)
        
    subnum=[subnum_T1,subnum_T2,subnum_T3,0];    
    a1=subnum_T1;
    a2=subnum_T1+subnum_T2;
    a3=subnum_T1+subnum_T2+subnum_T3;
          
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T1{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off       
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T2{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
        
    elseif (next2>a2)&&(next2<=a3)
        
        b=next2-a2;
        PowerCurve=Power_T3{1,b};        
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off 
        
      
        
    end  
    
    
        
    
elseif (T1 == 1) && (T2 == 1) && (T3 == 1) && (T4 == 1)
        
    subnum=[subnum_T1,subnum_T2,subnum_T3,subnum_T4];
    
    a1=subnum_T1;
    a2=subnum_T1+subnum_T2;
    a3=subnum_T1+subnum_T2+subnum_T3;
    a4=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
      
    if (next2<=a1)
        
        b=next2;
        PowerCurve=Power_T1{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off       
        
    elseif (next2>a1)&&(next2<=a2)
        
        b=next2-a1;
        PowerCurve=Power_T2{1,b};
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off  
        
    elseif (next2>a2)&&(next2<=a3)
        
        b=next2-a2;
        PowerCurve=Power_T3{1,b};        
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off 
        
    elseif (next2>a3)&&(next2<=a4)
        
        b=next2-a3;
        PowerCurve=Power_T4{1,b};         
        % Ploting Power Curve:

        axes(handles.G1);
          grid on
         % hold on 
          title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
          xlabel('Wind Speed [m/s]');
          ylabel('Power [kW]');
          xlim([0 inf]);
          ylim([0 inf]); 
          %Plots Cp vs TSR curve
          plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
         % hold off          
        
    end
    
       
    
end


 
 

  


% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Power Curve Data From Wind_GUI_1 GUI
% Getting Data from Wind_GUI_1 GUI Window

Wind_GUI_1=getappdata(0,'Wind_GUI_1');
AllParameters=getappdata(Wind_GUI_1,'AllParameters');

global next2;

Num=num2str(next2);

% Disintegrating Cell AllParameters

WG_TurbineType=AllParameters{1,1} ;
Parameters_T1=AllParameters{1,2} ;
Parameters_T2=AllParameters{1,3} ;
Parameters_T3=AllParameters{1,4} ;
Parameters_T4=AllParameters{1,5} ;

% Disintegrating WG_TurbineType

T1=WG_TurbineType(1,1) ;
T2=WG_TurbineType(1,2) ;
T3=WG_TurbineType(1,3) ;
T4=WG_TurbineType(1,4) ;

% Disintegrating Parameters_T1

subnum_T1=Parameters_T1{1,1} ;

Power_T1=Parameters_T1{1,4} ;


% Disintegrating Parameters_T2

subnum_T2=Parameters_T2{1,1} ;

Power_T2=Parameters_T2{1,4} ;


% Disintegrating Parameters_T3

subnum_T3=Parameters_T3{1,1} ;

Power_T3=Parameters_T3{1,4} ;


% Disintegrating Parameters_T4

subnum_T4=Parameters_T4{1,1} ;

Power_T4=Parameters_T4{1,4} ;


% All Possible Cases

if (T1 == 0) && (T2 == 0) && (T3 == 0) && (T4 == 1)
    
    subnum=[0,0,0,subnum_T4];  
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
    setappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total',subnum_Total);
   
    PowerCurve=Power_T4{1,1};
    
% Ploting Power Curve:
    
  axes(handles.G1);
  grid on
  hold on 
  title(['Wind Turbine Power Curve',' ','No:',' ',next2]);
  xlabel('Wind Speed [m/s]');
  ylabel('Power [kW]');
  xlim([0 inf]);
  ylim([0 inf]); 
  %Plots Cp vs TSR curve
  plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
  hold off   
    
elseif (T1 == 0) && (T2 == 0) && (T3 == 1) && (T4 == 0)

    subnum=[0,0,subnum_T3,0];   
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
    setappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total',subnum_Total);
    
    PowerCurve=Power_T3{1,1};
   
% Ploting Power Curve:
    
    axes(handles.G1);
    grid on
    % hold on 
    title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
    xlabel('Wind Speed [m/s]');
    ylabel('Power [kW]');
    xlim([0 inf]);
    ylim([0 inf]); 
    %Plots Cp vs TSR curve
    plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
    % hold off        
    
  
elseif (T1 == 0) && (T2 == 0) && (T3 == 1) && (T4 == 1)
        
    subnum=[0,0,subnum_T3,subnum_T4];    
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
    setappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total',subnum_Total);
    
    PowerCurve=Power_T3{1,1};

    % Ploting Power Curve:
    
    axes(handles.G1);
    grid on
    % hold on 
    title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
    xlabel('Wind Speed [m/s]');
    ylabel('Power [kW]');
    xlim([0 inf]);
    ylim([0 inf]); 
    %Plots Cp vs TSR curve
    plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
    % hold off    
    
elseif (T1 == 0) && (T2 == 1) && (T3 == 0) && (T4 == 0)
        
    subnum=[0,subnum_T2,0,0];    
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
    setappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total',subnum_Total);
    
    PowerCurve=Power_T2{1,1};
 
    % Ploting Power Curve:
    
    axes(handles.G1);
    grid on
    % hold on 
    title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
    xlabel('Wind Speed [m/s]');
    ylabel('Power [kW]');
    xlim([0 inf]);
    ylim([0 inf]); 
    %Plots Cp vs TSR curve
    plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
    % hold off      
    
elseif (T1 == 0) && (T2 == 1) && (T3 == 0) && (T4 == 1)
        
    subnum=[0,subnum_T2,0,subnum_T4]; 
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
    setappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total',subnum_Total);
    
    PowerCurve=Power_T2{1,1};
    
% Ploting Power Curve:
    
    axes(handles.G1);
    grid on
    % hold on 
    title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
    xlabel('Wind Speed [m/s]');
    ylabel('Power [kW]');
    xlim([0 inf]);
    ylim([0 inf]); 
    %Plots Cp vs TSR curve
    plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
    % hold off    
    
elseif (T1 == 0) && (T2 == 1) && (T3 == 1) && (T4 == 0)
        
    subnum=[0,subnum_T2,subnum_T3,0];  
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
    setappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total',subnum_Total);
    
    PowerCurve=Power_T2{1,1};
   
% Ploting Power Curve:
    
    axes(handles.G1);
    grid on
    % hold on 
    title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
    xlabel('Wind Speed [m/s]');
    ylabel('Power [kW]');
    xlim([0 inf]);
    ylim([0 inf]); 
    %Plots Cp vs TSR curve
    plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
    % hold off         
    
elseif (T1 == 0) && (T2 == 1) && (T3 == 1) && (T4 == 1)
        
    subnum=[0,subnum_T2,subnum_T3,subnum_T4];
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
    setappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total',subnum_Total);
    
    PowerCurve=Power_T2{1,1};
        
% Ploting Power Curve:
    
    axes(handles.G1);
    grid on
    % hold on 
    title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
    xlabel('Wind Speed [m/s]');
    ylabel('Power [kW]');
    xlim([0 inf]);
    ylim([0 inf]); 
    %Plots Cp vs TSR curve
    plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
    % hold off    
    
elseif (T1 == 1) && (T2 == 0) && (T3 == 0) && (T4 == 0)
        
    subnum=[subnum_T1,0,0,0];  
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
    setappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total',subnum_Total);
    
    PowerCurve=Power_T1{1,1};

    % Ploting Power Curve:
    
    axes(handles.G1);
    grid on
    % hold on 
    title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
    xlabel('Wind Speed [m/s]');
    ylabel('Power [kW]');
    xlim([0 inf]);
    ylim([0 inf]); 
    %Plots Cp vs TSR curve
    plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
    % hold off    
    
elseif (T1 == 1) && (T2 == 0) && (T3 == 0) && (T4 == 1)
        
    subnum=[subnum_T1,0,0,subnum_T4];    
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
    setappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total',subnum_Total); 
    
    PowerCurve=Power_T1{1,1};
 
    % Ploting Power Curve:
    
    axes(handles.G1);
    grid on
    % hold on 
    title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
    xlabel('Wind Speed [m/s]');
    ylabel('Power [kW]');
    xlim([0 inf]);
    ylim([0 inf]); 
    %Plots Cp vs TSR curve
    plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
    % hold off    
        
    
elseif (T1 == 1) && (T2 == 0) && (T3 == 1) && (T4 == 0)
        
    subnum=[subnum_T1,0,subnum_T3,0];
        
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
    setappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total',subnum_Total);    
    
    PowerCurve=Power_T1{1,1};
 
    % Ploting Power Curve:
    
    axes(handles.G1);
    grid on
    % hold on 
    title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
    xlabel('Wind Speed [m/s]');
    ylabel('Power [kW]');
    xlim([0 inf]);
    ylim([0 inf]); 
    %Plots Cp vs TSR curve
    plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
    % hold off    
    
elseif (T1 == 1) && (T2 == 0) && (T3 == 1) && (T4 == 1)
        
    subnum=[subnum_T1,0,subnum_T3,subnum_T4];    
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
    setappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total',subnum_Total);    
    
    PowerCurve=Power_T1{1,1};
    
 % Ploting Power Curve:
    
    axes(handles.G1);
    grid on
    % hold on 
    title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
    xlabel('Wind Speed [m/s]');
    ylabel('Power [kW]');
    xlim([0 inf]);
    ylim([0 inf]); 
    %Plots Cp vs TSR curve
    plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
    % hold off         
    
elseif (T1 == 1) && (T2 == 1) && (T3 == 0) && (T4 == 0)
        
    subnum=[subnum_T1,subnum_T2,0,0];    
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;   
    setappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total',subnum_Total);    
    
    PowerCurve=Power_T1{1,1};    
    
% Ploting Power Curve:
    
    axes(handles.G1);
    grid on
    % hold on 
    title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
    xlabel('Wind Speed [m/s]');
    ylabel('Power [kW]');
    xlim([0 inf]);
    ylim([0 inf]); 
    %Plots Cp vs TSR curve
    plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
    % hold off    
    
elseif (T1 == 1) && (T2 == 1) && (T3 == 0) && (T4 == 1)
        
    subnum=[subnum_T1,subnum_T2,0,subnum_T4];    
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;  
    setappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total',subnum_Total);    
    
    PowerCurve=Power_T1{1,1};  
    
% Ploting Power Curve:
    
    axes(handles.G1);
    grid on
    % hold on 
    title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
    xlabel('Wind Speed [m/s]');
    ylabel('Power [kW]');
    xlim([0 inf]);
    ylim([0 inf]); 
    %Plots Cp vs TSR curve
    plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
    % hold off    
    
elseif (T1 == 1) && (T2 == 1) && (T3 == 1) && (T4 == 0)
        
    subnum=[subnum_T1,subnum_T2,subnum_T3,0];    
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
    setappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total',subnum_Total);   
    
    PowerCurve=Power_T1{1,1};
    
 % Ploting Power Curve:
    
    axes(handles.G1);
    grid on
    % hold on 
    title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
    xlabel('Wind Speed [m/s]');
    ylabel('Power [kW]');
    xlim([0 inf]);
    ylim([0 inf]); 
    %Plots Cp vs TSR curve
    plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
    % hold off         
    
    
elseif (T1 == 1) && (T2 == 1) && (T3 == 1) && (T4 == 1)
        
    subnum=[subnum_T1,subnum_T2,subnum_T3,subnum_T4];   
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
    setappdata(Wind_Power_Curve_Graph_GUI,'subnum_Total',subnum_Total);  
    
    PowerCurve=Power_T1{1,1};
   
 % Ploting Power Curve:
    
    axes(handles.G1);
    grid on
    % hold on 
    title(['Wind Turbine Power Curve',' ','No:',' ',Num]);
    xlabel('Wind Speed [m/s]');
    ylabel('Power [kW]');
    xlim([0 inf]);
    ylim([0 inf]); 
    %Plots Cp vs TSR curve
    plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
    % hold off         
    
    
end
 
set(handles.pb1,'Enable','on');
set(handles.pb2,'Enable','on');
    

% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.pb1,'Enable','off');
set(handles.pb2,'Enable','off');

% Resetting Graph

    axes(handles.G1);
    cla reset;

% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Closing the GUI

close;
