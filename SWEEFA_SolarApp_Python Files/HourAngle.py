def HourAngle( HourAngle_Input ):
    #UNTITLED15 Summary of this function goes here
    #   Detailed explanation goes here
    Hp = HourAngle_Input['Hp']

    length = len(Hp)

    H = []
    for i in range(length):
        H.insert(i, 15*(12-(Hp[i])))
        
    #H(i,j)=(360/23.9344696)*(12-(Hp(1,j)));

    return dict({'H': H})