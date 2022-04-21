import unittest
import SingleAxisEW

class TestSingleAxisEW(unittest.TestCase):

    def setUp(self):
        self.SingleAxisEW_Input = {
            'Ib': 10,
            'Id': 10,
            'C' : 10,
            'beta': 10,
            'phicmin': 10,
            'phi': 0,
            'phicmax': 20,
            'tilt': 10,
            'rho': 10
        }

    def test_inBetweenCase(self):
        expectedAns = {
            'Ic': 37.9741, 
            'Ibc': 3.4202, 
            'Idc': 9.7563, 
            'Irc': 24.7976, 
            'CosInciAngle': 0.3420
        }

        self.SingleAxisEW_Input['phi'] = 15
        ans = SingleAxisEW.SingleAxisEW(self.SingleAxisEW_Input)

        for (i1,i2), (j1,j2) in zip(ans.items(), expectedAns.items()):
            self.assertAlmostEqual(i2, j2, delta=0.0001)

    def test_underCase(self):
        expectedAns = {
            'Ic': 28.6016, 
            'Ibc': 3.4137, 
            'Idc': 9.8492, 
            'Irc': 15.3387, 
            'CosInciAngle': 0.3414
        }
        expectedAns2 = [28.6016, 3.4137, 9.8492, 15.3387, 0.3414]

        self.SingleAxisEW_Input['phi'] = 5
        ans = SingleAxisEW.SingleAxisEW(self.SingleAxisEW_Input)
        
        for (i1,i2), (j1,j2) in zip(ans.items(), expectedAns.items()):
            self.assertAlmostEqual(i2, j2, delta=0.0001)

    def test_overCase(self):
        expectedAns = {
            'Ic': 50.9801, 
            'Ibc': 3.4137, 
            'Idc': 9.6271, 
            'Irc': 37.9393, 
            'CosInciAngle': 0.3414
        }
        expectedAns2 = [50.9801, 3.4137, 9.6271, 37.9393, 0.3414]

        self.SingleAxisEW_Input['phi'] = 25
        ans = SingleAxisEW.SingleAxisEW(self.SingleAxisEW_Input)

        for (i1,i2), (j1,j2) in zip(ans.items(), expectedAns.items()):
            self.assertAlmostEqual(i2, j2, delta=0.0001)

if __name__ == '__main__':
    unittest.main()