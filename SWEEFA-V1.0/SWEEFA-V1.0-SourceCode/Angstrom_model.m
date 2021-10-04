function [ H ] = Angstrom_model ( Y , M , month , Lat , L , NL , a , b )

Isc = 1367 ;
% Solar constant in W/m^2

if ( L == 1 ) % Leap Year
    
    N_total = { 1:31 , 32:60 , 61:91 , 92:121 , 122:152 , 153:182 , 183:213 , 214:244 , 245:274 , 275:305 , 306:335 , 336:366 } ;

elseif ( NL == 1 ) % Non-Leap Year
    
    N_total = { 1:31 , 32:59 , 60:90 , 91:120 , 121:151 , 152:181 , 182:212 , 213:243 , 244:273 , 274:304 , 305:334 , 335:365 } ;
    
end

if ( Y == 1 )
    
    H_year = zeros ( 1 , 12 ) ;
    
    for i = 1 : 12
    
    n = N_total { 1 , i } ;
    
    [ row , column ] = size ( n ) ;
    
    S0_all = zeros ( row , column ) ;
    
    H0_all = zeros ( row , column ) ;
    
    for j = row
        
        for k = 1 : column
            
            delta = 23.45 * sin( (pi/180)*(( 360 * ( 284 + n(j,k) ) ) / 365) );
            % Solar declination angle in degree

            omega_s = acos ( - tan( (pi/180)*Lat ) * tan( (pi/180)*delta ) ) ;
            
            omega_s=(180/pi)*omega_s;
            
            % Solar hour angle in degree

            S0_all(j,k) = (2/15) * omega_s ;
                
            H0_all(j,k) = ( 24 / pi ) * Isc * ( 1 + 0.33 * cos((pi/180)*( ( 360 * n(j,k) ) / 365 ) )) * ( cos((pi/180)*(delta)) * cos((pi/180)*Lat) * sin((pi/180)*omega_s) + ( ( 2 * pi * omega_s ) / 360 ) * sin((pi/180)*Lat) * sin((pi/180)*delta) );
            
        end
        
    end
    
    S0 = max ( S0_all ) ;

    S = sum ( S0_all ) / column ;
                
    H0 = sum ( H0_all ) / column ;
                
    H_year( 1 , i )  = H0 * ( a + b * ( S / S0 ) ) ;
    
    end

H = H_year ;

elseif ( M == 1 )
    
         H_year = zeros ( 1 , 12 ) ;
        
         n = N_total { 1 , month } ;
        
         [ row , column ] = size ( n ) ;
    
         S0_all = zeros ( row , column ) ;
    
         H0_all = zeros ( row , column ) ;
    
         for j = row
        
             for k = 1 : column
            
            delta = 23.45 * sin( (pi/180)*(( 360 * ( 284 + n(j,k) ) ) / 365) );
            % Solar declination angle in degree

            omega_s = acos ( - tan( (pi/180)*Lat ) * tan( (pi/180)*delta ) ) ;
            
            omega_s=(180/pi)*omega_s;
            
            % Solar hour angle in degree

            S0_all(j,k) = (2/15) * omega_s ;
                
            H0_all(j,k) = ( 24 / pi ) * Isc * ( 1 + 0.33 * cos((pi/180)*( ( 360 * n(j,k) ) / 365 ) )) * ( cos((pi/180)*(delta)) * cos((pi/180)*Lat) * sin((pi/180)*omega_s) + ( ( 2 * pi * omega_s ) / 360 ) * sin((pi/180)*Lat) * sin((pi/180)*delta) );
            
            end
        
        end
    
        S0 = max ( S0_all ) ;

        S = sum ( S0_all ) / column ;
                
        H0 = sum ( H0_all ) / column ;
                
        H_year(1,month)  = H0 * ( a + b * ( S / S0 ) ) ;
        
        H = H_year ;
        
end
        
    