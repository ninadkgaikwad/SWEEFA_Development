

'''Naveen Venkat: 21/03/22
  If Leap Year, then Leap=1;
  If Leap Year, the Leap=0;'''

def LeapYearFinder( Year ) :
  Leap = np.zeros(len(Year))

  for i in range(len(Year)) :
    a=Year[i]%4
    b=Year[i]%100
    c=Year[i]%400

    if ((a==0) & (b!=0)) | (c==0):
      Leap[i]=1
    else :
      Leap[i]=0

    LeapYearFinder_output = {"Leap" : Leap}
  
  return LeapYearFinder_output



'''Naveen Venkat: 21/03/22
UNTITLED2 Summary of this function goes here
Detailed explanation goes here
Values of U_{0} varied from 23.5 to 26.5 with a combined fit = 25 W/m^{2}K
Values of U_{1} varied from 6.25 to 7.68 with a combined fit = 6.84 W/m^{2}K'''

def ModulePower( Pmod,ModTemCF,ModNum,Tn,Gn,Icsf,T,Ic,Uo,U1,Ws ) :
  Tm=T+((Ic)/(Uo+(U1*Ws))) # Faiman's Module Temperature Model
  Pmodin=Pmod*(1+((ModTemCF/100)*(Tm-Tn)))*(Icsf/Gn) # Power generated in one Module
  Pmodtot=ModNum*Pmodin; # Power generated in all Modules

  ModulePower_output = {"Pmodtot":Pmodtot,"Pmodin":Pmodin,"Tm":Tm}

  return ModulePower_output






'''
Naveen Venkat: 21-3-22
# %UNTITLED11 Summary of this function goes here
# %   Detailed explanation goes here
'''
import numpy as np
#pip install ismember
from ismember import ismember

def PVEnergyCalculator( EnergyParameters,LenPVmod,yeardays ):
  #inialization
  length=len(EnergyParameters) #matlab code had len as variable name, changed it to length as len is a keyword in python

  EnergyModTotCell=np.zeros((1,len))

  EnergyDayWiseTotCell=np.zeros((1,len))

  EnergyTotCell=np.zeros((1,len))

  EnergyMonthWiseTotCell=np.zeros((1,len))

  #For Monthly Energy Computations
  
  #Month Days for Non-Leap Year
  jannl=np.arange(1,32)
  febnl=np.arange(32,60)
  marnl=np.arange(60,91)
  aprnl=np.arange(91,121)
  maynl=np.arange(121,152)
  junnl=np.arange(152,182)
  julnl=np.arange(182,213)
  augnl=np.arange(213,244)
  sepnl=np.arange(244,274)
  octnl=np.arange(274,305)
  novnl=np.arange(305,335)
  decnl=np.arange(355,366)

  #Month Days for Leap Year
  janlp=np.arange(1,32)
  feblp=np.arange(32,61)
  marlp=np.arange(61,92)
  aprlp=np.arange(92,122)
  maylp=np.arange(122,153)
  junlp=np.arange(153,183)
  jullp=np.arange(183,214)
  auglp=np.arange(214,245)
  seplp=np.arange(245,275)
  octlp=np.arange(275,306)
  novlp=np.arange(306,336)
  declp=np.arange(336,367)

  #Computing Energy Portions for every PV Cell Technology for the complete Time Period

  for i in range(0,length) :

    E=EnergyParameters[0,i]
    EnergyModTot=np.zeros((LenPVmod,1))

    for j in range(0,LenPVmod) :

      for k in range(0,yeardays):

        EnergyModTot[j,0]=EnergyModTot[j,0]+E[j,k]
      
    EnergyModTotCell[0,i]=EnergyModTot # Individual Cell Technology Contribution in Energy for year


  #Computing Energy Total Energy for Each Day
  for i in range(0,length) :

    E=EnergyParameters[0,i]
    EnergyDayWiseTot=np.zeros((1,yeardays))

    for k in range(0,yeardays):

      for j in range(0,LenPVmod) :      

        EnergyDayWiseTot[0,k]=EnergyDayWiseTot[0,k]+E[j,k]
      
    EnergyDayWiseTotCell[0,i]=EnergyDayWiseTot # Total Energy of PV System for a specific Day


  #Computing Energy Total Energy of Entire PV System for the given period of simulation

  for i in range(0,length) :

    E=EnergyModTotCell[0,i]

    EnergyTot=0

    for j in range(0,LenPVmod) :
      
      EnergyTot=EnergyTot+E[j,0]
    
    EnergyTotCell[0,i]=EnergyTot


  #Computing Total Energy Month-Wise

  for i in range(0,length) : 

    E=EnergyDayWiseTotCell[0,i]
    EnergyMonthWiseTot=np.zeros((0,12))

    for k in range(0,yeardays) :

      if yeardays==365 :

        if ismember(k,jannl)==1:
          EnergyMonthWiseTot[0,0]=EnergyMonthWiseTot[0,0]+E[0,k]
        elif ismember(k,febnl)==1 :
          EnergyMonthWiseTot[0,1]=EnergyMonthWiseTot[0,1]+E[0,k]
        elif ismember(k,marnl)==1 :
          EnergyMonthWiseTot[0,2]=EnergyMonthWiseTot[0,2]+E[0,k]
        elif ismember(k,aprnl)==1 :
          EnergyMonthWiseTot[0,3]=EnergyMonthWiseTot[0,3]+E[0,k]
        elif ismember(k,maynl)==1 :
          EnergyMonthWiseTot[0,4]=EnergyMonthWiseTot[0,4]+E[0,k]
        elif ismember(k,junnl)==1 :
          EnergyMonthWiseTot[0,5]=EnergyMonthWiseTot[0,5]+E[0,k]
        elif ismember(k,julnl)==1 :
          EnergyMonthWiseTot[0,6]=EnergyMonthWiseTot[0,6]+E[0,k]
        elif ismember(k,augnl)==1 :
          EnergyMonthWiseTot[0,7]=EnergyMonthWiseTot[0,7]+E[0,k]
        elif ismember(k,sepnl)==1 :
          EnergyMonthWiseTot[0,8]=EnergyMonthWiseTot[0,8]+E[0,k]
        elif ismember(k,octnl)==1 :
          EnergyMonthWiseTot[0,9]=EnergyMonthWiseTot[0,9]+E[0,k]
        elif ismember(k,novnl)==1 :
          EnergyMonthWiseTot[0,10]=EnergyMonthWiseTot[0,10]+E[0,k]
        elif ismember(k,decnl)==1 :
          EnergyMonthWiseTot[0,11]=EnergyMonthWiseTot[0,11]+E[0,k]

      elif yeardays==366 :

        if ismember(k,janlp)==1:
          EnergyMonthWiseTot[0,0]=EnergyMonthWiseTot[0,0]+E[0,k]
        elif ismember(k,feblp)==1 :
          EnergyMonthWiseTot[0,1]=EnergyMonthWiseTot[0,1]+E[0,k]
        elif ismember(k,marlp)==1 :
          EnergyMonthWiseTot[0,2]=EnergyMonthWiseTot[0,2]+E[0,k]
        elif ismember(k,aprlp)==1 :
          EnergyMonthWiseTot[0,3]=EnergyMonthWiseTot[0,3]+E[0,k]
        elif ismember(k,maylp)==1 :
          EnergyMonthWiseTot[0,4]=EnergyMonthWiseTot[0,4]+E[0,k]
        elif ismember(k,junlp)==1 :
          EnergyMonthWiseTot[0,5]=EnergyMonthWiseTot[0,5]+E[0,k]
        elif ismember(k,jullp)==1 :
          EnergyMonthWiseTot[0,6]=EnergyMonthWiseTot[0,6]+E[0,k]
        elif ismember(k,auglp)==1 :
          EnergyMonthWiseTot[0,7]=EnergyMonthWiseTot[0,7]+E[0,k]
        elif ismember(k,seplp)==1 :
          EnergyMonthWiseTot[0,8]=EnergyMonthWiseTot[0,8]+E[0,k]
        elif ismember(k,octlp)==1 :
          EnergyMonthWiseTot[0,9]=EnergyMonthWiseTot[0,9]+E[0,k]
        elif ismember(k,novlp)==1 :
          EnergyMonthWiseTot[0,10]=EnergyMonthWiseTot[0,10]+E[0,k]
        elif ismember(k,declp)==1 :
          EnergyMonthWiseTot[0,11]=EnergyMonthWiseTot[0,11]+E[0,k]

    
    EnergyMonthWiseTotCell[0,i]=EnergyMonthWiseTot


  PVEnergyCalculator_Output = {"EnergyModTotCell":EnergyModTotCell,"EnergyDayWiseTotCell":EnergyDayWiseTotCell,"EnergyTotCell":EnergyTotCell,"EnergyMonthWiseTotCell":EnergyMonthWiseTotCell}

  return PVEnergyCalculator_Output



import numpy as np

'''Naveen Venkat: 23/03/22
# %UNTITLED4 Summary of this function goes here
# %   Detailed explanation goes here
# % LID = Light Induced Degradation (for Crystalline Modules) (1-3%; Default=2%)
# % LS = Light Soaking (For Thin Flim Modules)(3-5% or more; Default=3%)
# % Arraymismat = Array Mismatch Factor (Default=2%)
# % Crys = Is the PV Technology Crystalline (Crys==1) or Thin Film (Crys==0)??
# % Shading = Shading Loss Factor (Default=1%)
# % OhmicLoss = Array wiring loss (Default=3%)
# % INVeff = Inverter Efficiency (%; Given in Inverter Datasheet)
# % TransLoss = Transformer Loss Factor (Default=1%)

# % Calculating Power Output from Array'''

def PVoutputPower( Pmodtot, LID,LS,Arraymismat,Crys,Shading, OhmicLoss,TrackerL,INVeff,TransLoss  ) :
  if (Crys==1) :
    PVout=Pmodtot*(1-((LID+Arraymismat+Shading)/100))
  else :
    PVout=Pmodtot*(1-((Arraymismat+Shading)/100)+((LS)/100))
  
  #Calculating Power Input to Inverter
  INVpin=PVout*(1-(OhmicLoss/100))

  #Calculating Power Output from Inverter (%INVpout=INVpin*(1+(INVTemCF*(T-Tn)));)
  INVpout=INVpin*(INVeff/100)

  #Calculating Power Output from Inverter (%INVpout=INVpin*(1+(INVTemCF*(T-Tn)));)
  TrackerLossPP=INVpout*(1-(TrackerL/100))

  #Calculating Power Output to Grid through Transformer
  Pgrid=TrackerLossPP*(1-(TransLoss/100))

  #Calculating Power Losses 
  ArrayMismatchLoss=Pmodtot*(Arraymismat/100)
  ShadingLoss=Pmodtot*(Shading/100)
  LIDLoss=Pmodtot*(LID/100)
  OhmicLossP=PVout*(OhmicLoss/100)
  InverterLoss=INVpin*(1-(INVeff/100))
  TrackerLossP=INVpout*(TrackerL/100)
  TransformerLossP=INVpout*(TransLoss/100)
  

  PVoutputPower_output= {"PVout":PVout,"INVpin":INVpin,"INVpout" :INVpout,"Pgrid" : Pgrid,"ArrayMismatchLoss":ArrayMismatchLoss,"ShadingLoss":ShadingLoss,"LIDLoss":LIDLoss,"OhmicLossP":OhmicLossP,"InverterLoss":InverterLoss,"TransformerLossP":TransformerLossP,"TrackerLossP":TrackerLossP}
  

  return PVoutputPower_output



import numpy as np
import pandas as pd 
'''Naveen Venkat: 23/03/22
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Note: ResOriginal Should Always Be Smaller Than ResNew; And 60mins Should be integral multiples of both

% Note: Same Function can be used to convert files to Half-Hourly or Hourly Files

% %% Getting the Raw Data File in the MATLAB WorkSpace
% 
% % File Selection
% [Filename,Pathname]=uigetfile({'*.*'},'Raw Data File Selector');
% 
% Fullpathname=strcat(Pathname,Filename);
% 
% [ProcessedData]=xlsread(Fullpathname,1);

%% Computing Size of ProcessedData Matrix'''
# 
def MINToDayDataCoverterApp( ProcessedData,DataCols,Res,AvgOrAdd ) :
   
  Row1,Col1=ProcessedData.shape
   #2 lines of code needs to be added here 
  #ProcessedData(Row1+1,:)=0
   
  Row,Col=ProcessedData.shape
  #ProcessedData=ProcessedData(1:(Row-1),:)
  Row,Col=ProcessedData.shape

   # Computing the DayDataPoints

  DayDataPoints=24*(60/Res)
  RowNew=(Row/DayDataPoints) #computing Number of Rows for the PRocessedData1 Matrix

  #Initializing The New ProcessedData Matrix
  ProcessedData1=np.zeros(RowNew,(3+DataCols))

  #Computing Number off ROWS to be AVERAGED or ADDED
  NumRows=DayDataPoints

  #Initializing Index for ProcessedData1 Matrix
  Index1=0

  #FOR LOOP for Averging and Adding to get Desired ResNew according to AvgOrAdd
  
  #FOR LOOP for each ROW of ProcessedData

  for i in range(1,Row+1,NumRows) :
    #Incrementing Index1 for placing Data in Correct Rows of ProcessedData1 Matrix
    Index1=Index1+1

    #FOR LOOP for each DataCol

    for k in range(1,DataCols+1) :
      Indicator=AvgOrAdd[1][k] #For indication Values Should be Averaged or Added

      Add=0 # Initializing Add Variable to Zero

      Avg=np.zeros(1,NumRows) # Initializing Avg Vector to Zeros

      #FOR LOOP for Averaging & Adding as Per RES Values

      for j in range(1,NumRows+1) :

        RowIndex=(i-1)+j # Computing RowIndex

        if (Indicator==1) : # ADDITION
          Add=Add+ProcessedData[RowIndex][k+4]
        
        elif (Indicator==0 ) : # AVERAGE
          Avg[1][j]=ProcessedData[RowIndex][k+4]
      
      ProcessedData1[Index1][1:3]=ProcessedData[RowIndex][1:3] # Copying Correct DateTime Stamp

      if (Indicator==1) : # ADDITION
          ProcessedData1[Index1][k+3]=Add # Copying Correct Data Value
        
      elif (Indicator==0 ) : # AVERAGE
          ProcessedData1[Index1][k+3]=sum(Avg)/NumRows # Copying Correct Data Value



  #Writing the ProcessedData Matrix to an Excel File
  df= pd.DataFrame(ProcessedData1)

  #code needs to be added here 


  MINToDayDataCoverterApp_output= {"ProcessedData1" : ProcessedData1}

  filename = 'Converted_File_DailyResolution.xlsx'
  df.to_excel(filename,
             sheet_name='Sheet_name_1')


  return MINToDayDataCoverterApp_output







