import unittest
import SolarApp_Sharvani
import numpy as np


class Test_SolarApp_Sharvani(unittest.TestCase):

    def test_DaysToCompute(self):
        days_To_Compute_Input = {"leap_Year":0, "start_Day":1, "start_Month":1, "end_Day":20, "end_Month":2}
        days_To_Compute_Output = SolarApp_Sharvani.Days_To_Compute(
            days_To_Compute_Input)
        self.assertEqual(len(days_To_Compute_Output), 2)
        self.assertEqual(days_To_Compute_Output["start_Day"], 1)
        self.assertEqual(days_To_Compute_Output["end_Day"], 51)

    def test_DeciToHM(self):
        deci_To_HM_Input = {'td':np.array([10, 14, 12.300, 30, 4])}
        deci_To_HM_Output = SolarApp_Sharvani.Deci_To_HM(deci_To_HM_Input)
        self.assertEqual(len(deci_To_HM_Output), 3)
        # required_Output = np.array([[10., 14., 12., 30.,  4.],[ 0.,  0., 18.,  0.,  0.],[ 0.,  0.,  0.,  0.,  0.]])
        # self.assertEqual(deci_To_HM_Output, required_Output)

    def test_Declination(self):
        declination_Input  = {"n":np.array([3,111,2])}
        declination_Output = SolarApp_Sharvani.Declination(declination_Input)
        self.assertEqual(np.size(declination_Output["dec"]),
                         np.size(declination_Input["n"]))

    def test_DoubleAxis(self):
        values = np.array([10,5,1,2,3,4,59,8,0,1])
        items = ["i_b","i_d","c","phi","phic_Min","phic_Max","tilt_Min","tilt_Max","beta","rho"]
        double_Axis_Input  = {key:value for key, value in zip(items, values)}
        double_Axis_Output = SolarApp_Sharvani.Double_Axis(double_Axis_Input)
        self.assertEqual(len(double_Axis_Output), 5)

    def test_FixedTilt(self):
        values = np.array([10,5,1,2,3,4,59,1])
        items = ["i_b","i_d","c","beta","phi","tilt","phic","rho"]
        fixed_Tilt_Input  = {key:value for key, value in zip(items, values)}
        fixed_Tilt_Output = SolarApp_Sharvani.Fixed_Tilt(fixed_Tilt_Input)
        self.assertEqual(len(fixed_Tilt_Output), 5)

    def test_GHIGauSinAvg(self):
        values = np.array([10, 5, 1, 2, 3])
        items = ["in_So", "sr", "ss", "indi", "hh_Res"]
        ghi_Gau_Sin_Avg_Input  = {key:value for key, value in zip(items, values)}
        ghi_Gau_Sin_Avg_Output = SolarApp_Sharvani.GHI_Gau_Sin_Avg(
            ghi_Gau_Sin_Avg_Input)
        self.assertEqual(len(ghi_Gau_Sin_Avg_Output), 2)


if __name__ == '__main__':
    unittest.main()
