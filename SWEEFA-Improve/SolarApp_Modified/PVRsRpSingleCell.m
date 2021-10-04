function [Rs,Rp,V,I,P,Pmaxmn] = PVRsRpSingleCell(Vocn,Iscn,Vmpn,Impn,Pmen,Kv,Ki,U,Ns,Tn,Gn,T,G )
%UNTITLED13 Summary of this function goes here
% Vocn = Open Circuit Voltage (V)
% Iscn = Short Circuit Current (A)
% Vmpn = MPP Voltage (V)
% Impn = MPP Current (I)
% Pmen = MPP Power (W)
% Kv = Voc Temperature Co-efficient
% Ki = Isc Temperature Co-efficient
% Kp = Pme Temperature Co-efficient
% a = Diode Ideality Factor ranges from, 1<=a<=1.5
% U = 1, if Temp Co-effs are in Units/Degree; U = 2, if Temp Co-effs are in Percent/Degree 
% Ns = Number of cells in series in a Module
% Tn = Standard Experiment Temperature (Degree Celsius)
% Gn = Standard Experiment Insolation (W/m^(2))
% T = Temperature (Degree Celsius)
% G = Experiment Insolation (W/m^(2))
%   Detailed explanation goes here


% Constants
q=1.60217646*10^(-19); % Charge of electron (C)
k=1.3806503*10^(-23); % Boltzman's Constant (J/K)

% Celsius to Kelvin
Tkn=273.15+Tn;
Tk=273.15+T;
Tdel=Tk-Tkn;

% Calculating Thermal Voltage Vtn and Vt
Vtn=(k*Tkn)/(q);
Vt=(k*Tk)/(q);

% Unit Correction for Kv,Ki and

if U==1
  
  Kvv=Kv;
  Kii=Ki;
  %Kpp=Kp;
 
elseif U==2
    
  Kvv=Kv/100*Vocn;
  Kii=Ki/100*Iscn;
  %Kpp=Kp/100*Pmen;
    
end
% Calculations for change in Insolation and Temperature
    Voc=Vocn+(Kvv*Tdel);
    Isc=((Iscn+(Kii*Tdel))*(G/Gn));
    Ist=Iscn+(Kii*Tdel);
    Vmp=Vmpn+(Kvv*Tdel);
    Imp=(Impn+(Kii*Tdel))*(G/Gn);
    Pme=Vmp*Imp;%Pmen+(Kpp*Tdel);

% Initial Values of Rs and Rp
Rs=0;
Rp= ((Vmpn)/(Iscn-Impn))-((Vocn-Vmpn)/(Impn));
Rpmin=Rp;
Rsmax=((Vocn-Vmpn)/(Impn));

%Ipv(1,1)=((Rs(1,1)+Rp(1,1))/Rp(1,1))*Isc;
%Rp(1,1)=1;

% Intial Value of Pmm (Model Maximum Power),Error (Er) and Diode Ideality Factor(a)
%Pmaxm=0;
%Er=abs(Pmaxm-Pme);
Er=inf;
a=1;

% Tolerance Value (Tol)
Tol=0.0001;

% Initializing Loop Counter and spacing of Voc (n)
i=0;
imax=500000;
n=100;

% Calculating Rs and Rp

    while (Er>Tol)&&(Rp>0)&&(i<imax)%(Er>Tol)&&(Rp>0)&&
    
            i=i+1;

            

            % Calculation of Ipv and Io
            Ipvn=((Rs+Rp)/Rp)*Iscn;  
            
            Ipv=Ipvn;

            %Ipv = (Ipvn + Kii*Tdel) *G/Gn;      

            Io = (Ipv - (Vocn/Rp))/(exp(Vocn/Vtn/a/Ns)-1);

            % Increments Rs 
            Rs  = Rs + 0.001;

            Rpp = Rp;

            % Egap = 2.72370016e-19;  % Bandgap do silício amorfo em J (=1.7 eV)
            Egap = 1.8e-19;         % Bandgap do silício cristalino em J (=1.124 eV)

            a = (Kvv - Vocn/Tkn) / ( Ns*Vtn * ( Kii/Ipv - 3/Tkn - Egap/(k*Tkn^2) ) );

            % Calculating Rp
            Rp = Vmpn*(Vmpn+Impn*Rs)/(Vmpn*Ipv-Vmpn*Io*exp((Vmpn+Impn*Rs)/Vtn/Ns/a)+Vmpn*Io-Pmen);

            % Solving the I-V equation for several (V,I) pairs 
        clear V
        clear I

        V = 0:Vocn/n:Vocn;        % Voltage vector
        I = zeros(1,size(V,2));    % Current vector

                for j = 1 : size(V,2) %Calculates for all voltage values 
                    
                % Solves g = I - f(I,V) = 0 with Newton-Raphson

                g(j) = Ipv-Io*(exp((V(j)+I(j)*Rs)/Vtn/Ns/a)-1)-(V(j)+I(j)*Rs)/Rp-I(j);
                
                m=0;

                                while (abs(g(j)) > 0.001)
                                    
                                    m=m+1;

                                g(j) = Ipv-Io*(exp((V(j)+I(j)*Rs)/Vtn/Ns/a)-1)-(V(j)+I(j)*Rs)/Rp-I(j);
                                glin(j) = -Io*Rs/Vtn/Ns/a*exp((V(j)+I(j)*Rs)/Vtn/Ns/a)-Rs/Rp-1;
                                I_(j) = I(j) - g(j)/glin(j);
                                I(j) = I_(j);
                                    
                                end  

                end % for j = 1 : size(V,2)


    
% Calculating Pmax for each counter of while loop 

  P = (Ipv-Io*(exp((V+I.*Rs)/Vtn/Ns/a)-1)-(V+I.*Rs)/Rp).*V;
  
  [Pmaxmn,jj] = max(P);
  
  
  Er =(Pmaxmn-Pmen);
             
   
    
end % for main whlie loop

    if (Rp<0) 
        
        Rp = Rpp ;
   
    end
    
end

