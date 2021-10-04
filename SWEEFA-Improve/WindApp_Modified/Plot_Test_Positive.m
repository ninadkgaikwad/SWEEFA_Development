%% Ploting Power Curve:
    
  axes(handles.G1);
  grid on
  hold on 
  title('Wind Turbine Power Curve');
  xlabel('Wind Speed [m/s]');
  ylabel('Power [kW]');
  xlim([0 inf]);
  ylim([0 inf]); 
  %Plots Cp vs TSR curve
  plot(PowerCurve(:,1),PowerCurve(:,2),'b--o','LineWidth',2);  
  hold off;
  
  
   %% Initializing Cell Structure For Power Curve:
    
    PowerCurve_T1 = cell(1,sub_T1);
    
    for i = 1:sub_T1        
    
    % Loading Wind Power File into Simulation:
    [filename,pathname]=uigetfile({'*.*'},'Power Curve File Selector For WG_T1');
    fullpathname=strcat(pathname, filename);
    TempFile=xlsread(fullpathname);
    
    PowerCurve_T1(1,i) = {TempFile};
    
    end
    
    setappdata(Wind_GUI_1,'PowerCurve_T1',PowerCurve_T1);