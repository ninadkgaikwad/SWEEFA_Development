function varargout = Wake_Model_GUI(varargin)
% WAKE_MODEL_GUI MATLAB code for Wake_Model_GUI.fig
%      WAKE_MODEL_GUI, by itself, creates a_J new WAKE_MODEL_GUI or raises the existing
%      singleton*.
%
%      H = WAKE_MODEL_GUI returns the handle to a_J new WAKE_MODEL_GUI or the handle to
%      the existing singleton*.
%
%      WAKE_MODEL_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WAKE_MODEL_GUI.M with the given input arguments.
%
%      WAKE_MODEL_GUI('Property','Value',...) creates a_J new WAKE_MODEL_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Wake_Model_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Wake_Model_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Wake_Model_GUI

% Last Modified by GUIDE v2.5 20-Jan-2016 22:10:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Wake_Model_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Wake_Model_GUI_OutputFcn, ...
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


% --- Executes just before Wake_Model_GUI is made visible.
function Wake_Model_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Wake_Model_GUI (see VARARGIN)

% Choose default command line output for Wake_Model_GUI
handles.output = hObject;

% Getting Required GUI Workspace Name
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

if (isappdata(0,'Wind_GUI_MainPage') && isappdata(Wind_GUI_MainPage,'PlantInfo_DataCell'))
    
    % Getting Data fro Solar_App_Main_GUI Workspace    

    PlantInfo_DataCell=getappdata(Wind_GUI_MainPage,'PlantInfo_DataCell');
    
    % Initializing Loss Parameter Values to Data from Plant Info

    Jensen=PlantInfo_DataCell{76,2};
    set(handles.Jensen,'Value',Jensen);
    
    a_J=PlantInfo_DataCell{77,2};
    set(handles.a_J,'String',a_J);  
    
    k_J=PlantInfo_DataCell{78,2};
    set(handles.k_J,'String',k_J);
    
    x_J=PlantInfo_DataCell{79,2};
    set(handles.x_J,'String',x_J);    
    
    Frandsen=PlantInfo_DataCell{80,2};
    set(handles.Frandsen,'Value',Frandsen);
    
    a_F=PlantInfo_DataCell{81,2};
    set(handles.a_F,'String',a_F);  
    
    k_F=PlantInfo_DataCell{82,2};
    set(handles.k_F,'String',k_F);
    
    x_F=PlantInfo_DataCell{83,2};
    set(handles.x_F,'String',x_F);   
    
    alpha=PlantInfo_DataCell{84,2};
    set(handles.alpha,'String',alpha);    
    
    % Changing GUI Behaviour according to Jensen and Frandsen Values
    if (Jensen==1)        

        set(handles.a_J, 'Enable', 'on');
        set(handles.k_J, 'Enable', 'on');
        set(handles.x_J, 'Enable', 'on');

        set(handles.a_F, 'Enable', 'off');
        set(handles.k_F, 'Enable', 'off');
        set(handles.x_F, 'Enable', 'off');
        set(handles.alpha, 'Enable', 'off');        
        
    elseif (Frandsen==1)
        
        set(handles.a_J, 'Enable', 'off');
        set(handles.k_J, 'Enable', 'off');
        set(handles.x_J, 'Enable', 'off');

        set(handles.a_F, 'Enable', 'on');
        set(handles.k_F, 'Enable', 'on');
        set(handles.x_F, 'Enable', 'on');
        set(handles.alpha, 'Enable', 'on');        
        
    end
        
    
else
    
    % Initialization:

    set(handles.Jensen, 'Value', 1);

    set(handles.Frandsen, 'Value', 0);

    set(handles.a_J, 'Enable', 'on');

    set(handles.k_J, 'Enable', 'on');

    set(handles.x_J, 'Enable', 'on');

    set(handles.a_F, 'Enable', 'off');

    set(handles.k_F, 'Enable', 'off');

    set(handles.x_F, 'Enable', 'off');

    set(handles.alpha, 'Enable', 'off');

    set(handles.a_J, 'String', '0.5');

    set(handles.k_J, 'String', '0.075');

    set(handles.x_J, 'String', '');

    set(handles.a_F, 'String', '0.5');

    set(handles.k_F, 'String', '3');

    set(handles.x_F, 'String', '');

    set(handles.alpha, 'String', '0.15');          
    
end




% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'Wake_Model_GUI',gcf);

% UIWAIT makes Wake_Model_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Wake_Model_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.Jensen, 'Value', 1);

set(handles.Frandsen, 'Value', 0);

set(handles.a_J, 'Enable', 'on');

set(handles.k_J, 'Enable', 'on');

set(handles.x_J, 'Enable', 'on');

set(handles.a_F, 'Enable', 'off');

set(handles.k_F, 'Enable', 'off');

set(handles.x_F, 'Enable', 'off');

set(handles.alpha, 'Enable', 'off');

set(handles.a_J, 'String', '0.5');

set(handles.k_J, 'String', '0.075');

set(handles.x_J, 'String', '');

set(handles.a_F, 'String', '0.5');

set(handles.k_F, 'String', '3');

set(handles.x_F, 'String', '');

set(handles.alpha, 'String', '0.15');

% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Wake_Model_GUI = getappdata(0,'Wake_Model_GUI');

Jensen = get(handles.Jensen, 'Value');

Frandsen = get(handles.Frandsen, 'Value');

if Jensen == 1
    
    a_J = get(handles.a_J, 'String');
    a_J = str2double(a_J);

    
    k_J = get(handles.k_J, 'String');
    k_J = str2double(k_J);
    
    
    x_J = get(handles.x_J, 'String');
    x_J = str2double(x_J);
    
   a_F = 0;

   k_F = 0;
   
   x_F = 0;
   
   alpha = 0;
   
   WakeModelParameters = {Jensen,Frandsen,a_J, k_J, x_J, a_F, k_F, x_F, alpha};
   
   setappdata(Wake_Model_GUI, 'WakeModelParameters', WakeModelParameters);
   
elseif Frandsen == 1
    
    a_F = get(handles.a_F, 'String');
    a_F = str2double(a_F);
    
    k_F = get(handles.k_F, 'String');
    k_F = str2double(k_F);
    
    x_F = get(handles.x_F, 'String');
    x_F = str2double(x_F);
    
    alpha = get(handles.alpha, 'String');
    alpha = str2double(alpha);
    
    a_J = 0;

    k_J = 0;
   
    x_J = 0; 
   
   
   WakeModelParameters = {Jensen,Frandsen,a_J, k_J, x_J, a_F, k_F, x_F, alpha};
   
   setappdata(Wake_Model_GUI, 'WakeModelParameters', WakeModelParameters);
   
end
           
function a_F_Callback(hObject, eventdata, handles)
% hObject    handle to a_F (see GCBO)
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_F as text
%        str2double(get(hObject,'String')) returns contents of a_F as a_J double


% --- Executes during object creation, after setting all properties.
function a_F_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_F (see GCBO)
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a_J white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k_F_Callback(hObject, eventdata, handles)
% hObject    handle to k_F (see GCBO)
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k_F as text
%        str2double(get(hObject,'String')) returns contents of k_F as a_J double


% --- Executes during object creation, after setting all properties.
function k_F_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k_F (see GCBO)
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a_J white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x_F_Callback(hObject, eventdata, handles)
% hObject    handle to x_F (see GCBO)
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_F as text
%        str2double(get(hObject,'String')) returns contents of x_F as a_J double


% --- Executes during object creation, after setting all properties.
function x_F_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_F (see GCBO)
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a_J white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alpha_Callback(hObject, eventdata, handles)
% hObject    handle to alpha (see GCBO)
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha as text
%        str2double(get(hObject,'String')) returns contents of alpha as a_J double


% --- Executes during object creation, after setting all properties.
function alpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha (see GCBO)
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a_J white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_J_Callback(hObject, eventdata, handles)
% hObject    handle to a_J (see GCBO)
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_J as text
%        str2double(get(hObject,'String')) returns contents of a_J as a_J double


% --- Executes during object creation, after setting all properties.
function a_J_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_J (see GCBO)
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a_J white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k_J_Callback(hObject, eventdata, handles)
% hObject    handle to k_J (see GCBO)
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k_J as text
%        str2double(get(hObject,'String')) returns contents of k_J as a_J double


% --- Executes during object creation, after setting all properties.
function k_J_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k_J (see GCBO)
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a_J white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x_J_Callback(hObject, eventdata, handles)
% hObject    handle to x_J (see GCBO)
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_J as text
%        str2double(get(hObject,'String')) returns contents of x_J as a_J double


% --- Executes during object creation, after setting all properties.
function x_J_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_J (see GCBO)
% eventdata  reserved - to be defined in a_J future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a_J white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Getting Values of Radio-buttons from user:

Jansen = get(handles.Jensen, 'Value');

Frandsen = get(handles.Frandsen, 'Value');

if Jansen == 1
    
    set(handles.a_J, 'Enable', 'on');
    
    set(handles.k_J, 'Enable', 'on');
    
    set(handles.x_J, 'Enable', 'on');
    
    set(handles.a_F, 'Enable', 'off');
    
    set(handles.k_F, 'Enable', 'off');
    
    set(handles.x_F, 'Enable', 'off');   
    
    set(handles.alpha, 'Enable', 'off');
    
elseif Frandsen == 1
    
    set(handles.a_J, 'Enable', 'off');
    
    set(handles.k_J, 'Enable', 'off');
    
    set(handles.x_J, 'Enable', 'off');
    
    set(handles.a_F, 'Enable', 'on');
    
    set(handles.k_F, 'Enable', 'on');
    
    set(handles.x_F, 'Enable', 'on');   
    
    set(handles.alpha, 'Enable', 'on');
    
end
