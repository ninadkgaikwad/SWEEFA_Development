function varargout = Rainy_Snowy_Months(varargin)
% RAINY_SNOWY_MONTHS MATLAB code for Rainy_Snowy_Months.fig
%      RAINY_SNOWY_MONTHS, by itself, creates a new RAINY_SNOWY_MONTHS or raises the existing
%      singleton*.
%
%      H = RAINY_SNOWY_MONTHS returns the handle to a new RAINY_SNOWY_MONTHS or the handle to
%      the existing singleton*.
%
%      RAINY_SNOWY_MONTHS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RAINY_SNOWY_MONTHS.M with the given input arguments.
%
%      RAINY_SNOWY_MONTHS('Property','Value',...) creates a new RAINY_SNOWY_MONTHS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Rainy_Snowy_Months_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Rainy_Snowy_Months_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Rainy_Snowy_Months

% Last Modified by GUIDE v2.5 20-Sep-2016 15:50:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Rainy_Snowy_Months_OpeningFcn, ...
                   'gui_OutputFcn',  @Rainy_Snowy_Months_OutputFcn, ...
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


% --- Executes just before Rainy_Snowy_Months is made visible.
function Rainy_Snowy_Months_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Rainy_Snowy_Months (see VARARGIN)

% Choose default command line output for Rainy_Snowy_Months
handles.output = hObject;

% Initializing GUI

   set(handles.r1,'Value',1); 
   set(handles.r2,'Value',0); 

   set(handles.yr,'Value',0); 
   set(handles.mr,'Value',0); 
   
   set(handles.YearRain,'String',''); 
   set(handles.MonthRain,'String',''); 
   
    set(handles.jan,'Value',0);
    set(handles.feb,'Value',0);
    set(handles.mar,'Value',0);
    set(handles.apr,'Value',0);
    set(handles.may,'Value',0);
    set(handles.jun,'Value',0);
    set(handles.jul,'Value',0);
    set(handles.aug,'Value',0);
    set(handles.sep,'Value',0);
    set(handles.oct,'Value',0);
    set(handles.nov,'Value',0);
    set(handles.decc,'Value',0);

   set(handles.yr,'Enable','off'); 
   set(handles.mr,'Enable','off');  
   
   set(handles.YearRain,'Enable','off'); 
   set(handles.MonthRain,'Enable','off'); 
   
   set(handles.jan,'Enable','off'); 
   set(handles.feb,'Enable','off'); 
   set(handles.mar,'Enable','off'); 
   set(handles.apr,'Enable','off'); 
   set(handles.may,'Enable','off'); 
   set(handles.jun,'Enable','off'); 
   set(handles.jul,'Enable','off'); 
   set(handles.aug,'Enable','off'); 
   set(handles.sep,'Enable','off'); 
   set(handles.oct,'Enable','off'); 
   set(handles.nov,'Enable','off'); 
   set(handles.decc,'Enable','off'); 

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'Rainy_Snowy_Months',gcf);

% UIWAIT makes Rainy_Snowy_Months wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Rainy_Snowy_Months_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in jul.
function jul_Callback(hObject, eventdata, handles)
% hObject    handle to jul (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of jul


% --- Executes on button press in aug.
function aug_Callback(hObject, eventdata, handles)
% hObject    handle to aug (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of aug


% --- Executes on button press in sep.
function sep_Callback(hObject, eventdata, handles)
% hObject    handle to sep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sep


% --- Executes on button press in oct.
function oct_Callback(hObject, eventdata, handles)
% hObject    handle to oct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of oct


% --- Executes on button press in nov.
function nov_Callback(hObject, eventdata, handles)
% hObject    handle to nov (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of nov


% --- Executes on button press in jan.
function jan_Callback(hObject, eventdata, handles)
% hObject    handle to jan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of jan


% --- Executes on button press in feb.
function feb_Callback(hObject, eventdata, handles)
% hObject    handle to feb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of feb


% --- Executes on button press in mar.
function mar_Callback(hObject, eventdata, handles)
% hObject    handle to mar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mar


% --- Executes on button press in apr.
function apr_Callback(hObject, eventdata, handles)
% hObject    handle to apr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of apr


% --- Executes on button press in may.
function may_Callback(hObject, eventdata, handles)
% hObject    handle to may (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of may


% --- Executes on button press in jun.
function jun_Callback(hObject, eventdata, handles)
% hObject    handle to jun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of jun


% --- Executes on button press in decc.
function decc_Callback(hObject, eventdata, handles)
% hObject    handle to decc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of decc


% --- Executes on button press in PB1.
function PB1_Callback(hObject, eventdata, handles)
% hObject    handle to PB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Putting Check Box Values in Figure Workspace
jan=get(handles.jan,'Value');
feb=get(handles.feb,'Value');
mar=get(handles.mar,'Value');
apr=get(handles.apr,'Value');
may=get(handles.may,'Value');
jun=get(handles.jun,'Value');
jul=get(handles.jul,'Value');
aug=get(handles.aug,'Value');
sep=get(handles.sep,'Value');
oct=get(handles.oct,'Value');
nov=get(handles.nov,'Value');
decc=get(handles.decc,'Value');
RainSnowMonths=[jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,decc];
setappdata(Rainy_Snowy_Months,'RainSnowMonths',RainSnowMonths);

% Putting Radio Button values and Edit Text Box Values in Figure Workspace
yr=get(handles.yr,'Value');
setappdata(Rainy_Snowy_Months,'yr',yr);
mr=get(handles.mr,'Value');
setappdata(Rainy_Snowy_Months,'mr',mr);

NormalClearSky=get(handles.r1,'Value');
setappdata(Rainy_Snowy_Months,'NormalClearSky',NormalClearSky);
ModifiedClearSky=get(handles.r2,'Value');
setappdata(Rainy_Snowy_Months,'ModifiedClearSky',ModifiedClearSky);

YearRain=get(handles.YearRain,'String');
YearRain=str2double(YearRain)
setappdata(Rainy_Snowy_Months,'YearRain',YearRain);
MonthRain=get(handles.MonthRain,'String');
MonthRain=strread(MonthRain,'%f','delimiter',',')
setappdata(Rainy_Snowy_Months,'MonthRain',MonthRain);
% --- Executes on button press in PB2.
function PB2_Callback(hObject, eventdata, handles)
% hObject    handle to PB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting Check Box Values to '0'

   set(handles.r1,'Value',1); 
   set(handles.r2,'Value',0); 

   set(handles.yr,'Value',0); 
   set(handles.mr,'Value',0); 
   
   set(handles.YearRain,'String',''); 
   set(handles.MonthRain,'String',''); 
   
    set(handles.jan,'Value',0);
    set(handles.feb,'Value',0);
    set(handles.mar,'Value',0);
    set(handles.apr,'Value',0);
    set(handles.may,'Value',0);
    set(handles.jun,'Value',0);
    set(handles.jul,'Value',0);
    set(handles.aug,'Value',0);
    set(handles.sep,'Value',0);
    set(handles.oct,'Value',0);
    set(handles.nov,'Value',0);
    set(handles.decc,'Value',0);

   set(handles.yr,'Enable','off'); 
   set(handles.mr,'Enable','off');  
   
   set(handles.YearRain,'Enable','off'); 
   set(handles.MonthRain,'Enable','off'); 
   
   set(handles.jan,'Enable','off'); 
   set(handles.feb,'Enable','off'); 
   set(handles.mar,'Enable','off'); 
   set(handles.apr,'Enable','off'); 
   set(handles.may,'Enable','off'); 
   set(handles.jun,'Enable','off'); 
   set(handles.jul,'Enable','off'); 
   set(handles.aug,'Enable','off'); 
   set(handles.sep,'Enable','off'); 
   set(handles.oct,'Enable','off'); 
   set(handles.nov,'Enable','off'); 
   set(handles.decc,'Enable','off'); 





function YearRain_Callback(hObject, eventdata, handles)
% hObject    handle to YearRain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of YearRain as text
%        str2double(get(hObject,'String')) returns contents of YearRain as a double


% --- Executes during object creation, after setting all properties.
function YearRain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YearRain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MonthRain_Callback(hObject, eventdata, handles)
% hObject    handle to MonthRain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MonthRain as text
%        str2double(get(hObject,'String')) returns contents of MonthRain as a double


% --- Executes during object creation, after setting all properties.
function MonthRain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MonthRain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel3.
function uipanel3_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel3 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Opening Edit Text Box acoording to the Radiobutton Selected
a=get(handles.yr,'Value');
b=get(handles.mr,'Value');

if a==1
    set(handles.YearRain,'Enable','on');
    
    set(handles.MonthRain,'Enable','off');
elseif b==1
    set(handles.MonthRain,'Enable','on');
    
    set(handles.YearRain,'Enable','off');
end
    


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Programming GUI Element Behaviour in accordance with the Radio Button
% Values

r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');

if (r1==1)
    
   set(handles.yr,'Enable','off'); 
   set(handles.mr,'Enable','off');  
   
   set(handles.YearRain,'Enable','off'); 
   set(handles.MonthRain,'Enable','off'); 
   
   set(handles.jan,'Enable','off'); 
   set(handles.feb,'Enable','off'); 
   set(handles.mar,'Enable','off'); 
   set(handles.apr,'Enable','off'); 
   set(handles.may,'Enable','off'); 
   set(handles.jun,'Enable','off'); 
   set(handles.jul,'Enable','off'); 
   set(handles.aug,'Enable','off'); 
   set(handles.sep,'Enable','off'); 
   set(handles.oct,'Enable','off'); 
   set(handles.nov,'Enable','off'); 
   set(handles.decc,'Enable','off');    
   
   
   set(handles.yr,'Value',0); 
   set(handles.mr,'Value',0); 
   
   set(handles.YearRain,'String',''); 
   set(handles.MonthRain,'String',''); 
   
    set(handles.jan,'Value',0);
    set(handles.feb,'Value',0);
    set(handles.mar,'Value',0);
    set(handles.apr,'Value',0);
    set(handles.may,'Value',0);
    set(handles.jun,'Value',0);
    set(handles.jul,'Value',0);
    set(handles.aug,'Value',0);
    set(handles.sep,'Value',0);
    set(handles.oct,'Value',0);
    set(handles.nov,'Value',0);
    set(handles.decc,'Value',0);
   
    
elseif (r2==1)
    
   set(handles.yr,'Enable','on'); 
   set(handles.mr,'Enable','on');  
   
   set(handles.YearRain,'Enable','on'); 
   set(handles.MonthRain,'Enable','on'); 
   
   set(handles.jan,'Enable','on'); 
   set(handles.feb,'Enable','on'); 
   set(handles.mar,'Enable','on'); 
   set(handles.apr,'Enable','on'); 
   set(handles.may,'Enable','on'); 
   set(handles.jun,'Enable','on'); 
   set(handles.jul,'Enable','on'); 
   set(handles.aug,'Enable','on'); 
   set(handles.sep,'Enable','on'); 
   set(handles.oct,'Enable','on'); 
   set(handles.nov,'Enable','on'); 
   set(handles.decc,'Enable','on');      
    
end
