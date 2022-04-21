import math

def SingleAxisEW(SingleAxisEW_Input):
    ''' Calculates the Single Axis E-W Incidence Angle,
        Beam Component, Diffused Component and Reflected
        Component on the Collector and Total Solar 
        Irradiance.

        Args:
            Ib, Id, C, beta, phi, phicmin, phicmax, tilt, rho

        Returns:
            Ic, Ibc, Idc, Irc, CosInciAngle

        Author: 
            Harshal Dhake, 191EE212
    '''

    keys = ('Ib', 'Id', 'C', 'beta', 'phi', 'phicmin', 'phicmax', 'tilt', 'rho')
    Ib, Id, C, beta, phi, phicmin, phicmax, tilt, rho = [SingleAxisEW_Input[k] for k in keys]

    #Resued Terms
    radianConvert = math.pi / 180
    cos_beta = math.cos(radianConvert * beta)
    sin_beta = math.sin(radianConvert * beta)
    sin_tilt = math.sin(radianConvert * tilt)
    cos_tilt = math.cos(radianConvert * tilt)
    cos_phi = math.cos(radianConvert * phi)

    if (phi <= phicmax) and (phi >= phicmin): # Acts as Single Axis E-W Tracker
        # Incidence Angle
        CosInciAngle = cos_beta * sin_tilt + sin_beta * cos_tilt

        # Beam Component on Collector
        Ibc = Ib * CosInciAngle

        Idc = Id * ((1 + (cos_tilt * cos_phi)) / 2)
        # Diffused Component on Collector

        Irc = rho * Ib * (sin_beta + C) * ((1 - (cos_tilt * cos_phi)) / 2)
        # Reflected Component on the Collector

        Ic = Ibc + Idc + Irc
        # Total Solar Irradiance on the collector

    elif phi > phicmax:  # Acts as Fixed Tilt

        CosInciAngle = cos_beta * math.cos(radianConvert*(phi-phicmax)) * sin_tilt + sin_beta * cos_tilt
        # Incidence Angle

        Ibc = Ib * CosInciAngle
        # Beam Component on Collector

        Idc = Id * ((1 + (cos_tilt * math.cos(radianConvert * phicmax))) / 2 )
        # Diffused Component on Collector

        Irc = rho * Ib * (sin_beta + C) * ((1 - (cos_tilt * math.cos(radianConvert * phicmax))) / 2)
        # Reflected Component on the Collector

        Ic = Ibc + Idc + Irc
        # Total Solar Irradiance on the collector

    elif phi < phicmin:  # Acts as Fixed Tilt

        CosInciAngle = cos_beta * math.cos(radianConvert*(phi-phicmin)) * sin_tilt + sin_beta * cos_tilt
        # Incidence Angle

        Ibc = Ib * CosInciAngle
        # Beam Component on Collector

        Idc = Id * ((1 + (cos_tilt * math.cos(radianConvert * phicmin))) / 2 )
        # Diffused Component on Collector

        Irc = rho * Ib * (sin_beta + C) * ((1 - (cos_tilt * math.cos(radianConvert * phicmin))) / 2)
        # Reflected Component on the Collector

        Ic = Ibc + Idc + Irc
        # Total Solar Irradiance on the collector

    SingleAxisEW_Output = dict({'Ic': Ic, 'Ibc': Ibc, 'Idc': Idc, 'Irc': Irc, 'CosInciAngle': CosInciAngle})
    return SingleAxisEW_Output
