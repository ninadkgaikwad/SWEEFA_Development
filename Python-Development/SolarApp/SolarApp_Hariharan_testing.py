import unittest
import AltiAzi
import ArrayIncidenceLoss
import BeamDiffGHI
import BeamDiffModelClearIndex
import ClearnessIndex
import DayToMonthDataCoverterApp
import numpy as np

class TestAltiAzi(unittest.TestCase):

    def test_AltiAzi(self):
        dec = 1
        L = 1
        H = np.array([1])
        
        AltiAzi_input = {'dec' : dec, 'L' : L, 'H' : H}
        AltiAzi_output = AltiAzi.AltiAzi(AltiAzi_input)
        
        self.assertEqual(round(AltiAzi_output['beta'][0]), 89)
        self.assertEqual(round(AltiAzi_output['phi'][0]), 90)
    
    def test_ArrayIncidenceLoss(self):
        Ic = 1
        CosInciAngle = 1
        bo = 1
        SF = 1

        ArrayIncidenceLoss_input = {"Ic" : Ic, "CosInciAngle" : CosInciAngle, "bo" : bo, "SF" : SF}
        ArrayIncidenceLoss_output = ArrayIncidenceLoss.ArrayIncidenceLoss(ArrayIncidenceLoss_input)
        
        self.assertEqual(ArrayIncidenceLoss_output["Iciam"], 1)
        self.assertEqual(ArrayIncidenceLoss_output["Icsf"], .99)
    
    def test_BeamDiffGHI(self):
        n = 1
        GHI = 1
        beta = 1

        BeamDiffGHI_input = {"n" : n, "GHI" : GHI, "beta" : beta}
        BeamDiffGHI_output = BeamDiffGHI.BeamDiffGHI(BeamDiffGHI_input)
        
        self.assertEqual(round(BeamDiffGHI_output["Ib"], 4), 13.7348)
        self.assertEqual(round(BeamDiffGHI_output["Id"], 4), 0.7603)
        self.assertEqual(round(BeamDiffGHI_output["C"], 4), 0.0554)
    
    def test_BeamDiffModelClearIndex(self):
        n = 1
        beta = 1
        ClearIndex = 1
        DiffIndex = 1
        
        BeamDiffModelClearIndex_input = {"n" : n, "beta" : beta, "ClearIndex" : ClearIndex, "DiffIndex" : DiffIndex}
        BeamDiffModelClearIndex_output = BeamDiffModelClearIndex.BeamDiffModelClearIndex(BeamDiffModelClearIndex_input)
        
        self.assertEqual(round(BeamDiffModelClearIndex_output["Ib"], 4), 0.4217)
        self.assertEqual(round(BeamDiffModelClearIndex_output["Id"], 4), 0.0467)
        self.assertEqual(round(BeamDiffModelClearIndex_output["C"], 4), 0.0554)
        self.assertEqual(round(BeamDiffModelClearIndex_output["A"]), 1235)
    
    # def test_ClearnessIndex(self):
    #     RainSnowMonths = 1
    #     yr = 1
    #     mr = 1
    #     YearRain = 1
    #     MonthRain = 1
    #     LeapYear = 1
    #     NormalClearSky = 1
    #     ModifiedClearSky = 1

    #     ClearnessIndex_input = {"RainSnowMonths" : RainSnowMonths ,"yr" : yr ,"mr" : mr ,"YearRain" : YearRain ,"MonthRain" : MonthRain ,"LeapYear" : LeapYear ,"NormalClearSky" : NormalClearSky ,"ModifiedClearSky" : ModifiedClearSky }
    #     ClearnessIndex_output = ClearnessIndex.ClearnessIndex(ClearnessIndex_input)
        
    #     self.assertEqual(round(ClearnessIndex_output["ClearIndex"]), 89)
    #     self.assertEqual(round(ClearnessIndex_output["DiffIndex"]), 90)

    # def test_DayToMonthDataCoverterApp(self):
    #     ProcessedData = 1
    #     DataCols = 1
    #     AvgOrAdd = 1

    #     DayToMonthDataCoverterApp_input = {"ProcessedData" : ProcessedData,"DataCols" : DataCols,"AvgOrAdd" : AvgOrAdd}
    #     DayToMonthDataCoverterApp_output = DayToMonthDataCoverterApp.DayToMonthDataCoverterApp(DayToMonthDataCoverterApp_input)
        
    #     self.assertEqual(round(DayToMonthDataCoverterApp_output["ProcessedData1"]), 89)

if __name__ == '__main__':
    unittest.main()