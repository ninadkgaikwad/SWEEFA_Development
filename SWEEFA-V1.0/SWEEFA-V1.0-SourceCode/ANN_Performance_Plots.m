function varargout = ANN_Performance_Plots(varargin)
% ANN_PERFORMANCE_PLOTS MATLAB code for ANN_Performance_Plots.fig
%      ANN_PERFORMANCE_PLOTS, by itself, creates a new ANN_PERFORMANCE_PLOTS or raises the existing
%      singleton*.
%
%      H = ANN_PERFORMANCE_PLOTS returns the handle to a new ANN_PERFORMANCE_PLOTS or the handle to
%      the existing singleton*.
%
%      ANN_PERFORMANCE_PLOTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANN_PERFORMANCE_PLOTS.M with the given input arguments.
%
%      ANN_PERFORMANCE_PLOTS('Property','Value',...) creates a new ANN_PERFORMANCE_PLOTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ANN_Performance_Plots_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ANN_Performance_Plots_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ANN_Performance_Plots

% Last Modified by GUIDE v2.5 29-Apr-2016 17:08:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ANN_Performance_Plots_OpeningFcn, ...
                   'gui_OutputFcn',  @ANN_Performance_Plots_OutputFcn, ...
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


% --- Executes just before ANN_Performance_Plots is made visible.
function ANN_Performance_Plots_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ANN_Performance_Plots (see VARARGIN)

% Setting Global Variable for NEXT & Previous Buttons
global next3;
next3=1;

% Choose default command line output for ANN_Performance_Plots
handles.output = hObject;



% Resetting The GUI Elements
set(handles.NetNumber,'String','');
set(handles.b4,'Enable','off');
set(handles.b5,'Enable','off');

% Resetting Graph

%     axes(handles.G1);
%     cla reset;
%     axes(handles.G2);
%     cla reset;
%     axes(handles.G3);
%     cla reset;
%     axes(handles.G4);
%     cla reset;

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'ANN_Performance_Plots',gcf);

% UIWAIT makes ANN_Performance_Plots wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ANN_Performance_Plots_OutputFcn(hObject, eventdata, handles) 
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

% Resetting The GUI Elements
set(handles.NetNumber,'String','');
set(handles.b4,'Enable','off');
set(handles.b5,'Enable','off');

% Resetting Graph

%     axes(handles.G1);
%     cla reset;
%     axes(handles.G2);
%     cla reset;
%     axes(handles.G3);
%     cla reset;
%     axes(handles.G4);
%     cla reset;

    
    
    

% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing GUI

close;
close(1);
close(2);
close(3);
close(4);

% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Workspace of ANN_Forecasting_GUI_1
ANN_Forecasting_GUI_1=getappdata(0,'ANN_Forecasting_GUI_1');

% Getting Input_Train & Target_Train
Input_Train=getappdata(ANN_Forecasting_GUI_1,'Input_Train');
Target_Train=getappdata(ANN_Forecasting_GUI_1,'Target_Train');
targets=Target_Train; % for plotting

% Getting Trained Neural Networks and NetNum
Total_Nets=getappdata(ANN_Forecasting_GUI_1,'Total_Nets');
Total_TR=getappdata(ANN_Forecasting_GUI_1,'Total_TR');
NetNum=getappdata(ANN_Forecasting_GUI_1,'NetNum');

% Programming Previous Button
global next3;
if next3==1
    next3=NetNum + 1;
end 
next3=next3-1;

NetNumber1=num2str(next3);

% Setting NetNumber
set(handles.NetNumber,'String',NetNumber1);

% Getting Proper Net and TR
net=Total_Nets{1,next3};
tr=Total_TR{1,next3};

Output_Train=net(Input_Train);
outputs=Output_Train; % for plotting

% Getting Neural Net Inputs for Training, Validation and Test Set
inputTrain=tr.trainInd ; % Input for Training Set
inputVal=tr.valInd ; % Input for Training Set
inputTest=tr.testInd ; % Input for Training Set

% Getting Neural Net Outputs for Training, Validation and Test Set
trOut = Output_Train(tr.trainInd); % Output for Training Set
vOut = Output_Train(tr.valInd); % Output for Validation Set
tsOut = Output_Train(tr.testInd);% Output for Testing Set

% Getting Neural Net Targets for Training, Validation and Test Set
trTarg = Target_Train(tr.trainInd); % Targets for Training Set
vTarg = Target_Train(tr.valInd); % Targets for Validation Set
tsTarg = Target_Train(tr.testInd); % Targets for Testing Set

% Calculating Errors
errorsTrain = gsubtract(trOut,trTarg);
errorsVal = gsubtract(vOut,vTarg);
errorsTest = gsubtract(tsOut,tsTarg);

% Plotting Graphs

% Graph 1
% axes(handles.G1);
% grid on
% hold on 
figure(1);
plotperform(tr)
%hold off

% Graph 2
% axes(handles.G2);
% grid on
% hold on 
figure(2);
plottrainstate(tr)
%hold off

% Graph 3
% axes(handles.G3);
% grid on
% hold on 
figure(3);
plotregression(trTarg,trOut,'Train',vTarg,vOut,'Validation',...
tsTarg,tsOut,'Testing',targets,outputs,'All')
%hold off

% Graph 4
% axes(handles.G4);
% grid on
% hold on 
figure(4);
ploterrhist(errorsTrain,'Train',errorsVal,'Validation',...
errorsTest,'Testing')
%hold off

% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Setting NetNumber
set(handles.NetNumber,'String','1');

% Getting Workspace of ANN_Forecasting_GUI_1
ANN_Forecasting_GUI_1=getappdata(0,'ANN_Forecasting_GUI_1');

% Getting Input_Train & Target_Train
Input_Train=getappdata(ANN_Forecasting_GUI_1,'Input_Train');
Target_Train=getappdata(ANN_Forecasting_GUI_1,'Target_Train');
targets=Target_Train; % For plotting

% Getting Trained Neural Networks
Total_Nets=getappdata(ANN_Forecasting_GUI_1,'Total_Nets');
Total_TR=getappdata(ANN_Forecasting_GUI_1,'Total_TR');

% Getting Proper Net and TR
net=Total_Nets{1,1};
tr=Total_TR{1,1};

Output_Train=net(Input_Train);

outputs=Output_Train; % For plotting

% Getting Neural Net Inputs for Training, Validation and Test Set
inputTrain=tr.trainInd ; % Input for Training Set
inputVal=tr.valInd ; % Input for Training Set
inputTest=tr.testInd ; % Input for Training Set

% Getting Neural Net Outputs for Training, Validation and Test Set
trOut = Output_Train(tr.trainInd); % Output for Training Set
vOut = Output_Train(tr.valInd); % Output for Validation Set
tsOut = Output_Train(tr.testInd);% Output for Testing Set

% Getting Neural Net Targets for Training, Validation and Test Set
trTarg = Target_Train(tr.trainInd); % Targets for Training Set
vTarg = Target_Train(tr.valInd); % Targets for Validation Set
tsTarg = Target_Train(tr.testInd); % Targets for Testing Set

% Calculating Errors
errorsTrain = gsubtract(trOut,trTarg);
errorsVal = gsubtract(vOut,vTarg);
errorsTest = gsubtract(tsOut,tsTarg);

% Plotting Graphs

% Graph 1
% axes(handles.G1);
% grid on
% hold on
figure(1);
plotperform(tr);
%hold off

% Graph 2
% axes(handles.G2);
% grid on
% hold on 
figure(2);
plottrainstate(tr);
%hold off

% Graph 3
% axes(handles.G3);
% grid on
% hold on 
figure(3);
plotregression(trTarg,trOut,'Train',vTarg,vOut,'Validation',...
tsTarg,tsOut,'Testing',targets,outputs,'All');
%hold off

% Graph 4
% axes(handles.G4);
% grid on
% hold on 
figure(4);
ploterrhist(errorsTrain,'Train',errorsVal,'Validation',...
errorsTest,'Testing');
%hold off



% Enabling Next and Previous Buttons
set(handles.b4,'Enable','on');
set(handles.b5,'Enable','on');

% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Workspace of ANN_Forecasting_GUI_1
ANN_Forecasting_GUI_1=getappdata(0,'ANN_Forecasting_GUI_1');

% Getting Input_Train & Target_Train
Input_Train=getappdata(ANN_Forecasting_GUI_1,'Input_Train');
Target_Train=getappdata(ANN_Forecasting_GUI_1,'Target_Train');
targets=Target_Train; % for plotting

% Getting Trained Neural Networks and NetNum
Total_Nets=getappdata(ANN_Forecasting_GUI_1,'Total_Nets');
Total_TR=getappdata(ANN_Forecasting_GUI_1,'Total_TR');
NetNum=getappdata(ANN_Forecasting_GUI_1,'NetNum');


% Proramming NEXT Button
global next3;
if next3==NetNum;
    next3=0;
end 
next3=next3+1;

NetNumber1=num2str(next3);

% Setting NetNumber
set(handles.NetNumber,'String',NetNumber1);

% Getting Proper Net and TR
net=Total_Nets{1,next3};
tr=Total_TR{1,next3};

Output_Train=net(Input_Train);
outputs=Output_Train; % for plotting

% Getting Neural Net Inputs for Training, Validation and Test Set
inputTrain=tr.trainInd ; % Input for Training Set
inputVal=tr.valInd ; % Input for Training Set
inputTest=tr.testInd ; % Input for Training Set

% Getting Neural Net Outputs for Training, Validation and Test Set
trOut = Output_Train(tr.trainInd); % Output for Training Set
vOut = Output_Train(tr.valInd); % Output for Validation Set
tsOut = Output_Train(tr.testInd);% Output for Testing Set

% Getting Neural Net Targets for Training, Validation and Test Set
trTarg = Target_Train(tr.trainInd); % Targets for Training Set
vTarg = Target_Train(tr.valInd); % Targets for Validation Set
tsTarg = Target_Train(tr.testInd); % Targets for Testing Set

% Calculating Errors
errorsTrain = gsubtract(trOut,trTarg);
errorsVal = gsubtract(vOut,vTarg);
errorsTest = gsubtract(tsOut,tsTarg);

% Plotting Graphs

% Graph 1
% axes(handles.G1);
% grid on
% hold on 
figure(1);
plotperform(tr)
%hold off

% Graph 2
% axes(handles.G2);
% grid on
% hold on 
figure(2);
plottrainstate(tr)
%hold off

% Graph 3
% axes(handles.G3);
% grid on
% hold on 
figure(3);
plotregression(trTarg,trOut,'Train',vTarg,vOut,'Validation',...
tsTarg,tsOut,'Testing',targets,outputs,'All')
%hold off

% Graph 4
% axes(handles.G4);
% grid on
% hold on 
figure(4);
ploterrhist(errorsTrain,'Train',errorsVal,'Validation',...
errorsTest,'Testing')
%hold off
