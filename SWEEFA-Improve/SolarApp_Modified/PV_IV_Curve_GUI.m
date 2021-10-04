function varargout = PV_IV_Curve_GUI(varargin)
% PV_IV_CURVE_GUI MATLAB code for PV_IV_Curve_GUI.fig
%      PV_IV_CURVE_GUI, by itself, creates a new PV_IV_CURVE_GUI or raises the existing
%      singleton*.
%
%      H = PV_IV_CURVE_GUI returns the handle to a new PV_IV_CURVE_GUI or the handle to
%      the existing singleton*.
%
%      PV_IV_CURVE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PV_IV_CURVE_GUI.R1 with the given input arguments.
%
%      PV_IV_CURVE_GUI('Property','Value',...) creates a new PV_IV_CURVE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PV_IV_Curve_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PV_IV_Curve_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PV_IV_Curve_GUI

% Last Modified by GUIDE v2.5 25-Oct-2015 16:50:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PV_IV_Curve_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @PV_IV_Curve_GUI_OutputFcn, ...
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


% --- Executes just before PV_IV_Curve_GUI is made visible.
function PV_IV_Curve_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PV_IV_Curve_GUI (see VARARGIN)

% Choose default command line output for PV_IV_Curve_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PV_IV_Curve_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PV_IV_Curve_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BypassDV_Callback(hObject, eventdata, handles)
% hObject    handle to BypassDV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BypassDV as text
%        str2double(get(hObject,'String')) returns contents of BypassDV as a double


% --- Executes during object creation, after setting all properties.
function BypassDV_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BypassDV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CellsPerByD_Callback(hObject, eventdata, handles)
% hObject    handle to CellsPerByD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CellsPerByD as text
%        str2double(get(hObject,'String')) returns contents of CellsPerByD as a double


% --- Executes during object creation, after setting all properties.
function CellsPerByD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CellsPerByD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function shaded_Callback(hObject, eventdata, handles)
% hObject    handle to shaded (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of shaded as text
%        str2double(get(hObject,'String')) returns contents of shaded as a double


% --- Executes during object creation, after setting all properties.
function shaded_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shaded (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function T_Callback(hObject, eventdata, handles)
% hObject    handle to T (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of T as text
%        str2double(get(hObject,'String')) returns contents of T as a double


% --- Executes during object creation, after setting all properties.
function T_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function G_Callback(hObject, eventdata, handles)
% hObject    handle to G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of G as text
%        str2double(get(hObject,'String')) returns contents of G as a double


% --- Executes during object creation, after setting all properties.
function G_CreateFcn(hObject, eventdata, handles)
% hObject    handle to G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Gn_Callback(hObject, eventdata, handles)
% hObject    handle to Gn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Gn as text
%        str2double(get(hObject,'String')) returns contents of Gn as a double


% --- Executes during object creation, after setting all properties.
function Gn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Tn_Callback(hObject, eventdata, handles)
% hObject    handle to Tn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tn as text
%        str2double(get(hObject,'String')) returns contents of Tn as a double


% --- Executes during object creation, after setting all properties.
function Tn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vo_Callback(hObject, eventdata, handles)
% hObject    handle to Vo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Vo as text
%        str2double(get(hObject,'String')) returns contents of Vo as a double


% --- Executes during object creation, after setting all properties.
function Vo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Is_Callback(hObject, eventdata, handles)
% hObject    handle to Is (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Is as text
%        str2double(get(hObject,'String')) returns contents of Is as a double


% --- Executes during object creation, after setting all properties.
function Is_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Is (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vm_Callback(hObject, eventdata, handles)
% hObject    handle to Vm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Vm as text
%        str2double(get(hObject,'String')) returns contents of Vm as a double


% --- Executes during object creation, after setting all properties.
function Vm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Im_Callback(hObject, eventdata, handles)
% hObject    handle to Im (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Im as text
%        str2double(get(hObject,'String')) returns contents of Im as a double


% --- Executes during object creation, after setting all properties.
function Im_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Im (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pm_Callback(hObject, eventdata, handles)
% hObject    handle to Pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pm as text
%        str2double(get(hObject,'String')) returns contents of Pm as a double


% --- Executes during object creation, after setting all properties.
function Pm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pm (see GCBO)
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



function Np_Callback(hObject, eventdata, handles)
% hObject    handle to Np (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Np as text
%        str2double(get(hObject,'String')) returns contents of Np as a double


% --- Executes during object creation, after setting all properties.
function Np_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Np (see GCBO)
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

% Getting Data From GUI
Vo=get(handles.Vo,'String');
Vo=str2double(Vo);
Is=get(handles.Is,'String');
Is=str2double(Is);
Vm=get(handles.Vm,'String');
Vm=str2double(Vm);
Im=get(handles.Im,'String');
Im=str2double(Im);
Pm=get(handles.Pm,'String');
Pm=str2double(Pm);
Ns=get(handles.Ns,'String');
Ns=str2double(Ns);
Np=get(handles.Np,'String');
Np=str2double(Np);
Kv=get(handles.Kv,'String');
Kv=str2double(Kv);
Ki=get(handles.Ki,'String');
Ki=str2double(Ki);

T=get(handles.T,'String');
T=str2double(T);
Tn=get(handles.Tn,'String');
Tn=str2double(Tn);
G=get(handles.G,'String');
G=str2double(G);
Gn=get(handles.Gn,'String');
Gn=str2double(Gn);

%Using Radio Buttons
R1=get(handles.R1,'Value');
R2=get(handles.R2,'Value');

if (R1==1)&&(R2==0)
    CellorMod=1;
elseif (R1==0)&&(R2==1)
    CellorMod=2;
end

%Using Pre-defined Functions
[ V,I,P,Pmax ,V1,I1,P1,Pmaxmn,Vocg,Vocg1,Iog1,Iscn,Vmax,Iog] = PVivCurve(CellorMod,Vo,Is,Vm,Im,Pm,Kv,Ki,2,Ns,Np,Tn,Gn,T,G );

% IV and PV Curve at STC

%Current x Voltage  
axes(handles.G1);
  grid on
  hold on 
  title('I-V curve at STC');
  xlabel('V [V]');
  ylabel('I [A]');
  xlim([0 inf]);
  ylim([0 inf]); 
  %Plots I x V curve
  plot(V1,I1,'LineWidth',2,'Color','r');  
  %Plots the "remarkable points" on the I x V curve
  plot([0 Vocg1 V1(length(V1))],[max(I1) Iog1 0],'o','LineWidth',2,'MarkerSize',5,'Color','k'); 
  hold off;
  %Power x Voltage 
  axes(handles.G2);
  grid on
  hold on  
  title('P-V curve at STC');
  xlabel('V [V]');
  ylabel('P [W]');
  xlim([0 inf])
  ylim([0 inf]);  
  plot(V1,P1,'LineWidth',2,'Color','b');  
  %Plots the "remarkable points" on the power curve
  plot([0 Vocg1 V1(length(V1))],[0 Pmaxmn 0],'o','LineWidth',2,'MarkerSize',5,'Color','k');
  hold off;
  
  % IV and PV Curve at Given Temperature and Insolation

%Current x Voltage  
axes(handles.G3);
  grid on
  hold on 
  title('I-V curve at Given Temperature & Insolation');
  xlabel('V [V]');
  ylabel('I [A]');
  xlim([0 inf]);
  ylim([0 inf]); 
  %Plots I x V curve
  plot(V,I,'LineWidth',2,'Color','k');  
  %Plots the "remarkable points" on the I x V curve
  plot([0 Vmax Vocg],[max(I) Iog 0],'o','LineWidth',2,'MarkerSize',5,'Color','k'); 
  hold off;
  %Power x Voltage 
  axes(handles.G4);
  grid on
  hold on  
  title('P-V curve at given Temperature & Insolation');
  xlabel('V [V]');
  ylabel('P [W]');
  xlim([0 inf])
  ylim([0 inf]);  
  plot(V,P,'LineWidth',2,'Color','k');  
  %Plots the "remarkable points" on the power curve
  plot([0 Vmax Vocg],[0 Pmax 0],'o','LineWidth',2,'MarkerSize',5,'Color','k');
  hold off;
  
  % --- Executes on button press in PB2.
function PB2_Callback(hObject, eventdata, handles)
% hObject    handle to PB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Data From GUI
Vo=get(handles.Vo,'String');
Vo=str2double(Vo);
Is=get(handles.Is,'String');
Is=str2double(Is);
Vm=get(handles.Vm,'String');
Vm=str2double(Vm);
Im=get(handles.Im,'String');
Im=str2double(Im);
Pm=get(handles.Pm,'String');
Pm=str2double(Pm);
Ns=get(handles.Ns,'String');
Ns=str2double(Ns);
Np=get(handles.Np,'String');
Np=str2double(Np);
Kv=get(handles.Kv,'String');
Kv=str2double(Kv);
Ki=get(handles.Ki,'String');
Ki=str2double(Ki);

T=get(handles.T,'String');
T=str2double(T);
Tn=get(handles.Tn,'String');
Tn=str2double(Tn);
G=get(handles.G,'String');
G=str2double(G);
Gn=get(handles.Gn,'String');
Gn=str2double(Gn);

shaded=get(handles.shaded,'String');
shaded=str2double(shaded);
CellsPerByD=get(handles.CellsPerByD,'String');
CellsPerByD=str2double(CellsPerByD);
BypassDV=get(handles.BypassDV,'String');
BypassDV=str2double(BypassDV);

%Using Radio Buttons
R1=get(handles.R1,'Value');
R2=get(handles.R2,'Value');

if (R1==1)&&(R2==0)
    CellorMod=1;
elseif (R1==0)&&(R2==1)
    CellorMod=2;
end

%Using Pre-defined Functions
[VV1,VV2,I,P1,Pmax1,Pmax2,P2,Vocgg,Vocg,Vmax1,Vmax2 ,Imax1,Imax2 ] = PV_IV_Shading  (CellorMod,Vo,Is,Vm,Im,Pm,Kv,Ki,2,Ns,Np,shaded,CellsPerByD,BypassDV,Tn,Gn,T,G );

% IV and PV Curve at given conditions with Shading

%Current x Voltage  
axes(handles.G1);
  grid on
  hold on 
  title('I-V curve at given conditions with Shading');
  xlabel('V [V]');
  ylabel('I [A]');
  xlim([0 inf]);
  ylim([0 inf]); 
  %Plots I x V curve
  plot(VV1,I,'LineWidth',2,'Color','r');  
  %Plots the "remarkable points" on the I x V curve
  plot([0 Vmax1 ],[max(I) Imax1 ],'o','LineWidth',2,'MarkerSize',5,'Color','k');
  hold off;
  %Power x Voltage 
  axes(handles.G2);
  grid on
  hold on  
  title('P-V curve at given conditions with Shading');
  xlabel('V [V]');
  ylabel('P [W]');
  xlim([0 inf])
  ylim([0 inf]);  
  plot(VV1,VV1.*I,'LineWidth',2,'Color','b');  
  %Plots the "remarkable points" on the power curve
  %plot([0 Vmax1],[0 Pmax1 ],'o','LineWidth',2,'MarkerSize',5,'Color','k');
  hold off;

  % IV and PV Curve at Given Conditions without Shading

%Current x Voltage  
axes(handles.G3);
  grid on
  hold on 
  title('I-V curve at given conditions with Bypass Diode');
  xlabel('V [V]');
  ylabel('I [A]');
  xlim([0 inf]);
  ylim([0 inf]); 
  %Plots I x V curve
  plot(VV2,I,'LineWidth',2,'Color','k');  
  %Plots the "remarkable points" on the I x V curve
  %plot([0 Vmax2 ],[max(I) Imax2],'o','LineWidth',2,'MarkerSize',5,'Color','k');
  hold off;
  %Power x Voltage 
  axes(handles.G4);
  grid on
  hold on  
  title('P-V curve at given conditions with Bypass Diode');
  xlabel('V [V]');
  ylabel('P [W]');
  xlim([0 inf])
  ylim([0 inf]);  
  plot(VV2,VV2.*I,'LineWidth',2,'Color','k');  
  %Plots the "remarkable points" on the power curve
  %plot([0 Vmax2 ],[0 Pmax2],'o','LineWidth',2,'MarkerSize',5,'Color','k');
  hold off;




function Kv_Callback(hObject, eventdata, handles)
% hObject    handle to Kv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Kv as text
%        str2double(get(hObject,'String')) returns contents of Kv as a double


% --- Executes during object creation, after setting all properties.
function Kv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Kv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ki_Callback(hObject, eventdata, handles)
% hObject    handle to Ki (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ki as text
%        str2double(get(hObject,'String')) returns contents of Ki as a double


% --- Executes during object creation, after setting all properties.
function Ki_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ki (see GCBO)
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

% Closing GUI

close;


% --- Executes on button press in PB4.
function PB4_Callback(hObject, eventdata, handles)
% hObject    handle to PB4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% set(handles.Vo,'String','');
% set(handles.Is,'String','');
% set(handles.Vm,'String','');
% set(handles.Im,'String','');
% set(handles.Pm,'String','');
% set(handles.Ns,'String','');
% set(handles.Np,'String','');
% set(handles.Kv,'String','');
% set(handles.Ki,'String','');
% 
% set(handles.T,'String','');
% set(handles.Tn,'String','');
% set(handles.G,'String','');
% set(handles.Gn,'String','');
% 
% set(handles.shaded,'String','');
% set(handles.CellsPerByD,'String','');
% set(handles.BypassDV,'String','');

axes(handles.G1); 
cla reset;
axes(handles.G2); 
cla reset;
axes(handles.G3); 
cla reset;
axes(handles.G4); 
cla reset;
