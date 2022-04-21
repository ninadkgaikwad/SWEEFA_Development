import cmath

def Declination(Declination_Input):
    #UNTITLED14 Summary of this function goes here
    #   Detailed explanation goes here
    n = Declination_Input['n']

    length=len(n) 

    dec = []

    for i in range(length):
        dec.insert(i, 23.45 * (cmath.sin((360/365)*(n[i]-81)*(cmath.pi/180))))

    return dict({ 'd': dec})