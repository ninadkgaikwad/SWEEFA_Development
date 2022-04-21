import cmath

def AltiAzi(AltiAzi_Input):
    #UNTITLED13 Summary of this function goes here
    #   Detailed explanation goes here
    #len1=length(dec);
    dec = AltiAzi_Input['dec']
    L = AltiAzi_Input['L']
    H = AltiAzi_Input['ha']

    length=len(H)
    beta = []
    azi1 = []
    azi11 = []
    azi2 = []
    azi22 = []
    phi = []

    for j in range(length):
        #e=(cos(L(1,i)*(pi/180))*cos(dec(1,i)*(pi/180))*cos(H(1,i)*(pi/180)))+(sin(L(1,i)*(pi/180))*sin(dec(1,i)*(pi/180)))    
    
        beta.insert(j, (180/cmath.pi) * (cmath.asin((cmath.cos(L*(cmath.pi/180)) * cmath.cos(dec*(cmath.pi/180)) * cmath.cos(H[j] * (cmath.pi/180))) + (cmath.sin(L*(cmath.pi/180))*cmath.sin(dec*(cmath.pi/180))))))
        
                
        azi1.insert(j,(180/cmath.pi)*(cmath.asin((cmath.cos(dec*(cmath.pi/180))*cmath.sin(H[j]*(cmath.pi/180)))/(cmath.cos(beta[j]*(cmath.pi/180))))))

        
        
        azi11.insert(j, abs(azi1[j]))

        azi2.insert(j, 180-azi11[j])

        azi22.insert(j, abs(azi2[j]))

        x=cmath.cos(H[j]*(cmath.pi/180))

        y=(cmath.tan(dec*(cmath.pi/180)))/(cmath.tan(L*(cmath.pi/180)))


        if x.real >= y.real:
            phi.insert(j, azi1[j])
        else:
            if azi1[j].real >= 0:
                phi.insert(j, azi2[j])
            else:
                phi.insert(j, -(azi2[j]))
            
    return dict({'beta': beta, 'phi': phi})