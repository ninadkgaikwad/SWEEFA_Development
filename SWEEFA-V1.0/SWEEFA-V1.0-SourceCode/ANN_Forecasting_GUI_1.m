function varargout = ANN_Forecasting_GUI_1(varargin)
% ANN_FORECASTING_GUI_1 MATLAB code for ANN_Forecasting_GUI_1.fig
%      ANN_FORECASTING_GUI_1, by itself, creates a new ANN_FORECASTING_GUI_1 or raises the existing
%      singleton*.
%
%      H = ANN_FORECASTING_GUI_1 returns the handle to a new ANN_FORECASTING_GUI_1 or the handle to
%      the existing singleton*.
%
%      ANN_FORECASTING_GUI_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANN_FORECASTING_GUI_1.M with the given input arguments.
%
%      ANN_FORECASTING_GUI_1('Property','Value',...) creates a new ANN_FORECASTING_GUI_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ANN_Forecasting_GUI_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ANN_Forecasting_GUI_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ANN_Forecasting_GUI_1

% Last Modified by GUIDE v2.5 21-Jun-2016 15:13:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ANN_Forecasting_GUI_1_OpeningFcn, ...
                   'gui_OutputFcn',  @ANN_Forecasting_GUI_1_OutputFcn, ...
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


% --- Executes just before ANN_Forecasting_GUI_1 is made visible.
function ANN_Forecasting_GUI_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ANN_Forecasting_GUI_1 (see VARARGIN)

% Choose default command line output for ANN_Forecasting_GUI_1
handles.output = hObject;

% Initializing GUI Elements

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);
set(handles.r3,'Value',0);

set(handles.r4,'Value',1);
set(handles.r5,'Value',0);

set(handles.r6,'Value',1);
set(handles.r7,'Value',0);
set(handles.r8,'Value',0);

set(handles.hiddenLayerSize,'String','');
set(handles.listbox,'Value',1);

set(handles.NetNum,'String','');
set(handles.BestNetIndex,'String','');

set(handles.ForecastYear,'String','');
set(handles.Res,'String','');
set(handles.popupmenu1,'Value',1);
set(handles.popupmenu2,'Value',12);
set(handles.popupmenu3,'Value',1);
set(handles.popupmenu4,'Value',31);

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'ANN_Forecasting_GUI_1',gcf);

% UIWAIT makes ANN_Forecasting_GUI_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ANN_Forecasting_GUI_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b7.
function b7_Callback(hObject, eventdata, handles)
% hObject    handle to b7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting GUI Elements

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);
set(handles.r3,'Value',0);

set(handles.r4,'Value',1);
set(handles.r5,'Value',0);

set(handles.r6,'Value',1);
set(handles.r7,'Value',0);
set(handles.r8,'Value',0);

set(handles.hiddenLayerSize,'String','');
set(handles.listbox,'Value',1);

set(handles.NetNum,'String','');
set(handles.BestNetIndex,'String','');

set(handles.ForecastYear,'String','');
set(handles.Res,'String','');
set(handles.popupmenu1,'Value',1);
set(handles.popupmenu2,'Value',12);
set(handles.popupmenu3,'Value',1);
set(handles.popupmenu4,'Value',31);

% --- Executes on button press in b8.
function b8_Callback(hObject, eventdata, handles)
% hObject    handle to b8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing GUI

hf1=findobj('Name','ANN_Performance_Plots');
close(hf1);

% close(1);
% close(2);
% close(3);
% close(4);

close;

% --- Executes on selection change in listbox.
function listbox_Callback(hObject, eventdata, handles)
% hObject    handle to listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox


% --- Executes during object creation, after setting all properties.
function listbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hiddenLayerSize_Callback(hObject, eventdata, handles)
% hObject    handle to hiddenLayerSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hiddenLayerSize as text
%        str2double(get(hObject,'String')) returns contents of hiddenLayerSize as a double


% --- Executes during object creation, after setting all properties.
function hiddenLayerSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hiddenLayerSize (see GCBO)
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

% Getting Current GUI Workspace
ANN_Forecasting_GUI_1=getappdata(0,'ANN_Forecasting_GUI_1');

% Getting Radiobutton Values

r4=get(handles.r4,'Value'); % Single-Year File
r5=get(handles.r5,'Value'); % Multi-Year File

r6=get(handles.r6,'Value'); % Mode1
r7=get(handles.r7,'Value'); % Mode2
r8=get(handles.r8,'Value'); % Mode3

% Importing Input Data from Excel File
[filename,pathname]=uigetfile({'*.*'},'ANN Input-Target File Selector');
fullpathname=strcat(pathname, filename);
TempFile=xlsread(fullpathname);

Input_ANN_File = TempFile;

% Disintegrating Input_ANN_File into Input_Train and Target_Train

[r,c]=size(Input_ANN_File);

DataCols=c-4;

% Getting Target File

% Target_Train = Input_ANN_File(:,5:c); % Mode1
% Target_Train = Input_ANN_File(2:r,5:c); % Mode2
% Target_Train = Input_ANN_File(3:r,5:c); % Mode3

% Using Radio Button Values to create specific Input and  File

if (r4==1) % Single Year File    
   
    
   if (r6==1) % Mode1 
       
       % Getting Target File
       
       Target_Train = Input_ANN_File(:,5:c); % Mode1
       
       % Getting Temporary Ann Input File
       
       Temp_Input_Train=Input_ANN_File(:,1:4);
       
       % Processing Temp_Input_Train to get Actual Input_Train File
       
       [ ProcessedData ] = DMYfile_To_AnnInputFile( Temp_Input_Train,0,r4,r5);
       
       Input_Train=ProcessedData;       
       
   elseif (r7==1) % Mode2
       
       % Getting Target File
       
       Target_Train = Input_ANN_File(2:r,5:c); % Mode2
       
       % Creating Input_Train File using external function
        %Temp_Input_Train=Input_ANN_File(:,1:4); % ???
       [ Input_Train ] = DMYfile_To_AnnInputFile1(Input_ANN_File ,0,r4,r5,r7,r8);
       
   elseif (r8==1) % Mode3      
      
       % Getting Target File
       
       Target_Train = Input_ANN_File(3:r,5:c); % Mode3
       
       % Creating Input_Train File using external function
       
       [ Input_Train ] = DMYfile_To_AnnInputFile1( Input_ANN_File,0,r4,r5,r7,r8);
 
   end
    
elseif (r5==1) % Multi-Year File      
    
    
   if (r6==1) % Mode1
       
       % Getting Target File
       
       Target_Train = Input_ANN_File(:,5:c); % Mode1
       
       % Getting Temporary Ann Input File
       
       Temp_Input_Train=Input_ANN_File(:,1:4);
       
       % Processing Temp_Input_Train to get Actual Input_Train File
       
       [ ProcessedData ] = DMYfile_To_AnnInputFile( Temp_Input_Train,0,r4,r5);
       
       Input_Train=ProcessedData;
       
   elseif (r7==1) % Mode2
       
       % Getting Target File
       
       Target_Train = Input_ANN_File(2:r,5:c); % Mode2
       
       % Creating Input_Train File using external function
       
       [ Input_Train ] = DMYfile_To_AnnInputFile1( Input_ANN_File,0,r4,r5,r7,r8);
 
   elseif (r8==1) % Mode3       
      
       % Getting Target File
       
       Target_Train = Input_ANN_File(3:r,5:c); % Mode3
       
       % Creating Input_Train File using external function
       
       [ Input_Train ] = DMYfile_To_AnnInputFile1( Input_ANN_File,0,r4,r5,r7,r8);
 
   end    
    
end


% Setting up Input_Train and Target_Train in GUI Workspace 

Input_Train = Input_Train';

Target_Train = Target_Train';

[Target_Row,Target_Col]=size(Target_Train);

setappdata(ANN_Forecasting_GUI_1,'Target_Row',Target_Row);

% Setting Target_Train in Current GUI Workspace
setappdata(ANN_Forecasting_GUI_1,'Target_Train',Target_Train)

% Setting Input_Train in Current GUI Workspace
setappdata(ANN_Forecasting_GUI_1,'Input_Train',Input_Train);


% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI Workspace
ANN_Forecasting_GUI_1=getappdata(0,'ANN_Forecasting_GUI_1');

% Importing Target Data from Excel File
[filename,pathname]=uigetfile({'*.*'},'ANN Target File Selector');
fullpathname=strcat(pathname, filename);
TempFile=xlsread(fullpathname);

Target_Train = TempFile;

Target_Train = Target_Train';

[Target_Row,Target_Col]=size(Target_Train);

setappdata(ANN_Forecasting_GUI_1,'Target_Row',Target_Row);

% Setting Target_Train in Current GUI Workspace
setappdata(ANN_Forecasting_GUI_1,'Target_Train',Target_Train);

% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI Workspace
ANN_Forecasting_GUI_1=getappdata(0,'ANN_Forecasting_GUI_1');

% Getting Radio Buttor Values
r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');
r3=get(handles.r3,'Value');

% Getting Vector of Hidden Layer
hiddenLayerSize=get(handles.hiddenLayerSize,'String');
hiddenLayerSize=strread(hiddenLayerSize,'%f','delimiter',',');
hiddenLayerSize=hiddenLayerSize';

setappdata(ANN_Forecasting_GUI_1,'hiddenLayerSize',hiddenLayerSize);

% Getting Training Function String
listbox=get(handles.listbox,'Value');

switch (listbox)
   case 1
      TrainFcn='trainlm';  % Levenberg-Marquardt
      
   case 2
      TrainFcn='trainbr';  % Bayesian Regularization

   case 3
      TrainFcn='trainbfg';  % BFGS Quasi-Newton

   case 4
      TrainFcn='trainrp';  % Resilient Backpropagation

   case 5
      TrainFcn='trainscg';  % Scaled Conjugate Gradient

   case 6
      TrainFcn='traincgb';  % Conjugate Gradient with Powell/Beale Restarts

   case 7
      TrainFcn='traincgf';  % Fletcher-Powell Conjugate Gradient

   case 8
      TrainFcn='traincgp';  % Polak-Ribiére Conjugate Gradient

   case 9
      TrainFcn='trainoss';  % One Step Secant

   case 10
      TrainFcn='traingdx';  % Variable Learning Rate Gradient Descent  

   case 11
      TrainFcn='traingdm';  % Gradient Descent with Momentum

   case 12
      TrainFcn='traingd';  % Gradient Descent

end

% Creating Neural Net according to the radio button values
if (r1==1) % FitNet

    net = fitnet(hiddenLayerSize,TrainFcn);

    setappdata(ANN_Forecasting_GUI_1,'net',net);

    setappdata(ANN_Forecasting_GUI_1,'TrainFcn',TrainFcn);

elseif (r2==1) % FeedForwardNet

    net = feedforwardnet(hiddenLayerSize,TrainFcn);

    setappdata(ANN_Forecasting_GUI_1,'net',net);

    setappdata(ANN_Forecasting_GUI_1,'TrainFcn',TrainFcn);

elseif (r3==1) % CascadedFeedForwardNet

    net = cascadeforwardnet(hiddenLayerSize,TrainFcn);

    setappdata(ANN_Forecasting_GUI_1,'net',net);

    setappdata(ANN_Forecasting_GUI_1,'TrainFcn',TrainFcn);

end

% Viewing the Neural Net

view(net);

% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the Current GUI Workspace
ANN_Forecasting_GUI_1=getappdata(0,'ANN_Forecasting_GUI_1');

% Getting ANN Training Input File
Input_Train=getappdata(ANN_Forecasting_GUI_1,'Input_Train');

% Getting ANN Traing Target File
Target_Train=getappdata(ANN_Forecasting_GUI_1,'Target_Train');

% Getting hiddenLayerSize
hiddenLayerSize=getappdata(ANN_Forecasting_GUI_1,'hiddenLayerSize');

% Getting TrainFunc
TrainFcn=getappdata(ANN_Forecasting_GUI_1,'TrainFcn');

% Getting Total Number of nets to Train
NetNum=get(handles.NetNum,'String');
NetNum=str2double(NetNum);

setappdata(ANN_Forecasting_GUI_1,'NetNum',NetNum);

% % Getting Radio Buttor Values
% r7=get(handles.r7,'Value');
% r8=get(handles.r8,'Value');
% r6=get(handles.r6,'Value');
% 
% % Creating Neural Net according to the radio button values
% if (r7==1) % FitNet
% 
%     net = fitnet(hiddenLayerSize,TrainFcn);
% 
%     setappdata(ANN_Forecasting_GUI_1,'net',net);
% 
% elseif (r8==1) % FeedForwardNet
% 
%     net = feedforwardnet(hiddenLayerSize,TrainFcn);
% 
%     setappdata(ANN_Forecasting_GUI_1,'net',net);
% 
% elseif (r6==1) % CascadedFeedForwardNet
% 
%     net = cascadeforwardnet(hiddenLayerSize,TrainFcn);
% 
%     setappdata(ANN_Forecasting_GUI_1,'net',net);
% 
% end

% Getting Neural Net
net=getappdata(ANN_Forecasting_GUI_1,'net');

% Creating Cells for Storing Multiple Trained Nets and their respective Performance Structures
% Performance Structures
Total_Nets=cell(1,NetNum);

Total_TR=cell(1,NetNum);

% Training all the Neural Nets
for i=1:NetNum

%   disp(['Training ' num2str(i) '/' num2str(numNN)]) 

  [Total_Nets{1,i},Total_TR{1,i}] = train(net,Input_Train,Target_Train);

%   y2 = NN{i}(x2);

%   perfs(i) = mse(net,t2,y2);

end

% Setting Total_Nets and Total_TR in Current GUI Workspace
setappdata(ANN_Forecasting_GUI_1,'Total_Nets',Total_Nets);

setappdata(ANN_Forecasting_GUI_1,'Total_TR',Total_TR);


% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening ANN Plots GUI
ANN_Performance_Plots


% --- Executes on button press in b6.
function b6_Callback(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the Current GUI Workspace
ANN_Forecasting_GUI_1=getappdata(0,'ANN_Forecasting_GUI_1');

% Getting ANN Traing Target Number of Rows 
Target_Row=getappdata(ANN_Forecasting_GUI_1,'Target_Row');

% Getting ANN Trained Nets 
Total_Nets=getappdata(ANN_Forecasting_GUI_1,'Total_Nets');

% Getting BestNetIndex
BestNetIndex=get(handles.BestNetIndex,'String');
BestNetIndex=str2double(BestNetIndex);

% Getting Information for Creating Input File

SingleYear=get(handles.r4,'Value');
MultiYear=get(handles.r5,'Value');

Mode1=get(handles.r6,'Value');
Mode2=get(handles.r7,'Value');
Mode3=get(handles.r8,'Value');

ForecastYear=get(handles.ForecastYear,'String');
ForecastYear=str2double(ForecastYear);

Res=get(handles.Res,'String');
Res=str2double(Res);

StartYear=ForecastYear;
EndYear=ForecastYear;
StartMonth=get(handles.popupmenu1,'Value');
StartDay=get(handles.popupmenu3,'Value');
EndMonth=get(handles.popupmenu2,'Value');
EndDay=get(handles.popupmenu4,'Value');

DataCols=Target_Row;

if (Mode1==1)

    % Creating Input File
    [ ~,~,TotDays ] = RowsColsToComputeDataCleaning( StartYear,StartMonth,StartDay,EndYear,EndMonth,EndDay,Res,DataCols,4 );

    [ DateTimeMatrix,~,~ ] = StartEndCalender( StartYear,StartMonth,StartDay,TotDays,Res,DataCols );

    DataFile=DateTimeMatrix;

    DataFile1=DateTimeMatrix(:,1:4);

    [~,c]=size(DataFile);

    [ ProcessedData ] = DMYfile_To_AnnInputFile( DataFile1,0,SingleYear,MultiYear);

    Input_Forecast_Col=ProcessedData;

    Input_Forecast_Row=Input_Forecast_Col';

    % Using The Best Trained Neural Net to give Forecast

    net=Total_Nets{1,BestNetIndex};

    Forecast_Output_Row=net(Input_Forecast_Row);

    Forecast_Output_Col=Forecast_Output_Row';

    % Putting Forecasted Output in DataFile
    DataFile(:,5:c)=Forecast_Output_Col;

    % Loading Forecasted Output in Excel File

    filename = 'ForecastANN_Mode1_File.xlsx';

    sheet = 1;

    xlRange = 'A2';

    xlswrite(filename,DataFile,sheet,xlRange);
    
elseif (Mode2==1)
    
    % Importing Input Data from Excel File
    [filename,pathname]=uigetfile({'*.*'},'ANN Input-Target File Selector');
    fullpathname=strcat(pathname, filename);
    TempFile=xlsread(fullpathname);
    
    % Creating Input File
    [ Input_Ann_Train, TempInput ] = DMYfile_To_AnnInputFile1( TempFile,0,SingleYear,MultiYear,Mode2,Mode3);

    Input_Forecast_Col=Input_Ann_Train;

    Input_Forecast_Row=Input_Forecast_Col';

    % Using The Best Trained Neural Net to give Forecast

    net=Total_Nets{1,BestNetIndex};

    Forecast_Output_Row=net(Input_Forecast_Row);

    Forecast_Output_Col=Forecast_Output_Row';

    % Putting Forecasted Output in DataFile
    DataFile=[TempInput , Forecast_Output_Col];

    % Loading Forecasted Output in Excel File

    filename = 'ForecastANN_Mode2_File.xlsx';

    sheet = 1;

    xlRange = 'A2';

    xlswrite(filename,DataFile,sheet,xlRange);    
    
elseif (Mode3==1)

    % Importing Input Data from Excel File
    [filename,pathname]=uigetfile({'*.*'},'ANN Input-Target File Selector');
    fullpathname=strcat(pathname, filename);
    TempFile=xlsread(fullpathname);    
    
    % Creating Input File
    [ Input_Ann_Train, TempInput ] = DMYfile_To_AnnInputFile1( TempFile,0,SingleYear,MultiYear,Mode2,Mode3);

    Input_Forecast_Col=Input_Ann_Train;

    Input_Forecast_Row=Input_Forecast_Col';
    
    % Using The Best Trained Neural Net to give Forecast

    net=Total_Nets{1,BestNetIndex};

    Forecast_Output_Row=net(Input_Forecast_Row);

    Forecast_Output_Col=Forecast_Output_Row';

    % Putting Forecasted Output in DataFile
    DataFile=[TempInput , Forecast_Output_Col];

    % Loading Forecasted Output in Excel File

    filename = 'ForecastANN_Mode3_File.xlsx';

    sheet = 1;

    xlRange = 'A2';

    xlswrite(filename,DataFile,sheet,xlRange);    
    
end


function Res_Callback(hObject, eventdata, handles)
% hObject    handle to Res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Res as text
%        str2double(get(hObject,'String')) returns contents of Res as a double


% --- Executes during object creation, after setting all properties.
function Res_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ForecastYear_Callback(hObject, eventdata, handles)
% hObject    handle to ForecastYear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ForecastYear as text
%        str2double(get(hObject,'String')) returns contents of ForecastYear as a double


% --- Executes during object creation, after setting all properties.
function ForecastYear_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ForecastYear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, ~, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NetNum_Callback(hObject, eventdata, handles)
% hObject    handle to NetNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NetNum as text
%        str2double(get(hObject,'String')) returns contents of NetNum as a double


% --- Executes during object creation, after setting all properties.
function NetNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NetNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BestNetIndex_Callback(hObject, eventdata, handles)
% hObject    handle to BestNetIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BestNetIndex as text
%        str2double(get(hObject,'String')) returns contents of BestNetIndex as a double


% --- Executes during object creation, after setting all properties.
function BestNetIndex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BestNetIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in r7.
function r7_Callback(hObject, eventdata, handles)
% hObject    handle to r7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of r7
