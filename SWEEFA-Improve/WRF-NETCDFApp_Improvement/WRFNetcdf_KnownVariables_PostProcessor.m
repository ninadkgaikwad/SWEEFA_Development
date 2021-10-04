function [WRFNetcdf_KnownVariables_PostProcessed] = WRFNetcdf_KnownVariables_PostProcessor(WRFnetcdf_KnownVariables,Plant_Index)

%% Function Details

% WRFnetcdf_KnownVariables = A 3-D Matrix of all the Known WRF-NETCDF Variables for Post Processing
% Plant_Index = If Plant_Index = 1, Then Wind Plant is Selected ; If Plant_Index = 2, Then Solar Plant is Selected

%% Post Processing the WRFnetcdf_KnownVariables

% Computing the Size of WRFnetcdf_KnownVariables

[Row, Col, Z]=size(WRFnetcdf_KnownVariables);

% Post-Processing WRFnetcdf_KnownVariables based on Plant Selected
if (Plant_Index==1) % Wind Plant is Selected
    
    % Computing the Number of Columns for WRFNetcdf_KnownVariables_PostProcessed
    
    Col1=4; % [WindSpeed, Temperature, WindDirection, PlantStatus]
    
    % Intializing WRFNetcdf_KnownVariables_PostProcessed
    
    WRFNetcdf_KnownVariables_PostProcessed=zeros(Row,Col1,Z);
    
    % Filling the WRFNetcdf_KnownVariables_PostProcessed 
    
    for i=1:Z % For each Different Location
        
       for j=1:Row % For each Date-Time Stamp
           
           % Computing Wind-Speed
           
           WRFNetcdf_KnownVariables_PostProcessed(j,1,i)=sqrt(WRFnetcdf_KnownVariables(j,1,i)^(2)+WRFnetcdf_KnownVariables(j,2,i)^(2));
           
           % Computing Temperature
           
           WRFNetcdf_KnownVariables_PostProcessed(j,2,i)=WRFnetcdf_KnownVariables(j,3,i)- 273.15 ;
           
           % Computing Wind-Direction
           
           WRF_U_Earth=(WRFnetcdf_KnownVariables(j,1,i)*WRFnetcdf_KnownVariables(j,5,i))-(WRFnetcdf_KnownVariables(j,2,i)*WRFnetcdf_KnownVariables(j,4,i));
           
           WRF_V_Earth=(WRFnetcdf_KnownVariables(j,2,i)*WRFnetcdf_KnownVariables(j,5,i))+(WRFnetcdf_KnownVariables(j,1,i)*WRFnetcdf_KnownVariables(j,4,i));
           
           % Computing Wind_direction From North using WRF_U_Earth and WRF_V_Earth
           if ((WRF_U_Earth>=0)&&(WRF_V_Earth>=0)) % U and V Components are in the I-Quadrant
               
               WRFNetcdf_KnownVariables_PostProcessed(j,3,i)=(180/pi)*(acos(WRF_V_Earth/WRFNetcdf_KnownVariables_PostProcessed(j,1,i)));
               
           elseif ((WRF_V_Earth<0)&&(WRF_U_Earth>0)) % U and V Components are in the IV-Quadrant
               
               WRFNetcdf_KnownVariables_PostProcessed(j,3,i)=(180/pi)*(acos(WRF_V_Earth/WRFNetcdf_KnownVariables_PostProcessed(j,1,i)));
               
           elseif ((WRF_V_Earth>0)&&(WRF_U_Earth<0)) % U and V Components are in the II-Quadrant
               
               WRFNetcdf_KnownVariables_PostProcessed(j,3,i)=360-((180/pi)*(acos(WRF_V_Earth/WRFNetcdf_KnownVariables_PostProcessed(j,1,i))));
               
           else % U and V Components are in the III-Quadrant
               
               WRFNetcdf_KnownVariables_PostProcessed(j,3,i)=((180/pi)*(acos(WRF_V_Earth/WRFNetcdf_KnownVariables_PostProcessed(j,1,i))))+(2*(90-(((180/pi)*(acos(WRF_V_Earth/WRFNetcdf_KnownVariables_PostProcessed(j,1,i))))-90)));
                              
           end        
                     
           % Computing Plant-Status
           
           WRFNetcdf_KnownVariables_PostProcessed(j,4,i)=1;
           
       end
        
    end    
    
elseif (Plant_Index==2) % Solar Plant is Selected
    
    % Computing the Number of Columns for WRFNetcdf_KnownVariables_PostProcessed
    
    Col1=4; % [WindSpeed, Temperature, SolarIrradiance, PlantStatus]
    
    % Intializing WRFNetcdf_KnownVariables_PostProcessed
    
    WRFNetcdf_KnownVariables_PostProcessed=zeros(Row,Col1,Z);    
    
    % Filling the WRFNetcdf_KnownVariables_PostProcessed
    
    for i=1:Z % For each Different Location
        
       for j=1:Row % For each Date-Time Stamp
           
           % Computing Wind-Speed
           
           WRFNetcdf_KnownVariables_PostProcessed(j,1,i)=sqrt(WRFnetcdf_KnownVariables(j,1,i)^(2)+WRFnetcdf_KnownVariables(j,2,i)^(2));
           
           % Computing Temperature
           
           WRFNetcdf_KnownVariables_PostProcessed(j,2,i)=WRFnetcdf_KnownVariables(j,3,i)- 273.15 ;
           
           % Computing Solar-Irradiance
           
           WRFNetcdf_KnownVariables_PostProcessed(j,3,i)=WRFnetcdf_KnownVariables(j,4,i);
           
           % Computing Plant-Status
           
           WRFNetcdf_KnownVariables_PostProcessed(j,4,i)=1;
           
       end
        
    end
    
end

end

