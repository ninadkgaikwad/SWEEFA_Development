function varargout = Cp_Curve_Generator_GUI(varargin)
% CP_CURVE_GENERATOR_GUI MATLAB code for Cp_Curve_Generator_GUI.fig
%      CP_CURVE_GENERATOR_GUI, by itself, creates a new CP_CURVE_GENERATOR_GUI or raises the existing
%      singleton*.
%
%      H = CP_CURVE_GENERATOR_GUI returns the handle to a new CP_CURVE_GENERATOR_GUI or the handle to
%      the existing singleton*.
%
%      CP_CURVE_GENERATOR_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CP_CURVE_GENERATOR_GUI.M with the given input arguments.
%
%      CP_CURVE_GENERATOR_GUI('Property','Value',...) creates a new CP_CURVE_GENERATOR_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Cp_Curve_Generator_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Cp_Curve_Generator_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Cp_Curve_Generator_GUI

% Last Modified by GUIDE v2.5 21-May-2016 17:43:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Cp_Curve_Generator_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Cp_Curve_Generator_GUI_OutputFcn, ...
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


% --- Executes just before Cp_Curve_Generator_GUI is made visible.
function Cp_Curve_Generator_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Cp_Curve_Generator_GUI (see VARARGIN)

% Setting Global Variable for NEXT & Previous Buttons
global next1;
next1=1;

% Choose default command line output for untitled4
handles.output = hObject;

% Initialization:

set(handles.r1, 'Value', 1);

set(handles.r2, 'Value', 0);

set(handles.r3, 'Value', 0);

set(handles.n, 'String', '1');

set(handles.c1, 'String', '0.5');

set(handles.c2, 'String', '116');

set(handles.c3, 'String', '0.4');

set(handles.c4, 'String', '0');

set(handles.c5, 'String', '5');

set(handles.c6, 'String', '21');

set(handles.x, 'String', '0');

set(handles.n, 'Enable', 'on');

set(handles.c1, 'Enable', 'on');

set(handles.c2, 'Enable', 'on');

set(handles.c3, 'Enable', 'on');

set(handles.c4, 'Enable', 'on');

set(handles.c5, 'Enable', 'on');

set(handles.c6, 'Enable', 'on');

set(handles.x, 'Enable', 'on');

set(handles.b6, 'Enable', 'on');

set(handles.b5, 'Enable', 'on');

set(handles.b3, 'Enable', 'on');

set(handles.b4, 'Enable', 'on');

set(handles.b8, 'Enable', 'off');

set(handles.Theta, 'String', '0');
    
    axes(handles.G1);
    cla reset;



% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace:
setappdata(0,'Cp_Curve_Generator_GUI',gcf);

% UIWAIT makes Cp_Curve_Generator_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Cp_Curve_Generator_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Defining Global Variable

global next1;

Cp_Curve_Generator_GUI=getappdata(0,'Cp_Curve_Generator_GUI');
% Setting Theta = 0:
set(handles.Theta, 'String', '0');

% Clearing all graph values:
axes(handles.G1);
    cla reset;
    
% Getting radio button values:
r1 = get(handles.r1, 'Value');

r2 = get(handles.r2, 'Value');

% Computing Cp:

if r1 == 1
    
    n = get(handles.n, 'String');
    n = str2double(n);
    
    c1 = get(handles.c1, 'String');
    c1 = strread(c1, '%f', 'delimiter', ',');
    c1 = c1';
    
    c2 = get(handles.c2, 'String');
    c2 = strread(c2, '%f', 'delimiter', ',');
    c2 = c2';
    
    c3 = get(handles.c3, 'String');
    c3 = strread(c3, '%f', 'delimiter', ',');
    c3 = c3';
    
    c4 = get(handles.c4, 'String');
    c4 = strread(c4, '%f', 'delimiter', ',');
    c4 = c4';
    
    c5 = get(handles.c5, 'String');
    c5 = strread(c5, '%f', 'delimiter', ',');
    c5 = c5';

    
    c6 = get(handles.c6, 'String');
    c6 = strread(c6, '%f', 'delimiter', ',');
    c6 = c6';

   
    x = get(handles.x, 'String');
    x = strread(x, '%f', 'delimiter', ',');
    x = x';
   
    Theta = get(handles.Theta, 'String');
    Theta = str2double(Theta);
    
    % Calling external function to calculate Cp:
    
    [Cp, TSR] = Cpcurve( n, c1, c2, c3, c4, c5, c6, x, Theta );
    
    % Saving computed values to current GUI workspace:
    setappdata(Cp_Curve_Generator_GUI,'Cp',Cp);
    setappdata(Cp_Curve_Generator_GUI,'TSR',TSR);
    
   
    
elseif r2 == 1
    
    Theta = get(handles.Theta, 'String');
    Theta = str2double(Theta);
    
    % Calling external function to calculate Cp:
    
    [Cp, TSR] = Cpcurve2( Theta );
    
end

 % Ploting Power coeffficient(Cp) curve:
    
  axes(handles.G1);
  grid on
  hold on 
  title('Cp Curve');
  xlabel('Tip Speed Ratio [TSR]');
  ylabel('Power Coefficient [Cp]');
  xlim([0 inf]);
  ylim([0 inf]); 
  %Plots Cp vs TSR curve
  plot(TSR,Cp(1,:),'LineWidth',2,'Color','k');  
 
 
  hold off;
  
%     % Debugger
%   Debugger=num2str(next);
%   set(handles.debug,'String',Debugger);


% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Defining Global value:
global next1;


% Getting radio button values:
r1 = get(handles.r1, 'Value');

r2 = get(handles.r2, 'Value');

% Computing Cp:

if r1 == 1
    
    n = get(handles.n, 'String');
    n = str2double(n);
    
    c1 = get(handles.c1, 'String');
    c1 = strread(c1, '%f', 'delimiter', ',');
    c1 = c1';
    
    c2 = get(handles.c2, 'String');
    c2 = strread(c2, '%f', 'delimiter', ',');
    c2 = c2';
    
    c3 = get(handles.c3, 'String');
    c3 = strread(c3, '%f', 'delimiter', ',');
    c3 = c3';
    
    c4 = get(handles.c4, 'String');
    c4 = strread(c4, '%f', 'delimiter', ',');
    c4 = c4';
    
    c5 = get(handles.c5, 'String');
    c5 = strread(c5, '%f', 'delimiter', ',');
    c5 = c5';

    
    c6 = get(handles.c6, 'String');
    c6 = strread(c6, '%f', 'delimiter', ',');
    c6 = c6';

   
    x = get(handles.x, 'String');
    x = strread(x, '%f', 'delimiter', ',');
    x = x';
   
    Theta = get(handles.Theta, 'String');
    Theta = str2double(Theta);
    
    % Calling external function to calculate Cp:
    
    [Cp, TSR] = Cpcurve( n, c1, c2, c3, c4, c5, c6, x, Theta );
    
    % Saving computed values to current GUI workspace:
%     setappdata(Cp_Curve_Generator_GUI,'Cp',Cp);
%     setappdata(Cp_Curve_Generator_GUI,'TSR',TSR);
    
   
    
elseif r2 == 1
    
    Theta = get(handles.Theta, 'String');
    Theta = str2double(Theta);
    
    % Calling external function to calculate Cp:
    
    [Cp, TSR] = Cpcurve2( Theta );
    
end

 % Ploting Power coeffficient(Cp) curve:
    
  axes(handles.G1);
  grid on
  hold on 
  title('Cp Curve');
  xlabel('Tip Speed Ratio [TSR]');
  ylabel('Power Coefficient [Cp]');
  xlim([0 inf]);
  ylim([0 inf]); 
  %Plots Cp vs TSR curve
  plot(TSR,Cp(1,:),'LineWidth',2,'Color','k');  
 
 
  hold off;
%   % Debugger
%   Debugger=num2str(next);
%   set(handles.debug,'String',Debugger);
%   Debugger

% --- Executes on button press in b6.
function b6_Callback(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Cp_Curve_Generator_GUI=getappdata(0,'Cp_Curve_Generator_GUI');
% Setting Theta = 0:
set(handles.Theta, 'String', '0');

% Clearing previous Values:
axes(handles.G1);
    cla reset;


% Getting number of rotor types:
n = get(handles.n, 'String');
n = str2double(n);

% Getting radio button values:
r1 = get(handles.r1, 'Value');

r2 = get(handles.r2, 'Value');

r3 = get(handles.r3, 'Value');

% Computing Cp:

if r1 == 1
    
    n = get(handles.n, 'String');
    n = str2double(n);
    
    c1 = get(handles.c1, 'String');
    c1 = strread(c1, '%f', 'delimiter', ',');
    c1 = c1';
    
    c2 = get(handles.c2, 'String');
    c2 = strread(c2, '%f', 'delimiter', ',');
    c2 = c2';
    
    c3 = get(handles.c3, 'String');
    c3 = strread(c3, '%f', 'delimiter', ',');
    c3 = c3';
    
    c4 = get(handles.c4, 'String');
    c4 = strread(c4, '%f', 'delimiter', ',');
    c4 = c4';
    
    c5 = get(handles.c5, 'String');
    c5 = strread(c5, '%f', 'delimiter', ',');
    c5 = c5';

    
    c6 = get(handles.c6, 'String');
    c6 = strread(c6, '%f', 'delimiter', ',');
    c6 = c6';

   
    x = get(handles.x, 'String');
    x = strread(x, '%f', 'delimiter', ',');
    x = x';
   
    Theta = get(handles.Theta, 'String');
    Theta = str2double(Theta);
    
    % Calling external function to calculate Cp:
    
    [Cp, TSR] = Cpcurve( n, c1, c2, c3, c4, c5, c6, x, Theta );
    
    % Saving computed values to current GUI workspace:
%     setappdata(Cp_Curve_Generator_GUI,'Cp',Cp);
%     setappdata(Cp_Curve_Generator_GUI,'TSR',TSR);
    
   
    
elseif r2 == 1
    
    Theta = get(handles.Theta, 'String');
    Theta = str2double(Theta);
    
    % Calling external function to calculate Cp:
    
    [Cp, TSR] = Cpcurve2( Theta );
    
elseif r3 == 1 
    
    n = get(handles.n, 'String');
    n = str2double(n);
    
    CpCurve_Data=getappdata(Cp_Curve_Generator_GUI,'CpCurve_Data');
    
      
end
    

% Getting Cp and TSR values:
% Cp = getappdata(Cp_Curve_Generator_GUI,'Cp');
% 
% TSR = getappdata(Cp_Curve_Generator_GUI,'TSR');

% Proramming NEXT Button
global next1;
if next1==n
    next1=0;
end 
next1=next1+1;

if (r1==1) || (r2==1)
% Ploting Power coeffficient(Cp) curve:
    
  axes(handles.G1);
  grid on
  hold on 
  title('Cp Curve');
  xlabel('Tip Speed Ratio [TSR]');
  ylabel('Power Coefficient [Cp]');
  xlim([0 inf]);
  ylim([0 inf]); 
  %Plots Cp vs TSR curve
  plot(TSR,Cp(next1,:),'LineWidth',2,'Color','k');  
 
 
  hold off;
  
elseif r3==1
  
    Data_Element=next1;
    
    Cp_Data=CpCurve_Data{1,Data_Element};
    
    Cp_Data=Cp_Data';
    
    [Rows,Cols]=size(Cp_Data);
    
    error_term=mod(Rows,2);
    
    if error_term~=0
        
        error('Cp Curve input excel file is of inappropriate dimensions');    
              
    end

% Ploting Power coeffficient(Cp) curve:
    
  axes(handles.G1);
  grid on
  hold on 
  title('Cp Curve');
  xlabel('Tip Speed Ratio [TSR]');
  ylabel('Power Coefficient [Cp]');
  xlim([0 inf]);
  ylim([0 inf]);     
    for i=1:2:Rows
        
        plot(Cp_Data(i,:),Cp_Data(i+1,:),'b--o','LineWidth',2);
        
    end
    
    hold off;
end
%   % Debugger
%   Debugger=num2str(next);
%   set(handles.debug,'String',Debugger);


% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Cp_Curve_Generator_GUI=getappdata(0,'Cp_Curve_Generator_GUI');
% Setting Theta = 0:
set(handles.Theta, 'String', '0');

% Clearing all graph values:
axes(handles.G1);
cla reset;

% Getting number of rotor types:
n = get(handles.n, 'String');
n = str2double(n);

% Getting radio button values:
r1 = get(handles.r1, 'Value');

r2 = get(handles.r2, 'Value');

r3 = get(handles.r3, 'Value');

% Computing Cp:

if r1 == 1
    
    n = get(handles.n, 'String');
    n = str2double(n);
    
    c1 = get(handles.c1, 'String');
    c1 = strread(c1, '%f', 'delimiter', ',');
    c1 = c1';
    
    c2 = get(handles.c2, 'String');
    c2 = strread(c2, '%f', 'delimiter', ',');
    c2 = c2';
    
    c3 = get(handles.c3, 'String');
    c3 = strread(c3, '%f', 'delimiter', ',');
    c3 = c3';
    
    c4 = get(handles.c4, 'String');
    c4 = strread(c4, '%f', 'delimiter', ',');
    c4 = c4';
    
    c5 = get(handles.c5, 'String');
    c5 = strread(c5, '%f', 'delimiter', ',');
    c5 = c5';

    
    c6 = get(handles.c6, 'String');
    c6 = strread(c6, '%f', 'delimiter', ',');
    c6 = c6';

   
    x = get(handles.x, 'String');
    x = strread(x, '%f', 'delimiter', ',');
    x = x';
   
    Theta = get(handles.Theta, 'String');
    Theta = str2double(Theta);
    
    % Calling external function to calculate Cp:
    
    [Cp, TSR] = Cpcurve( n, c1, c2, c3, c4, c5, c6, x, Theta );
    
    % Saving computed values to current GUI workspace:
%     setappdata(Cp_Curve_Generator_GUI,'Cp',Cp);
%     setappdata(Cp_Curve_Generator_GUI,'TSR',TSR);
    
   
    
elseif r2 == 1
    
    Theta = get(handles.Theta, 'String');
    Theta = str2double(Theta);
    
    % Calling external function to calculate Cp:
    
    [Cp, TSR] = Cpcurve2( Theta );
    
elseif r3 == 1 
    
    n = get(handles.n, 'String');
    n = str2double(n);
    
    CpCurve_Data=getappdata(Cp_Curve_Generator_GUI,'CpCurve_Data');
    
      
end
    

% Getting Cp and TSR values:
% Cp = getappdata(Cp_Curve_Generator_GUI,'Cp');
% 
% TSR = getappdata(Cp_Curve_Generator_GUI,'TSR');

% Programming Previous button:

global next1;
if next1==1
    next1=n + 1;
end 
next1=next1-1;

if (r1==1) || (r2==1)
% Ploting Power coeffficient(Cp) curve:
    
  axes(handles.G1);
  grid on
  hold on 
  title('Cp Curve');
  xlabel('Tip Speed Ratio [TSR]');
  ylabel('Power Coefficient [Cp]');
  xlim([0 inf]);
  ylim([0 inf]); 
  %Plots Cp vs TSR curve
  plot(TSR,Cp(next1,:),'LineWidth',2,'Color','k');  
 
 
  hold off;
  
elseif r3==1
  
    Data_Element=next1;
    
    Cp_Data=CpCurve_Data{1,Data_Element};
    
    Cp_Data=Cp_Data';
    
    [Rows,Cols]=size(Cp_Data);
    
    error_term=mod(Rows,2);
    
    if error_term~=0
        
        error('Cp Curve input excel file is of inappropriate dimensions');    
              
    end

% Ploting Power coeffficient(Cp) curve:
    
  axes(handles.G1);
  grid on
  hold on 
  title('Cp Curve');
  xlabel('Tip Speed Ratio [TSR]');
  ylabel('Power Coefficient [Cp]');
  xlim([0 inf]);
  ylim([0 inf]);     
    for i=1:2:Rows
        
        plot(Cp_Data(i,:),Cp_Data(i+1,:),'b--o','LineWidth',2);
        
    end
    
    hold off;
    
end
%   % Debugger
%   Debugger=num2str(next);
%   set(handles.debug,'String',Debugger);
  


function c1_Callback(hObject, eventdata, handles)
% hObject    handle to c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c1 as text
%        str2double(get(hObject,'String')) returns contents of c1 as a double


% --- Executes during object creation, after setting all properties.
function c1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c2_Callback(hObject, eventdata, handles)
% hObject    handle to c2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c2 as text
%        str2double(get(hObject,'String')) returns contents of c2 as a double


% --- Executes during object creation, after setting all properties.
function c2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c3_Callback(hObject, eventdata, handles)
% hObject    handle to c3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c3 as text
%        str2double(get(hObject,'String')) returns contents of c3 as a double


% --- Executes during object creation, after setting all properties.
function c3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c4_Callback(hObject, eventdata, handles)
% hObject    handle to c4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c4 as text
%        str2double(get(hObject,'String')) returns contents of c4 as a double


% --- Executes during object creation, after setting all properties.
function c4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c5_Callback(hObject, eventdata, handles)
% hObject    handle to c5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c5 as text
%        str2double(get(hObject,'String')) returns contents of c5 as a double


% --- Executes during object creation, after setting all properties.
function c5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c6_Callback(hObject, eventdata, handles)
% hObject    handle to c6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c6 as text
%        str2double(get(hObject,'String')) returns contents of c6 as a double


% --- Executes during object creation, after setting all properties.
function c6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x_Callback(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x as text
%        str2double(get(hObject,'String')) returns contents of x as a double


% --- Executes during object creation, after setting all properties.
function x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_Callback(hObject, eventdata, handles)
% hObject    handle to Theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta as text
%        str2double(get(hObject,'String')) returns contents of Theta as a double


% --- Executes during object creation, after setting all properties.
function Theta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n_Callback(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n as text
%        str2double(get(hObject,'String')) returns contents of n as a double


% --- Executes during object creation, after setting all properties.
function n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing application window
close;

% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting GUI values:

set(handles.r1, 'Value', 1);

set(handles.r2, 'Value', 0);

set(handles.r3, 'Value', 0);

set(handles.n, 'String', '1');

set(handles.c1, 'String', '0.5');

set(handles.c2, 'String', '116');

set(handles.c3, 'String', '0.4');

set(handles.c4, 'String', '0');

set(handles.c5, 'String', '5');

set(handles.c6, 'String', '21');

set(handles.x, 'String', '0');

set(handles.n, 'Enable', 'on');

set(handles.c1, 'Enable', 'on');

set(handles.c2, 'Enable', 'on');

set(handles.c3, 'Enable', 'on');

set(handles.c4, 'Enable', 'on');

set(handles.c5, 'Enable', 'on');

set(handles.c6, 'Enable', 'on');

set(handles.x, 'Enable', 'on');

set(handles.b6, 'Enable', 'on');

set(handles.b5, 'Enable', 'on');

set(handles.b3, 'Enable', 'on');

set(handles.b4, 'Enable', 'on');

set(handles.b8, 'Enable', 'off');

set(handles.Theta, 'String', '0');
    
    axes(handles.G1);
    cla reset;

    



% --- Executes when selected object is changed in uipanel5.
function uipanel5_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel5 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Getting values of radio buttons:

r1 = get(handles.r1, 'Value');

r2 = get(handles.r2, 'Value');

r3 = get(handles.r3, 'Value');

% Writing selction change function:

if r1 == 1
    
    set(handles.n, 'Enable', 'on');
    
    set(handles.c1, 'Enable', 'on');
    
    set(handles.c2, 'Enable', 'on');
    
    set(handles.c3, 'Enable', 'on');
    
    set(handles.c4, 'Enable', 'on');
    
    set(handles.c5, 'Enable', 'on');
    
    set(handles.c6, 'Enable', 'on');
    
    set(handles.x, 'Enable', 'on');
    
    set(handles.Theta, 'Enable', 'on');
    
    set(handles.b3, 'Enable', 'on');
    
    set(handles.b4, 'Enable', 'on');
    
    set(handles.b5, 'Enable', 'on');
    
    set(handles.b6, 'Enable', 'on');
    
    set(handles.b8, 'Enable', 'off');
    
  
    
elseif r2 == 1
    
    set(handles.n, 'Enable', 'off');
    
    set(handles.c1, 'Enable', 'off');
    
    set(handles.c2, 'Enable', 'off');
    
    set(handles.c3, 'Enable', 'off');
    
    set(handles.c4, 'Enable', 'off');
    
    set(handles.c5, 'Enable', 'off');
    
    set(handles.c6, 'Enable', 'off');
    
    set(handles.x, 'Enable', 'off');
    
    set(handles.Theta, 'Enable', 'on');
    
    set(handles.b3, 'Enable', 'on');
    
    set(handles.b4, 'Enable', 'on');
    
    set(handles.b5, 'Enable', 'off');
    
    set(handles.b6, 'Enable', 'off');
    
    set(handles.b8, 'Enable', 'off');
    
elseif r3 == 1
    
    set(handles.n, 'Enable', 'on');
    
    set(handles.c1, 'Enable', 'off');
    
    set(handles.c2, 'Enable', 'off');
    
    set(handles.c3, 'Enable', 'off');
    
    set(handles.c4, 'Enable', 'off');
    
    set(handles.c5, 'Enable', 'off');
    
    set(handles.c6, 'Enable', 'off');
    
    set(handles.x, 'Enable', 'off');
    
    set(handles.Theta, 'Enable', 'off');
    
    set(handles.b3, 'Enable', 'off');
    
    set(handles.b4, 'Enable', 'off');
    
    set(handles.b5, 'Enable', 'on');
    
    set(handles.b6, 'Enable', 'on');
    
    set(handles.b8, 'Enable', 'on');
    
    
    
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over b1.
function b1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in b8.
function b8_Callback(hObject, eventdata, handles)
% hObject    handle to b8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    Cp_Curve_Generator_GUI=getappdata(0,'Cp_Curve_Generator_GUI');

    n = get(handles.n, 'String');
    
    n = str2double(n);
    
    % Initializing Cell Structure For Power Curve:
    
    CpCurve_Data = cell(1,n);
    
    for i = 1:n        
    
    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Cp Curve File Selector');
    fullpathname=strcat(pathname, filename);
    TempFile=xlsread(fullpathname);
    
    CpCurve_Data(1,i) = {TempFile};
    
    end
    
    setappdata(Cp_Curve_Generator_GUI,'CpCurve_Data',CpCurve_Data);

      



function debug_Callback(hObject, eventdata, handles)
% hObject    handle to debug (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of debug as text
%        str2double(get(hObject,'String')) returns contents of debug as a double


% --- Executes during object creation, after setting all properties.
function debug_CreateFcn(hObject, eventdata, handles)
% hObject    handle to debug (see GCBO)
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
Cp_Curve_Generator_GUI=getappdata(0,'Cp_Curve_Generator_GUI');

% Getting Radio button values:
      r1 = get(handles.r1, 'Value');
      
      r2 = get(handles.r2, 'Value');

      r3 = get(handles.r3, 'Value');
% Getting values from the user:
if r1 == 1
    
    % Setting Cp_indicator:
    
    Cp_Indicator = 1;
    setappdata(Cp_Curve_Generator_GUI,'Cp_Indicator',Cp_Indicator);    
    
    n = get(handles.n, 'String');
    n = str2double(n);
    setappdata(Cp_Curve_Generator_GUI,'n',n);
    
    c1 = get(handles.c1, 'String');
    c1 = strread(c1, '%f', 'delimiter', ',');
    c1 = c1';
    setappdata(Cp_Curve_Generator_GUI,'c1',c1);
    
    c2 = get(handles.c2, 'String');
    c2 = strread(c2, '%f', 'delimiter', ',');
    c2 = c2';
    setappdata(Cp_Curve_Generator_GUI,'c2',c2);
    
    c3 = get(handles.c3, 'String');
    c3 = strread(c3, '%f', 'delimiter', ',');
    c3 = c3';
    setappdata(Cp_Curve_Generator_GUI,'c3',c3);
    
    c4 = get(handles.c4, 'String');
    c4 = strread(c4, '%f', 'delimiter', ',');
    c4 = c4';
    setappdata(Cp_Curve_Generator_GUI,'c4',c4);
    
    c5 = get(handles.c5, 'String');
    c5 = strread(c5, '%f', 'delimiter', ',');
    c5 = c5';
    setappdata(Cp_Curve_Generator_GUI,'c5',c5);

    c6 = get(handles.c6, 'String');
    c6 = strread(c6, '%f', 'delimiter', ',');
    c6 = c6';
    setappdata(Cp_Curve_Generator_GUI,'c6',c6);

   
    x = get(handles.x, 'String');
    x = strread(x, '%f', 'delimiter', ',');
    x = x';
    setappdata(Cp_Curve_Generator_GUI,'x',x);
   
    
    
elseif r2 == 1
    
    % Setting Cp_indicator:
    
    Cp_Indicator = 0;
    setappdata(Cp_Curve_Generator_GUI,'Cp_Indicator',Cp_Indicator);  
    
    
elseif r3 == 1
    
    % Setting Cp_indicator:
    
    Cp_Indicator = 2;
    setappdata(Cp_Curve_Generator_GUI,'Cp_Indicator',Cp_Indicator);    
    setappdata(Cp_Curve_Generator_GUI,'CpCurve_Data',CpCurve_Data);
    
end


% --- Executes on button press in b10.

%
% hObject    handle to b10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in b10.
function b10_Callback(hObject, eventdata, handles)
% hObject    handle to b10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Open Data Acquisition App

Wind_GUI_1;
