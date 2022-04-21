import math, numpy as np, cmath

def SunRiseSet(SunRiseSet_Input):
    ''' Calculates Solar Time, Sun Rise and Sun Set

        Args:
            L, dec

        Returns:
            SunRise, SunSet, Indicator

        Author:
            Harshal Dhake, 191EE212
    '''

    keys = ('L', 'dec')
    L, dec = [SunRiseSet_Input[k] for k in keys]

    #Output in Solar Time-Decimal Hours
    length=len(dec)

    Indicator = []
    SunRise = []
    SunSet = []
    for i in range(length):
        Indicator.insert(0, complex(0, 0))
        SunRise.insert(0, complex(0, 0))
        SunSet.insert(0, complex(0, 0))

    for i in range(0, length):
        
        Hsr=(180/cmath.pi)*(cmath.acos((-(cmath.tan(L*(cmath.pi/180)))*cmath.tan(dec[i]*(cmath.pi/180))))) 
        
        hsr=abs(Hsr)
        
        Q=((3.467)/(cmath.cos((cmath.pi/180)*L)*cmath.cos((cmath.pi/180)*dec[i])*cmath.sin((cmath.pi/180)*Hsr)))
        
        SunRise[i] = 12-(hsr/15)-(Q/60)
        
        SunSet[i] = 12+(hsr/15)+(Q/60)
        
        #         SunRise[0, i-1]=12-(hsr/(360/23.9344696))-(Q/60);
        #     
        #     SunSet[0, i-1]=12+(hsr/(360/23.9344696))+(Q/60);
        
        Sr= abs(SunRise[i].imag)
        Ss= abs(SunSet[i].imag)
        
        if (Sr>0) and (Ss>0):
            if (L>0) and (dec[i].real>=0):
                Indicator[i]=1 # 24 Hour Sunlight
            
            if (L>0) and (dec[i].real<=0):
                Indicator[i] = -1 # 24 Hour Night

            if (L<0) and (dec[i].real<=0):
                Indicator[i] = 1 # 24 Hour Sunlight
            
            if (L<0) and (dec[i].real>=0):
                Indicator[i] = -1 # 24 Hour Night
                
        else:
            Indicator[i] = 0 # Sunrise and Sunset are present
            
    SunRiseSet_Output = dict({ 'SunRise': SunRise, 'SunSet': SunSet, 'Indicator': Indicator })
    return SunRiseSet_Output