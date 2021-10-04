function varargout = Strin_Sizing(varargin)
% STRIN_SIZING MATLAB code for Strin_Sizing.fig
%      STRIN_SIZING, by itself, creates a new STRIN_SIZING or raises the existing
%      singleton*.
%
%      H = STRIN_SIZING returns the handle to a new STRIN_SIZING or the handle to
%      the existing singleton*.
%
%      STRIN_SIZING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STRIN_SIZING.M with the given input arguments.
%
%      STRIN_SIZING('Property','Value',...) creates a new STRIN_SIZING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Strin_Sizing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Strin_Sizing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Strin_Sizing

% Last Modified by GUIDE v2.5 20-Jun-2016 19:07:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Strin_Sizing_OpeningFcn, ...
                   'gui_OutputFcn',  @Strin_Sizing_OutputFcn, ...
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


% --- Executes just before Strin_Sizing is made visible.
function Strin_Sizing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Strin_Sizing (see VARARGIN)

% Initializing the GUI

set(handles.Pp,'String','');
set(handles.Voc,'String','');
set(handles.Isc,'String','');
set(handles.Vmp,'String','');
set(handles.Imp,'String','');
set(handles.Pmp,'String','');
set(handles.Meff,'String','');
set(handles.INVmv,'String','');
set(handles.INVmi,'String','');
set(handles.Pinv1,'String','');
set(handles.INVeff,'String','');

set(handles.Nmod,'String','');
% set(handles.area,'String','');
set(handles.Nms,'String','');
set(handles.Ns,'String','');
set(handles.Pnom,'String','');
set(handles.Ninv,'String','');
set(handles.Nspinv,'String','');

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);


    set(handles.Pp,'Enable','on');
    set(handles.Voc,'Enable','on');
    set(handles.Isc,'Enable','on');
    set(handles.Vmp,'Enable','on');
    set(handles.Imp,'Enable','on');
    set(handles.Pmp,'Enable','on');
    set(handles.Meff,'Enable','on');
    set(handles.modlen,'Enable','on');
    set(handles.modbr,'Enable','on');
    set(handles.INVmv,'Enable','on');
    set(handles.INVmi,'Enable','on');
    set(handles.Pinv1,'Enable','on');
    set(handles.INVeff,'Enable','on');
    set(handles.Nmod,'Enable','on');
    set(handles.area,'Enable','on');
    set(handles.Nms,'Enable','on');
    set(handles.Ns,'Enable','on');
    set(handles.Pnom,'Enable','on');
    set(handles.Ninv,'Enable','on');
    set(handles.Nspinv,'Enable','on');
    
    set(handles.PB1,'Enable','on');
    set(handles.PB2,'Enable','on');
    set(handles.PB3,'Enable','on');
    
    set(handles.PB1,'String','Compute');  

% Choose default command line output for Strin_Sizing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Creating GUI Workspace Name
setappdata(0,'Strin_Sizing',gcf);

% UIWAIT makes Strin_Sizing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Strin_Sizing_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function INVmv_Callback(hObject, eventdata, handles)
% hObject    handle to INVmv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of INVmv as text
%        str2double(get(hObject,'String')) returns contents of INVmv as a double


% --- Executes during object creation, after setting all properties.
function INVmv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to INVmv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function INVmi_Callback(hObject, eventdata, handles)
% hObject    handle to INVmi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of INVmi as text
%        str2double(get(hObject,'String')) returns contents of INVmi as a double


% --- Executes during object creation, after setting all properties.
function INVmi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to INVmi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pinv1_Callback(hObject, eventdata, handles)
% hObject    handle to Pinv1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pinv1 as text
%        str2double(get(hObject,'String')) returns contents of Pinv1 as a double


% --- Executes during object creation, after setting all properties.
function Pinv1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pinv1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function INVeff_Callback(hObject, eventdata, handles)
% hObject    handle to INVeff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of INVeff as text
%        str2double(get(hObject,'String')) returns contents of INVeff as a double


% --- Executes during object creation, after setting all properties.
function INVeff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to INVeff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Voc_Callback(hObject, eventdata, handles)
% hObject    handle to Voc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Voc as text
%        str2double(get(hObject,'String')) returns contents of Voc as a double


% --- Executes during object creation, after setting all properties.
function Voc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Voc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Isc_Callback(hObject, eventdata, handles)
% hObject    handle to Isc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Isc as text
%        str2double(get(hObject,'String')) returns contents of Isc as a double


% --- Executes during object creation, after setting all properties.
function Isc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Isc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vmp_Callback(hObject, eventdata, handles)
% hObject    handle to Vmp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Vmp as text
%        str2double(get(hObject,'String')) returns contents of Vmp as a double


% --- Executes during object creation, after setting all properties.
function Vmp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vmp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Imp_Callback(hObject, eventdata, handles)
% hObject    handle to Imp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Imp as text
%        str2double(get(hObject,'String')) returns contents of Imp as a double


% --- Executes during object creation, after setting all properties.
function Imp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Imp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pmp_Callback(hObject, eventdata, handles)
% hObject    handle to Pmp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pmp as text
%        str2double(get(hObject,'String')) returns contents of Pmp as a double


% --- Executes during object creation, after setting all properties.
function Pmp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pmp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Meff_Callback(hObject, eventdata, handles)
% hObject    handle to Meff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Meff as text
%        str2double(get(hObject,'String')) returns contents of Meff as a double


% --- Executes during object creation, after setting all properties.
function Meff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Meff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pp_Callback(hObject, eventdata, handles)
% hObject    handle to Pp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pp as text
%        str2double(get(hObject,'String')) returns contents of Pp as a double


% --- Executes during object creation, after setting all properties.
function Pp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Nmod_Callback(hObject, eventdata, handles)
% hObject    handle to Nmod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Nmod as text
%        str2double(get(hObject,'String')) returns contents of Nmod as a double


% --- Executes during object creation, after setting all properties.
function Nmod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nmod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function area_Callback(hObject, eventdata, handles)
% hObject    handle to area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of area as text
%        str2double(get(hObject,'String')) returns contents of area as a double


% --- Executes during object creation, after setting all properties.
function area_CreateFcn(hObject, eventdata, handles)
% hObject    handle to area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Nms_Callback(hObject, eventdata, handles)
% hObject    handle to Nms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Nms as text
%        str2double(get(hObject,'String')) returns contents of Nms as a double


% --- Executes during object creation, after setting all properties.
function Nms_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ns_Callback(hObject, eventdata, handles)
% hObject    handle to Ns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ns as text
%        str2double(get(hObject,'String')) returns contents of Ns as a double


% --- Executes during object creation, after setting all properties.
function Ns_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pnom_Callback(hObject, eventdata, handles)
% hObject    handle to Pnom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pnom as text
%        str2double(get(hObject,'String')) returns contents of Pnom as a double


% --- Executes during object creation, after setting all properties.
function Pnom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pnom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ninv_Callback(hObject, eventdata, handles)
% hObject    handle to Ninv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ninv as text
%        str2double(get(hObject,'String')) returns contents of Ninv as a double


% --- Executes during object creation, after setting all properties.
function Ninv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ninv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Nspinv_Callback(hObject, eventdata, handles)
% hObject    handle to Nspinv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Nspinv as text
%        str2double(get(hObject,'String')) returns contents of Nspinv as a double


% --- Executes during object creation, after setting all properties.
function Nspinv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nspinv (see GCBO)
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

% Getting radio button values
r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');

if (r1==1) % Computation

    %Getting Data from GUI
    Pp=get(handles.Pp,'String');
    Pp=str2double(Pp);
    Voc=get(handles.Voc,'String');
    Voc=str2double(Voc);
    Isc=get(handles.Isc,'String');
    Isc=str2double(Isc);
    Vmp=get(handles.Vmp,'String');
    Vmp=str2double(Vmp);
    Imp=get(handles.Imp,'String');
    Imp=str2double(Imp);
    Pmp=get(handles.Pmp,'String');
    Pmp=str2double(Pmp);
    Meff=get(handles.Meff,'String');
    Meff=str2double(Meff);
    modlen=get(handles.modlen,'String');
    modlen=str2double(modlen);
    modbr=get(handles.modbr,'String');
    modlbr=str2double(modbr);
    INVmv=get(handles.INVmv,'String');
    INVmv=str2double(INVmv);
    INVmi=get(handles.INVmi,'String');
    INVmi=str2double(INVmi);
    Pinv1=get(handles.Pinv1,'String');
    Pinv1=str2double(Pinv1);
    INVeff=get(handles.INVeff,'String');
    INVeff=str2double(INVeff);

    Pp1=Pp*1000;
    Pinv=Pinv1*1000;
    Pmod=Pmp;
    Vm=Vmp;
    Im=Imp;
    %Computing Results

    %Number of Modules in a single String
    Nms=ceil((INVmv*0.9)/Voc);

    % Number of Strings
    Ns=ceil(Pp1/(Im*Nms*Vm*(Meff/100)));

    % Number of Modules
    Nmod=Nms*Ns;

    % Total Area of Modules
     area=((modlen*modlbr)/(10^(6)))*(Nmod);

    % Nominal Power Output
    Pnom=((Im*Ns)*(Vm*Nms)*((Meff/100)*(INVeff\100)))/1000;

    % Number of Inverters
    Ninv=ceil((Pp1*1.2)/(Pinv*(INVeff\100)));

    % Number of Strings per Inverter
    Nspinv=ceil((INVmi*0.8)/(Isc));

    %Converting Results to Strings
    Nms=num2str(Nms);
    Ns=num2str(Ns);
    Nmod=num2str(Nmod);
    area=num2str(area);
    Pnom=num2str(Pnom);
    Ninv=num2str(Ninv);
    Nspinv=num2str(Nspinv);

    %Displaying Results
    set(handles.Nmod,'String',Nmod);
     set(handles.area,'String',area);
    set(handles.Nms,'String',Nms);
    set(handles.Ns,'String',Ns);
    set(handles.Pnom,'String',Pnom);
    set(handles.Ninv,'String',Ninv);
    set(handles.Nspinv,'String',Nspinv);
    
elseif (r2==1)
    
    % Gettin the Workspace name of current GUI
    Strin_Sizing=getappdata(0,'Strin_Sizing');
    
    %Getting Data from GUI
    Pp=get(handles.Pp,'String');
    Pp=str2double(Pp);
    Voc=get(handles.Voc,'String');
    Voc=str2double(Voc);
    Isc=get(handles.Isc,'String');
    Isc=str2double(Isc);
    Vmp=get(handles.Vmp,'String');
    Vmp=str2double(Vmp);
    Imp=get(handles.Imp,'String');
    Imp=str2double(Imp);
    Pmp=get(handles.Pmp,'String');
    Pmp=str2double(Pmp);
    Meff=get(handles.Meff,'String');
    Meff=str2double(Meff);
    modlen=get(handles.modlen,'String');
    modlen=str2double(modlen);
    modbr=get(handles.modbr,'String');
    modlbr=str2double(modbr);
    INVmv=get(handles.INVmv,'String');
    INVmv=str2double(INVmv);
    INVmi=get(handles.INVmi,'String');
    INVmi=str2double(INVmi);
    Pinv1=get(handles.Pinv1,'String');
    Pinv1=str2double(Pinv1);
    INVeff=get(handles.INVeff,'String');
    INVeff=str2double(INVeff);

    Pp1=Pp*1000;
    Pinv=Pinv1*1000;
    Pmod=Pmp;
    Vm=Vmp;
    Im=Imp;
    %Computing Results

    %Number of Modules in a single String
    Nms=ceil((INVmv*0.9)/Voc);

    % Number of Strings
    Ns=ceil(Pp1/(Im*Nms*Vm*(Meff/100)));

    % Number of Modules
    Nmod=Nms*Ns;

    % Total Area of Modules
     area=((modlen*modlbr)/(10^(6)))*(Nmod);

    % Nominal Power Output
    Pnom=((Im*Ns)*(Vm*Nms)*((Meff/100)*(INVeff\100)))/1000;

    % Number of Inverters
    Ninv=ceil((Pp1*1.2)/(Pinv*(INVeff\100)));

    % Number of Strings per Inverter
    Nspinv=ceil((INVmi*0.8)/(Isc));

    %Converting Results to Strings
    Nms=num2str(Nms);
    Ns=num2str(Ns);
    Nmod=num2str(Nmod);
    area=num2str(area);
    Pnom=num2str(Pnom);
    Ninv=num2str(Ninv);
    Nspinv=num2str(Nspinv);

    %Displaying Results
    set(handles.Nmod,'String',Nmod);
     set(handles.area,'String',area);
    set(handles.Nms,'String',Nms);
    set(handles.Ns,'String',Ns);
    set(handles.Pnom,'String',Pnom);
    set(handles.Ninv,'String',Ninv);
    set(handles.Nspinv,'String',Nspinv);
    
    % Setting Results in GUI Workspace
    setappdata(Strin_Sizing,'Nmod',Nmod);
    setappdata(Strin_Sizing,'area',area);
    setappdata(Strin_Sizing,'Nms',Nms);
    setappdata(Strin_Sizing,'Ns',Ns);
    setappdata(Strin_Sizing,'Pnom',Pnom);
    setappdata(Strin_Sizing,'Ninv',Ninv);
    setappdata(Strin_Sizing,'Nspinv',Nspinv);
    
end




% --- Executes on button press in PB2.
function PB2_Callback(hObject, eventdata, handles)
% hObject    handle to PB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Pp,'String','');
set(handles.Voc,'String','');
set(handles.Isc,'String','');
set(handles.Vmp,'String','');
set(handles.Imp,'String','');
set(handles.Pmp,'String','');
set(handles.Meff,'String','');
set(handles.INVmv,'String','');
set(handles.INVmi,'String','');
set(handles.Pinv1,'String','');
set(handles.INVeff,'String','');

set(handles.Nmod,'String','');
% set(handles.area,'String','');
set(handles.Nms,'String','');
set(handles.Ns,'String','');
set(handles.Pnom,'String','');
set(handles.Ninv,'String','');
set(handles.Nspinv,'String','');

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);


    set(handles.Pp,'Enable','on');
    set(handles.Voc,'Enable','on');
    set(handles.Isc,'Enable','on');
    set(handles.Vmp,'Enable','on');
    set(handles.Imp,'Enable','on');
    set(handles.Pmp,'Enable','on');
    set(handles.Meff,'Enable','on');
    set(handles.modlen,'Enable','on');
    set(handles.modbr,'Enable','on');
    set(handles.INVmv,'Enable','on');
    set(handles.INVmi,'Enable','on');
    set(handles.Pinv1,'Enable','on');
    set(handles.INVeff,'Enable','on');
    set(handles.Nmod,'Enable','on');
    set(handles.area,'Enable','on');
    set(handles.Nms,'Enable','on');
    set(handles.Ns,'Enable','on');
    set(handles.Pnom,'Enable','on');
    set(handles.Ninv,'Enable','on');
    set(handles.Nspinv,'Enable','on');
    
    set(handles.PB1,'Enable','on');
    set(handles.PB2,'Enable','on');
    set(handles.PB3,'Enable','on');
    
    set(handles.PB1,'String','Compute');  


% --- Executes on button press in PB3.
function PB3_Callback(hObject, eventdata, handles)
% hObject    handle to PB3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing GUI

close;



function modlen_Callback(hObject, eventdata, handles)
% hObject    handle to modlen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of modlen as text
%        str2double(get(hObject,'String')) returns contents of modlen as a double


% --- Executes during object creation, after setting all properties.
function modlen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to modlen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function modbr_Callback(hObject, eventdata, handles)
% hObject    handle to modbr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of modbr as text
%        str2double(get(hObject,'String')) returns contents of modbr as a double


% --- Executes during object creation, after setting all properties.
function modbr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to modbr (see GCBO)
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
r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');

% Changing GUI Element behaviour according to radio button values

if (r1==1)
    
    set(handles.PB1,'String','Compute');
    
    
elseif (r2==1)

    set(handles.PB1,'String','Compute Send');
    
end
