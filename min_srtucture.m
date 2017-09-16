clc
clear
close all
mydata=readtable('khsapa.csv');
clse_prc=mydata.x_CLOSE_;
TC_b=0.00486;
TC_s=0.00529;
% i=30;
% j=10;
ret=zeros(30,10);
for i=1:30
    for j=1:10
min_clse_prc=zeros(size(clse_prc,1)-i,1);
idx=zeros(1,size(clse_prc,1)-i);
max_clse_prc=zeros(size(clse_prc,1)-i,1);
idx1=zeros(1,length(idx)-j);

for p=1:size(clse_prc,1)-i
    
    [min_clse_prc(p),idx(p)]=min(clse_prc(p:p+i));
    idx(p)=idx(p)+p-1;
    
end
for q=1:size(idx,2)-j
    
    [max_clse_prc(q),idx1(q)]=max(clse_prc(idx(q):idx(q)+j));
    idx1(q)=idx1(q)+idx(q);
end

max_clse=clse_prc(idx1);
min_clse=clse_prc(idx(1:length(max_clse)));
ret1=(max_clse-TC_s*max_clse)./(min_clse+max_clse*TC_b)-1;
ret(i,j)=mean(ret1);
    end
end

plot(clse_prc)
hold on
scatter(idx,clse_prc(idx),40,'k','filled')
scatter(idx1,clse_prc(idx1),40,'r','filled')
legend('Close Price','Buy Price','Sale Price')
