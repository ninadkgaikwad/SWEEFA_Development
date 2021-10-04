function varargout = Sun_Path_Diagram(varargin)
% SUN_PATH_DIAGRAM MATLAB code for Sun_Path_Diagram.fig
%      SUN_PATH_DIAGRAM, by itself, creates a new SUN_PATH_DIAGRAM or raises the existing
%      singleton*.
%
%      H = SUN_PATH_DIAGRAM returns the handle to a new SUN_PATH_DIAGRAM or the handle to
%      the existing singleton*.
%
%      SUN_PATH_DIAGRAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUN_PATH_DIAGRAM.M with the given input arguments.
%
%      SUN_PATH_DIAGRAM('Property','Value',...) creates a new SUN_PATH_DIAGRAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sun_Path_Diagram_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sun_Path_Diagram_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sun_Path_Diagram

% Last Modified by GUIDE v2.5 25-Oct-2015 16:20:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sun_Path_Diagram_OpeningFcn, ...
                   'gui_OutputFcn',  @Sun_Path_Diagram_OutputFcn, ...
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


% --- Executes just before Sun_Path_Diagram is made visible.
function Sun_Path_Diagram_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sun_Path_Diagram (see VARARGIN)

% Choose default command line output for Sun_Path_Diagram
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Sun_Path_Diagram wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Sun_Path_Diagram_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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



function Hres_Callback(hObject, eventdata, handles)
% hObject    handle to Hres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Hres as text
%        str2double(get(hObject,'String')) returns contents of Hres as a double


% --- Executes during object creation, after setting all properties.
function Hres_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Hres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB1.
function PB1_Callback(hObject, eventdata, handles)
% hObject    handle to PB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Data from GUI
L=get(handles.L,'String');
L=str2double(L);
n=get(handles.n,'String');
n=str2double(n);
Hres=get(handles.Hres,'String');
Hres=str2double(Hres);

% Using Pre-defined Functions


[hp,ha,beta1,phi1,Sr,Ss] = Sun1(80,L,Hres);%Equinox
[hp,ha,beta2,phi2,Sr,Ss] = Sun1(172,L,Hres);%Summer Soltice
[hp,ha,beta3,phi3,Sr,Ss] = Sun1(355,L,Hres);%Winter Soltice
[hp,ha,beta4,phi4,Sr,Ss] = Sun1(n,L,Hres);%User Defined Day


axes(handles.G1); 
hold on;
grid on;
 plot(phi1,beta1,'-g',phi2,beta2,'-r',phi3,beta3,'-b',phi4,beta4,'-k'); 
%plot(phi1,beta1,'-g',phi2,beta2,'-r',phi3,beta3,'-b'); 

% plot(phi1,beta1,'-g');
% 
% plot(phi2,beta2,'-r'); 
% 
% plot(phi3,beta3,'-b');   
% 
% plot(phi4,beta4,'-k');

    
xlabel('Solar Azimuth Angle (Degrees)');
ylabel('Solar Elevation Angle (Degrees)');
title('Sunpath Diagram');

% --- Executes on button press in PB2.
function PB2_Callback(hObject, eventdata, handles)
% hObject    handle to PB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing GUI

close;


% --- Executes on button press in PB3.
function PB3_Callback(hObject, eventdata, handles)
% hObject    handle to PB3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.L,'String','');
set(handles.n,'String','');
set(handles.Hres,'String','');

axes(handles.G1); 
cla reset; % Do a complete and total reset of the axes.
