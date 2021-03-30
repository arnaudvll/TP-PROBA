clear variables;
close all;

%a
k=-2:7;
p=1/9*ones(1,length(k));
subplot(3,1,1)
bar(k,p) %histogramme de X
Ex=sum(k.*p);
Sigmax=sqrt(sum((k.^2).*p)-Ex^2);
text(7,0.27,['Ecart type : ', num2str(Sigmax)])
text(7,0.32,['Moyenne : ', num2str(Ex)])
xlabel('k (valeurs de X)')
ylabel('P(X=k)')
legend('loi de X')

%b
p2=conv(p,p);
k2=-4:14;
subplot(3,1,2)
bar(k2,p2) %histogramme de X1+X2
xlabel('k (valeurs de X1+X2)')
ylabel('P(X1+X2=k)')
legend('loi de X1+X2')

%c
n=10;
p10=p;
for i=1:n-1
    p10=conv(p10,p);
end
k10=n*(-2):n*7;
subplot(3,1,3)
bar(k10,p10) %histogramme de X1+X2+...+X10
xlabel('z (valeurs de Z = X1+...+Xn')
text(7*n,0.06,['n = ',num2str(n)]);


%d
Ez=sum(k10.*p10);
Ez2=sum(k10.^2.*p10);
% for i=1:length(k10)
%     Ez=Ez+k10(i)*p10(i);
%     Ez2=Ez2+k10(i)^2*p10(i);
% end
Vz=Ez2-Ez^2;
Sigmaz=sqrt(abs(Vz));
text(7*n,0.04,['E(Z) = ',num2str(Ez)]);
text(7*n,0.02,['𝜎(Z) = ',num2str(Sigmaz)]);


%e
hold on;
f=1/(Sigmaz*sqrt(2*pi))*exp(-(k10-Ez).^2/(2*Sigmaz^2));
plot(k10,f,'r','linewidth',2)
legend('loi de Z=X1+...Xn','densité limite (TCL)')
