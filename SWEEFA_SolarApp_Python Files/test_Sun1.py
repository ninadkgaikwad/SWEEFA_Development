import unittest

from cv2 import exp
import Sun1

class TestSun1(unittest.TestCase):

    def setUp(self):
        pass

    def test_forImgValues(self):
        Sun1_Input = {
            'n': [complex(1, 3), complex(2, 3), complex(3, 3)],
            'L': 10,
            'HHres': 480
        }

        expectedAns = {
            'hp' : [0, 8, 16, 24],
            'ha': [180, 60, -60, -180],
            'beta': [complex(-77.1268773303668, -0.273952217176333), complex(22.7178387494195 ,0.104360087669858), complex(22.7178387494195, 0.104360087669858), complex(-77.1268773303668, -0.273952217176333)],
            'phi': [complex(2.90039359655372e-14, 6.65336479713983e-16), complex(59.8868425667185, 0.274599502652074), complex(-59.8868425667185, -0.274599502652074), complex(-2.90039359655372e-14, -6.65336479713983e-16)],
            'Sr': [complex(6.22280083063657, 0.000114765580754492), complex(6.22170994920729, 0.000124247305173327), complex(6.2205290307411, 0.000133549864375832)],
            'Ss': [complex(17.7771991693634, -0.000114765580754492), complex(17.7782900507927, -0.000124247305173327), complex(17.7794709692589, -0.000133549864375832)],
            'Indi': [-1, -1, -1]
        }

        expectedAns2 = [[0, 8, 16, 24], [180, 60, -60, -180], [complex(-77.1268773303668, -0.273952217176333), complex(22.7178387494195 ,0.104360087669858), complex(22.7178387494195, 0.104360087669858), complex(-77.1268773303668, -0.273952217176333)], [complex(2.90039359655372e-14, 6.65336479713983e-16), complex(59.8868425667185, 0.274599502652074), complex(-59.8868425667185, -0.274599502652074), complex(-2.90039359655372e-14, -6.65336479713983e-16)], [complex(6.22280083063657, 0.000114765580754492), complex(6.22170994920729, 0.000124247305173327), complex(6.2205290307411, 0.000133549864375832)], [complex(17.7771991693634, -0.000114765580754492), complex(17.7782900507927, -0.000124247305173327), complex(17.7794709692589, -0.000133549864375832)], [-1, -1, -1]]
        
        n = [complex(1, 3), complex(2, 3), complex(3, 3)]

        ans = Sun1.Sun1(Sun1_Input)

        for (i1, j1), (i2, j2) in zip(ans.items(), expectedAns.items()):
            for itr in range(len(j1)):
                self.assertAlmostEqual(j1[itr], j2[itr])

if __name__ == '__main__':
    unittest.main()