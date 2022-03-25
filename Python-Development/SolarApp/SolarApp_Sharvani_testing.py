import unittest
import SolarApp_Sharvani
import numpy as np


class Test_SolarApp_Sharvani(unittest.TestCase):

    def test_DaysToCompute(self):
        days_To_Compute_Input = np.array([0, 1, 1, 20, 2])
        days_To_Compute_Output = SolarApp_Sharvani.Days_To_Compute(
            days_To_Compute_Input)
        self.assertEqual(np.size(days_To_Compute_Output), 2)
        self.assertEqual(days_To_Compute_Output[0], 1)
        self.assertEqual(days_To_Compute_Output[1], 51)

    def test_DeciToHM(self):
        deci_To_HM_Input = np.array([[10, 14, 12.300, 30, 4]])
        deci_To_HM_Output = SolarApp_Sharvani.Deci_To_HM(deci_To_HM_Input)
        self.assertEqual(np.shape(deci_To_HM_Output)[0], 3)
        # required_Output = np.array([[10., 14., 12., 30.,  4.],[ 0.,  0., 18.,  0.,  0.],[ 0.,  0.,  0.,  0.,  0.]])
        # self.assertEqual(deci_To_HM_Output, required_Output)

    def test_Declination(self):
        declination_Input = np.array([[3, 111, 2]])
        declination_Output = SolarApp_Sharvani.Declination(declination_Input)
        self.assertEqual(np.size(declination_Output[0]),
                         np.size(declination_Input[0]))

    def test_DoubleAxis(self):
        double_Axis_Input = np.array([10, 5, 1, 2, 3, 4, 59, 8, 0, 1])
        double_Axis_Output = SolarApp_Sharvani.Double_Axis(double_Axis_Input)
        self.assertEqual(np.shape(double_Axis_Output)[0], 5)

    def test_FixedTilt(self):
        fixed_Tilt_Input = np.array([10, 5, 1, 2, 3, 4, 59, 1])
        fixed_Tilt_Output = SolarApp_Sharvani.Fixed_Tilt(fixed_Tilt_Input)
        self.assertEqual(np.shape(fixed_Tilt_Output)[0], 5)

    def test_GHIGauSinAvg(self):
        ghi_Gau_Sin_Avg_Input = np.array([10, 5, 1, 2, 3])
        ghi_Gau_Sin_Avg_Output = SolarApp_Sharvani.GHI_Gau_Sin_Avg(
            ghi_Gau_Sin_Avg_Input)
        self.assertEqual(np.shape(ghi_Gau_Sin_Avg_Output)[0], 2)


if __name__ == '__main__':
    unittest.main()
