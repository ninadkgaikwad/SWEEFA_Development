function [E] = Perez_model ( theta_t, L , phic )

% theta_t is the array tilt angle in degree

% L is the latitude of the place

% phic is the azimuth of the collecctor

Ea = 1367 ;
% Ea is the absolute extraterrestrial radiation in W/m^2

%DHI_set = xlsread ( 'PerezDHI.xlsx') ;

%DNI_set = xlsread ( 'PerezDNI.xlsx') ;
DHI_set = getappdata(Perez_Figure,'DHI_set');
DNI_set = getappdata(Perez_Figure,'DNI_set');
[ row , column ] = size ( DHI_set ) ;

DHI = DHI_set ( 1 : row , column ) ;
% DHI is the diffuse horizontal irradiance in W/m^2

DNI = DNI_set ( 1 : row , column ) ;
% DNI is the direct normal irradiance in W/m^2

k = 5.535 * 10 ^ -6 ;

C= zeros( row , 1 ) ;

for i = 1 : ( row )
    
    for j = 1
        
        date = DHI_set ( i , 1 ) ;
 
        month = DHI_set ( i , 2 ) ;
 
        year = DHI_set ( i , 3 ) ;
        
        [ Hp ] = DHI_set ( i , 4 ) ;
        [ H ] = HourAngle ( Hp ) ;
        [ n ] = JulianDay ( date , month , year ) ;
        [ dec ] = Declination ( n ) ;
        [ beta , phi ] = AltiAzi ( dec , L , H ) ;
        
        epsilon = ( ( ( DHI(i,1) + DNI(i,1) ) / DNI(i,1) ) + ( k * (90 - beta) ^ 3 ) ) / ( 1 + k * (90 - beta) ^ 3 ) ;        % theta_z from function
        
        if ( epsilon > 1 && epsilon < 1.065 )
            
            f11 = -0.008 ; f12 = 0.588 ; f13 = -0.062 ; f21 = -0.06 ; f22 = 0.072 ; f23 = -0.022 ;
        
        end
        
        if ( epsilon > 1.065 && epsilon < 1.230 )
            
            f11 = 0.13 ; f12 = 0.683 ; f13 = -0.151 ; f21 = -0.019 ; f22 = 0.066 ; f23 = -0.029 ;
        
        end
        
        if ( epsilon > 1.230 && epsilon < 1.500 )
            
            f11 = 0.33 ; f12 = 0.487 ; f13 = -0.221 ; f21 = 0.055 ; f22 = -0.064 ; f23 = -0.026 ;
        
        end
        
        if ( epsilon > 1.500 && epsilon < 1.950 )
            
            f11 = 0.568 ; f12 = 0.187 ; f13 = -0.295 ; f21 = 0.109 ; f22 = -0.152 ; f23 = -0.014 ;
        
        end
        
        if ( epsilon > 1.950 && epsilon < 2.800 )
            
            f11 = 0.873 ; f12 = -0.392 ; f13 = -0.362 ; f21 = 0.226 ; f22 = -0.462 ; f23 = 0.001 ;
        
        end
        
        if ( epsilon > 2.800 && epsilon < 4.500 )
            
            f11 = 1.132 ; f12 = -1.237 ; f13 = -0.412 ; f21 = 0.288 ; f22 = -0.823 ; f23 = 0.056 ;
        
        end
        
        if ( epsilon > 4.500 && epsilon < 6.200 )
            
            f11 = 1.06 ; f12 = -1.6 ; f13 = -0.359 ; f21 = 0.264 ; f22 = -1.127 ; f23 = 0.131 ;
        
        end
        
        if ( epsilon > 6.200 )
            
            f11 = 0.678 ; f12 = -0.327 ; f13 = -0.25 ; f21 = 0.156 ; f22 = -1.377 ; f23 = 0.251 ;
        
        end

        del = ( DHI(i,1) * AirMassRatio(beta) ) / Ea ;                                                              % AM from function...
        
        F1 = max ( 0 , ( f11 + f12 * del + ( (pi * (90 - beta)) / 180 ) * f13 ) ) ;                     % theta_z from function
        
        F2 = f21 + f22 * del + ( ( pi * (90 - beta) ) / 180 ) * f23 ;                                   % theta_z from function
        % F1 and F2 are complex emperical functions which describe circumsolar and
        % horizon brightness
        
        a = max (0 , FixedTilt(beta,phi,theta_t,phic) ) ;                                                             % incidence from function...
        
        b = max (cos(85) , cos(90 - beta) ) ;                                                         % theta_z from function
        
        E = DHI(i,1) * ( ( (1 - F1) * ( ( 1 + cos(theta_t) ) / 2 ) + F1 * ( a / b ) +  F2 * sin(theta_t) ) ) ;
        
        C(i,1) = E ;

    end
    
end
Q = [ DHI_set C ];
%xlswrite ( ' PerezOut.xls ' , DHI_set ) ;
 x=uiputfile('Perez_Out.xlsx'); 
xlswrite ( x , Q  ) ;

end