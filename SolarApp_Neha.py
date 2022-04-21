# -*- coding: utf-8 -*-
"""SolarApp_Neha.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/12InVTwUhVGHa97qdSu2k9Nhi6mI3ZZ8B
"""

"""Python implementations of the 6 functions assigned to Neha

This module contains all the python implementations of the 6 functions,
originally from the SWEEFA MATLAB application. The functions in this module
are listed below:

    GHIGaussianDistri
    GHIHHresIndex
    GHISinusoidalDistri
    HourAngle
    HourlyFileIndex

Typical usage example:
    ghi_HHres_Index_Input  = {'GHI':GHI, 'Area':Area, 'h':h}
    ghi_HHres_Index_Output = GHI_HHres_Index(ghi_HHres_Index_Input)

Author: Neha Alagi

"""
import numpy as np
import math
import skfuzzy 
from SolarApp_Sharvani import Deci_to_HM


def GHI_Gaussian_Distri(ghi_Gaussian_Distri_Input):
  """A one line summary of the module or program, terminated by a period.
  
  Leave one blank line.  The rest of this docstring should contain an
  overall description of the module or program.  Optionally, it may also
  contain a brief description of exported classes and functions and/or usage
  examples.

  Args:
    ghi_Gaussian_Distri_Input (numpy.ndarray): Numpy array with the following 
    elements:
      INso (numpy.int64)
      Sr (numpy.int64)
      Ss (numpy.int64)
      Indi (numpy.int64)
      HHres (numpy.int64)

  Returns:
    ghi_Gaussian_Distri_Output (numpy.ndarray): Numpy array with the following 
    elements:
      GHI (numpy.int64)
      Area (numpy.ndarray)
      H (numpy.int64)

  Author : Neha Alagi

  
  """
  INso,Sr,Ss,Indi,HHres = ghi_Gaussian_Distri_Input.values()
  
  Hres=(60/HHres)

  m=1/Hres

  hh = arange(0,25,m)

  len1 = size(hh, axis=1)

  if Indi==0 or Indi==1:
    
    if Indi==0:
       D=Ss-Sr
       
       dd=D/2
       
       SD=D/6
       
       h=((INso/0.997)*(1/math.sqrt(a)(2*math.pi)))/(SD)
       
       x = np.arange(0,D+1,m)

       GHI= h*skfuzzy.membership.gaussmf(x,dd,SD)      #doubt

       xx=x+Sr

       xx=x+Sr



    if Indi==1:
        
        D=24;
        
        dd=D/2;
       
        SD=D/6;
        
        h=((INso/0.997)*(1/math.sqrt(2*math.pi)))/(SD)


        #m=0.001

        x = np.arange(0,D+1,m)

        GHI = h*skfuzzy.membership.gaussmf(x,dd,SD)

        xx = hh



  elif Indi==-1:

    GHI = np.zeros((1,len1))

    xx = hh

    h = 0



  Sum = 0

  for j in range(0, len(xx)):
  
    Sum=Sum+(GHI[0,j])

  Area = Sum*m

  ghi_Gaussian_Distri_Output = {'GHI':GHI, 'Area':Area, 'h':h}

  return ghi_Gaussian_Distri_Output 

    # Area = sum*m   #DOUBT
    #
    # figure
    # grid on
    # plot(xx,GHI)
    # xlabel('Time (Hrs)')
    # ylabel('GHI (kW/m^(2))')
    # title('Gaussian Distribution of GHI for given Daily - Insolation')


def GHI_HHres_Index(ghi_HHres_Index_Input):
  """A one line summary of the module or program, terminated by a period.
  
  Leave one blank line.  The rest of this docstring should contain an
  overall description of the module or program.  Optionally, it may also
  contain a brief description of exported classes and functions and/or usage
  examples.

  Args:
    ghi_HHres_Index_Input (numpy.ndarray): Numpy array with the following 
    elements:
      n (numpy.int64)
      hp (numpy.int64)
      HHres (numpy.int64)

  Returns:
    ghi_HHres_Index_Output (numpy.ndarray): Numpy array with the following 
    elements:
      GHIIndex (numpy.int64)
      hh (numpy.ndarray)
      difference (numpy.ndarray)
      I (numpy.int64)

  Author : Neha Alagi

  
  """
  #UNTITLED10 Summary of this function goes here
  #   Detailed explanation goes here

  n,hp,HHres = ghi_HHres_Index_Input.values()

  deci_To_HM_Input = Deci_To_HM({'hp':hp})
  hr, minn, sec = deci_To_HM_Input.values()

  H = 60/HHres;

  hh = np.arange(0,60,HHres)

  len = np.size(hh, axis=1)

  difference = []

  for i in range(0,len-1):

    difference[0][i] = abs(minn-hh[0][i])

  I = np.argmin(difference)

  [M]= difference.min(0)   #DOUBT  M = min(difference)

  GHIIndex=((24*H)*(n-1))+((math.floor(hp))*(H))+ (I)

  ghi_HHres_Index_Output = {'GHIIndex':GHIIndex,'hh':hh, 'difference':difference, 'I':I}

  return ghi_HHres_Index_Output


def GHI_Sinusoidal_Distri(ghi_Sinusoidal_Distri_Input):
  """A one line summary of the module or program, terminated by a period.

  Leave one blank line.  The rest of this docstring should contain an
  overall description of the module or program.  Optionally, it may also
  contain a brief description of exported classes and functions and/or usage
  examples.

  Args:
      ghi_Sinusoidal_Distri_Input (numpy.ndarray): Numpy array with the 
      following elements:
        INso (numpy.int64)
        Sr (numpy.int64)
        Ss (numpy.int64)
        Indi (numpy.int64)
        HHres (numpy.int64)

  Returns:
      ghi_Sinusoidal_Distri_Output (numpy.ndarray): Numpy array with the 
      following elements:
        GHI (numpy.ndarray)
        Area (numpy.int64)
        H (numpy.int64)

  """

  #UNTITLED10 Summary of this function goes here
  #   Detailed explanation goes here

  INso,Sr,Ss,Indi,HHres = ghi_Sinusoidal_Distri_Input.values()

  Hres=(60/HHres)

  m=1/Hres

  hh = np.arange(0,24+m,m)

  len1=len(hh);


  if Indi==0 or Indi==1 :

    if Indi==0:

      D=Ss-Sr
      
      div=D*Hres

      m=math.pi/div

      ts = np.arange(0,math.pi+1,m)

      A = ((INso)/2)

      tt=len(ts)

      GHI=np.zeros((1,tt))

      for i in range(0,tt):

        GHI[0][i]=A*math.sin(((2*math.pi)/(2*math.pi))*ts[0][i])



      xx=ts*(D/math.pi)+Sr

    if Indi==1:

      D = 24

      div=D*Hres

      m=math.i/div

      ts = np.arange(0,math.pi+1,m)

      A=((INso)/2)

      tt=len(ts)

      GHI=np.zeros((1,tt))

      for i in range(0,tt):

        GHI[0][i]=A*math.sin(((2*math.pi)/(2*math.pi))*ts[0][i])

        
      xx=ts*(D/math.pi)

      
  elif Indi==-1:

    GHI=np.zeros((1,len1));

    xx=hh

    A=0



  Sum = 0

  # for j in range(0,len(xx)):

    # Sum=Sum+(GHI[0][j])

  sum = np.sum(GHI)

  Area=Sum*m

  ghi_Sinusoidal_Distri_Output = {'GHI':GHI, 'Area':Area, 'A':A}
  
  return ghi_Sinusoidal_Distri_Output

  # Area=Sum*m
  # 
  # figure
  # grid on
  # plot(xx,GHI)
  # xlabel('Time (Hrs)')
  # ylabel('GHI (kW/m^(2))')
  # title('Sinusoidal Distribution of GHI for given Daily - Insolation')


def Hour_Angle(hour_Angle_Input):
  """A one line summary of the module or program, terminated by a period. 
  
  Leave one blank line.  The rest of this docstring should contain an
  overall description of the module or program.  Optionally, it may also
  contain a brief description of exported classes and functions and/or usage
  examples.

  Args:
    hour_Angle_Input(np.ndarray): Numpy array with the following element:
      hp (numpy.ndarray)

  Returns:
    hour_Angle_Output (numpy.ndarray): Numpy array with the following element:
      H (numpy.ndarray)
      
  Author : Neha Alagi

  #UNTITLED15 Summary of this function goes here
  #   Detailed explanation goes here
  """
  hp = hour_Angle_Input.values()
  hpsz = hp.shape
  
  H = []

  len1 = hpsz[0]
  len2 = hpsz[1]

  for i in range(0,len1):
    x=[]
    for j in range(0,len2):

      x.append(15*(12-(hp[0][j])))
      
    H.append(x)
  hour_Angle_Output = {'H':H}
  #         H(i,j)=(360/23.9344696)*(12-(Hp(1,j)));

  return hour_Angle_Output


def Hourly_File_Index(hourly_File_Index_Input):
  """A one line summary of the module or program, terminated by a period.

  Leave one blank line.  The rest of this docstring should contain an
  overall description of the module or program.  Optionally, it may also
  contain a brief description of exported classes and functions and/or usage
  examples.

  Args:
    hourly_File_Index_Input(numpy.ndarray): Numpy array with the following 
    elements:
      n (numpy.int64)
      hp (numpy.int64)

  Returns:
    hourly_File_Index_Output : 
      Hourly_Index (numpy.int64)

  Author: Neha Alagi
  """

  #UNTITLED8 Summary of this function goes here
  #   Detailed explanation goes here

  n,hp = hourly_File_Index_Input.values()

  Hourly_Index = math.ceil(hp)+((n-1)*(24));

  hourly_File_Index_Output = {'Hourly_Index':Hourly_Index}
  
  return hourly_File_Index_Output



!pip install -U scikit-fuzzy