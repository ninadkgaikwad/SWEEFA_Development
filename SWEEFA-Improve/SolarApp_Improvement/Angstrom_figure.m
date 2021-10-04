function varargout = Angstrom_figure(varargin)
% ANGSTROM_FIGURE M-file for Angstrom_figure.fig
%      ANGSTROM_FIGURE, by itself, creates a new ANGSTROM_FIGURE or raises the existing
%      singleton*.
%
%      H = ANGSTROM_FIGURE returns the handle to a new ANGSTROM_FIGURE or the handle to
%      the existing singleton*.
%
%      ANGSTROM_FIGURE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANGSTROM_FIGURE.M with the given input arguments.
%
%      ANGSTROM_FIGURE('Property','Value',...) creates a new ANGSTROM_FIGURE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Angstrom_figure_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Angstrom_figure_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Angstrom_figure

% Last Modified by GUIDE v2.5 17-Jun-2016 11:12:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Angstrom_figure_OpeningFcn, ...
                   'gui_OutputFcn',  @Angstrom_figure_OutputFcn, ...
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


% --- Executes just before Angstrom_figure is made visible.
function Angstrom_figure_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Angstrom_figure (see VARARGIN)

% initialising GUI
set(handles.A1,'String','');
set(handles.B1,'String','');
set(handles.C1,'String','');
set(handles.D1,'String','');

set(handles.R1,'Value',1);
set(handles.R2,'Value',0);
set(handles.R3,'Value',1);
set(handles.R4,'Value',0);

set(handles.P1,'String','Ok');
set(handles.P2,'String','Reset');
set(handles.P3,'String','Close');

set(handles.A,'Enable','off');
set(handles.A1,'Enable','off');

set(handles.T,'Data','');

% Choose default command line output for Angstrom_figure
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Angstrom_figure wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Angstrom_figure_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in P2.
function P2_Callback(hObject, eventdata, handles)
% hObject    handle to P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Reseting GUI
set(handles.A1,'String','');
set(handles.B1,'String','');
set(handles.C1,'String','');
set(handles.D1,'String','');

set(handles.R1,'Value',1);
set(handles.R2,'Value',0);
set(handles.R3,'Value',1);
set(handles.R4,'Value',0);


set(handles.P1,'String','Ok');
set(handles.P2,'String','Reset');
set(handles.P3,'String','Close');

set(handles.A,'Enable','off');
set(handles.A1,'Enable','off');

set(handles.T,'Data','');

% --- Executes on button press in P3.
function P3_Callback(hObject, eventdata, handles)
% hObject    handle to P3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing GUI
close ;

% --- Executes on button press in P1.
function P1_Callback(hObject, eventdata, handles)
% hObject    handle to P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

R1 = get(handles.R1,'Value');
R2 = get(handles.R2,'Value');
R3 = get(handles.R3,'Value');
R4 = get(handles.R4,'Value');

A1 = get(handles.A1,'String');
A1 = str2double(A1);    
B1 = get(handles.B1,'String');
B1 = str2double(B1);
C1 = get(handles.C1,'String');
C1 = str2double(C1);
D1 = get(handles.D1,'String');
D1 = str2double(D1);

V = Angstrom_model(R1,R2,A1,B1,R3,R4,C1,D1);
V = transpose(V);

set(handles.T,'Data',V);


% --- Executes on selection change in P.
function P_Callback(hObject, eventdata, handles)
% hObject    handle to P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

P = get(handles.P,'Value') ;

if (P==1) 
    
     set(handles.C1,'String','0.23') ;
     set(handles.D1,'String','0.48') ;
     
elseif (P==2)
    
    set(handles.C1,'String','0.262') ;
    set(handles.D1,'String','0.454') ;
    
elseif (P==3)
    
    set(handles.C1,'String','0.24') ;
    set(handles.D1,'String','0.53') ;
    
elseif (P==4)
    
    set(handles.C1,'String','0.3156') ;
    set(handles.D1,'String','0.452') ;
    
elseif (P==5)
    
    set(handles.C1,'String','0.175') ;
    set(handles.D1,'String','0.552') ;
    
elseif (P==6)
    
    set(handles.C1,'String','0.177') ;
    set(handles.D1,'String','0.692') ;
    
elseif (P==7)
    
    set(handles.C1,'String','0.174') ;
    set(handles.D1,'String','0.615') ;
    
elseif (P==8)
    
    set(handles.C1,'String','0.24') ;
    set(handles.D1,'String','0.513') ;
    
elseif (P==9)
    
    set(handles.C1,'String','0.241') ;
    set(handles.D1,'String','0.488') ;
    
elseif (P==10)
    
    set(handles.C1,'String','0.335') ;
    set(handles.D1,'String','0.367') ;
    
elseif (P==11)
    
    set(handles.C1,'String','0.313') ;
    set(handles.D1,'String','0.474') ;
    
elseif (P==12)
    
    set(handles.C1,'String','0.309') ;
    set(handles.D1,'String','0.599') ;
    
elseif (P==13)
    
    set(handles.C1,'String','0.14') ;
    set(handles.D1,'String','0.57') ;
    
elseif (P==14)
    
    set(handles.C1,'String','0.1538') ;
    set(handles.D1,'String','0.7874') ;
    
elseif (P==15)
    
    set(handles.C1,'String','0.2262') ;
    set(handles.D1,'String','0.418') ;
    
elseif (P==16)
    
    set(handles.C1,'String','0.215') ;
    set(handles.D1,'String','0.527') ;
    
elseif (P==17)
    
    set(handles.C1,'String','0.2424') ;
    set(handles.D1,'String','0.5014') ;
    
elseif (P==18)
    
    set(handles.C1,'String','0.2424') ;
    set(handles.D1,'String','0.5017') ;
    
elseif (P==19)
    
    set(handles.C1,'String','0.318') ;
    set(handles.D1,'String','0.449') ;
    
elseif (P==20)
    
    set(handles.C1,'String','0.2671') ;
    set(handles.D1,'String','0.4754') ;
    
elseif (P==21)
    
    set(handles.C1,'String','0.324') ;
    set(handles.D1,'String','0.405') ;
    
elseif (P==22)
    
    set(handles.C1,'String','0.1332') ;
    set(handles.D1,'String','0.6471') ;
    
elseif (P==23)
    
    set(handles.C1,'String','0.3647') ;
    set(handles.D1,'String','0.3505') ;
    
elseif (P==24)
    
    set(handles.C1,'String','0.3078') ;
    set(handles.D1,'String','0.4166') ;
    
elseif (P==25)
    
    set(handles.C1,'String','0.176') ;
    set(handles.D1,'String','0.563') ;
    
elseif (P==26)
    
    set(handles.C1,'String','0.2276') ;
    set(handles.D1,'String','0.5105') ;
    
elseif (P==27)
    
    set(handles.C1,'String','0.18') ;
    set(handles.D1,'String','0.62') ;
    
end

    
% Hints: contents = get(hObject,'String') returns P contents as cell array
%        contents{get(hObject,'Value')} returns selected item from P


% --- Executes during object creation, after setting all properties.
function P_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C1_Callback(hObject, eventdata, handles)
% hObject    handle to C1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C1 as text
%        str2double(get(hObject,'String')) returns contents of C1 as a double


% --- Executes during object creation, after setting all properties.
function C1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function D1_Callback(hObject, eventdata, handles)
% hObject    handle to D1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D1 as text
%        str2double(get(hObject,'String')) returns contents of D1 as a double


% --- Executes during object creation, after setting all properties.
function D1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function A1_Callback(hObject, eventdata, handles)
% hObject    handle to A1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of A1 as text
%        str2double(get(hObject,'String')) returns contents of A1 as a double


% --- Executes during object creation, after setting all properties.
function A1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function B1_Callback(hObject, eventdata, handles)
% hObject    handle to B1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of B1 as text
%        str2double(get(hObject,'String')) returns contents of B1 as a double


% --- Executes during object creation, after setting all properties.
function B1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B1 (see GCBO)
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

R1 = get(handles.R1,'Value'); 
R2 = get(handles.R2,'Value');

if (R1==1)
    
   set(handles.A,'Enable','off');
   set(handles.A1,'Enable','off');
    
elseif (R2==1)
    
    set(handles.A,'Enable','on');
    set(handles.A1,'Enable','on');    
end


% --- Executes when entered data in editable cell(s) in T.
function T_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to T (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
