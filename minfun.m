function  ret = minfun( days_to_min,wt_days )

data=xlsread('khpars.csv');
clse_pric=data(:,4);

TC_b=0.00486;
TC_s=0.00529;
b_pric=zeros(1,size(clse_pric,1));
s_pric=zeros(1,size(clse_pric,1));
ret1=zeros(1,size(clse_pric,1));

for t=days_to_min+1:size(clse_pric,1)
    
    if clse_pric(t)== min(clse_pric(t-days_to_min:t)) && clse_pric(t)>0
        
        b_pric(t)=clse_pric(t);
        
        for j=t+wt_days:size(clse_pric,1)-wt_days
            
            if clse_pric(j)==max(clse_pric(j-wt_days:j))
                s_pric(t)=clse_pric(j);
                break
            end
            
        end
        ret1(t)=(s_pric(t)-TC_s*s_pric(t))/(b_pric(t)+TC_b*b_pric(t))-1;
    end
end

ret=mean(ret1(ret1>0));

end

