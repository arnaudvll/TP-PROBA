clear variables;
close all;

N=5000;
n=8;
X=zeros(1,N);
for i=1:N
    a=randi(n);
    b=randi(n);
    X(i)=min(a,b);
end 

hold on;
k_tab=1:n-1;
[h,xout]=hist(X,k_tab);
proba_emp=h/N;
bar(xout,proba_emp)

%proba théorique
proba_theo=2*(n-k_tab)/(n*(n-1));
bar(xout,proba_theo,0.5,'w')
legend('empirique','théorique')

E_emp=0;
E_emp2=0;
for i=1:n-1
    E_emp=E_emp+i*proba_emp(i);
    E_emp2=E_emp2+i^2*proba_emp(i);
end

V_emp=E_emp2-E_emp^2;
Sigma_emp=sqrt(V_emp);


E_theo=(n+1)/3;
V_theo=(n^2-n-2)/18;
Sigma_theo=sqrt(V_theo);


%Affichage du texte
txt_exp=[num2str(N),' expériences'];
text(5.5,0.2,txt_exp);
text(5.5,0.22,[num2str(n),' boules']);
text(5.5,0.18,['E(X)emp=',num2str(E_emp)]);
text(5.5,0.16,['E(X)th=',num2str(E_theo)]);
text(5.5,0.13,['V(X)emp=',num2str(V_emp)]);
text(5.5,0.11,['V(X)th=',num2str(V_theo)]);

