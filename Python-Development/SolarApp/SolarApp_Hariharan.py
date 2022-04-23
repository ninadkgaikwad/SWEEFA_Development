"""Python implementations of the 6 functions assigned to Sharvani
This module contains all the python implementations of the 6 functions,
originally from the SWEEFA MATLAB application. The functions in this module
are listed below:
    AltiAzi
    ArrayIncidenceLoss
    BeamDiffGHI
    BeamDiffModelClearIndex
    ClearnessIndex
    DayToMonthDataCoverterApp
Typical usage example:
    RainSnowMonths = 1
    yr = 1
    mr = 1
    YearRain = 1
    MonthRain = 1
    LeapYear = 1
    NormalClearSky = 1
    ModifiedClearSky = 1

    ClearnessIndex_input = {"RainSnowMonths" : RainSnowMonths ,"yr" : yr ,"mr" : mr ,"YearRain" : YearRain ,"MonthRain" : MonthRain ,"LeapYear" : LeapYear ,"NormalClearSky" : NormalClearSky ,"ModifiedClearSky" : ModifiedClearSky }
    ClearnessIndex_output = ClearnessIndex.ClearnessIndex(ClearnessIndex_input)

Author: Hariharan
"""

import numpy as np
import pandas as pd

"""A one line summary of the module or program, terminated by a period.
Leave one blank line.  The rest of this docstring should contain an
overall description of the module or program.  Optionally, it may also
contain a brief description of exported classes and functions and/or usage
examples.

Args:
    AltiAzi_input: A dictionary containing keys
    dec (numpy.int64)
    L (numpy.int64)
    H (numpy.array)

Returns:
    AltiAzi_output: A dictionary containing keys
    beta (numpy.int64)
    phi (numpy.int64)

Author: Hariharan: 21/03/22
"""
def AltiAzi(AltiAzi_input):
    dec = AltiAzi_input['dec']
    L = AltiAzi_input['L']
    H = AltiAzi_input['H']

    len2 = H.shape[0]
    beta = np.zeros(len2)
    azi1 = np.zeros(len2)
    azi11 = np.zeros(len2)
    azi2 = np.zeros(len2)
    azi22 = np.zeros(len2)
    phi = np.zeros(len2)
    
    for j in np.arange(0, len2):
        beta[j] = (180/np.pi)*(np.arcsin((np.cos(L*(np.pi/180))*np.cos(dec*(np.pi/180))
                     * np.cos(H[j]*(np.pi/180)))+(np.sin(L*(np.pi/180))*np.sin(dec*(np.pi/180)))))
        azi1[j] = (180/np.pi)*(np.arcsin((np.cos(dec*(np.pi/180)) *
                                          np.sin(H[j]*(np.pi/180)))/(np.cos(beta[j]*(np.pi/180)))))
        azi11[j] = np.abs(azi1[j])
        azi2[j] = 180-azi11[j]
        azi22[j] = np.abs(azi2[j])
        x = np.cos(H[j]*(np.pi/180))
        y = (np.tan(dec*(np.pi/180)))/(np.tan(L*(np.pi/180)))
    
        if (x >= y):
            phi[j] = azi1[j]
        else:
           if (azi1[j] >= 0):
                phi[j] = azi2[j]
           else:
                phi[j] = -(azi2[j])
    
    AltiAzi_output = {'beta' : beta, 'phi' : phi}

    return AltiAzi_output



"""A one line summary of the module or program, terminated by a period.
Leave one blank line.  The rest of this docstring should contain an
overall description of the module or program.  Optionally, it may also
contain a brief description of exported classes and functions and/or usage
examples.

Args:
    ArrayIncidenceLoss_input: A dictionary containing keys
    Ic (numpy.int64)
    CosInciAngle (numpy.int64)
    bo (numpy.int64)
    SF (numpy.int64)

Returns:
    ArrayIncidenceLoss_output: A dictionary containing keys
    Iciam: (numpy.int64)
    Icsf: (numpy.int64)

Author: Hariharan: 21/03/22
"""

def ArrayIncidenceLoss( ArrayIncidenceLoss_input ):
    Ic = ArrayIncidenceLoss_input['Ic']
    CosInciAngle = ArrayIncidenceLoss_input['CosInciAngle']
    bo = ArrayIncidenceLoss_input['bo']
    SF = ArrayIncidenceLoss_input['SF']
    
    '''Calculating Incidence Angle Modifier'''
    Fiam=1-(bo*((1/CosInciAngle)-1)) 
    '''Solar Power Available after Incidence Angle Modification'''
    Iciam=Ic*Fiam
    '''Solar Power Available For PV Module after Soiling Effect'''
    Icsf=Iciam*(1-(SF/100))
    
    ArrayIncidenceLoss_output = {"Iciam" : Iciam, "Icsf" : Icsf}
    
    return ArrayIncidenceLoss_output


"""A one line summary of the module or program, terminated by a period.
Leave one blank line.  The rest of this docstring should contain an
overall description of the module or program.  Optionally, it may also
contain a brief description of exported classes and functions and/or usage
examples.

Args:
    BeamDiffGHI_input: A dictionary containing keys
    n: (numpy.int64)
    GHI: (numpy.int64)
    beta: (numpy.int64)

Returns:
    BeamDiffGHI_output: A dictionary containing keys
    Ib: (numpy.int64)
    Id: (numpy.int64)
    C: (numpy.int64)

Author: Hariharan: 21/03/22
"""

def BeamDiffGHI(BeamDiffGHI_input):
    n = BeamDiffGHI_input["n"]
    GHI = BeamDiffGHI_input["GHI"]
    beta = BeamDiffGHI_input["beta"]
    
    C=0.095+(0.04*np.sin((np.pi/180)*(360/365)*(n-100)))
    Ib=GHI/(np.sin((np.pi/180)*beta)+C)
    Id=C*Ib
    
    BeamDiffGHI_output = {"Ib" : Ib, "Id" : Id, "C" : C}
    
    return BeamDiffGHI_output


"""A one line summary of the module or program, terminated by a period.
Leave one blank line.  The rest of this docstring should contain an
overall description of the module or program.  Optionally, it may also
contain a brief description of exported classes and functions and/or usage
examples.

Args:
    A dictionary containing keys
     n (numpy.int64)
     beta (numpy.int64)
     ClearIndex (numpy.int64)
     DiffIndex (numpy.int64)

Returns:
    A dictionary containing keys
     Ib (numpy.int64)
     Id (numpy.int64)
     C (numpy.int64)
     A (numpy.int64)

Author: Hariharan: 21/03/22
"""

def BeamDiffModelClearIndex( BeamDiffModelClearIndex_input ):
     n = BeamDiffModelClearIndex_input["n"]
     beta = BeamDiffModelClearIndex_input["beta"]
     ClearIndex = BeamDiffModelClearIndex_input["ClearIndex"]
     DiffIndex = BeamDiffModelClearIndex_input["DiffIndex"]

     '''Air Mass Ratio'''
     m=(1/np.sin((np.pi/180)*beta)) 
 
     '''Apparent Extra-Terrestrial Flux'''
     A=1160+(75*np.sin((np.pi/180)*(360/365)*(n-275))) 
    
     '''k is Dimensionless factor for Optical Depth'''
     k=0.174+(0.035*np.sin((np.pi/180)*(360/365)*(n-100))) 

     '''Sky-Diffuse Factor'''
     C=0.095+(0.04*np.sin((np.pi/180)*(360/365)*(n-100))) 
    
     Ib=ClearIndex*(A*np.exp(-k*m))
    
     Id=(1+DiffIndex)*(C*Ib)
     
     BeamDiffModelClearIndex_output = {"Ib" : Ib, "Id" : Id,"C" : C, "A" : A}
     
     return BeamDiffModelClearIndex_output


"""A one line summary of the module or program, terminated by a period.
Leave one blank line.  The rest of this docstring should contain an
overall description of the module or program.  Optionally, it may also
contain a brief description of exported classes and functions and/or usage
examples.

Args:
    ClearnessIndex_input : A dictionary containing keys
    RainSnowMonths (numpy.int64)
    yr (numpy.int64)
    mr (numpy.int64)
    YearRain (numpy.int64)
    MonthRain (numpy.int64)
    LeapYear (numpy.int64)
    NormalClearSky (numpy.int64)
    ModifiedClearSky (numpy.int64)

Returns:
    ClearnessIndex_output: A dictionary containing keys
    ClearIndex (numpy.int64)
    DiffIndex (numpy.int64)

Author: Hariharan: 21/03/22
"""


def ClearnessIndex(ClearnessIndex_input):
    # % Month Days for Non-Leap Year
    RainSnowMonths = ClearnessIndex_input["RainSnowMonths"]
    yr = ClearnessIndex_input["yr"]
    mr = ClearnessIndex_input["mr"]
    YearRain = ClearnessIndex_input["YearRain"]
    MonthRain = ClearnessIndex_input["MonthRain"]
    LeapYear = ClearnessIndex_input["LeapYear"]
    NormalClearSky = ClearnessIndex_input["NormalClearSky"]
    ModifiedClearSky = ClearnessIndex_input["ModifiedClearSky"]
    jannl = np.arange(1, 31 + 1)
    febnl = np.arange(32, 59 + 1)
    marnl = np.arange(60, 90 + 1)
    aprnl = np.arange(91, 120 + 1)
    maynl = np.arange(121, 151 + 1)
    junnl = np.arange(152, 181 + 1)
    julnl = np.arange(182, 212 + 1)
    augnl = np.arange(213, 243 + 1)
    sepnl = np.arange(244, 273 + 1)
    octnl = np.arange(274, 304 + 1)
    novnl = np.arange(305, 334 + 1)
    decnl = np.arange(335, 365 + 1)

    # % Month Days for Leap Year
    janlp = np.arange(1, 31 + 1)
    feblp = np.arange(32, 60 + 1)
    marlp = np.arange(61, 91 + 1)
    aprlp = np.arange(92, 121 + 1)
    maylp = np.arange(122, 152 + 1)
    junlp = np.arange(153, 182 + 1)
    jullp = np.arange(183, 213 + 1)
    auglp = np.arange(214, 244 + 1)
    seplp = np.arange(245, 274 + 1)
    octlp = np.arange(275, 305 + 1)
    novlp = np.arange(306, 335 + 1)
    declp = np.arange(336, 366 + 1)

    if (ModifiedClearSky == 1):

        if LeapYear == 0:

            Year = np.arange(1, 365 + 1)
            # % Gives Raindays an  d Cell Structure for Raindays
            [RainDays] = RainSnowMonthDays(RainSnowMonths, LeapYear)

            if yr == 1:
                # % Total Number of Rainy Months
                NumRainMonth = length(find(RainSnowMonths))

                Rain = YearRain/NumRainMonth

                a1 = 1.527e+13 % (-2.669e+17, 2.669e+17)
                b1 = -5082 % (-2.863e+06, 2.853e+06)
                c1 = 909 % (-2.563e+05, 2.581e+05)
                a2 = 0.6984 % (0.06669, 1.33)
                b2 = 327.5 % (-2132, 2787)
                c2 = 809.3 % (-3740, 5359)

                ClearIndexx = a1*np.exp(-((Rain-b1)/c1) ^ 2) + \
                    a2*np.exp(-((Rain-b2)/c2) ^ 2)

                for i in Year:

                    if i in RainDays:

                        ClearIndex[i] = ClearIndexx

                    else:

                        ClearIndex[i] = 1

                    # % As Beam Radiation scatters more Diffuse Radiation increases in more clouds
                DiffIndex = 1-ClearIndex

        elif mr == 1:

            Rain = MonthRain
            # %(-2.669e+17, 2.669e+17)
            a1 = 1.527e+13
            # %(-2.863e+06, 2.853e+06)
            b1 = -5082
            # %(-2.563e+05, 2.581e+05)
            c1 = 909
            # %(0.06669, 1.33)
            a2 = 0.6984
            # %(-2132, 2787)
            b2 = 327.5
            # %(-3740, 5359)
            c2 = 809.3

            for i in range(1, 12 + 1):
                ClearIndexx[i] = a1*np.exp(-((Rain(i, 1)-b1)/c1)
                                           ^ 2) + a2*np.exp(-((Rain(i, 1)-b2)/c2) ^ 2)

            if ClearIndexx[i] > 0.999:

                ClearIndexx[i] = 1

            #   % m=0 % Debugger

            for k in Year:
                if (k in jannl):
                    ClearIndex[k] = ClearIndexx[0]
                elif (k in febnl):
                    ClearIndex[k] = ClearIndexx[1]
                elif (k in marnl):
                    ClearIndex[k] = ClearIndexx[2]
                elif (k in aprnl):
                    ClearIndex[k] = ClearIndexx[3]
                elif (k in maynl):
                    ClearIndex[k] = ClearIndexx[4]
                elif (k in junnl):
                    ClearIndex[k] = ClearIndexx[5]
                elif (k in julnl):
                    ClearIndex[k] = ClearIndexx[6]
                elif (k in augnl):
                    ClearIndex[k] = ClearIndexx[7]
                elif (k in sepnl):
                    ClearIndex[k] = ClearIndexx[8]
                elif (k in octnl):
                    ClearIndex[k] = ClearIndexx[9]
                elif (k in novnl):
                    ClearIndex[k] = ClearIndexx[10]
                elif (k in decnl):
                    ClearIndex[k] = ClearIndexx[11]

            # % As Beam Radiation scatters more Diffuse Radiation increases in more clouds
            DiffIndex = 1-ClearIndex

        elif LeapYear == 1:
            Year = np.ar5ange(1, 366 + 1)

            # % Gives Raindays and Cell Structure for Raindays
            [RainDays] = RainSnowMonthDays(RainSnowMonths, LeapYear)

            if yr == 1:
                # % Total Number of Rainy Months
                NumRainMonth = (find(RainSnowMonths)).shape[0]

                Rain = YearRain/NumRainMonth

                a1 = 1.527e+13 % (-2.669e+17, 2.669e+17)
                b1 = -5082 % (-2.863e+06, 2.853e+06)
                c1 = 909 % (-2.563e+05, 2.581e+05)
                a2 = 0.6984 % (0.06669, 1.33)
                b2 = 327.5 % (-2132, 2787)
                c2 = 809.3 % (-3740, 5359)

                ClearIndexx = a1*np.exp(-((Rain-b1)/c1)
                                        ^ 2) + a2*np.exp(-((Rain-b2)/c2) ^ 2)

                for i in Year:

                    if (i in RainDays):

                        ClearIndex[i] = ClearIndexx

                    else:

                        ClearIndex[i] = 1
            # % As Beam Radiation scatters more Diffuse Radiation increases in more clouds
            DiffIndex = 1-ClearIndex

        elif mr == 1:
            Rain = MonthRain
            # %(-2.669e+17, 2.669e+17)
            a1 = 1.527e+13
            # %(-2.863e+06, 2.853e+06)
            b1 = -5082
            # %(-2.563e+05, 2.581e+05)
            c1 = 909
            # %(0.06669, 1.33)
            a2 = 0.6984
            # %(-2132, 2787)
            b2 = 327.5
            # %(-3740, 5359)
            c2 = 809.3

            for i in np.arange(1, 12 + 1):
                ClearIndexx[i] = a1*np.exp(-((Rain(i, 1)-b1)/c1)
                                           ^ 2) + a2*np.exp(-((Rain(i, 1)-b2)/c2) ^ 2)

            if ClearIndexx(1, i) > 0.999:

                ClearIndexx[i] = 1

            # % Debugger
            m = 0
            for k in Year:
                m = m+1

                if (k in janlp):
                    ClearIndex[k] = ClearIndexx[1]
                elif (k in feblp):
                    ClearIndex[k] = ClearIndexx[2]
                elif (k in marlp):
                    ClearIndex[k] = ClearIndexx[3]
                elif (k in aprlp):
                    ClearIndex[k] = ClearIndexx[4]
                elif (k in maylp):
                    ClearIndex[k] = ClearIndexx[5]
                elif (k in junlp):
                    ClearIndex[k] = ClearIndexx[6]
                elif (k in jullp):
                    ClearIndex[k] = ClearIndexx[7]
                elif (k in auglp):
                    ClearIndex[k] = ClearIndexx[8]
                elif (k in seplp):
                    ClearIndex[k] = ClearIndexx[9]
                elif (k in octlp):
                    ClearIndex[k] = ClearIndexx[10]
                elif (k in novlp):
                    ClearIndex[k] = ClearIndexx[11]
                elif (k in declp):
                    ClearIndex[k] = ClearIndexx[12]

            # % As Beam Radiation scatters more Diffuse Radiation increases in more clouds
            DiffIndex = 1-ClearIndex

        elif (NormalClearSky == 1):

            if (LeapYear == 0):

                Year = np.arange(1, 365 + 1)

                ClearIndex = np.ones(1, Year.shape[0])

                DiffIndex = np.zeros(1, Year.shape[0])

            elif (LeapYear == 1):

                Year = np.arange(1, 366 + 1)

                ClearIndex = np.ones(1, Year.shape[0])

                DiffIndex = np.zeros(1, Year.shape[0])
        
        ClearnessIndex_output = {"ClearIndex" : ClearIndex, "DiffIndex" : DiffIndex}
        
        return ClearnessIndex_output


"""A one line summary of the module or program, terminated by a period.
Leave one blank line.  The rest of this docstring should contain an
overall description of the module or program.  Optionally, it may also
contain a brief description of exported classes and functions and/or usage
examples.

Args:
    DayToMonthDataCoverterApp_input : A dictionary containing keys
    ProcessedData (numpy.int64)
    DataCols (numpy.int64)
    AvgOrAdd (numpy.int64)

Returns:
    DayToMonthDataCoverterApp_output: A dictionary containing keys
    ProcessedData1 (numpy.int64)

Author: Hariharan: 21/03/22
"""


def DayToMonthDataCoverterApp(DayToMonthDataCoverterApp_input):
    ProcessedData = DayToMonthDataCoverterApp_input["ProcessedData"]
    DataCols = DayToMonthDataCoverterApp_input["DataCols"]
    AvgOrAdd = DayToMonthDataCoverterApp_input["AvgOrAdd"]
    Row = ProcessedData.shape[0]
    Col = ProcessedData.shape[1]
    RowNew = ((Row + 29)/30)+1

    ProcessedData1 = np.zeros(RowNew, (2+DataCols))
    Index1 = 0
    MonthMemo = np.zeros(1, 2)
    MonthMemo[0][0] = ProcessedData[0][1]
    Add = np.zeros(1, DataCols)
    Avg = np.zeros(1, 1, DataCols)

    index = 1

    for i in range(0, Row):

        if i <= Row:
            MonthMemo[0][1] = ProcessedData[i-1][1]

        if ((MonthMemo[0][0] != MonthMemo[0][1]) | (i == Row+1)):

            Index1 = Index1+1

            ProcessedData1[Index1-1][0] = MonthMemo[0][0]

            ProcessedData1[Index1-1][1] = ProcessedData[i-2][2]

            for k in range(0, DataCols - 1):

                Indicator = AvgOrAdd(1, k)

                if Indicator == 1:

                    ProcessedData1[Index1, (k+3)] = Add[0][k-1]

                elif Indicator == 0:

                    ProcessedData1[Index1, (k+3)] = sum(Avg[1, :, k])/(index-1)

            MonthMemo[0][0] = MonthMemo[0][1]

            Add = np.zeros(1, DataCols)

            Avg = np.zeros(1, 1, DataCols)

            index = 0

        elif MonthMemo[0][0] == MonthMemo[0][1]:

            for k in range(0, DataCols - 1):

                Indicator = AvgOrAdd(1, k)

                if Indicator == 1:

                    Add[0][k-1] = Add[0][k-1]+ProcessedData(i, (k+3))

                elif Indicator == 0:
                    Avg[1:index:k] = ProcessedData[i, (k+3)]

        index = index+1

    filename = 'Converted_File_MonthlyResolution.xlsx'

    sheet = 1

    xlRange = 'A2'

    pd.to_excel(filename, ProcessedData1, sheet, xlRange)

    DayToMonthDataCoverterApp_output = {"ProcessedData1" : ProcessedData1}

    return ProcessedData1

