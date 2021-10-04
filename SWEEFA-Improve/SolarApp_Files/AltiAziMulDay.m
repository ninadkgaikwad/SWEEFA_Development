function [ beta, phi] = AltiAziMulDay( dec ,L, H)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here
len1=length(dec);

len2=length(H);


    for i=1:len1
        
        for j=1:len2
      
            %e=(cos(L(1,i)*(pi/180))*cos(dec(1,i)*(pi/180))*cos(H(1,i)*(pi/180)))+(sin(L(1,i)*(pi/180))*sin(dec(1,i)*(pi/180)))    
        
             beta(i,j)=(180/pi)*(asin((cos(L*(pi/180))*cos(dec(1,i)*(pi/180))*cos(H(1,j)*(pi/180)))+(sin(L*(pi/180))*sin(dec(1,i)*(pi/180)))));
            
                       
             azi1(i,j)=(180/pi)*(asin((cos(dec(1,i)*(pi/180))*sin(H(i,j)*(pi/180)))/(cos(beta(i,j)*(pi/180)))));
    
             
             
             azi11(i,j)=abs(azi1(i,j));
    
             azi2(i,j)=180-azi11(i,j);
    
             azi22(i,j)=abs(azi2(i,j));
    
             x=cos(H(i,j)*(pi/180));
    
             y=(tan(dec(1,i)*(pi/180)))/(tan(L*(pi/180)));
    
       
            if x>=y
                
                phi(i,j)=azi1(i,j);
                
            else
                
                if azi1(i,j)>=0
                    
                    phi(i,j)=azi2(i,j);
                    
                else
                    
                    phi(i,j)=-(azi2(i,j));
        
                end
                
            end
        
            
        
               
            
               end
               
               
            end
        end

