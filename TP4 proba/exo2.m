clear variables;
close all;

n=5000;
Y=rand(1,n);
X=6.^Y-4;
[h,xout]=hist(X,50);
h=h/trapz(xout,h);
x=-3:0.1:2;
f=(1/log(6))./(x+4);
bar(xout,h)	
hold on;
plot(x,f,'r','LineWidth',2)
legend('densité simulée','densité théorique');

E_emp=mean(X);
Sigma_emp=std(X);

E_th=(5-4*log(6))*(1/log(6));
E_th2=trapz(x,x.^2.*f);

V_th=E_th2-E_th^2;
Sigma_th=sqrt(V_th);




