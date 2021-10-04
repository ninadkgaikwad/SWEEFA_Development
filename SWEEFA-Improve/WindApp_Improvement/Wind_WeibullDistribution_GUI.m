function varargout = Wind_WeibullDistribution_GUI(varargin)
% WIND_WEIBULLDISTRIBUTION_GUI MATLAB code for Wind_WeibullDistribution_GUI.fig
%      WIND_WEIBULLDISTRIBUTION_GUI, by itself, creates a new WIND_WEIBULLDISTRIBUTION_GUI or raises the existing
%      singleton*.
%
%      H = WIND_WEIBULLDISTRIBUTION_GUI returns the handle to a new WIND_WEIBULLDISTRIBUTION_GUI or the handle to
%      the existing singleton*.
%
%      WIND_WEIBULLDISTRIBUTION_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WIND_WEIBULLDISTRIBUTION_GUI.M with the given input arguments.
%
%      WIND_WEIBULLDISTRIBUTION_GUI('Property','Value',...) creates a new WIND_WEIBULLDISTRIBUTION_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Wind_WeibullDistribution_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Wind_WeibullDistribution_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Wind_WeibullDistribution_GUI

% Last Modified by GUIDE v2.5 02-Nov-2017 14:22:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Wind_WeibullDistribution_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Wind_WeibullDistribution_GUI_OutputFcn, ...
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


% --- Executes just before Wind_WeibullDistribution_GUI is made visible.
function Wind_WeibullDistribution_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Wind_WeibullDistribution_GUI (see VARARGIN)

% Getting Required GUI Workspace Name
Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

if (isappdata(0,'Wind_GUI_MainPage') && isappdata(Wind_GUI_MainPage,'PlantInfo_DataCell'))
    
    % Getting Data fro Wind_GUI_MainPage Workspace    
    PlantInfo_DataCell=getappdata(Wind_GUI_MainPage,'PlantInfo_DataCell');
    
    % Initializing Weibull Analysis GUI Fields with Data from Plant Info

    WRes=PlantInfo_DataCell{92,2};
    set(handles.WRes,'String',WRes);
    
    k=PlantInfo_DataCell{93,2};
    set(handles.k,'String',k);  
    
    yr=PlantInfo_DataCell{94,2};
    set(handles.yr,'Value',yr);
    
    YrWs=PlantInfo_DataCell{95,2};
    set(handles.YrWs,'String',YrWs);     
    
    YrTemp=PlantInfo_DataCell{96,2};
    set(handles.YrTemp,'String',YrTemp);
    
    mr=PlantInfo_DataCell{97,2};
    set(handles.mr,'Value',mr);  
    
    MrWs=PlantInfo_DataCell{98,2};
    set(handles.MrWs,'String',MrWs);
    
    MrTemp=PlantInfo_DataCell{99,2};
    set(handles.MrTemp,'String',MrTemp);   
    
    % Changing GUI Behaviour according to yr and mr Values
    if (yr==1)
        
        set(handles.MrWs,'Enable','off');
        set(handles.MrTemp,'Enable','off');

        set(handles.YrWs,'Enable','on');
        set(handles.YrTemp,'Enable','on');

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
        
    elseif (mr==1)
        
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
        
        jan=PlantInfo_DataCell{100,2};
        set(handles.jan,'Value',jan);

        feb=PlantInfo_DataCell{101,2};
        set(handles.feb,'Value',feb);  

        mar=PlantInfo_DataCell{102,2};
        set(handles.mar,'Value',mar);

        apr=PlantInfo_DataCell{103,2};
        set(handles.apr,'Value',apr);     

        may=PlantInfo_DataCell{104,2};
        set(handles.may,'Value',may);

        jun=PlantInfo_DataCell{105,2};
        set(handles.jun,'Value',jun);  

        jul=PlantInfo_DataCell{106,2};
        set(handles.jul,'Value',jul);

        aug=PlantInfo_DataCell{107,2};
        set(handles.aug,'Value',aug);  
    
        sep=PlantInfo_DataCell{108,2};
        set(handles.sep,'Value',sep);

        oct=PlantInfo_DataCell{109,2};
        set(handles.oct,'Value',oct);  

        nov=PlantInfo_DataCell{110,2};
        set(handles.nov,'Value',nov);

        decc=PlantInfo_DataCell{111,2};
        set(handles.decc,'Value',decc);        
        
        set(handles.MrWs,'Enable','on');
        set(handles.MrTemp,'Enable','on');

        set(handles.YrWs,'Enable','off');
        set(handles.YrTemp,'Enable','off');
                      
    end    
    
else

    % Initializing the GUI

    set(handles.WRes,'String','');
    set(handles.k,'String','');
    set(handles.YrWs,'String','');
    set(handles.MrWs,'String','');
    set(handles.YrTemp,'String','');
    set(handles.MrTemp,'String','');
    set(handles.WindPower,'String','');
    set(handles.WindEnergy,'String','');
    set(handles.WindTurPower,'String','');
    set(handles.WindTurEnergy,'String','');

    set(handles.yr,'Value',1);
    set(handles.mr,'Value',0);

    set(handles.MrWs,'Enable','off');
    set(handles.MrTemp,'Enable','off');

    set(handles.YrWs,'Enable','on');
    set(handles.YrTemp,'Enable','on');

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

        axes(handles.G1);
        cla reset;    
        axes(handles.G2);
        cla reset;           
    
end

% Choose default command line output for Wind_WeibullDistribution_GUI
handles.output = hObject;



% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'Wind_WeibullDistribution_GUI',gcf);

% Setting-Up Current GUI Workspace name
setappdata(0,'Wind_WeibullDistribution_GUI',gcf);

% UIWAIT makes Wind_WeibullDistribution_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Wind_WeibullDistribution_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to WindPower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WindPower as text
%        str2double(get(hObject,'String')) returns contents of WindPower as a double


% --- Executes during object creation, after setting all properties.
function WindPower_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WindPower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to WindEnergy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WindEnergy as text
%        str2double(get(hObject,'String')) returns contents of WindEnergy as a double


% --- Executes during object creation, after setting all properties.
function WindEnergy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WindEnergy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to WindTurPower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WindTurPower as text
%        str2double(get(hObject,'String')) returns contents of WindTurPower as a double


% --- Executes during object creation, after setting all properties.
function WindTurPower_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WindTurPower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to WindTurEnergy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WindTurEnergy as text
%        str2double(get(hObject,'String')) returns contents of WindTurEnergy as a double


% --- Executes during object creation, after setting all properties.
function WindTurEnergy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WindTurEnergy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function YrWs_Callback(hObject, eventdata, handles)
% hObject    handle to YrWs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of YrWs as text
%        str2double(get(hObject,'String')) returns contents of YrWs as a double


% --- Executes during object creation, after setting all properties.
function YrWs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YrWs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MrWs_Callback(hObject, eventdata, handles)
% hObject    handle to MrWs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MrWs as text
%        str2double(get(hObject,'String')) returns contents of MrWs as a double


% --- Executes during object creation, after setting all properties.
function MrWs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MrWs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function WRes_Callback(hObject, eventdata, handles)
% hObject    handle to WRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WRes as text
%        str2double(get(hObject,'String')) returns contents of WRes as a double


% --- Executes during object creation, after setting all properties.
function WRes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function YrTemp_Callback(hObject, eventdata, handles)
% hObject    handle to YrTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of YrTemp as text
%        str2double(get(hObject,'String')) returns contents of YrTemp as a double


% --- Executes during object creation, after setting all properties.
function YrTemp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YrTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MrTemp_Callback(hObject, eventdata, handles)
% hObject    handle to MrTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MrTemp as text
%        str2double(get(hObject,'String')) returns contents of MrTemp as a double


% --- Executes during object creation, after setting all properties.
function MrTemp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MrTemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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


% --- Executes on button press in jul.
function jul_Callback(hObject, eventdata, handles)
% hObject    handle to jul (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of jul


% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Open Wind Loss Parameters GUI
Wind_Loss_Parameters_GUI;


function k_Callback(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k as text
%        str2double(get(hObject,'String')) returns contents of k as a double


% --- Executes during object creation, after setting all properties.
function k_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Workspace of Wind Main Page GUI

Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

Altitude=getappdata(Wind_GUI_MainPage,'Altitude');
LpYear=getappdata(Wind_GUI_MainPage,'LpYear');
NLpYear=getappdata(Wind_GUI_MainPage,'NLpYear');

% Getting Inputs

WRes=get(handles.WRes,'String');
WRes=str2double(WRes);

k=get(handles.k,'String');
k=str2double(k);

YrWs=get(handles.YrWs,'String');
YrWs=str2double(YrWs);

YrTemp=get(handles.YrTemp,'String');
YrTemp=str2double(YrTemp);

MrWs=get(handles.MrWs,'String');
MrWs = strread(MrWs, '%f', 'delimiter', ',');
MrWs = MrWs';

MrTemp=get(handles.MrTemp,'String');
MrTemp = strread(MrTemp, '%f', 'delimiter', ',');
MrTemp = MrTemp';
       
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

months=[jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,decc];

yr=get(handles.yr,'Value');
mr=get(handles.mr,'Value');

% Using External Function to evaluate Wind Curve
[ v,H,Hhour,Prmc,Ermc,Ptur,Etur,Ecurve ] = WeibullDist_PowerEnergy( yr,mr,WRes,k,YrWs,YrTemp,MrWs,MrTemp,months,Altitude,LpYear,NLpYear );

% Ploting PoweWind Probability Curve Curve:

  axes(handles.G1);
  grid on
  hold on 
  title('Wind Probability Curve');
  xlabel('Wind Speed [m/s]');
  ylabel('Probability');
  xlim([0 inf]);
  ylim([0 inf]); 
  %Plots Cp vs TSR curve
  plot(v,H,'LineWidth',2);  
          

% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Workspace of Wind Main Page GUI

Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

Altitude=getappdata(Wind_GUI_MainPage,'Altitude');
LpYear=getappdata(Wind_GUI_MainPage,'LpYear');
NLpYear=getappdata(Wind_GUI_MainPage,'NLpYear');

% Getting Inputs

WRes=get(handles.WRes,'String');
WRes=str2double(WRes);

k=get(handles.k,'String');
k=str2double(k);

YrWs=get(handles.YrWs,'String');
YrWs=str2double(YrWs);

YrTemp=get(handles.YrTemp,'String');
YrTemp=str2double(YrTemp);

MrWs=get(handles.MrWs,'String');
MrWs = strread(MrWs, '%f', 'delimiter', ',');
MrWs = MrWs';

MrTemp=get(handles.MrTemp,'String');
MrTemp = strread(MrTemp, '%f', 'delimiter', ',');
MrTemp = MrTemp';
       
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

months=[jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,decc];

yr=get(handles.yr,'Value');
mr=get(handles.mr,'Value');

% Using External Function to evaluate Wind Curve
[ v,H,Hhour,Prmc,Ermc,Ptur,Etur,Ecurve ] = WeibullDist_PowerEnergy( yr,mr,WRes,k,YrWs,YrTemp,MrWs,MrTemp,months,Altitude,LpYear,NLpYear );

% Displaying Results
Prmc=num2str(Prmc);
Ermc=num2str(Ermc);
Ptur=num2str(Ptur);
Etur=num2str(Etur);

set(handles.WindPower,'String',Prmc);
set(handles.WindEnergy,'String',Ermc);
set(handles.WindTurPower,'String',Ptur);
set(handles.WindTurEnergy,'String',Etur);

% Ploting Wind Probability Curve Curve:

  axes(handles.G2);
  grid on
  hold on 
  title('Wind Probability and Energy Curve');
  xlabel('Wind Speed [m/s]');
  ylabel('Probability [Hours] & Energy [kWh/m^(2)]');
  xlim([0 inf]);
  ylim([0 inf]); 
  %Plots Cp vs TSR curve
  plot(v,Hhour,'LineWidth',2,'Color','b');  
  
  plot(v,Ecurve,'LineWidth',2,'Color','g');  

% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Computing Weibul Curve

% Getting Workspace of Wind Main Page GUI

Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

Altitude=getappdata(Wind_GUI_MainPage,'Altitude');
LpYear=getappdata(Wind_GUI_MainPage,'LpYear');
NLpYear=getappdata(Wind_GUI_MainPage,'NLpYear');

% Getting Inputs

WRes=get(handles.WRes,'String');
WRes=str2double(WRes);

k=get(handles.k,'String');
k=str2double(k);

YrWs=get(handles.YrWs,'String');
YrWs=str2double(YrWs);

YrTemp=get(handles.YrTemp,'String');
YrTemp=str2double(YrTemp);

MrWs=get(handles.MrWs,'String');
MrWs = strread(MrWs, '%f', 'delimiter', ',');
MrWs = MrWs';

MrTemp=get(handles.MrTemp,'String');
MrTemp = strread(MrTemp, '%f', 'delimiter', ',');
MrTemp = MrTemp';
       
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

months=[jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,decc];

yr=get(handles.yr,'Value');
mr=get(handles.mr,'Value');

% Using External Function to evaluate Wind Curve
[ v,H,Hhour,Prmc,Ermc,Ptur,Etur,Ecurve,DenNew ] = WeibullDist_PowerEnergy( yr,mr,WRes,k,YrWs,YrTemp,MrWs,MrTemp,months,Altitude,LpYear,NLpYear );

% Getting WorkSpaces of Wind App GUI's

Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');

Wind_GUI_1=getappdata(0,'Wind_GUI_1');

Wind_Loss_Parameters_GUI=getappdata(0,'Wind_Loss_Parameters_GUI');

% Getting Data from Wind_GUI_1
AllParameters=getappdata(Wind_GUI_1,'AllParameters');

% Getting Data from Wind_GUI_MainPage

Altitude=getappdata(Wind_GUI_MainPage,'Altitude');


% Combining All User Input from Wind_GUI_MainPage in a Single Cell

SimParameters={Altitude,v,Hhour,DenNew,WRes};

% Getting Data from Wind_Loss_Parameters_GUI

WindLossParameters=getappdata(Wind_Loss_Parameters_GUI,'WindLossParameters');

% Using External Function for Energy Estimation of the Wind Power Plant

[EnergyParameters_T1,EnergyParameters_T2,EnergyParameters_T3,EnergyParameters_T4] = WTGRayEnergySimulation( SimParameters,AllParameters,WindLossParameters );




% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting the GUI 

set(handles.WRes,'String','');
set(handles.k,'String','');
set(handles.YrWs,'String','');
set(handles.MrWs,'String','');
set(handles.YrTemp,'String','');
set(handles.MrTemp,'String','');
set(handles.WindPower,'String','');
set(handles.WindEnergy,'String','');
set(handles.WindTurPower,'String','');
set(handles.WindTurEnergy,'String','');

set(handles.yr,'Value',1);
set(handles.mr,'Value',0);

set(handles.MrWs,'Enable','off');
set(handles.MrTemp,'Enable','off');

set(handles.YrWs,'Enable','on');
set(handles.YrTemp,'Enable','on');

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

    axes(handles.G1);
    cla reset;    
    axes(handles.G2);
    cla reset;

% --- Executes on button press in b6.
function b6_Callback(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Close Current GUI
hf1=findobj('Name','Wind_Loss_Parameters_GUI');
close(hf1);

hf2=findobj('Name','Wake_Model_GUI');
close(hf2);

close;


% --- Executes when selected object is changed in uipanel4.
function uipanel4_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel4 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Getting Radio Button Value

yr=get(handles.yr,'Value');
mr=get(handles.mr,'Value');

% Programming behaviour of GUI Elments according to Radio Button Values

if (yr==1)
    
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

    set(handles.MrWs,'Enable','off');
    set(handles.MrTemp,'Enable','off');
    
    set(handles.YrWs,'Enable','on');
    set(handles.YrTemp,'Enable','on');
    
elseif(mr==1)
    
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

    set(handles.MrWs,'Enable','on');
    set(handles.MrTemp,'Enable','on');
    
    set(handles.YrWs,'Enable','off');
    set(handles.YrTemp,'Enable','off');    
    
end


% --- Executes on button press in b7.
function b7_Callback(hObject, eventdata, handles)
% hObject    handle to b7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI Workspace

Wind_WeibullDistribution_GUI=getappdata(0,'Wind_WeibullDistribution_GUI');

% Getting the User Defined Data from Current GUI

WRes=get(handles.WRes,'String');

k=get(handles.k,'String');

YrWs=get(handles.YrWs,'String');

YrTemp=get(handles.YrTemp,'String');

MrWs=get(handles.MrWs,'String');

MrTemp=get(handles.MrTemp,'String');
       
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

months=[jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,decc];

yr=get(handles.yr,'Value');
mr=get(handles.mr,'Value');

% Creating Weibull User Data Cell Array

Weibull_Parameters={WRes, k, YrWs, YrTemp, MrWs, MrTemp, months, yr, mr};

% Putting Weibull_Parameters in the Current GUI Workspace

setappdata(Wind_WeibullDistribution_GUI,'Weibull_Parameters',Weibull_Parameters);
