clear variables;
close all;

%X et Y ~ U[0,1]
N=50000;
X=rand(1,N);
Y=rand(1,N);
Z=min(X,Y);
[h,zout]=hist(Z,50);
bar(zout,h/trapz(zout,h))
hold on;
z=0:0.1:1;
fz=2*(1-z);
hold on;
plot(z,fz)




