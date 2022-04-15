# -*- coding: utf-8 -*-
"""SolarApp_Neha_testing.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/10DBip-6I2YH4QazRWQtYOdX_K7lD5-ed
"""

import unittest
import SolarApp_Neha
import numpy as np


class Test_SolarApp_Neha(unittest.TestCase):
  
  def test_GHI_Gaussian_Distri(self):
    ghi_Gaussian_Distri_Input = np.array([10, 5, 1, 2, 3])
    ghi_Gaussian_Distri_Output = SolarApp_Neha.GHI_Gaussian_Distri(
        ghi_Gaussian_Distri_Input)
    self.assertEqual(np.shape(ghi_Gaussian_Distri_Output)[0], 3)

  def test_GHI_HHres_Index(self):
    ghi_HHres_Index_Input = np.array([5, 1, 2])
    ghi_HHres_Index_Output = SolarApp_Neha.GHI_HHres_Index(
        ghi_HHres_Index_Input)
    #self.assertEqual(np.shape(ghi_HHres_Index_Output)[0], 3)

  def test_GHI_Sinusoidal_Distri(self):
    ghi_Sinusoidal_Distri_Input = np.array([10, 5, 1, 2, 3])
    ghi_Sinusoidal_Distri_Output = SolarApp_Neha.GHI_Sinusoidal_Distri(
        ghi_Sinusoidal_Distri_Input)
    self.assertEqual(np.shape(ghi_Sinusoidal_Distri_Output)[0], 3)

  def test_Hour_Angle(self):
    hour_Angle_Input = np.array([3, 4])
    hour_Angle_Output = SolarApp_Neha.Hour_Angle(hour_Angle_Input)
    self.assertEqual(np.shape(hour_Angle_Output)[0], 1)

  def test_HourlyFileIndex(self):
    hourly_File_Index_Input = np.array([10, 5])
    hourly_File_Index_Output = SolarApp_Neha.HourlyFileIndex(
        hourly_File_Index_Input)
    self.assertEqual(np.shape(hourly_File_Index_Output), 1)
