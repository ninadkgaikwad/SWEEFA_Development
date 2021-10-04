function [Rs,Rp,Voc,Isc,Vmp,Imp,Pme,Rpmin,Rsmax,Kii,Kvv,Tk,Tkn,Vt,Vtn,a,Tol,Er,V,I,P,Pmaxmn,Vocg1,Iog1,Iscn] = PVRsRp(Vocn,Iscn,Vmpn,Impn,Pmen,Kv,Ki,U,Ns,Tn,Gn,T,G )
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
  Vocg1=V(jj);
  Iog1=I(jj);
  
  Er =(Pmaxmn-Pmen);
             
   
    
end % for main whlie loop

    if (Rp<0) 
        
        Rp = Rpp ;
   
    end

% %Plots the I-V and P-V curves
% 
%   %Current x Voltage
%   figure(1) 
%   grid on
%   hold on 
%   title('I-V curve - Adjusting Rs and Rp');
%   xlabel('V [V]');
%   ylabel('I [A]');
%   xlim([0 Vocn+1]);
%   ylim([0 Iscn+1]);
%  
%   %Plots I x V curve
%   plot(V,I,'LineWidth',2,'Color','k') 
%  
%   %Plots the "remarkable points" on the I x V curve
%   plot([0 V(jj) V(length(V))],[Iscn I(jj) 0],'o','LineWidth',2,'MarkerSize',5,'Color','k') 
% 
%   
%   %Power x Voltage
%   figure(2)  
%   grid on
%   hold on  
%   title('P-V curve - Adjusting peak power');
%   xlabel('V [V]');
%   ylabel('P [W]');
%   xlim([0 Vocn])
%   ylim([0 Vmpn*Impn*1.2]); 
%    
%   P = (Ipv-Io*(exp((V+I.*Rs)/Vtn/Ns/a)-1)-(V+I.*Rs)/Rp).*V;
%    Pmaxmn = max(P);
%   plot(V,P,'LineWidth',2,'Color','k')
%   
%   %Plots the "remarkable points" on the power curve
%   plot([0 V(jj) V(length(V))],[0 Pmaxmn 0],'o','LineWidth',2,'MarkerSize',5,'Color','k')
%   
% disp(sprintf('Method 1 - complete model at Standard Conditions\n'));
% disp(sprintf(' Rp_min = %f',Rpmin));
% disp(sprintf('     Rp = %f',Rp));
% disp(sprintf(' Rs_max = %f',Rsmax));
% disp(sprintf('     Rs = %f',Rs));
% disp(sprintf('      a = %f',a));
% disp(sprintf('      T = %f',Tkn-273.15));
% disp(sprintf('      G = %f',G));
% disp(sprintf(' Pmax,m = %f  (model)',Pmaxmn));
% disp(sprintf(' Pmax,e = %f  (experimental)',Pmen));
% disp(sprintf('    tol = %f',Tol));
% disp(sprintf('P_error = %f',Er));
% disp(sprintf('    Ipv = %f',Ipv));
% disp(sprintf('    Isc = %f',Iscn));
% disp(sprintf('    Ion = %g',Io));
% disp(sprintf('\n\n'));
      

end

