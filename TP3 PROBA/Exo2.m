clear variables;
close all;

lambda=0.3;
mu=0.5;
N=10000;
k=1:N;

%X
x=zeros(1,N);
for i=1:N
   x(i)=LoiGeometrique(lambda); 
end
[h,xout]=hist(x,k);
px_emp=h/N;
bar(k,px_emp,'g')
hold on;

px_th=(1-lambda).^(k-1)*lambda;
bar(k,px_th,0.5,'r')
xlim([0 15])
legend('Empirique','Theorique')

%Y
figure(2);
y=zeros(1,N);
for i=1:N
   y(i)=LoiGeometrique(mu); 
end
[h2,xout2]=hist(y,k);
py_emp=h2/N;
bar(k,py_emp,'g')
hold on;

py_th=(1-mu).^(k-1)*mu;
bar(k,py_th,0.5,'r')
xlim([0 15])
legend('Empirique','Theorique')

%Z
p=lambda+mu-lambda*mu;
figure(3)
z=zeros(1,N);
for i=1:N
    z(i)=min(x(i),y(i));
end
[h3,xout3]=hist(z,k);
pz_emp=h3/N;
bar(k,pz_emp,'g')
hold on;

pz_th=(1-p).^(k-1)*p;
bar(k,pz_th,0.5,'r')
xlim([0 15])
legend('Empirique','Theorique')

