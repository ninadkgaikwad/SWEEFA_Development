import math

def SingleAxisNS(SingleAxisNS_Input):
    ''' Calculates the Single Axis N-S Incidence Angle,
        Beam Component, Diffused Component and Reflected
        Component on the Collector and Total Solar 
        Irradiance.

        Args:
            Ib, Id, C, beta, phi, phic, tiltmin, tiltmax, rho

        Returns:
            Ic, Ibc, Idc, Irc, CosInciAngle

        Author: 
            Harshal Dhake, 191EE212
    '''

    keys = ('Ib', 'Id', 'C', 'beta', 'phi', 'phic', 'tiltmin', 'tiltmax', 'rho')
    Ib, Id, C, beta, phi, phic, tiltmin, tiltmax, rho = [SingleAxisNS_Input[k] for k in keys]

    betamax=90-tiltmin
    betamin=90-tiltmax


    if (beta>=betamin) and (beta<=betamax): # Acts as Single Axis N-S Tracker
        
        CosInciAngle=((math.cos((math.pi/180)*(beta)))*(math.cos((math.pi/180)*(phi-phic)))*(math.sin((math.pi/180)*(90-beta))))+(math.sin((math.pi/180)*(beta))*math.cos((math.pi/180)*(90-beta))); # Incidence Angle

        Ibc=Ib*CosInciAngle; # Beam Component on Collector

        Idc=Id*(((1+(math.cos((math.pi/180)*(90-beta))))/(2))); # Diffused Component on Collector

        Irc=rho*Ib*(math.sin((math.pi/180)*(beta))+C)*(((1+(math.cos((math.pi/180)*(90-beta))))/(2))); # Reflected Component on the Collector

        Ic=Ibc+Idc+Irc; # Total Solar Irradiance on the collector
        
    elif beta>betamax: # Acts as Fixed Tilt
        
        CosInciAngle=(math.cos((math.pi/180)*(beta))*math.cos((math.pi/180)*(phi-phic))*math.sin((math.pi/180)*(90-betamax)))+(math.sin((math.pi/180)*(beta))*math.cos((math.pi/180)*(90-betamax))); # Incidence Angle

        Ibc=Ib*CosInciAngle; # Beam Component on Collector

    # Idc=Id*(((1+(cos((math.pi/180)*(90-betamax))*cos((math.pi/180)*(phic))))/(2))); # Diffused Component on Collector
    
        Idc=Id*(((1+(math.cos((math.pi/180)*(90-betamax))))/(2))); # Diffused Component on Collector

    # Irc=rho*Ib*(sin((math.pi/180)*(beta))+C)*((1-(cos((math.pi/180)*(90-betamax))*cos((math.pi/180)*(phic))))/(2)); # Reflected Component on the Collector

        Irc=rho*Ib*(math.sin((math.pi/180)*(beta))+C)*((1-(math.cos((math.pi/180)*(90-betamax))))/(2)); # Reflected Component on the Collector 
    
        Ic=Ibc+Idc+Irc; # Total Solar Irradiance on the collector
        
    elif beta<betamin: # Acts as Fixed Tilt
        
        CosInciAngle=(math.cos((math.pi/180)*(beta))*math.cos((math.pi/180)*(phi-phic))*math.sin((math.pi/180)*(90-betamin)))+(math.sin((math.pi/180)*(beta))*math.cos((math.pi/180)*(90-betamin))); # Incidence Angle

        Ibc=Ib*CosInciAngle; # Beam Component on Collector

        #Idc=Id*(((1+(cos((math.pi/180)*(90-betamin))*cos((math.pi/180)*(phic))))/(2))); # Diffused Component on Collector
        
        Idc=Id*(((1+(math.cos((math.pi/180)*(90-betamin))))/(2))); # Diffused Component on Collector

        #Irc=rho*Ib*(sin((math.pi/180)*(beta))+C)*((1-(cos((math.pi/180)*(90-betamin))*cos((math.pi/180)*(phic))))/(2)); # Reflected Component on the Collector

        Irc=rho*Ib*(math.sin((math.pi/180)*(beta))+C)*((1-(math.cos((math.pi/180)*(90-betamin))))/(2)); # Reflected Component on the Collector
        
        Ic=Ibc+Idc+Irc; # Total Solar Irradiance on the collector
        
    SingleAxisNS_Output = dict({'Ic': Ic, 'Ibc': Ibc, 'Idc': Idc, 'Irc': Irc, 'CosInciAngle': CosInciAngle})    
    
    return SingleAxisNS_Output