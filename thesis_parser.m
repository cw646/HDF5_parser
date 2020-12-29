clear all;
start = 1.0;
count = 13800.0;
%read = h5read('301/particles0010.h5','/table',start,count)
store = [];
store1 = [];
shear1 = [];
visco1= [];
strain1= [];
test4 = [];
octa = [];
sq = [];
dx= [];


% for i=1:999
% 
% FileName  = sprintf('301/particles%04d.h5', i);
% 
% read = h5read(FileName,'/table',start,count);
% store(i) = read.tau_yz;
% shear(i) = read.svars_4;
% 
% end


 j = 1;

FileName  = sprintf('results/folder/particles000000.h5')

read = h5read(FileName,'/table',start,count)

max_x = max(read.coord_x);
min_x = min(read.coord_x);
store1(j) = max_x - min_x;
store2(j) = mean(read.svars_1)
shear1(j) = mean(read.svars_6)

j = j+1;

for i = 1000:1000:210000 

    i
FileName  = sprintf('results/folder/particles%06d.h5', i);

read = h5read(FileName,'/table',start,count);

max_x = max(read.coord_x);
min_x = min(read.coord_x);
store1(j) = max_x - min_x
store2(j) = mean(read.svars_1)
shear1(j) = mean(read.svars_6)
dx(j) = store1(j) - store1(j-1);
dxmm(j) = dx(j)*1000;
j = j+1;


end

%[zz] = meshgrid(store1)
 

 figure
 plot(store1)
 figure
 plot(dx)
 %surf(shear1,strain1,zz)
 %scatter(shear1,store1)
 %plot(visco1, store1, 'x-')


%scatter3(shear1,store1, strain5)
%  plot(strain3,'o-')
%  plot(strain4,'x-')