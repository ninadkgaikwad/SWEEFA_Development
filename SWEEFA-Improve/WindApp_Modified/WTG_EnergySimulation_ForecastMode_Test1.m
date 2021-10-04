%% Code Structure : For Finding Sub_T Index

for i=1:length(a)
    
    a1=a{1,i}
    
    ab=find(a1==22)
    
    if(isempty(ab))
        
        a2(1,i)=0
        
    else
        
        a2(1,i)=ab
        
    end
    
end