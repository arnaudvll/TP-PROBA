clear variables;
close all;

a=-2;
b=3;
N=50000;


X=-2+5*rand(1,N);
[h,xout]=hist(X,50);
h=h/trapz(xout,h);
bar(xout,h)
x=linspace(a,b); 
f=1/(b-a);
hold on;
plot(x,f,'r')

E_th=(a+b)/2;
V_th=(b-a)^2/12;
Sigma_th=sqrt(V_th);

E_emp=mean(X);
Sigma_emp=std(X);