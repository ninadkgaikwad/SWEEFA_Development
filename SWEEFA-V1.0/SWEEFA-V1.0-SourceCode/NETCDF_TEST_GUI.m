function varargout = NETCDF_TEST_GUI(varargin)
% NETCDF_TEST_GUI MATLAB code for NETCDF_TEST_GUI.fig
%      NETCDF_TEST_GUI, by itself, creates a new NETCDF_TEST_GUI or raises the existing
%      singleton*.
%
%      H = NETCDF_TEST_GUI returns the handle to a new NETCDF_TEST_GUI or the handle to
%      the existing singleton*.
%
%      NETCDF_TEST_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NETCDF_TEST_GUI.M with the given input arguments.
%
%      NETCDF_TEST_GUI('Property','Value',...) creates a new NETCDF_TEST_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NETCDF_TEST_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NETCDF_TEST_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NETCDF_TEST_GUI

% Last Modified by GUIDE v2.5 25-Apr-2016 14:28:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NETCDF_TEST_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @NETCDF_TEST_GUI_OutputFcn, ...
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


% --- Executes just before NETCDF_TEST_GUI is made visible.
function NETCDF_TEST_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NETCDF_TEST_GUI (see VARARGIN)

% Choose default command line output for NETCDF_TEST_GUI
handles.output = hObject;

% Initializing GUI Elements

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);
set(handles.VarName,'String','');

set(handles.r3,'Value',1);
set(handles.r4,'Value',0);
set(handles.r5,'Value',0);
set(handles.Long,'String','');
set(handles.Lat,'String','');
set(handles.D3,'String','');
set(handles.D4,'String','');
set(handles.Long,'Enable','on');
set(handles.Lat,'Enable','on');
set(handles.D3,'Enable','off');
set(handles.D4,'Enable','off');

set(handles.r6,'Value',1);
set(handles.r7,'Value',0);
set(handles.Location_Lat,'String','');
set(handles.Location_Long,'String','');
set(handles.Location_D3,'String','');
set(handles.Location_Lat,'Enable','off');
set(handles.Location_Long,'Enable','off');
set(handles.Location_D3,'Enable','off');

set(handles.Netcdf_Total,'String','');
set(handles.Netcdf_Variable,'String','');

% Resetting Graph

    axes(handles.G1);
    cla reset;

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'NETCDF_TEST_GUI',gcf);

% UIWAIT makes NETCDF_TEST_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NETCDF_TEST_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Netcdf_Total_Callback(hObject, eventdata, handles)
% hObject    handle to Netcdf_Total (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Netcdf_Total as text
%        str2double(get(hObject,'String')) returns contents of Netcdf_Total as a double


% --- Executes during object creation, after setting all properties.
function Netcdf_Total_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Netcdf_Total (see GCBO)
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

%% File Selection
[Filename,Pathname]=uigetfile({'*.*'},'NETCDF File Selector');

Fullpathname=strcat(Pathname,Filename);

% Saving Fullpathname to Current GUI Workspace
NETCDF_TEST_GUI=getappdata(0,'NETCDF_TEST_GUI');

setappdata(NETCDF_TEST_GUI,'Fullpathname',Fullpathname);

% Getting Values of Radio Buttons
r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');

% Displaying NETCDF File Details according to the radio button values
if (r1==1) % Complete Details

    clc;

    % Creating File CommandLine_Output to store Netcdf File Details
    diary('CommandLine_Output')

    diary on;

    ncdisp(Fullpathname);

    diary off;

    output=fileread('CommandLine_Output');

    % Displaying File Data to Edit Box 
     set(handles.Netcdf_Total,'string',output);

     delete('CommandLine_Output');


elseif (r2==1) % Minimum Details

    clc;
    
    % Creating File CommandLine_Output to store Netcdf File Details
    diary('CommandLine_Output')

    diary on;

    ncdisp(Fullpathname,'/','min');

    diary off;

    output=fileread('CommandLine_Output');

    % Displaying File Data to Edit Box 

     set(handles.Netcdf_Total,'string',output);

     delete('CommandLine_Output');


end








function VarName_Callback(hObject, eventdata, handles)
% hObject    handle to VarName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of VarName as text
%        str2double(get(hObject,'String')) returns contents of VarName as a double


% --- Executes during object creation, after setting all properties.
function VarName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VarName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting GUI Elements

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);
set(handles.VarName,'String','');

set(handles.r3,'Value',1);
set(handles.r4,'Value',0);
set(handles.r5,'Value',0);
set(handles.Long,'String','');
set(handles.Lat,'String','');
set(handles.D3,'String','');
set(handles.D4,'String','');
set(handles.Long,'Enable','on');
set(handles.Lat,'Enable','on');
set(handles.D3,'Enable','off');
set(handles.D4,'Enable','off');

set(handles.r6,'Value',1);
set(handles.r7,'Value',0);
set(handles.Location_Lat,'String','');
set(handles.Location_Long,'String','');
set(handles.Location_D3,'String','');
set(handles.Location_Lat,'Enable','off');
set(handles.Location_Long,'Enable','off');
set(handles.Location_D3,'Enable','off');

set(handles.Netcdf_Total,'String','');
set(handles.Netcdf_Variable,'String','');

% Resetting Graph

    axes(handles.G1);
    cla reset;


% --- Executes on button press in b6.
function b6_Callback(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing GUI

close;


function Netcdf_Variable_Callback(hObject, eventdata, handles)
% hObject    handle to Netcdf_Variable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Netcdf_Variable as text
%        str2double(get(hObject,'String')) returns contents of Netcdf_Variable as a double


% --- Executes during object creation, after setting all properties.
function Netcdf_Variable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Netcdf_Variable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI Workspace
NETCDF_TEST_GUI=getappdata(0,'NETCDF_TEST_GUI');

Fullpathname=getappdata(NETCDF_TEST_GUI,'Fullpathname');

% Getting NETCDF Variable Name
VarName=get(handles.VarName,'String');

% Displaying NETCDF Variable Information 

clc;

% Creating File CommandLine_Output to store Netcdf File Details
diary('CommandLine_Output')

diary on;

ncdisp(Fullpathname,VarName);

diary off;

output=fileread('CommandLine_Output');

% Displaying File Data to Edit Box 
 set(handles.Netcdf_Variable,'string',output);

 delete('CommandLine_Output');




% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI Workspace
NETCDF_TEST_GUI=getappdata(0,'NETCDF_TEST_GUI');

Fullpathname=getappdata(NETCDF_TEST_GUI,'Fullpathname');

% Getting Radio Button Values

r3=get(handles.r3,'Value');
r4=get(handles.r4,'Value');
r5=get(handles.r5,'Value');

% Getting NETCDF Variable Name
VarName=get(handles.VarName,'String');

% Read a Variable attribute.
AttData = ncreadatt(Fullpathname,VarName,'units');

% Plotting NETCDF Variable according to radio button values

if (r3==1) % Plot 2D Variable
    
    % Getting 1st and 2nd Dimension Names
    Long=get(handles.Long,'String');
    Lat=get(handles.Lat,'String');

    % Getting 1st and 2nd Dimensions
    xx = ncread(Fullpathname,Long);
    yy = ncread(Fullpathname,Lat); 

    axes(handles.G1);
    cla reset;
    
    % Plot
    axes(handles.G1);
    grid on
    hold on 
    title(['Plot of ' VarName '[' AttData ']' ]);
    xlabel(['Longitudes [Degrees]']);
    ylabel(['Latitudes [Degrees]']);
    %Plots NETCDF Variables
    plot(xx(:,:,1),yy(:,:,1),'o');  
    hold off;      

elseif (r4==1) % Plot 3D Variable

    % Getting 1st and 2nd Dimension Names
    Long=get(handles.Long,'String');
    Lat=get(handles.Lat,'String');

    % Getting 3rd Dimension
    D3=get(handles.D3,'String');
    D3=str2double(D3);

    % Getting 1st and 2nd Dimensions
    xx = ncread(Fullpathname,Long);
    xx=double(xx);

    yy = ncread(Fullpathname,Lat); 
    yy=double(yy);

    % Getting Variable Value
    VarData = ncread(Fullpathname,VarName);
    
    % Getting Eact Variable Value in Time Dimension
    zz = VarData(:,:,D3);
    zz=double(zz);

    axes(handles.G1);
    cla reset;    
    
    % Plot
    axes(handles.G1);
    grid on
    hold on 
    title(['Plot of ' VarName ' [' AttData ']' ]);
    xlabel(['Longitudes [Degrees]']);
    ylabel(['Latitudes [Degrees]']);
    zlabel([VarName ' [' AttData ']']);
    %Plots NETCDF Variables
    surf(xx(:,:,D3),yy(:,:,D3),zz); 
    colorbar();
    hold off;  

elseif (r5==1) % Plot 4D Variable

    % Getting 1st and 2nd Dimension Names
    Long=get(handles.Long,'String');
    Lat=get(handles.Lat,'String');

    % Getting 3rd and 4th Dimensions
    D3=get(handles.D3,'String');
    D3=str2double(D3);

    D4=get(handles.D4,'String');
    D4=str2double(D4);

    % Getting 1st and 2nd Dimensions
    xx = ncread(Fullpathname,Long);
    xx=double(xx);

    yy = ncread(Fullpathname,Lat); 
    yy=double(yy);

    % Getting Variable Value
    VarData = ncread(Fullpathname,VarName);
    
    % Getting Eact Variable Value in Time Dimension
    zz = VarData(:,:,D3,D4);
    zz=double(zz);

    axes(handles.G1);
    cla reset;    
    
    % Plot
    axes(handles.G1);
    grid on
    hold on 
    title(['Plot of ' VarName ' [' AttData ']' ]);
    xlabel(['Longitudes [Degrees]']);
    ylabel(['Latitudes [Degrees]']);
    zlabel([VarName ' [' AttData ']']);
    %Plots NETCDF Variables
    surf(xx(:,:,D3),yy(:,:,D3),zz); 
    colorbar();
    hold off;  

end



% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI Workspace
NETCDF_TEST_GUI=getappdata(0,'NETCDF_TEST_GUI');

% Getting Fullpathname
Fullpathname=getappdata(NETCDF_TEST_GUI,'Fullpathname');

% Getting Variable Name
VarName=get(handles.VarName,'String');

% Getting Values of Dimension Radio Buttons
r3=get(handles.r3,'Value'); % 2D
r4=get(handles.r4,'Value'); % 3D
r5=get(handles.r5,'Value'); % 4D

% Getting Dimension 1 & 2 Names
Long=get(handles.Long,'String');
Lat=get(handles.Lat,'String');

% Getting Values of Radio Buttons for Variable Extraction
r6=get(handles.r6,'Value'); % Extract Complete Variable
r7=get(handles.r7,'Value'); % Extract Variable at Location

% Getting Time Dimension 
VarDataTime = ncread(Fullpathname,'Times');

Times=VarDataTime;

Times=Times';

[r,c]=size(Times);

TimesCell=cell(r,1);

for i=1:r

TimesCell(i,1)={Times(i,:)};

end

% Extracting Variable According Radio Button Values

if (r6==1) % Extract Complete Variable
    
    % Extracting Complete Variable
    VarData = ncread(Fullpathname,VarName);
    
    % Computing Size of VarData
    VarSize=size(VarData);
    
    % Extracting Data Depending on Radio Button Values
    if (r3==1) % 2D
        
       VarData1=VarData(:,:,1);

       % Excel File Creation         

       filename = [VarName '_File.xlsx'];

       sheet = 1;

       xlRange = 'A2';

       xlswrite(filename,VarData1,sheet,xlRange);          
       
        
    elseif (r4==1) % 3D
        
        VarData1=VarData(:,:,:);
        
        r=VarSize(1,1);
        c=VarSize(1,2);
        t=VarSize(1,3);
        
      % Excel File Creation

         for m=1:t
             
           time=TimesCell{m,1};  

           filename = [VarName '_File.xlsx'];

           sheet = m;
           
           xlRange1 = 'A2';

           xlswrite(filename,time,sheet,xlRange1);           

           xlRange2 = 'B2';

           xlswrite(filename,VarData1(:,:,m),sheet,xlRange2); 

         end       
        
    elseif (r5==1) % 4D
        
        VarData1=VarData(:,:,:,:);
        
        r=VarSize(1,1);
        c=VarSize(1,2);
        z=VarSize(1,3);  
        t=VarSize(1,4); 
        
      % Excel File Creation

         for m=1:t
             
             for n=1:z
             
               TimeN=num2str(m);
                 
               time=TimesCell{m,1};  

               filename = [VarName '_' TimeN '_File.xlsx'];

               sheet = n;

               xlRange1 = 'A2';

               xlswrite(filename,time,sheet,xlRange1);           

               xlRange2 = 'B2';

               xlswrite(filename,VarData1(:,:,n,m),sheet,xlRange2); 
               
             end

         end          
        
        
    end
    
elseif (r7==1) % Extract Variable at Location
    
    % Extracting Complete Variable
    VarData = ncread(Fullpathname,VarName);
    
    % Computing Size of VarData
    VarSize=size(VarData);
    
    % Computing Location on Grid
    Location_Lat=get(handles.Location_Lat,'String');
    Location_Lat=str2double(Location_Lat);
    trueLat=Location_Lat;

    Location_Long=get(handles.Location_Long,'String');
    Location_Long=str2double(Location_Long);
    trueLong=Location_Long; 
    
    Long=get(handles.Long,'String');
    Lat=get(handles.Lat,'String');
    
    LongData = ncread(Fullpathname,Long);
    LatData = ncread(Fullpathname,Lat);
    
     [r,c]=size(LongData);

    CombinedLatLong=cell(r,c);

    for i=1:r

        for j=1:c

           latt=LatData(i,j);
           longg=LongData(i,j);
           CombinedLatLong(i,j)={[latt,longg]};

        end

    end

    TotalError=zeros(r,c);

    for i=1:r

        for j=1:c

            LatLong=CombinedLatLong{i,j};

            latt=LatLong(1,1);
            longg=LatLong(1,2);

            laterror=abs(latt-trueLat);
            longerror=abs(longg-trueLong);

            TotalError(i,j)=laterror+longerror;       


        end

    end

    [Min1,Index1]=min(TotalError);

    [Min2,Index2]=min(Min1);

    ColumnData=Index2;

    RowData=Index1(1,Index2) ;  
    
    
    % Extracting Data Depending on Radio Button Values
    if (r3==1) % 2D
        
        LatIndicator_U=strcmp(Lat,'XLAT_U');
        LongIndicator_U=strcmp(Long,'XLONG_U');
        LatIndicator_V=strcmp(Lat,'XLAT_V');
        LongIndicator_V=strcmp(Long,'XLONG_V');  
        
        if ((LatIndicator_U==1) && (LongIndicator_U==1)) % If it is Staggered in U Direction
            
            VarData1=VarData(:,:,1);
            
            time=TimesCell;
            
           % Excel File Creation         

           filename = [VarName '_Location' '_Ugrid' '_File.xlsx'];

           sheet = 1;

           xlRange1 = 'A2';
           
           xlswrite(filename,VarData1(RowData,ColumnData,1),sheet,xlRange1);

           xlRange2 = 'B2';
           
           xlswrite(filename,VarData1(RowData+1,ColumnData,1),sheet,xlRange2);              
            
            
            
        elseif ((LatIndicator_V==1) && (LongIndicator_V==1)) % If it is Staggered in V Direction
            
            VarData1=VarData(:,:,1);
            
            time=TimesCell;
            
           % Excel File Creation         

           filename = [VarName '_Location' '_Vgrid' '_File.xlsx'];

           sheet = 1;

           xlRange1 = 'A2';
           
           xlswrite(filename,VarData1(RowData,ColumnData,1),sheet,xlRange1);

           xlRange2 = 'B2';
           
           xlswrite(filename,VarData1(RowData,ColumnData+1,1),sheet,xlRange2);            
            
            
        else % If it is UnStaggered
            
            VarData1=VarData(:,:,1);
            
            time=TimesCell;
            
           % Excel File Creation         

           filename = [VarName '_Location' '_Mgrid' '_File.xlsx'];

           sheet = 1;

           xlRange1 = 'A2';
           
           xlswrite(filename,VarData1(RowData,ColumnData,1),sheet,xlRange1);           
            
            
        end
        
        
    elseif (r4==1) % 3D
        
        LatIndicator_U=strcmp(Lat,'XLAT_U');
        LongIndicator_U=strcmp(Long,'XLONG_U');
        LatIndicator_V=strcmp(Lat,'XLAT_V');
        LongIndicator_V=strcmp(Long,'XLONG_V');  
        
        if ((LatIndicator_U==1) && (LongIndicator_U==1)) % If it is Staggered in U Direction
            
            VarData1=VarData(:,:,:);
                                   
            time=TimesCell;
            
            len=length(time);
            
            for i=1:len
                
               VarData2(i,1)=VarData1(RowData,ColumnData,i) ;
                
            end
            
            for i=1:len
            
               VarData3(i,1)=VarData1(RowData+1,ColumnData,i) ;
                
            end            
            
           % Excel File Creation         

           filename = [VarName '_Location' '_Ugrid' '_File.xlsx'];

           sheet = 1;

           xlRange1 = 'A2';
           
           xlswrite(filename,time,sheet,xlRange1);

           xlRange2 = 'B2';
           
           xlswrite(filename,VarData2,sheet,xlRange2);     
           
           xlRange2 = 'C2';
           
           xlswrite(filename,VarData3,sheet,xlRange2);             
            
            
            
        elseif ((LatIndicator_V==1) && (LongIndicator_V==1)) % If it is Staggered in V Direction
            
            VarData1=VarData(:,:,:);
            
            time=TimesCell;
            
            len=length(time);
            
            for i=1:len
                
               VarData2(i,1)=VarData1(RowData,ColumnData,i) ;
                
            end
            
            for i=1:len
            
               VarData3(i,1)=VarData1(RowData,ColumnData+1,i) ;
                
            end            
            
           % Excel File Creation         

           filename = [VarName '_Location' '_Vgrid' '_File.xlsx'];

           sheet = 1;

           xlRange1 = 'A2';
           
           xlswrite(filename,time,sheet,xlRange1);

           xlRange2 = 'B2';
           
           xlswrite(filename,VarData2,sheet,xlRange2);     
           
           xlRange2 = 'C2';
           
           xlswrite(filename,VarData3,sheet,xlRange2);             
            
            
        else % If it is UnStaggered
            
            VarData1=VarData(:,:,:);
            
            time=TimesCell;
            
            len=length(time);
            
            for i=1:len
                
               VarData2(i,1)=VarData1(RowData,ColumnData,i) ;
                
            end
            
            for i=1:len
            
               VarData3(i,1)=VarData1(RowData+1,ColumnData,i) ;
                
            end            
            
           % Excel File Creation         

           filename = [VarName '_Location' '_Mgrid' '_File.xlsx'];

           sheet = 1;

           xlRange1 = 'A2';
           
           xlswrite(filename,time,sheet,xlRange1);

           xlRange2 = 'B2';
           
           xlswrite(filename,VarData2,sheet,xlRange2);     
           
        end        
        
    elseif (r5==1) % 4D
        
        LatIndicator_U=strcmp(Lat,'XLAT_U');
        LongIndicator_U=strcmp(Long,'XLONG_U');
        LatIndicator_V=strcmp(Lat,'XLAT_V');
        LongIndicator_V=strcmp(Long,'XLONG_V'); 
        
        Location_D3=get(handles.Location_D3,'String');
        Location_D3=str2double(Location_D3);
        
        if ((LatIndicator_U==1) && (LongIndicator_U==1)) % If it is Staggered in U Direction
            
            VarData1=VarData(:,:,:,:);
            
            time=TimesCell;
            
            len=length(time);
            
            for i=1:len
                
               VarData2(i,1)=VarData1(RowData,ColumnData,Location_D3,i) ;
                
            end
            
            for i=1:len
            
               VarData3(i,1)=VarData1(RowData+1,ColumnData,Location_D3,i) ;
                
            end            
            
           % Excel File Creation         

           filename = [VarName '_Location' '_Ugrid' '_File.xlsx'];

           sheet = 1;

           xlRange1 = 'A2';
           
           xlswrite(filename,time,sheet,xlRange1);

           xlRange2 = 'B2';
           
           xlswrite(filename,VarData2,sheet,xlRange2);     
           
           xlRange2 = 'C2';
           
           xlswrite(filename,VarData3,sheet,xlRange2);             
            
        elseif ((LatIndicator_V==1) && (LongIndicator_V==1)) % If it is Staggered in V Direction
            
            VarData1=VarData(:,:,:,:);
            
            time=TimesCell;
            
            len=length(time);
            
            for i=1:len
                
               VarData2(i,1)=VarData1(RowData,ColumnData,Location_D3,i) ;
                
            end
            
            for i=1:len
            
               VarData3(i,1)=VarData1(RowData,ColumnData+1,Location_D3,i) ;
                
            end            
            
           % Excel File Creation         

           filename = [VarName '_Location' '_Vgrid' '_File.xlsx'];

           sheet = 1;

           xlRange1 = 'A2';
           
           xlswrite(filename,time,sheet,xlRange1);

           xlRange2 = 'B2';
           
           xlswrite(filename,VarData2,sheet,xlRange2);     
           
           xlRange2 = 'C2';
           
           xlswrite(filename,VarData3,sheet,xlRange2);             
            
        else % If it is UnStaggered
            
            VarData1=VarData(:,:,:,:);
            
            time=TimesCell;
            
            len=length(time);
            
            for i=1:len
                
               VarData2(i,1)=VarData1(RowData,ColumnData,Location_D3,i) ;
                
            end           
  
            
           % Excel File Creation         

           filename = [VarName '_Location' '_Mgrid' '_File.xlsx'];

           sheet = 1;

           xlRange1 = 'A2';
           
           xlswrite(filename,time,sheet,xlRange1);

           xlRange2 = 'B2';
           
           xlswrite(filename,VarData2,sheet,xlRange2);                
       
            
        end        
        
    end    
    
    
end



function Long_Callback(hObject, eventdata, handles)
% hObject    handle to Long (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Long as text
%        str2double(get(hObject,'String')) returns contents of Long as a double


% --- Executes during object creation, after setting all properties.
function Long_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Long (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function D3_Callback(hObject, eventdata, handles)
% hObject    handle to D3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D3 as text
%        str2double(get(hObject,'String')) returns contents of D3 as a double


% --- Executes during object creation, after setting all properties.
function D3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Lat_Callback(hObject, eventdata, handles)
% hObject    handle to Lat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Lat as text
%        str2double(get(hObject,'String')) returns contents of Lat as a double


% --- Executes during object creation, after setting all properties.
function Lat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function D4_Callback(hObject, eventdata, handles)
% hObject    handle to D4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D4 as text
%        str2double(get(hObject,'String')) returns contents of D4 as a double


% --- Executes during object creation, after setting all properties.
function D4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Location_Lat_Callback(hObject, eventdata, handles)
% hObject    handle to Location_Lat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Location_Lat as text
%        str2double(get(hObject,'String')) returns contents of Location_Lat as a double


% --- Executes during object creation, after setting all properties.
function Location_Lat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Location_Lat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Location_D3_Callback(hObject, eventdata, handles)
% hObject    handle to Location_D3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Location_D3 as text
%        str2double(get(hObject,'String')) returns contents of Location_D3 as a double


% --- Executes during object creation, after setting all properties.
function Location_D3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Location_D3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Location_Long_Callback(hObject, eventdata, handles)
% hObject    handle to Location_Long (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Location_Long as text
%        str2double(get(hObject,'String')) returns contents of Location_Long as a double


% --- Executes during object creation, after setting all properties.
function Location_Long_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Location_Long (see GCBO)
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

% Selection Change GUI Effects

% Getting Radio Button values
r3=get(handles.r3,'Value');
r4=get(handles.r4,'Value');
r5=get(handles.r5,'Value');

% Conditional GUI Effects
if (r3==1)
    
    set(handles.Long,'Enable','on');
    set(handles.Lat,'Enable','on');
    
    set(handles.D3,'Enable','off');
    set(handles.D4,'Enable','off');
    
elseif (r4==1)
    
    set(handles.Long,'Enable','on');
    set(handles.Lat,'Enable','on');    
    set(handles.D3,'Enable','on');
    
    set(handles.D4,'Enable','off'); 
    
elseif (r5==1)
    
    set(handles.Long,'Enable','on');
    set(handles.Lat,'Enable','on');    
    set(handles.D3,'Enable','on');
    set(handles.D4,'Enable','on'); 
    
end


% --- Executes when selected object is changed in uipanel12.
function uipanel12_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel12 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Selection Change GUI Effects

% Getting Radio Button values
r5=get(handles.r5,'Value');
r6=get(handles.r6,'Value');
r7=get(handles.r7,'Value');

% Conditional GUI Effects
if (r6==1)
    
    set(handles.Location_Long,'Enable','off');
    set(handles.Location_Lat,'Enable','off');    
    set(handles.Location_D3,'Enable','off');
   
    
elseif (r7==1)
    
    if (r5==1)
    
        set(handles.Location_Long,'Enable','on');
        set(handles.Location_Lat,'Enable','on');    
        set(handles.Location_D3,'Enable','on');   
    
    elseif (r5==0)
    
        set(handles.Location_Long,'Enable','on');
        set(handles.Location_Lat,'Enable','on');    
        set(handles.Location_D3,'Enable','off');
        
    end
     
end
