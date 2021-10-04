function varargout = Loss_Parameters(varargin)
% LOSS_PARAMETERS MATLAB code for Loss_Parameters.fig
%      LOSS_PARAMETERS, by itself, creates a new LOSS_PARAMETERS or raises the existing
%      singleton*.
%
%      H = LOSS_PARAMETERS returns the handle to a new LOSS_PARAMETERS or the handle to
%      the existing singleton*.
%
%      LOSS_PARAMETERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOSS_PARAMETERS.M with the given input arguments.
%
%      LOSS_PARAMETERS('Property','Value',...) creates a new LOSS_PARAMETERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Loss_Parameters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Loss_Parameters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Loss_Parameters

% Last Modified by GUIDE v2.5 20-Jun-2016 19:01:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Loss_Parameters_OpeningFcn, ...
                   'gui_OutputFcn',  @Loss_Parameters_OutputFcn, ...
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


% --- Executes just before Loss_Parameters is made visible.
function Loss_Parameters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Loss_Parameters (see VARARGIN)

% Choose default command line output for Loss_Parameters
handles.output = hObject;

% Getting Required GUI Workspace Name
Solar_App_Main_GUI=getappdata(0,'Solar_App_Main_GUI');

if (isappdata(0,'Solar_App_Main_GUI') && isappdata(Solar_App_Main_GUI,'PlantInfo_DataCell'))
    
    % Getting Data fro Solar_App_Main_GUI Workspace
  
    PlantInfo_DataCell=getappdata(Solar_App_Main_GUI,'PlantInfo_DataCell');
    
    % Initializing Loss Parameter Values to Data from Plant Info

    Default=PlantInfo_DataCell{51,2};
    set(handles.r1,'Value',Default);
    
    UserDef=PlantInfo_DataCell{52,2};
    set(handles.r2,'Value',UserDef);
    
    SF=PlantInfo_DataCell{53,2};
    set(handles.SF,'String',SF);
    
    LID=PlantInfo_DataCell{54,2};
    set(handles.LID,'String',LID);
    
    LS=PlantInfo_DataCell{55,2};
    set(handles.LS,'String',LS);
    
    Arraymismat=PlantInfo_DataCell{56,2};
    set(handles.Arraymismat,'String',Arraymismat);
    
    OhmicLoss=PlantInfo_DataCell{57,2};
    set(handles.OhmicLoss,'String',OhmicLoss);
    
    rho=PlantInfo_DataCell{58,2};
    set(handles.rho,'String',rho);
    
    TrackerL=PlantInfo_DataCell{59,2};
    set(handles.TrackerL,'String',TrackerL);
    
    INVeff=PlantInfo_DataCell{60,2};
    set(handles.INVeff,'String',INVeff);
    
    TransLoss=PlantInfo_DataCell{61,2};
    set(handles.TransLoss,'String',TransLoss);
    
    Uo=PlantInfo_DataCell{62,2};
    set(handles.Uo,'String',Uo);
    
    U1=PlantInfo_DataCell{63,2};
    set(handles.U1,'String',U1);
    
    Shading=PlantInfo_DataCell{64,2};
    set(handles.Shading,'String',Shading);
    
    bo=PlantInfo_DataCell{65,2};
    set(handles.bo,'String',bo);

    if (Default==1)
    
        set(handles.SF,'Enable','off');
        set(handles.LID,'Enable','off');
        set(handles.LS,'Enable','off');
        set(handles.Arraymismat,'Enable','off');
        set(handles.OhmicLoss,'Enable','off');
        set(handles.rho,'Enable','off');
        set(handles.INVeff,'Enable','off');
        set(handles.TransLoss,'Enable','off');
        set(handles.Uo,'Enable','off');
        set(handles.U1,'Enable','off');
        set(handles.Shading,'Enable','off');
        set(handles.bo,'Enable','off');
        set(handles.PB3,'Enable','off');
        set(handles.PB3,'Enable','off');
    
    else(UserDef==1)
        
        set(handles.SF,'Enable','on');
        set(handles.LID,'Enable','on');
        set(handles.LS,'Enable','on');
        set(handles.Arraymismat,'Enable','on');
        set(handles.OhmicLoss,'Enable','on');
        set(handles.rho,'Enable','on');
        set(handles.INVeff,'Enable','on');
        set(handles.TransLoss,'Enable','on');
        set(handles.Uo,'Enable','on');
        set(handles.U1,'Enable','on');
        set(handles.Shading,'Enable','on');
        set(handles.bo,'Enable','on');
        set(handles.PB3,'Enable','on');
        set(handles.PB3,'Enable','on');        
        
    end
    
else

    % Initializing Loss Parameter Values to Default
    set(handles.SF,'String','2');
    set(handles.LID,'String','2');
    set(handles.LS,'String','3');
    set(handles.Arraymismat,'String','2');
    set(handles.OhmicLoss,'String','3');
    set(handles.rho,'String','0.2');
    set(handles.TrackerL,'String','0');
    set(handles.INVeff,'String','98');
    set(handles.TransLoss,'String','1');
    set(handles.Uo,'String','25');
    set(handles.U1,'String','6.84');
    set(handles.Shading,'String','1');
    set(handles.bo,'String','0.05');

    set(handles.SF,'Enable','off');
    set(handles.LID,'Enable','off');
    set(handles.LS,'Enable','off');
    set(handles.Arraymismat,'Enable','off');
    set(handles.OhmicLoss,'Enable','off');
    set(handles.rho,'Enable','off');
    set(handles.INVeff,'Enable','off');
    set(handles.TransLoss,'Enable','off');
    set(handles.Uo,'Enable','off');
    set(handles.U1,'Enable','off');
    set(handles.Shading,'Enable','off');
    set(handles.bo,'Enable','off');
    set(handles.PB3,'Enable','off');
    set(handles.PB3,'Enable','off');
    
end

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'Loss_Parameters',gcf);

% UIWAIT makes Loss_Parameters wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Loss_Parameters_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function SF_Callback(hObject, eventdata, handles)
% hObject    handle to SF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SF as text
%        str2double(get(hObject,'String')) returns contents of SF as a double


% --- Executes during object creation, after setting all properties.
function SF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LID_Callback(hObject, eventdata, handles)
% hObject    handle to LID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LID as text
%        str2double(get(hObject,'String')) returns contents of LID as a double


% --- Executes during object creation, after setting all properties.
function LID_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LS_Callback(hObject, eventdata, handles)
% hObject    handle to LS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LS as text
%        str2double(get(hObject,'String')) returns contents of LS as a double


% --- Executes during object creation, after setting all properties.
function LS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Arraymismat_Callback(hObject, eventdata, handles)
% hObject    handle to Arraymismat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Arraymismat as text
%        str2double(get(hObject,'String')) returns contents of Arraymismat as a double


% --- Executes during object creation, after setting all properties.
function Arraymismat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Arraymismat (see GCBO)
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



function Uo_Callback(hObject, eventdata, handles)
% hObject    handle to Uo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Uo as text
%        str2double(get(hObject,'String')) returns contents of Uo as a double


% --- Executes during object creation, after setting all properties.
function Uo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Uo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function U1_Callback(hObject, eventdata, handles)
% hObject    handle to U1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of U1 as text
%        str2double(get(hObject,'String')) returns contents of U1 as a double


% --- Executes during object creation, after setting all properties.
function U1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to U1 (see GCBO)
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



function rho_Callback(hObject, eventdata, handles)
% hObject    handle to rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rho as text
%        str2double(get(hObject,'String')) returns contents of rho as a double


% --- Executes during object creation, after setting all properties.
function rho_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Shading_Callback(hObject, eventdata, handles)
% hObject    handle to Shading (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Shading as text
%        str2double(get(hObject,'String')) returns contents of Shading as a double


% --- Executes during object creation, after setting all properties.
function Shading_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Shading (see GCBO)
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

Loss_Parameters=getappdata(0,'Loss_Parameters');

% Getting User Input and storing it in Figure Workspace
r1=get(handles.r1,'Value');
setappdata(Loss_Parameters,'Default',r1);
r2=get(handles.r2,'Value');
setappdata(Loss_Parameters,'UserDef',r2);
SF=get(handles.SF,'String');
SF=str2double(SF);
setappdata(Loss_Parameters,'SF',SF);
LID=get(handles.LID,'String');
LID=str2double(LID);
setappdata(Loss_Parameters,'LID',LID);
LS=get(handles.LS,'String');
LS=str2double(LS);
setappdata(Loss_Parameters,'LS',LS);
Arraymismat=get(handles.Arraymismat,'String');
Arraymismat=str2double(Arraymismat);
setappdata(Loss_Parameters,'Arraymismat',Arraymismat);
OhmicLoss=get(handles.OhmicLoss,'String');
OhmicLoss=str2double(OhmicLoss);
setappdata(Loss_Parameters,'OhmicLoss',OhmicLoss);
rho=get(handles.rho,'String');
rho=str2double(rho);
setappdata(Loss_Parameters,'rho',rho);
TrackerL=get(handles.TrackerL,'String');
TrackerL=str2double(TrackerL);
setappdata(Loss_Parameters,'TrackerL',TrackerL);
INVeff=get(handles.INVeff,'String');
INVeff=str2double(INVeff);
setappdata(Loss_Parameters,'INVeff',INVeff);
TransLoss=get(handles.TransLoss,'String');
TransLoss=str2double(TransLoss);
setappdata(Loss_Parameters,'TransLoss',TransLoss);
Uo=get(handles.Uo,'String');
Uo=str2double(Uo);
setappdata(Loss_Parameters,'Uo',Uo);
U1=get(handles.U1,'String');
U1=str2double(U1);
setappdata(Loss_Parameters,'U1',U1);
Shading=get(handles.Shading,'String');
Shading=str2double(Shading);
setappdata(Loss_Parameters,'Shading',Shading);
bo=get(handles.bo,'String');
bo=str2double(bo);
setappdata(Loss_Parameters,'bo',bo);

% --- Executes on button press in PB2.
function PB2_Callback(hObject, eventdata, handles)
% hObject    handle to PB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting Figure Values to Default Loss Parameters
set(handles.SF,'String','2');
set(handles.LID,'String','2');
set(handles.LS,'String','3');
set(handles.Arraymismat,'String','2');
set(handles.OhmicLoss,'String','3');
set(handles.rho,'String','0.2');
set(handles.INVeff,'String','98');
set(handles.TransLoss,'String','1');
set(handles.Uo,'String','25');
set(handles.U1,'String','6.84');
set(handles.Shading,'String','1');
set(handles.r1,'Value',1);
set(handles.bo,'String','0.05');

set(handles.SF,'Enable','off');
set(handles.LID,'Enable','off');
set(handles.LS,'Enable','off');
set(handles.Arraymismat,'Enable','off');
set(handles.OhmicLoss,'Enable','off');
set(handles.rho,'Enable','off');
set(handles.INVeff,'Enable','off');
set(handles.TransLoss,'Enable','off');
set(handles.Uo,'Enable','off');
set(handles.U1,'Enable','off');
set(handles.Shading,'Enable','off');
set(handles.bo,'Enable','off');
set(handles.PB3,'Enable','off');

% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Option to be able to Edit Default Loss Parameter Values
r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');

if r1==1
    
    set(handles.SF,'String','2');
    set(handles.LID,'String','2');
    set(handles.LS,'String','3');
    set(handles.Arraymismat,'String','2');
    set(handles.OhmicLoss,'String','3');
    set(handles.rho,'String','0.2');
    set(handles.TrackerL,'String','0');
    set(handles.INVeff,'String','98');
    set(handles.TransLoss,'String','1');
    set(handles.Uo,'String','25');
    set(handles.U1,'String','6.84');
    set(handles.Shading,'String','1');
    set(handles.bo,'String','0.05');
    
    set(handles.SF,'Enable','off');
    set(handles.LID,'Enable','off');
    set(handles.LS,'Enable','off');
    set(handles.Arraymismat,'Enable','off');
    set(handles.OhmicLoss,'Enable','off');
    set(handles.rho,'Enable','off');
    set(handles.INVeff,'Enable','off');
    set(handles.TransLoss,'Enable','off');
    set(handles.Uo,'Enable','off');
    set(handles.U1,'Enable','off');
    set(handles.Shading,'Enable','off');
    set(handles.bo,'Enable','off');
    set(handles.PB3,'Enable','off');
    
elseif r2==1
    
    set(handles.SF,'Enable','on');
    set(handles.LID,'Enable','on');
    set(handles.LS,'Enable','on');
    set(handles.Arraymismat,'Enable','on');
    set(handles.OhmicLoss,'Enable','on');
    set(handles.rho,'Enable','on');
    set(handles.INVeff,'Enable','on');
    set(handles.TransLoss,'Enable','on');
    set(handles.Uo,'Enable','on');
    set(handles.U1,'Enable','on');
    set(handles.Shading,'Enable','on');
    set(handles.Shading,'Enable','on');
    set(handles.bo,'Enable','on');
    set(handles.PB3,'Enable','on');
        
 end



function bo_Callback(hObject, eventdata, handles)
% hObject    handle to bo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bo as text
%        str2double(get(hObject,'String')) returns contents of bo as a double


% --- Executes during object creation, after setting all properties.
function bo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TrackerL_Callback(hObject, eventdata, handles)
% hObject    handle to TrackerL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TrackerL as text
%        str2double(get(hObject,'String')) returns contents of TrackerL as a double


% --- Executes during object creation, after setting all properties.
function TrackerL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TrackerL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB3.
function PB3_Callback(hObject, eventdata, handles)
% hObject    handle to PB3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Ohmic Loss GUI

ohmic_loss_figure ;
