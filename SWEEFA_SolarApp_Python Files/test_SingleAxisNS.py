import unittest
import SingleAxisNS

class TestSingleAxisNS(unittest.TestCase):

    def setUp(self):
        self.SingleAxisNS_Input = {
            'Ib': 10,
            'Id': 10,
            'C': 10,
            'beta': 0,
            'phi': 10,
            'phic': 10,
            'tiltmin': 10,
            'tiltmax': 20,
            'rho': 10
        }
        self.Ib = 10
        self.Id = 10
        self.C = 10
        self.phi = 10
        self.phic = 10
        self.tiltmin = 10
        self.tiltmax = 20
        self.rho = 10

    def test_inBetweenCase(self):
        expectedAns = {
            'Ic': 1097.73946868504,
            'Ibc': 10,
            'Idc': 9.82962913144534,
            'Irc': 1077.9098395536,
            'CosInciAngle': 1
        }
        expectedAns2 = [1097.73946868504, 10, 9.82962913144534, 1077.9098395536, 1]

        self.SingleAxisNS_Input['beta'] = 75
        ans = SingleAxisNS.SingleAxisNS(self.SingleAxisNS_Input)

        for (i1,i2), (j1,j2) in zip(ans.items(), expectedAns.items()):
            self.assertAlmostEqual(i2, j2, delta=0.0001)

    def test_underCase(self):
        expectedAns = {
            'Ic': 52.546952061768,
            'Ibc': 9.96194698091746,
            'Idc': 9.69846310392954,
            'Irc': 32.886541976921,
            'CosInciAngle': 0.996194698091746
        }
        expectedAns2 = [52.546952061768, 9.96194698091746, 9.69846310392954, 32.886541976921, 0.996194698091746]

        self.SingleAxisNS_Input['beta'] = 65
        ans = SingleAxisNS.SingleAxisNS(self.SingleAxisNS_Input)

        for (i1,i2), (j1,j2) in zip(ans.items(), expectedAns.items()):
            self.assertAlmostEqual(i2, j2, delta=0.0001)

    def test_overCase(self):
        expectedAns = {
            'Ic': 28.2388310349414,
            'Ibc': 9.96194698091746,
            'Idc': 9.92403876506104,
            'Irc': 8.35284528896292,
            'CosInciAngle': 0.996194698091745
        }
        expectedAns2 = [28.2388310349414, 9.96194698091746, 9.92403876506104, 8.35284528896292, 0.996194698091745]

        self.SingleAxisNS_Input['beta'] = 85
        ans = SingleAxisNS.SingleAxisNS(self.SingleAxisNS_Input)

        for (i1,i2), (j1,j2) in zip(ans.items(), expectedAns.items()):
            self.assertAlmostEqual(i2, j2, delta=0.0001)

if __name__ == '__main__':
    unittest.main()