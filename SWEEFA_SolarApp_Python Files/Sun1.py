import numpy as np
import AltiAzi
import Declination
import HourAngle
import SunRiseSet

def Sun1(Sun1_Input):
    ''' Calculates Sun Parameters 

        Args:
            n, L, HHres

        Returns:
            hp, ha, beta, phi, Sr, Ss, Indi

        Author:
            Harshal Dhake, 191EE212
    '''
    keys = ('n', 'L', 'HHres')
    n, L, HHres = [Sun1_Input[k] for k in keys]

    # Use it only for one day

    Hres = HHres//60

    d_dict = Declination.Declination(dict({'n': n}))
    d = d_dict['d']

    SunRiseSet_Output = SunRiseSet.SunRiseSet(dict({'L': L, 'dec': d}))
    keys = ('SunRise', 'SunSet', 'Indicator')
    Sr, Ss, Indi = [SunRiseSet_Output[k] for k in keys]

    length=len(Sr)

    #  figure;
    #  hold on;

    for i in range(length): 
        if Indi[i] == 1:
            hp = np.arange(0, 25, Hres)
            
        elif Indi[i] == -1:
            hp = np.arange(0, 25, Hres)
            
        elif Indi[i] == 0:
            hp = np.arange(Sr[i], Ss[i]+1, Hres)
        
        HourAngle_Output = HourAngle.HourAngle(dict({'Hp': hp}))
        ha = HourAngle_Output['H']

        AltiAzi_Output = AltiAzi.AltiAzi(dict({'dec': d[i],'L': L,'ha': ha}))
        keys = ('beta', 'phi')
        beta, phi = [AltiAzi_Output[k] for k in keys]
        
    
    #      plot(phi(1,:),beta(1,:));
    # 
    #     xlabel('Solar Azimuth Angle (Degrees)')
    #     ylabel('Solar Elevation Angle (Degrees)')
    #     title('Sunpath Diagram')



    #        hp=zeros(1,288);
    #     
    #     hp=zeros(1,24/Hres);

    Sun1_Output = dict({'hp': hp, 'ha': ha, 'beta': beta, 'phi': phi, 'Sr': Sr, 'Ss': Ss, 'Indi': Indi})

    return Sun1_Output