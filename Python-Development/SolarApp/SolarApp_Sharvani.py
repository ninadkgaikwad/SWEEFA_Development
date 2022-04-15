"""Python implementations of the 6 functions assigned to Sharvani

This module contains all the python implementations of the 6 functions,
originally from the SWEEFA MATLAB application. The functions in this module
are listed below:

    Days_To_Compute
    Deci_To_HM
    Declination
    Double_Axis
    Fixed_Tilt
    GHI_Gau_Sin_Avg

Typical usage example:

    days_To_Compute_Input  = {"leap_Year":0, "start_Day":1, "start_Month":1, "end_Day":20, "end_Month":2}
    days_To_Compute_Output = Days_To_Compute(days_To_Compute_Input)

Author: Sharvani Laxmi Somayaji
"""
import numpy as np
from SolarApp_Neha import GHI_Gaussian_Distri
from SolarApp_Neha import GHI_Sinusoidal_Distri


def Days_To_Compute(days_To_Compute_Input):
    """A one line summary of the module or program, terminated by a period.

    Leave one blank line.  The rest of this docstring should contain an
    overall description of the module or program.  Optionally, it may also
    contain a brief description of exported classes and functions and/or usage
    examples.

    Args:
      days_To_Compute_Input (dict): Python dictionary with the following elements:
        leap_Year (int)
        start_Day (int)
        start_Month (int)
        end_Day (int)
        end_Month (int)

    Returns:
      days_To_Compute_Output (dict): Python dictionary with the following elements:
        start_Day (int)
        end_Day (int)

    Author: Sharvani Laxmi Somayaji
    """

    #UNTITLED3 Summary of this function goes here
    #   Detailed explanation goes here

    leap_Year = days_To_Compute_Input["leap_Year"]
    start_Day = days_To_Compute_Input["start_Day"]
    start_Month = days_To_Compute_Input["start_Month"]
    end_Day = days_To_Compute_Input["end_Day"]
    end_Month = days_To_Compute_Input["end_Month"]

    start_Month_Start_Day = 0

    end_Month_Start_Day = 0

    if leap_Year == 0:

        start_Month_Start_Day_Dict = {
            1: 1,
            2: 32,
            3: 60,
            4: 91,
            5: 121,
            6: 152,
            7: 182,
            8: 213,
            9: 244,
            10: 274,
            11: 305,
            12: 335
        }
        start_Month_Start_Day = start_Month_Start_Day_Dict[start_Month]

        end_Month_Start_Day_Dict = {
            1: 1,
            2: 32,
            3: 60,
            4: 91,
            5: 121,
            6: 152,
            7: 182,
            8: 213,
            9: 244,
            10: 274,
            11: 305,
            12: 335
        }
        end_Month_Start_Day = end_Month_Start_Day_Dict[end_Month]

    elif leap_Year == 1:

        start_Month_Start_Day_Dict = {
            1: 1,
            2: 32,
            3: 61,
            4: 92,
            5: 122,
            6: 153,
            7: 183,
            8: 214,
            9: 245,
            10: 275,
            11: 306,
            12: 336
        }
        start_Month_Start_Day = start_Month_Start_Day_Dict[start_Month]

        end_Month_Start_Day_Dict = {
            1: 1,
            2: 32,
            3: 61,
            4: 92,
            5: 122,
            6: 153,
            7: 183,
            8: 214,
            9: 245,
            10: 275,
            11: 306,
            12: 336
        }
        end_Month_Start_Day = end_Month_Start_Day_Dict[end_Month]

    start_Day = start_Month_Start_Day + start_Day - 1

    end_Day = end_Month_Start_Day + end_Day - 1

    days_To_Compute_Output = {"start_Day":start_Day, "end_Day":end_Day}

    return days_To_Compute_Output


def Deci_To_HM(deci_To_HM_Input):
    """A one line summary of the module or program, terminated by a period.

    Leave one blank line.  The rest of this docstring should contain an
    overall description of the module or program.  Optionally, it may also
    contain a brief description of exported classes and functions and/or usage
    examples.

    Args:
      deci_To_HM_Input (dict): Python dictionary with the following element:
        td (numpy.ndarray)

    Returns:
      deci_To_HM_Output (dict): Python dictionary with the following elements:
        hr (numpy.ndarray)
        min (numpy.ndarray)
        sec (numpy.ndarray)

    Author: Sharvani Laxmi Somayaji
    """
    #UNTITLED21 Summary of this function goes here
    #   Detailed explanation goes here
    td = deci_To_HM_Input["td"]
    len = np.size(td)

    #Thm[1][i]=fprintf('The Time is %d hours : %d mins : %d secs\n',hr[1][i],min[1][i],sec[1][i])

    hr = np.fix(td / 1)
    mmm = np.remainder(td, 1)
    mm = mmm * 60
    min = np.fix(mm / 1)
    sss = np.remainder(mm, 1)
    ss = sss * 60
    sec = np.fix(ss / 1)

    deci_To_HM_Output = {"hr":hr, "min":min, "sec":sec}

    return deci_To_HM_Output


def Declination(declination_Input):
    """A one line summary of the module or program, terminated by a period.

    Leave one blank line.  The rest of this docstring should contain an
    overall description of the module or program.  Optionally, it may also
    contain a brief description of exported classes and functions and/or usage
    examples.

    Args:
      declination_Input (dict): Python dictionary with the following element:
        n (numpy.ndarray)

    Returns:
      declination_Output (dict): Python dictionary with the following element:
        dec (numpy.ndarray)

    Author: Sharvani Laxmi Somayaji
    """
    #UNTITLED14 Summary of this function goes here
    #   Detailed explanation goes here

    n = declination_Input["n"]
    pi = np.pi
    len = np.size(n)
    dec = np.zeros((1, len))

    dec = 23.45 * (np.sin((360 / 365) * (n - 81) * (pi / 180)))

    declination_Output = {"dec":dec}

    return declination_Output


def Double_Axis(double_Axis_Input):
    """A one line summary of the module or program, terminated by a period.

    Leave one blank line.  The rest of this docstring should contain an
    overall description of the module or program.  Optionally, it may also
    contain a brief description of exported classes and functions and/or usage
    examples.

    Args:
      double_Axis_Input (numpy.ndarray): Numpy array with the following elements:
        i_b (numpy.int64)
        i_d (numpy.int64)
        c (numpy.int64)
        phi (numpy.int64)
        phic_Min (numpy.int64)
        phic_Max (numpy.int64)
        tilt_Min (numpy.int64)
        tilt_Max (numpy.int64)
        beta (numpy.int64)
        rho (numpy.int64)

    Returns:
      double_Axis_Output (numpy.ndarray): Numpy array with the following elements:
        i_c (numpy.int64)
        i_bc (numpy.int64)
        i_dc (numpy.int64)
        i_rc (numpy.int64)
        cos_Inci_Angle (numpy.int64)

    Author: Sharvani Laxmi Somayaji
    """

    i_b,i_d,c,phi,phic_Min,phic_Max,tilt_Min,tilt_Max,beta,rho = double_Axis_Input.values()
    #UNTITLED Summary of this function goes here
    #   Detailed explanation goes here
    beta_Max=90-tilt_Min
    beta_Min=90-tilt_Max
    pi = np.pi

    if ((phi<=phic_Max)and(phi>=phic_Min))and ((beta>=beta_Min)and(beta<=beta_Max)): # Acts as a Double Axix Tracker

        cos_Inci_Angle=1

        i_bc=i_b

        i_dc=i_d*((1-np.cos((pi/180)*(90-beta)))/(2))

        i_rc=rho*i_b*(np.sin((pi/180)*(beta))+c)*((1-np.cos((pi/180)*(90-beta)))/(2))

        i_c=i_bc+i_dc+i_rc

    elif ((phi>phic_Max)or(phi<phic_Min))and ((beta<beta_Min)or(beta>beta_Max)):# Acts as a Fixed Tilt with an Azimuth

        if phi>phic_Max:
            phi_Actual=phic_Max
        elif phi<phic_Min:
            phi_Actual=phic_Min
        if beta>beta_Max:
            beta_Actual=beta_Max
        elif beta<beta_Min:
            beta_Actual=beta_Min


        cos_Inci_Angle=(np.cos((pi/180)*(beta))*np.cos((pi/180)*(phi-phi_Actual))*np.sin((pi/180)*(90-beta_Actual)))+(np.sin((pi/180)*(beta))*np.cos((pi/180)*(90-beta_Actual))) # Inci_dence Angle

        i_bc=i_b*cos_Inci_Angle # Beam Component on Collector

        i_dc=i_d*((1+(np.cos((pi/180)*(90-beta_Actual))*np.cos((pi/180)*(phi_Actual))))/(2)) # Diffused Component on Collector

        i_rc=rho*i_b*(np.sin((pi/180)*(beta))+c)*((1-(np.cos((pi/180)*(90-beta_Actual))*np.cos((pi/180)*(phi_Actual))))/(2)) # Reflected Component on the Collector

        i_c=i_bc+i_dc+i_rc # Total Solar Irradiance on the collector

    elif ((phi<=phic_Max)and(phi>=phic_Min))and ((beta<beta_Min)or(beta>beta_Max)): # Acts as a Single Axis EW Tracker

        if beta>beta_Max:
            beta_Actual=beta_Max
        elif beta<beta_Min:
            beta_Actual=beta_Min

        cos_Inci_Angle=(np.cos((pi/180)*(beta))*np.sin((pi/180)*(90-beta_Actual)))+(np.sin((pi/180)*(beta))*np.cos((pi/180)*(90-beta_Actual))) # Inci_dence Angle

        i_bc=i_b*cos_Inci_Angle # Beam Component on Collector

        i_dc=i_d*(((1+(np.cos((pi/180)*(90-beta_Actual))*np.cos((pi/180)*(phi))))/(2))) # Diffused Component on Collector

        i_rc=rho*i_b*(np.sin((pi/180)*(beta))+c)*((1-(np.cos((pi/180)*(90-beta_Actual))*np.cos((pi/180)*(phi))))/(2)) # Reflected Component on the Collector

        i_c=i_bc+i_dc+i_rc # Total Solar Irradiance on the collector

    elif ((beta>=beta_Min)and(beta<=beta_Max)) and ((phi>phic_Max)or(phi<phic_Min)):

        if phi>phic_Max:
            phi_Actual=phic_Max
        elif phi<phic_Min:
            phi_Actual=phic_Min

        cos_Inci_Angle=((np.cos((pi/180)*(beta)))*(np.cos((pi/180)*(phi-phi_Actual)))*(np.sin((pi/180)*(90-beta))))+(np.sin((pi/180)*(beta))*np.cos((pi/180)*(90-beta))) # Inci_dence Angle

        i_bc=i_b*cos_Inci_Angle # Beam Component on Collector

        i_dc=i_d*(((1+(np.cos((pi/180)*(90-beta))))/(2))) # Diffused Component on Collector

        i_rc=rho*i_b*(np.sin((pi/180)*(beta))+c)*(((1+(np.cos((pi/180)*(90-beta))))/(2))) # Reflected Component on the Collector

        i_c=i_bc+i_dc+i_rc # Total Solar Irradiance on the collector

    double_Axis_Output = {'i_c':i_c,'i_bc':i_bc,'i_dc':i_dc,'i_rc':i_rc,'cos_Inci_Angle':cos_Inci_Angle}

    return double_Axis_Output


def Fixed_Tilt(fixed_Tilt_Input):
    """A one line summary of the module or program, terminated by a period.

    Leave one blank line.  The rest of this docstring should contain an
    overall description of the module or program.  Optionally, it may also
    contain a brief description of exported classes and functions and/or usage
    examples.

    Args:
      fixed_Tilt_Input (dict): Python dictionary with the following elements:
        i_b (numpy.int64)
        i_d (numpy.int64)
        c (numpy.int64)
        beta (numpy.int64)
        phi (numpy.int64)
        tilt (numpy.int64)
        phic (numpy.int64)
        rho (numpy.int64)

    Returns:
      fixed_Tilt_Output (dict): Python dictionary with the following elements:
        i_c (numpy.int64)
        i_bc (numpy.int64)
        i_dc (numpy.int64)
        i_rc (numpy.int64)
        cos_Inci_Angle (numpy.int64)

    Author: Sharvani Laxmi Somayaji
    """
    #UNTITLED9 Summary of this function goes here
    #   Detailed explanation goes here

    i_b,i_d,c,beta,phi,tilt,phic,rho = fixed_Tilt_Input.values()
    pi = np.pi

    cos_Inci_Angle=(np.cos((pi/180)*(beta))*np.cos((pi/180)*(phi-phic))*np.sin((pi/180)*(tilt)))+(np.sin((pi/180)*(beta))*np.cos((pi/180)*(tilt))) # Incidence Angle

    i_bc=i_b*cos_Inci_Angle # Beam Component on Collector

    i_dc=i_d*((1+np.cos((pi/180)*(tilt)))/(2)) # Diffused Component on Collector

    i_rc=rho*i_b*(np.sin((pi/180)*(beta))+c)*((1-np.cos((pi/180)*(tilt)))/(2)) # Reflected Component on the Collector

    i_c=i_bc+i_dc+i_rc # Total Solar Irradiance on the collector

    fixed_Tilt_Output = {'i_c':i_c,'i_bc':i_bc,'i_dc':i_dc,'i_rc':i_rc,'cos_Inci_Angle':cos_Inci_Angle}

    return fixed_Tilt_Output


def GHI_Gau_Sin_Avg(ghi_Gau_Sin_Avg_Input):
    """A one line summary of the module or program, terminated by a period.

    Leave one blank line.  The rest of this docstring should contain an
    overall description of the module or program.  Optionally, it may also
    contain a brief description of exported classes and functions and/or usage
    examples.

    Args:
      ghi_Gau_Sin_Avg_Input (dict): Python dictionary with the following elements:
        in_So (numpy.int64)
        sr (numpy.int64)
        ss (numpy.int64)
        indi (numpy.int64)
        hh_Res (numpy.int64)

    Returns:
      ghi_Gau_Sin_Avg_Output (dict): Python dictionary with the following elements:
        ghi_Avg (numpy.ndarray)
        area (numpy.int64)

    Author: Sharvani Laxmi Somayaji
    """
    in_So, sr, ss, indi, hh_Res = ghi_Gau_Sin_Avg_Input.values()
    #UNTITLED5 Summary of this function goes here
    #   Detailed explanation goes here
    ghi_Gaussian_Distri_Input = GHI_Gaussian_Distri(
        {'in_So':in_So, 'sr':sr, 'ss':ss, 'indi':indi, 'hh_Res':hh_Res})
    ghi_Gau, area, h, xx, m = ghi_Gaussian_Distri_Input.values()

    ghi_Sinusoidal_Distri_Input = GHI_Sinusoidal_Distri(
        {'in_So':in_So, 'sr':sr, 'ss':ss, 'indi':indi, 'hh_Res':hh_Res})
    ghi_Sin = ghi_Sinusoidal_Distri_Input['ghi_Sin']

    ghi_Avg = (ghi_Gau + ghi_Sin) / 2

    # sum = 0
    # for j in range(0,np.size(xx)):
    #     sum = sum + ghi_Avg[j]

    # No issues with this if ghi_Avg is 1-D and sum of all elements is required
    sum = np.sum(ghi_Avg)

    # Area=Sum*m;
    #
    #
    # figure;
    # grid on;
    # plot(xx,GHIavg)
    # xlabel('Time (Hrs)')
    # ylabel('GHI (kW/m^(2))')
    # title('Gaussian & Sinusoidal Average Distribution of GHI for given Daily - Insolation')

    ghi_Gau_Sin_Avg_Output = {'ghi_Avg':ghi_Avg, 'area':area}

    return ghi_Gau_Sin_Avg_Output
