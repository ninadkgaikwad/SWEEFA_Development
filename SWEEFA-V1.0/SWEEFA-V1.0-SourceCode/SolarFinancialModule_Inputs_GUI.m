function varargout = SolarFinancialModule_Inputs_GUI(varargin)
% SOLARFINANCIALMODULE_INPUTS_GUI MATLAB code for SolarFinancialModule_Inputs_GUI.fig
%      SOLARFINANCIALMODULE_INPUTS_GUI, by itself, creates a new SOLARFINANCIALMODULE_INPUTS_GUI or raises the existing
%      singleton*.
%
%      H = SOLARFINANCIALMODULE_INPUTS_GUI returns the handle to a new SOLARFINANCIALMODULE_INPUTS_GUI or the handle to
%      the existing singleton*.
%
%      SOLARFINANCIALMODULE_INPUTS_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOLARFINANCIALMODULE_INPUTS_GUI.M with the given input arguments.
%
%      SOLARFINANCIALMODULE_INPUTS_GUI('Property','Value',...) creates a new SOLARFINANCIALMODULE_INPUTS_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SolarFinancialModule_Inputs_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SolarFinancialModule_Inputs_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SolarFinancialModule_Inputs_GUI

% Last Modified by GUIDE v2.5 07-Dec-2016 11:46:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SolarFinancialModule_Inputs_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SolarFinancialModule_Inputs_GUI_OutputFcn, ...
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


% --- Executes just before SolarFinancialModule_Inputs_GUI is made visible.
function SolarFinancialModule_Inputs_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SolarFinancialModule_Inputs_GUI (see VARARGIN)

% Initializing the GUI

set(handles.PlantCapacity,'String','70');
set(handles.UnitEPCCost,'String','5.96');
set(handles.LandRequirement,'String','5');
set(handles.LandCost,'String','5.55');
set(handles.UnitOtherCosts_Percent,'String','2');
set(handles.FeedInTariff,'String','5');

set(handles.UnitLandCost,'String','');
set(handles.UnitOtherCosts,'String','');
set(handles.UnitDevelopmentCost,'String','');
set(handles.TotalProjectCost,'String','');

set(handles.OM_Cost_Percent,'String','0.1');
set(handles.OM_Escalation_Percent,'String','5.5');

set(handles.CUF_Percent,'String','20.1');
set(handles.AnnualPerformance_Percent,'String','1');
set(handles.AuxConsp_Percent,'String','0.1');
set(handles.ProjectLife,'String','25');

set(handles.DebtFraction_Percent,'String','80');
set(handles.LoanTenure,'String','12');
set(handles.MoratoriumPeriod,'String','4');
set(handles.Int_Loan_ROI_Percent,'String','10');
set(handles.InsuranceCost_Percent,'String','0.35');

set(handles.OM_NumMonths,'String','1');
set(handles.EnergyCharges_NumMonths,'String','2');
set(handles.OM_Spares_Percent,'String','15');
set(handles.WC_Int_Percent,'String','10.5');

set(handles.SL,'Value',1);
set(handles.AD,'Value',0);

set(handles.FirstYearSegment,'String','12');
set(handles.FirstYearSegment_ROI_Percent,'String','5.83');
set(handles.NextYearSegment,'String','13');
set(handles.NextYearSegment_ROI_Percent,'String','1.54');
set(handles.AD_ROI_Percent,'String','80');
set(handles.CorporateTax_ROI_Percent,'String','35');
set(handles.MinAlternateTax_ROI_Percent,'String','21');
set(handles.AD_Years,'String','5');
set(handles.DiscountForCalculation_Percent,'String','10');

set(handles.FirstYearSegment,'Enable','on');
set(handles.FirstYearSegment_ROI_Percent,'Enable','on');
set(handles.NextYearSegment,'Enable','on');
set(handles.NextYearSegment_ROI_Percent,'Enable','on');

set(handles.AD_ROI_Percent,'Enable','off');
set(handles.CorporateTax_ROI_Percent,'Enable','on');
set(handles.MinAlternateTax_ROI_Percent,'Enable','on');
set(handles.AD_Years,'Enable','on');

set(handles.DiscountForCalculation_Percent,'Enable','on');

% Choose default command line output for SolarFinancialModule_Inputs_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'SolarFinancialModule_Inputs_GUI',gcf);

% UIWAIT makes SolarFinancialModule_Inputs_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SolarFinancialModule_Inputs_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b4.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in b4.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing the GUI Application
close;

% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting the GUI

set(handles.PlantCapacity,'String','70');
set(handles.UnitEPCCost,'String','5.96');
set(handles.LandRequirement,'String','5');
set(handles.LandCost,'String','5.55');
set(handles.UnitOtherCosts_Percent,'String','2');
set(handles.FeedInTariff,'String','5');

set(handles.UnitLandCost,'String','');
set(handles.UnitOtherCosts,'String','');
set(handles.UnitDevelopmentCost,'String','');
set(handles.TotalProjectCost,'String','');

set(handles.OM_Cost_Percent,'String','0.1');
set(handles.OM_Escalation_Percent,'String','5.5');

set(handles.CUF_Percent,'String','20.1');
set(handles.AnnualPerformance_Percent,'String','1');
set(handles.AuxConsp_Percent,'String','0.1');
set(handles.ProjectLife,'String','25');

set(handles.DebtFraction_Percent,'String','80');
set(handles.LoanTenure,'String','12');
set(handles.MoratoriumPeriod,'String','4');
set(handles.Int_Loan_ROI_Percent,'String','10');
set(handles.InsuranceCost_Percent,'String','0.35');

set(handles.OM_NumMonths,'String','1');
set(handles.EnergyCharges_NumMonths,'String','2');
set(handles.OM_Spares_Percent,'String','15');
set(handles.WC_Int_Percent,'String','10.5');

set(handles.SL,'Value',1);
set(handles.AD,'Value',0);

set(handles.FirstYearSegment,'String','12');
set(handles.FirstYearSegment_ROI_Percent,'String','5.83');
set(handles.NextYearSegment,'String','13');
set(handles.NextYearSegment_ROI_Percent,'String','1.54');
set(handles.AD_ROI_Percent,'String','80');
set(handles.CorporateTax_ROI_Percent,'String','35');
set(handles.MinAlternateTax_ROI_Percent,'String','21');
set(handles.AD_Years,'String','5');
set(handles.DiscountForCalculation_Percent,'String','10');

set(handles.FirstYearSegment,'Enable','on');
set(handles.FirstYearSegment_ROI_Percent,'Enable','on');
set(handles.NextYearSegment,'Enable','on');
set(handles.NextYearSegment_ROI_Percent,'Enable','on');

set(handles.AD_ROI_Percent,'Enable','off');
set(handles.CorporateTax_ROI_Percent,'Enable','on');
set(handles.MinAlternateTax_ROI_Percent,'Enable','on');
set(handles.AD_Years,'Enable','on');

set(handles.DiscountForCalculation_Percent,'Enable','on');

function PlantCapacity_Callback(hObject, eventdata, handles)
% hObject    handle to PlantCapacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PlantCapacity as text
%        str2double(get(hObject,'String')) returns contents of PlantCapacity as a double


% --- Executes during object creation, after setting all properties.
function PlantCapacity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PlantCapacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LandRequirement_Callback(hObject, eventdata, handles)
% hObject    handle to LandRequirement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LandRequirement as text
%        str2double(get(hObject,'String')) returns contents of LandRequirement as a double


% --- Executes during object creation, after setting all properties.
function LandRequirement_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LandRequirement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function UnitOtherCosts_Percent_Callback(hObject, eventdata, handles)
% hObject    handle to UnitOtherCosts_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of UnitOtherCosts_Percent as text
%        str2double(get(hObject,'String')) returns contents of UnitOtherCosts_Percent as a double


% --- Executes during object creation, after setting all properties.
function UnitOtherCosts_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to UnitOtherCosts_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function UnitEPCCost_Callback(hObject, eventdata, handles)
% hObject    handle to UnitEPCCost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of UnitEPCCost as text
%        str2double(get(hObject,'String')) returns contents of UnitEPCCost as a double


% --- Executes during object creation, after setting all properties.
function UnitEPCCost_CreateFcn(hObject, eventdata, handles)
% hObject    handle to UnitEPCCost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FeedInTariff_Callback(hObject, eventdata, handles)
% hObject    handle to FeedInTariff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FeedInTariff as text
%        str2double(get(hObject,'String')) returns contents of FeedInTariff as a double


% --- Executes during object creation, after setting all properties.
function FeedInTariff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FeedInTariff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function UnitLandCost_Callback(hObject, eventdata, handles)
% hObject    handle to UnitLandCost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of UnitLandCost as text
%        str2double(get(hObject,'String')) returns contents of UnitLandCost as a double


% --- Executes during object creation, after setting all properties.
function UnitLandCost_CreateFcn(hObject, eventdata, handles)
% hObject    handle to UnitLandCost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function UnitDevelopmentCost_Callback(hObject, eventdata, handles)
% hObject    handle to UnitDevelopmentCost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of UnitDevelopmentCost as text
%        str2double(get(hObject,'String')) returns contents of UnitDevelopmentCost as a double


% --- Executes during object creation, after setting all properties.
function UnitDevelopmentCost_CreateFcn(hObject, eventdata, handles)
% hObject    handle to UnitDevelopmentCost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function UnitOtherCosts_Callback(hObject, eventdata, handles)
% hObject    handle to UnitOtherCosts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of UnitOtherCosts as text
%        str2double(get(hObject,'String')) returns contents of UnitOtherCosts as a double


% --- Executes during object creation, after setting all properties.
function UnitOtherCosts_CreateFcn(hObject, eventdata, handles)
% hObject    handle to UnitOtherCosts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TotalProjectCost_Callback(hObject, eventdata, handles)
% hObject    handle to TotalProjectCost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TotalProjectCost as text
%        str2double(get(hObject,'String')) returns contents of TotalProjectCost as a double


% --- Executes during object creation, after setting all properties.
function TotalProjectCost_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TotalProjectCost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get Current Window Wakspace Name

SolarFinancialModule_Inputs_GUI=getappdata(0,'SolarFinancialModule_Inputs_GUI');

% Getting User Plant Info Data  for Cost Computations

PlantCapacity=get(handles.PlantCapacity,'String');
PlantCapacity=str2double(PlantCapacity);

UnitEPCCost=get(handles.UnitEPCCost,'String');
UnitEPCCost=str2double(UnitEPCCost);

LandRequirement=get(handles.LandRequirement,'String');
LandRequirement=str2double(LandRequirement);

LandCost=get(handles.LandCost,'String');
LandCost=str2double(LandCost);

UnitOtherCosts_Percent=get(handles.UnitOtherCosts_Percent,'String');
UnitOtherCosts_Percent=str2double(UnitOtherCosts_Percent);

% Computing Project Costs and setting them to Current GUI Workspace

UnitLandCost=LandCost*LandRequirement*(1/100);
setappdata(SolarFinancialModule_Inputs_GUI,'UnitLandCost',UnitLandCost);

UnitOtherCosts=UnitEPCCost*UnitOtherCosts_Percent*(1/100);
setappdata(SolarFinancialModule_Inputs_GUI,'UnitOtherCosts',UnitOtherCosts);

UnitDevelopmentCost=UnitEPCCost+UnitLandCost+UnitOtherCosts;
setappdata(SolarFinancialModule_Inputs_GUI,'UnitDevelopmentCost',UnitDevelopmentCost);

TotalProjectCost=UnitDevelopmentCost*PlantCapacity;
setappdata(SolarFinancialModule_Inputs_GUI,'TotalProjectCost',TotalProjectCost);

% Sending Computed Cost Values to Current GUI for Display

UnitLandCost=num2str(UnitLandCost);
set(handles.UnitLandCost,'String',UnitLandCost);

UnitOtherCosts=num2str(UnitOtherCosts);
set(handles.UnitOtherCosts,'String',UnitOtherCosts);

UnitDevelopmentCost=num2str(UnitDevelopmentCost);
set(handles.UnitDevelopmentCost,'String',UnitDevelopmentCost);

TotalProjectCost=num2str(TotalProjectCost);
set(handles.TotalProjectCost,'String',TotalProjectCost);

function OM_NumMonths_Callback(hObject, eventdata, handles)
% hObject    handle to OM_NumMonths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OM_NumMonths as text
%        str2double(get(hObject,'String')) returns contents of OM_NumMonths as a double


% --- Executes during object creation, after setting all properties.
function OM_NumMonths_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OM_NumMonths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OM_Spares_Percent_Callback(hObject, eventdata, handles)
% hObject    handle to OM_Spares_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OM_Spares_Percent as text
%        str2double(get(hObject,'String')) returns contents of OM_Spares_Percent as a double


% --- Executes during object creation, after setting all properties.
function OM_Spares_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OM_Spares_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EnergyCharges_NumMonths_Callback(hObject, eventdata, handles)
% hObject    handle to EnergyCharges_NumMonths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EnergyCharges_NumMonths as text
%        str2double(get(hObject,'String')) returns contents of EnergyCharges_NumMonths as a double


% --- Executes during object creation, after setting all properties.
function EnergyCharges_NumMonths_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EnergyCharges_NumMonths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function WC_Int_Percent_Callback(hObject, eventdata, handles)
% hObject    handle to WC_Int_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WC_Int_Percent as text
%        str2double(get(hObject,'String')) returns contents of WC_Int_Percent as a double


% --- Executes during object creation, after setting all properties.
function WC_Int_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WC_Int_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DebtFraction_Percent_Callback(hObject, eventdata, handles)
% hObject    handle to DebtFraction_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DebtFraction_Percent as text
%        str2double(get(hObject,'String')) returns contents of DebtFraction_Percent as a double


% --- Executes during object creation, after setting all properties.
function DebtFraction_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DebtFraction_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MoratoriumPeriod_Callback(hObject, eventdata, handles)
% hObject    handle to MoratoriumPeriod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MoratoriumPeriod as text
%        str2double(get(hObject,'String')) returns contents of MoratoriumPeriod as a double


% --- Executes during object creation, after setting all properties.
function MoratoriumPeriod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MoratoriumPeriod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Int_Loan_ROI_Percent_Callback(~, eventdata, handles)
% hObject    handle to Int_Loan_ROI_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Int_Loan_ROI_Percent as text
%        str2double(get(hObject,'String')) returns contents of Int_Loan_ROI_Percent as a double


% --- Executes during object creation, after setting all properties.
function Int_Loan_ROI_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Int_Loan_ROI_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LoanTenure_Callback(hObject, eventdata, handles)
% hObject    handle to LoanTenure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LoanTenure as text
%        str2double(get(hObject,'String')) returns contents of LoanTenure as a double


% --- Executes during object creation, after setting all properties.
function LoanTenure_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LoanTenure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function InsuranceCost_Percent_Callback(hObject, eventdata, handles)
% hObject    handle to InsuranceCost_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InsuranceCost_Percent as text
%        str2double(get(hObject,'String')) returns contents of InsuranceCost_Percent as a double


% --- Executes during object creation, after setting all properties.
function InsuranceCost_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InsuranceCost_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FirstYearSegment_Callback(hObject, eventdata, handles)
% hObject    handle to FirstYearSegment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FirstYearSegment as text
%        str2double(get(hObject,'String')) returns contents of FirstYearSegment as a double


% --- Executes during object creation, after setting all properties.
function FirstYearSegment_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FirstYearSegment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NextYearSegment_Callback(hObject, eventdata, handles)
% hObject    handle to NextYearSegment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NextYearSegment as text
%        str2double(get(hObject,'String')) returns contents of NextYearSegment as a double


% --- Executes during object creation, after setting all properties.
function NextYearSegment_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NextYearSegment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NextYearSegment_ROI_Percent_Callback(hObject, eventdata, handles)
% hObject    handle to NextYearSegment_ROI_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NextYearSegment_ROI_Percent as text
%        str2double(get(hObject,'String')) returns contents of NextYearSegment_ROI_Percent as a double


% --- Executes during object creation, after setting all properties.
function NextYearSegment_ROI_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NextYearSegment_ROI_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FirstYearSegment_ROI_Percent_Callback(hObject, eventdata, handles)
% hObject    handle to FirstYearSegment_ROI_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FirstYearSegment_ROI_Percent as text
%        str2double(get(hObject,'String')) returns contents of FirstYearSegment_ROI_Percent as a double


% --- Executes during object creation, after setting all properties.
function FirstYearSegment_ROI_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FirstYearSegment_ROI_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AD_ROI_Percent_Callback(hObject, eventdata, handles)
% hObject    handle to AD_ROI_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AD_ROI_Percent as text
%        str2double(get(hObject,'String')) returns contents of AD_ROI_Percent as a double


% --- Executes during object creation, after setting all properties.
function AD_ROI_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD_ROI_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MinAlternateTax_ROI_Percent_Callback(hObject, eventdata, handles)
% hObject    handle to MinAlternateTax_ROI_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MinAlternateTax_ROI_Percent as text
%        str2double(get(hObject,'String')) returns contents of MinAlternateTax_ROI_Percent as a double


% --- Executes during object creation, after setting all properties.
function MinAlternateTax_ROI_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MinAlternateTax_ROI_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AD_Years_Callback(hObject, eventdata, handles)
% hObject    handle to AD_Years (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AD_Years as text
%        str2double(get(hObject,'String')) returns contents of AD_Years as a double


% --- Executes during object creation, after setting all properties.
function AD_Years_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD_Years (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CorporateTax_ROI_Percent_Callback(hObject, eventdata, handles)
% hObject    handle to CorporateTax_ROI_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CorporateTax_ROI_Percent as text
%        str2double(get(hObject,'String')) returns contents of CorporateTax_ROI_Percent as a double


% --- Executes during object creation, after setting all properties.
function CorporateTax_ROI_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CorporateTax_ROI_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DiscountForCalculation_Percent_Callback(hObject, eventdata, handles)
% hObject    handle to DiscountForCalculation_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DiscountForCalculation_Percent as text
%        str2double(get(hObject,'String')) returns contents of DiscountForCalculation_Percent as a double


% --- Executes during object creation, after setting all properties.
function DiscountForCalculation_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DiscountForCalculation_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OM_Cost_Percent_Callback(hObject, eventdata, handles)
% hObject    handle to OM_Cost_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OM_Cost_Percent as text
%        str2double(get(hObject,'String')) returns contents of OM_Cost_Percent as a double


% --- Executes during object creation, after setting all properties.
function OM_Cost_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OM_Cost_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OM_Escalation_Percent_Callback(hObject, eventdata, handles)
% hObject    handle to OM_Escalation_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OM_Escalation_Percent as text
%        str2double(get(hObject,'String')) returns contents of OM_Escalation_Percent as a double


% --- Executes during object creation, after setting all properties.
function OM_Escalation_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OM_Escalation_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CUF_Percent_Callback(hObject, eventdata, handles)
% hObject    handle to CUF_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CUF_Percent as text
%        str2double(get(hObject,'String')) returns contents of CUF_Percent as a double


% --- Executes during object creation, after setting all properties.
function CUF_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CUF_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AuxConsp_Percent_Callback(hObject, eventdata, handles)
% hObject    handle to AuxConsp_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AuxConsp_Percent as text
%        str2double(get(hObject,'String')) returns contents of AuxConsp_Percent as a double


% --- Executes during object creation, after setting all properties.
function AuxConsp_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AuxConsp_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ProjectLife_Callback(hObject, eventdata, handles)
% hObject    handle to ProjectLife (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ProjectLife as text
%        str2double(get(hObject,'String')) returns contents of ProjectLife as a double


% --- Executes during object creation, after setting all properties.
function ProjectLife_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ProjectLife (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AnnualPerformance_Percent_Callback(hObject, eventdata, handles)
% hObject    handle to AnnualPerformance_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AnnualPerformance_Percent as text
%        str2double(get(hObject,'String')) returns contents of AnnualPerformance_Percent as a double


% --- Executes during object creation, after setting all properties.
function AnnualPerformance_Percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AnnualPerformance_Percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LandCost_Callback(hObject, eventdata, handles)
% hObject    handle to LandCost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LandCost as text
%        str2double(get(hObject,'String')) returns contents of LandCost as a double


% --- Executes during object creation, after setting all properties.
function LandCost_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LandCost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit52_Callback(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit52 as text
%        str2double(get(hObject,'String')) returns contents of edit52 as a double


% --- Executes during object creation, after setting all properties.
function edit52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel9.
function uipanel9_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel9 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Getting Radio Button Values

SL=get(handles.SL,'Value');
AD=get(handles.AD,'Value');

% Using Radio Button Values to Modify GUI Element Behaviour

if (SL==1)
    
    set(handles.FirstYearSegment,'Enable','on');
    set(handles.FirstYearSegment_ROI_Percent,'Enable','on');
    set(handles.NextYearSegment,'Enable','on');
    set(handles.NextYearSegment_ROI_Percent,'Enable','on');

    set(handles.AD_ROI_Percent,'Enable','off');
    set(handles.CorporateTax_ROI_Percent,'Enable','on');
    set(handles.MinAlternateTax_ROI_Percent,'Enable','on');
    set(handles.AD_Years,'Enable','on');

    set(handles.DiscountForCalculation_Percent,'Enable','on');    
    
elseif (AD==1)
    
    set(handles.FirstYearSegment,'Enable','off');
    set(handles.FirstYearSegment_ROI_Percent,'Enable','off');
    set(handles.NextYearSegment,'Enable','off');
    set(handles.NextYearSegment_ROI_Percent,'Enable','off');

    set(handles.AD_ROI_Percent,'Enable','on');
    set(handles.CorporateTax_ROI_Percent,'Enable','on');
    set(handles.MinAlternateTax_ROI_Percent,'Enable','on');
    set(handles.AD_Years,'Enable','on');

    set(handles.DiscountForCalculation_Percent,'Enable','on');    
    
end


% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI Workspace Name

SolarFinancialModule_Inputs_GUI=getappdata(0,'SolarFinancialModule_Inputs_GUI');

% Financial Model Computation

% Getting All User Defined Data

% Plant Info
PlantCapacity=get(handles.PlantCapacity,'String');
PlantCapacity=str2double(PlantCapacity);

UnitEPCCost=get(handles.UnitEPCCost,'String');
UnitEPCCost=str2double(UnitEPCCost);

LandRequirement=get(handles.LandRequirement,'String');
LandRequirement=str2double(LandRequirement);

LandCost=get(handles.LandCost,'String');
LandCost=str2double(LandCost);

UnitOtherCosts_Percent=get(handles.UnitOtherCosts_Percent,'String');
UnitOtherCosts_Percent=str2double(UnitOtherCosts_Percent);

FeedInTariff=get(handles.FeedInTariff,'String');
FeedInTariff=str2double(FeedInTariff);


% Creating a List of Connected Parameters
PlantInfo=[PlantCapacity,UnitEPCCost,LandRequirement,LandCost,UnitOtherCosts_Percent,FeedInTariff];


% Project Cost Computations (From Current GUI Workspace)
UnitLandCost=getappdata(SolarFinancialModule_Inputs_GUI,'UnitLandCost');

UnitOtherCosts=getappdata(SolarFinancialModule_Inputs_GUI,'UnitOtherCosts');

UnitDevelopmentCost=getappdata(SolarFinancialModule_Inputs_GUI,'UnitDevelopmentCost');

TotalProjectCost=getappdata(SolarFinancialModule_Inputs_GUI,'TotalProjectCost');


% Creating a List of Connected Parameters
ProjectCostComputations=[UnitLandCost,UnitOtherCosts,UnitDevelopmentCost,TotalProjectCost];


% Operation & Maintenance Info
OM_Cost_Percent=get(handles.OM_Cost_Percent,'String');
OM_Cost_Percent=str2double(OM_Cost_Percent);

OM_Escalation_Percent=get(handles.OM_Escalation_Percent,'String');
OM_Escalation_Percent=str2double(OM_Escalation_Percent);


% Creating a List of Connected Parameters
OperationAndMaintenanceInfo=[OM_Cost_Percent,OM_Escalation_Percent];


% Plant Performance Parameters
CUF_Percent=get(handles.CUF_Percent,'String');
CUF_Percent=str2double(CUF_Percent);

AnnualPerformance_Percent=get(handles.AnnualPerformance_Percent,'String');
AnnualPerformance_Percent=str2double(AnnualPerformance_Percent);

AuxConsp_Percent=get(handles.AuxConsp_Percent,'String');
AuxConsp_Percent=str2double(AuxConsp_Percent);

ProjectLife=get(handles.ProjectLife,'String');
ProjectLife=str2double(ProjectLife);


% Creating a List of Connected Parameters
PlantPerformanceParamters=[CUF_Percent,AnnualPerformance_Percent,AuxConsp_Percent,ProjectLife];


% Loan And Insurance Parameters
DebtFraction_Percent=get(handles.DebtFraction_Percent,'String');
DebtFraction_Percent=str2double(DebtFraction_Percent);

LoanTenure=get(handles.LoanTenure,'String');
LoanTenure=str2double(LoanTenure);

MoratoriumPeriod=get(handles.MoratoriumPeriod,'String');
MoratoriumPeriod=str2double(MoratoriumPeriod);

Int_Loan_ROI_Percent=get(handles.Int_Loan_ROI_Percent,'String');
Int_Loan_ROI_Percent=str2double(Int_Loan_ROI_Percent);

InsuranceCost_Percent=get(handles.InsuranceCost_Percent,'String');
InsuranceCost_Percent=str2double(InsuranceCost_Percent);


% Creating a List of Connected Parameters
LoanAndInsuranceParameters=[DebtFraction_Percent,LoanTenure,MoratoriumPeriod,Int_Loan_ROI_Percent,InsuranceCost_Percent];


% Working Capital Parameters
OM_NumMonths=get(handles.OM_NumMonths,'String');
OM_NumMonths=str2double(OM_NumMonths);

EnergyCharges_NumMonths=get(handles.EnergyCharges_NumMonths,'String');
EnergyCharges_NumMonths=str2double(EnergyCharges_NumMonths);

OM_Spares_Percent=get(handles.OM_Spares_Percent,'String');
OM_Spares_Percent=str2double(OM_Spares_Percent);

WC_Int_Percent=get(handles.WC_Int_Percent,'String');
WC_Int_Percent=str2double(WC_Int_Percent);


% Creating a List of Connected Parameters
WorkingCapitalParameters=[OM_NumMonths,EnergyCharges_NumMonths,OM_Spares_Percent,WC_Int_Percent];


% Depreciation Info
SL=get(handles.SL,'Value');

AD=get(handles.AD,'Value');

if (SL==1)
    
    FirstYearSegment=get(handles.FirstYearSegment,'String');
    FirstYearSegment=str2double(FirstYearSegment);

    FirstYearSegment_ROI_Percent=get(handles.FirstYearSegment_ROI_Percent,'String');
    FirstYearSegment_ROI_Percent=str2double(FirstYearSegment_ROI_Percent);

    NextYearSegment=get(handles.NextYearSegment,'String');
    NextYearSegment=str2double(NextYearSegment);

    NextYearSegment_ROI_Percent=get(handles.NextYearSegment_ROI_Percent,'String');
    NextYearSegment_ROI_Percent=str2double(NextYearSegment_ROI_Percent);
    
    AD_ROI_Percent=0;
    
    CorporateTax_ROI_Percent=get(handles.CorporateTax_ROI_Percent,'String');
    CorporateTax_ROI_Percent=str2double(CorporateTax_ROI_Percent);
    
    MinAlternateTax_ROI_Percent=get(handles.MinAlternateTax_ROI_Percent,'String');
    MinAlternateTax_ROI_Percent=str2double(MinAlternateTax_ROI_Percent);

    AD_Years=get(handles.AD_Years,'String');
    AD_Years=str2double(AD_Years);  
    
    AD_Years=get(handles.AD_Years,'String');
    AD_Years=str2double(AD_Years); 
    
elseif (AD==1)
    
    AD_ROI_Percent=get(handles.AD_ROI_Percent,'String');
    AD_ROI_Percent=str2double(AD_ROI_Percent);

    CorporateTax_ROI_Percent=get(handles.CorporateTax_ROI_Percent,'String');
    CorporateTax_ROI_Percent=str2double(CorporateTax_ROI_Percent);

    MinAlternateTax_ROI_Percent=get(handles.MinAlternateTax_ROI_Percent,'String');
    MinAlternateTax_ROI_Percent=str2double(MinAlternateTax_ROI_Percent);

    AD_Years=get(handles.AD_Years,'String');
    AD_Years=str2double(AD_Years);  
    
    FirstYearSegment=0;
    
    FirstYearSegment_ROI_Percent=0;
    
    NextYearSegment=0;
    
    NextYearSegment_ROI_Percent=0;
    
end

DiscountForCalculation_Percent=get(handles.DiscountForCalculation_Percent,'String');
DiscountForCalculation_Percent=str2double(DiscountForCalculation_Percent);


% Creating a List of Connected Parameters
DepreciationInfo=[SL,AD,FirstYearSegment,FirstYearSegment_ROI_Percent,NextYearSegment,NextYearSegment_ROI_Percent,AD_ROI_Percent,CorporateTax_ROI_Percent,MinAlternateTax_ROI_Percent,AD_Years,DiscountForCalculation_Percent];


% Creating a Cell Array of Connected Parameters
FinancialParameters={PlantInfo,ProjectCostComputations,OperationAndMaintenanceInfo,PlantPerformanceParamters,LoanAndInsuranceParameters,WorkingCapitalParameters,DepreciationInfo};


% Calling External Fuction For Financial Model Caomputations
[FinancialParameters_Computed]=SolarFinancialModel_Computer(FinancialParameters);

% Setting-up the Input Financial Parameters in the Current GUI Workspace 
setappdata(SolarFinancialModule_Inputs_GUI,'FinancialParameters',FinancialParameters);

% Setting-up the Computed Financial Parameters in the Current GUI Workspace 
setappdata(SolarFinancialModule_Inputs_GUI,'FinancialParameters_Computed',FinancialParameters_Computed);

% Opening Solar Financial Module Results GUI

SolarFinancialModule_Results_GUI;
