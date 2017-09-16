clc
clear
close all

for i=1:30
    for j=1:10
        ret(i,j)= minfun( i,j );
    end
end