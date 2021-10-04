%% TestPlot_1

Data1=[1:100]';

Data2=[0:10:990]';

Data3=[1:100]';

    %axes(handles.G1);
    figure(1);
    grid on
    hold on 
    title(['Plot of ']);
    xlabel(['Longitudes [Degrees]']);
    ylabel(['Latitudes [Degrees]']);
    %Plots NETCDF Variables
    plot(Data3,Data1,'-ob'); 
    plot(Data3,Data2,'-*r');
    hold off;  