#!/usr/bin/env python
# coding: utf-8

# In[1]:


def PvPlantPerformance(PvPlantPerformnce_Input):
    EArrayMod = PvPlantPerformance_Input['EArrayMod']
    EPgridMod = PvPlantPerformance_Input['EPgridMod']
    EArray = PvPlantPerformance_Input['EArray']
    EPgrid = PvPlantPerformance_Input['EPgrid']
    TotPlaneInso = PvPlantPerformance_Input['TotPlaneInso']
    ModuleTemperature = PvPlantPerformance_Input['ModuleTemperature']
    DayNum = PvPlantPerformance_Input['DayNum']
    EnergyConvertor = PvPlantPerformance_Input['EnergyConvertor']
    ModTemCF = PvPlantPerformance_Input['ModTemCF']
    PlantCapacity = PvPlantPerformance_Input['PlantCapacity']
    Pmod = PvPlantPerformance_Input['Pmod']
    Modnum = PvPlantPerformance_Input['Modnum']
    #UNTITLED2 Summary of this function goes here
    #Detailed explanation goes here
    #Computing weighted average of ModtemCF
    length=len(ModTemCF)
    
    Weighted_ModTemCF_Numerator=0

    Weighted_ModTemCF_Denominator=0
    for i in range(length):
        Weighted_ModTemCF_Numerator= Weighted_ModTemCF_Numerator + (ModNum[1][i]*ModTemCF[1][i]);
   
        Weighted_ModTemCF_Denominator= Weighted_ModTemCF_Denominator + ModNum[1][i];
    Weighted_ModTemCF= Weighted_ModTemCF_Numerator/Weighted_ModTemCF_Denominator;

    Weighted_ModTemCFF=Weighted_ModTemCF/100

    ModTemCFF=ModTemCF/100
    # Computing Average Module Temperature

    lenTemp=len(ModuleTemperature);

    TotalTemp=sum(ModuleTemperature);

    AvgModTemp=TotalTemp/lenTemp;
    # Computing total Solar Energy Incident on Plant [kWh/m^(2)]

    GHITot=sum(TotPlaneInso);

    GHI=(GHITot/1000)*EnergyConverter;

    # Computing Module Specific Capacity

    ModCapacity=(Pmod*ModNum)/1000;

    # Performace Analysis of Different PV Modules
    for i in range(length):
        Yf=EPgridMod[i][1]/(ModCapacity[1][i]*1000) # Final Yeild 1000 is divided to make EPgrid in KWh
        Yr=GHI # Reference Yeild
        Ya=EArrayMod[i][1]/(ModCapacity[1][i]*1000) # Array Yeild 1000 is divided to make EArrayMod in KWh
        Yt=Yr*(1+(ModTemCFF[1][i]*(AvgModTemp-25))) # Temperature Corrected Reference Yeild
        Lct=Yr-Yt # Thermal Capture Loss
        Lc=Yr-Ya # Array Capture Loss
        Lcm=Lc-Lct # Miscelleneous Capture Losses
        Ls=Ya-Yf # System Loss
        Pr=Yf/Yr # Performance Ratio
        Cuf=EPgridMod[i][1]/(ModCapacity[1][i]*(24*DayNum)); # Capacity Utilization Factor
        PrTemp=Pr/(1-(ModTemCFF[1][i]*(AvgModTemp-25))); # Temperature Corrected Performance Ratio      
    ModulePerfMatrix.append(Yf)
    ModulePerfMatrix.append(Yr)
    ModulePerfMatrix.append(Ya)
    ModulePerfMatrix.append(Yt)
    ModulePerfMatrix.append(Yf)
    ModulePerfMatrix.append(Lct)
    ModulePerfMatrix.append(Lc)
    ModulePerfMatrix.append(Lcm)
    ModulePerfMatrix.append(Ls)
    ModulePerfMatrix.append(Pr)
    ModulePerfMatrix.append(Cuf)
    ModulePerfMatrix.append(PrTemp)
    # Performance Analysis of Entire Plant

    YYf=EPgrid/PlantCapacity; # Final Yeild
    YYr=GHI; # Reference Yeild
    YYa=EArray/PlantCapacity; # Array Yeild
    YYt=YYr*(1+(Weighted_ModTemCFF*(AvgModTemp-25))); # Temperature Corrected Reference Yeild
    LLct=YYr-YYt; # Thermal Capture Loss
    LLc=YYr-YYa; # Array Capture Loss
    LLcm=LLc-LLct; # Miscelleneous Capture Losses
    LLs=YYa-YYf; # System Loss
    PPr=YYf/YYr; # Performance Ratio
    CCuf=EPgrid/(PlantCapacity*(24*DayNum)); # Capacity Utilization Factor
    PPrTemp=PPr/(1-(Weighted_ModTemCFF*(AvgModTemp-25))); # Temperature Corrected Performance Ratio
    
    PlantPerfVector.append(YYf)
    PlantPerfVector.append(YYr)
    PlantPerfVector.append(YYa)
    PlantPerfVector.append(YYt)
    PlantPerfVector.append(LLct)
    PlantPerfVector.append(LLc)
    PlantPerfVector.append(LLcm)
    PlantPerfVector.append(LLs)
    PlantPerfVector.append(PPr)
    PlantPerfVector.append(CCuf)
    PlantPerfVector.append(PPrTemp)
    PvPlantPerformance_Output = dict({'PlantPerfVector':PlantPerfVector , 'ModulePerfMatrix' : ModulePerfMatrix})
    return PvPlantPerformance


# In[2]:


def RainSnowMonthDays(RainSnowMonthDays_Input):
    #UNTITLED4 Summary of this function goes here
    #Detailed explanation goes here
    RainSnowMonths = RainSnowMonthDays_Input['RainSnowMonths']
    LeapYear = RainSnowMonthDays_Input['LeapYear']
    n= np.array([ np.zeros(31), np.zeros(28), np.zeros(31), np.zeros(30), np.zeros(31) , np.zeros(30) , np.zeros(31) , np.zeros(31) , np.zeros(30), np.zeros(31) , np.zeros(30) , np.zeros(31) ])
    if LeapYear == 0:
        for i in range(1,13):
            if (RainSnowMonths[i]==1):
                if(i==1):
                    n[i-1] = np.arange(1,32)
                elif(i==2):
                    n[i-1] = np.arange(1,29)
                elif(i==3):
                    n[i-1] = np.arange(1,32)
                elif(i==4):
                    n[i-1] = np.arange(1,31)
                elif(i==5):
                    n[i-1] = np.arange(32)
                elif(i==6):
                    n[i-1] = np.arange(31)
                elif(i==7):
                    n[i-1] = np.arange(32)
                elif(i==8):
                    n[i-1] = np.arange(32)
                elif(i==9):
                    n[i-1] = np.arange(31)
                elif(i==10):
                    n[i-1] = np.arange(32)
                elif(i==11):
                    n[i-1] = np.arange(31)
                elif(i==12):
                    n[i-1] = np.arange(32)
    elif LeapYear ==1:
        for i in range(1,13):
            if (RainSnowMonths[i]==1):
                if(i==1):
                    n[i-1] = np.arange(1,32)
                elif(i==2):
                    n[i-1] = np.arange(1,30)
                elif(i==3):
                    n[i-1] = np.arange(1,32)
                elif(i==4):
                    n[i-1] = np.arange(1,31)
                elif(i==5):
                    n[i-1] = np.arange(1,32)
                elif(i==6):
                    n[i-1] = np.arange(1,31)
                elif(i==7):
                    n[i-1] = np.arange(1,32)
                elif(i==8):
                    n[i-1] = np.arange(1,32)
                elif(i==9):
                    n[i-1] = np.arange(1,31)
                elif(i==10):
                    n[i-1] = np.arange(1,32)
                elif(i==11):
                    n[i-1] = np.arange(1,31)
                elif(i==12):
                    n[i-1] = np.arange(1,32)
    RainDays=[n[1],n[2],n[3],n[4],n[5],n[6],n[7],n[8],n[9],n[10],n[11],n[12] ]
    RainSnowMonthDays_Output = dict({'RainDays': RainDays , 'n' : n})
    return RainSnowMonthDays_Output


# In[3]:


def ResFileIndex(ResFileIndex_Input):
    DayCounter = ResFileIndex_Input['DayCounter']
    T = ResFileIndex_Input['T']
    Res = ResFileIndex['Res']
    #%UNTITLED3 Summary of this function goes here
    #Detailed explanation goes here
    #Computing DayPoints
    DayPoints=24*(60/Res)
    #Creating Time Vector for one day depending on the Simulation Resolution
    Time = np.arange(0,(1/(60/Res)),24)
    TimeCorrect = Time[0:-2]
    for i in range(len(TimeCorrect)):
        Difference[i]=abs((T-TimeCorrect[i]))
    for i in range(len(Difference)):
        for j in range(len(Difference[0])):
            temp = 1000000
            if(temp<Difference[i][j]):
                temp = Difference(i,j)
                idx = j
        M.append(temp)
        I.append(idx)
    Index=I+(DayPoints*(DayCounter-1))
    ResFileIndex_Output = dict({'Index':Index})
    return ResFileIndex_Output


# In[4]:


def SeasonalTilt(SeasnalTilt_Input):
    n = SeasonalTilt_Input = ['n']
    L = SeasonalTilt_Input = ['L']
    Ib = SeasonalTilt_Input = ['Ib']
    Id = SeasonalTilt_Input = ['Id']
    C = SeasonalTilt_Input = ['C']
    beta = SeasonalTilt_Input = ['beta']
    phi = SeasonalTilt_Input = ['phi']
    tilt = SeasonalTilt_Input = ['tilt']
    tiltsummer = SeasonalTilt_Input = ['tiltsummer']
    tiltwinter = SeasonalTilt_Input = ['tiltwinter']
    phic = SeasonalTilt_Input = ['phic']
    rho = SeasonalTilt_Input = ['rho']
    #UNTITLED10 Summary of this function goes here
    #Detailed explanation goes here
    if (n>=60)&(n<=181)&(L>=0):
        #It is summer in the northern hemisphere
        tiltactual=tiltsummer
    elif (n>=182)&(n<=304)&(L>=0):
        #It is middle period in the northern hemisphere
        tiltactual=tilt
    elif (((n>=305)&(n<=366))|((n>=1)&(n<=59)))&(L>=0):
        #It is winter in northern hemisphere
        tiltactual=tiltwinter
    elif (n>=60)&(n<=181)&(L<0):
        #It is winter in the southern hemisphere
        tiltactual=tiltwinter
    elif (n>=182)&(n<=304)&(L<0):
        # It is middle period in the southern hemisphere
        tiltactual=tilt
    elif (((n>=305)&(n<=366))|((n>=1)&(n<=59)))&(L<0):
        #It is summer in southern hemisphere
         tiltactual=tiltsummer
    CosInciAngle=(np.cos((pi/180)*(beta))*np.cos((pi/180)*(phi-phic))*np.sin((pi/180)*(tiltactual)))+(np.sin((pi/180)*(beta))*np.cos((pi/180)*(tiltactual))) #Incidence Angle
    Ibc=Ib*CosInciAngle; # Beam Component on Collector
    Idc=Id*((1+np.cos((pi/180)*(tiltactual)))/(2)); # Diffused Component on Collector
    Irc=rho*Ib*(np.sin((pi/180)*(beta))+C)*((1-np.cos((pi/180)*(tiltactual)))/(2)); # Reflected Component on the Collector
    Ic=Ibc+Idc+Irc; # Total Solar Irradiance on the collector   
    SeasonalTilt_Output = dict({'Ic':Ic , 'Ibc' : Ibc , 'Idc' : Idc , 'Irc' : Irc , 'CosInciAngle' : CosInciAngle})
    return SeasonalTilt_Output


# In[5]:


def StartEndCalender(StartEndCalender_Input):
    StartYear = StartEndCalender_Input['StartYear']
    StartMonth = StartEndCalender_Input['StartMonth']
    StartDay = StartEndCalender_Input['StartDay']
    TotDays = StartEndCalender_Input['TotDays']
    Res = StartEndCalender_Input['Res']
    DataCols = StartEndCalender_Input['DataCols']
    #UNTITLED9 Summary of this function goes here
    #Detailed explanation goes here
    # Initializing Start: Day, Month and Year
    SD=StartDay
    SM=StartMonth
    SY=StartYear
    # Computing Nuber of Data Points in One day and Total number of Days: DayPoints and TotDataPoints & Time Vector
    DayPoints=24*(60/Res)
    TotDataPoints=TotDays*DayPoints
    Time=np.arange(0,Res/60,(24-(Res/60)))
    Time=np.conjugate(Time)
    # Computing Total Number of Columns (Initial 4 Columns are for the Date time Signature)
    TotCols=DataCols+4;
    #Initializing DateTimeMatrix to Zeros and Count
    DateTimeMatrix=np.zeros([TotDataPoints,TotCols])
    Count=0
    #Intializing Month/Year Markers: Tn, Th, Tl and Yr 
    Tn=0
    Th=0
    Tl=0
    Yr=0
    #Creating DateTimeMatrix using FOR LOOP
    for i in range(TotDays):
        #Computing Current value of Start Year: SY
        if(i==1):
            SY=SY
            SM=SM
            SD=SD
        elif(SD==31 & SM==12):
            SY=SY+1
            SM=1
            SD=1
        #End of Year Marker
        Yr=1
    #Finding if current Year is a Leap Year using a Pre-defined Function
    LP=LeapYearFinder(SY)
    #Resetting Start Day and Start Month: SD, SM 1
    if(SD==31):
        SD=1
        SM=SM+1
        #End of Month Marker
        Tn=1
    elif(SD==30):
        for j in (4,6,9,11):
            if (SM==j):
                SD=1
                SM=SM+1
                #End of Month Marker
                Th=1
                break
    elif((SD==30) & (LP==0) & (SM==2) | (SD==29) & (LP==1) & (SM==2)):
        SD=1
        SM=SM+1
        #End of the Month marker
        Tl=1
    #####
    DayIncrement = (i!=1)&(((SD!=31)&(SM==1|SM==3|SM==5|SM==7|SM==8|SM==10|SM==12))|((SD!=30)&(SM==4|SM==6|SM==9|SM==11))|(SD!=28)&(LP==0)&(SM==2)|(SD!=29)&(LP==1)&(SM==2))
    if DayIncrement:
        if (Tn==1)|(Th==1)|(Tl==1)|(Yr==1):
            SD=1
        else:
            SD=SD+1
    for k in range(length(Time)):
        Count=Count+1
        DateTimeMatrix[Count,:]=[SD,SM,SY,Time(k,1),zeros(1,DataCols)]
    Tn=0
    Th=0
    Tl=0
    Yr=0
    StartEndCalender_Output = dict({'DateTimeMatrix' : DateTimeMatrix , 'TotDataPoints' : TotDataPoints , 'Time' : Time})
    return StartEndCalender_Output
    


# In[ ]:




