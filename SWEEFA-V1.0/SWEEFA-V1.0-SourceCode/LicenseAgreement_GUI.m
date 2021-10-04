function varargout = LicenseAgreement_GUI(varargin)
% LICENSEAGREEMENT_GUI MATLAB code for LicenseAgreement_GUI.fig
%      LICENSEAGREEMENT_GUI, by itself, creates a new LICENSEAGREEMENT_GUI or raises the existing
%      singleton*.
%
%      H = LICENSEAGREEMENT_GUI returns the handle to a new LICENSEAGREEMENT_GUI or the handle to
%      the existing singleton*.
%
%      LICENSEAGREEMENT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LICENSEAGREEMENT_GUI.M with the given input arguments.
%
%      LICENSEAGREEMENT_GUI('Property','Value',...) creates a new LICENSEAGREEMENT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LicenseAgreement_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LicenseAgreement_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LicenseAgreement_GUI

% Last Modified by GUIDE v2.5 18-Nov-2016 16:40:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LicenseAgreement_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @LicenseAgreement_GUI_OutputFcn, ...
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


% --- Executes just before LicenseAgreement_GUI is made visible.
function LicenseAgreement_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LicenseAgreement_GUI (see VARARGIN)

% Initializing the GUI

set(handles.r1,'Value',0);
set(handles.r2,'Value',0);
set(handles.b1,'Enable','off');
set(handles.b2,'Enable','off');


% Loading the License Agreement File to the Edit Box

    output=fileread('Sample_Lic.txt');

    % Displaying File Data to Edit Box 
     set(handles.Lic,'String',output);

% Choose default command line output for LicenseAgreement_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LicenseAgreement_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LicenseAgreement_GUI_OutputFcn(hObject, eventdata, handles) 
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

% Enter the Application

SWF_Start_GUI;

% Close Current GUI

close LicenseAgreement_GUI;

% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Leave the Application

close;


function Lic_Callback(hObject, eventdata, handles)
% hObject    handle to Lic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Lic as text
%        str2double(get(hObject,'String')) returns contents of Lic as a double


% --- Executes during object creation, after setting all properties.
function Lic_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
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

% Getting Radio Button Values
r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');

% Programming GUI Element Behaviour using Radio Button Values

if (r1==1)
    
    set(handles.b1,'Enable','on');
    set(handles.b2,'Enable','off');    
    
elseif (r2==1)
    
    set(handles.b1,'Enable','off');
    set(handles.b2,'Enable','on');    
    
elseif ((r1==0)&&(r2==0))
    
    set(handles.b1,'Enable','off');
    set(handles.b2,'Enable','off');    
    
end
