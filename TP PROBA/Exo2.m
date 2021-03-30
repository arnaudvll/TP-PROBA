clear variables;
close all;

N=10000;
loi=4;
switch loi
    case 1
        n=40;
        x=zeros(1,N);
        for i=1:N
            x(i)=LoiUniforme(n);
        end
        [h,xout]=hist(x,1:n);
        proba_emp=h/N;
        k=1:n;
        proba_th=1/n * ones(1,n);

    case 2
        p=0.2;
        x=zeros(1,N);
        for i=1:N
            x(i)=LoiBernoulli(p);
        end
        [h,xout]=hist(x,0:1);
        proba_emp=h/N;
        proba_th=p;
        
    case 3
        p=0.2;
        n=40;
        x=zeros(1,N);
        for i=1:N
            x(i)=LoiBinomiale(n,p);
        end
        [h,xout]=hist(x,1:n);
        proba_emp=h/N;
        proba_th=zeros(1,n);
        for k=1:n;
            proba_th(k)=nchoosek(n,k).*p.^k*(1-p)^(n-k);
        end
        title(['Loi binomiale B(n=',num2str(n),', p=',num2str(p),')'])
   
    case 4
        p=0.2;
        x=zeros(1,N);
        for i=1:N
            x(i)=LoiGeometrique(p);
        end
        [h,xout]=hist(x,1:N);
        proba_emp=h/N;
        proba_th=zeros(1,N);
        for i=1:N
            proba_th(i)=(1-p)^(i-1)*p;
        end
        
end

hold on;
bar(xout,proba_emp,'g')
bar(xout,proba_th,0.3,'r')
legend('Empirique','Théorique')
axis auto