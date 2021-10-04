function varargout = PUConverter_GUI(varargin)
% PUCONVERTER_GUI MATLAB code for PUConverter_GUI.fig
%      PUCONVERTER_GUI, by itself, creates a new PUCONVERTER_GUI or raises the existing
%      singleton*.
%
%      H = PUCONVERTER_GUI returns the handle to a new PUCONVERTER_GUI or the handle to
%      the existing singleton*.
%
%      PUCONVERTER_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PUCONVERTER_GUI.M with the given input arguments.
%
%      PUCONVERTER_GUI('Property','Value',...) creates a new PUCONVERTER_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PUConverter_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PUConverter_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PUConverter_GUI

% Last Modified by GUIDE v2.5 24-Mar-2016 10:39:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PUConverter_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @PUConverter_GUI_OutputFcn, ...
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


% --- Executes just before PUConverter_GUI is made visible.
function PUConverter_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PUConverter_GUI (see VARARGIN)

% Choose default command line output for PUConverter_GUI
handles.output = hObject;

% Initializations 

set(handles.Sbase,'String','');

set(handles.Vbase,'String','');

set(handles.PuValue,'String','');

set(handles.ActualValue,'String','');

set(handles.ActualValue,'Enable','off');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PUConverter_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PUConverter_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Input Values

Sbase=get(handles.Sbase,'String');
Sbase=str2double(Sbase);

Vbase=get(handles.Vbase,'String');
Vbase=str2double(Vbase);

PuValue=get(handles.PuValue,'String');
PuValue=str2double(PuValue);

% Using External Function to Compute Actual Value

[ ActualValue ] = PerUnitToActual(Sbase, Vbase, 3, 1, PuValue  );

% Putting Computed Answer on Screen

set(handles.ActualValue,'String',ActualValue);

% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing Window

close;


function Vbase_Callback(hObject, eventdata, handles)
% hObject    handle to Vbase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Vbase as text
%        str2double(get(hObject,'String')) returns contents of Vbase as a double


% --- Executes during object creation, after setting all properties.
function Vbase_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vbase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PuValue_Callback(hObject, eventdata, handles)
% hObject    handle to PuValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PuValue as text
%        str2double(get(hObject,'String')) returns contents of PuValue as a double


% --- Executes during object creation, after setting all properties.
function PuValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PuValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Sbase_Callback(hObject, eventdata, handles)
% hObject    handle to Sbase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Sbase as text
%        str2double(get(hObject,'String')) returns contents of Sbase as a double


% --- Executes during object creation, after setting all properties.
function Sbase_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sbase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ActualValue_Callback(hObject, eventdata, handles)
% hObject    handle to ActualValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ActualValue as text
%        str2double(get(hObject,'String')) returns contents of ActualValue as a double


% --- Executes during object creation, after setting all properties.
function ActualValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ActualValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting GUI

set(handles.Sbase,'String','');

set(handles.Vbase,'String','');

set(handles.PuValue,'String','');

set(handles.ActualValue,'String','');

set(handles.ActualValue,'Enable','off');
