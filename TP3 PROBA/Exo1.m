clear variables;
close all;

n_cases=24;
cx=[0:n_cases];
cy=[0:n_cases];
[CX,CY]=meshgrid(cx,cy);
mesh(CX,CY,zeros(n_cases+1,n_cases+1));
n_impacts=537;
hold on;

M=zeros(n_cases);
for i=1:n_impacts
    a=1+(n_cases-1)*rand();
    b=1+(n_cases-1)*rand();
    M(floor(a),floor(b))=M(floor(a),floor(b))+1;
    plot(a,b,'*r')
end
M=M(:);
k=0:max(M);
[h,xout]=hist(M,k);
figure(2)
bar(xout,h)
hold on;

lambda=mean(M);
k2=0:10;
p=576*(exp(-lambda)*lambda.^k2)./factorial(k2);
bar(k2,p,0.5,'r')
legend('Empirique','Theorique (Loi de poisson)');

E_th=lambda;
E_emp=std(M);

text(3,150,['Ecart type empirique : ',num2str(E_emp)]);
text(3,125,['Ecart type théorique : ',num2str(E_th)]);