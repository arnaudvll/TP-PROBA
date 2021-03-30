clear variables;
close all;

N=50000;
x=0:0.1:16;
lambdax=1;
lambday=2;
X=-log(1-rand(1,N))/lambdax;
Y=-log(1-rand(1,N))/lambday;
U=X+2*Y;
[h,xout]=hist(U,50);
fu=x.*exp(-x);
plot(x,fu)
hold on;
bar(xout,h/trapz(xout,h))
xlim([0 16])

Eemp=mean(U);
Eth=trapz(x,x.*x.*exp(-x));

Vemp=trapz(x,x.^3.*exp(-x))-Eemp^2;
Vth=1/lambdax^2 +4/lambday^2



