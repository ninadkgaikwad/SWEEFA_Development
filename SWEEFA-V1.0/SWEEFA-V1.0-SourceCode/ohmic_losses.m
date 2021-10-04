function [ohmic_loss_percent] = ohmic_losses( a , rho , Vdcm , inv_power , dia , total_length , single_length , out_power,n,N )

% Enter a as either 1 or 2
% If you select 1 then give the inputs of rho, Vdcm, inv_power, dia and
% total_length only.
% If you select 2 then give the inputs of rho, Vdcm, inv_power, dia and
% single_length. If you do not know the total length and know the length of
% a single cable then you should give 0 as an argument for total length.

% ohmic_loss gives us the ohmic loss in ohms

% rho is the resistivity of the material of your cable in ohm meter

% Vdcm is the maximum input dc volatage to the inverter in Volts

% inv_power is the maximum input power to the inverter in Watts

% dia is the diameter of each cable in meters

% total_length is the total length of all cables in meters

% single_length is the length of one cable in meters

if(a==1)
    
    R_total = ( rho * total_length * 4 ) / ( pi * dia * dia ) ;
    
end

if(a==2)
    
    R_total = ( N * rho * single_length * 4 ) / ( pi * dia * dia ) ;       % N from Ninad's function
    
end

I_inv = inv_power / ( Vdcm * n ) ;                                         % n from Ninad's function
% I_inv is the current in each inverter in Ampere
% n is the number of inverters

I_string = I_inv / N ;                                                     % N from Ninad's function
% I_string is the current in each string in Ampere
% N is the number of strings connected to one inverter

ohmic_loss = ( I_string ^ 2 ) * R_total ;
% This giver the power loss due resistance or the ohmic loss in Watts

ohmic_loss_percent = ( ohmic_loss / out_power ) * 100 ;
% ohmic losses of the plant in percentage