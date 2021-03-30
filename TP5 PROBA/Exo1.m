clear variables;
close all;

n=10000;
U=rand(1,n);
V=rand(1,n);
theta=2*pi*U;
R=sqrt(-2*log(V));
X=R.*cos(theta);
Y=R.*sin(theta);
k=linspace(-15,15,n);
[xout,k2]=hist(X,50);
subplot(3,1,1)
bar(k2,xout/trapz(k2,xout))
[yout,k2]=hist(Y,50);
subplot(3,1,2)
bar(k2,yout/trapz(k2,yout))


mu=4;
sigma=3;
Z=sigma*Y+mu;
[zout,k3]=hist(Z,50);
subplot(3,1,3)
bar(k3,zout/trapz(k3,zout))
hold on;
fz=1/(sigma*sqrt(2*pi))*exp(-(k-mu).^2/(2*sigma^2));
plot(k,fz,'linewidth',2)
Ez=mean(Z);
Sigma=std(Z);
text(-10,0.15,['E(Z) = ',num2str(Ez)]);
text(-10,0.12,['𝜎(Z) = ',num2str(Sigma)]);