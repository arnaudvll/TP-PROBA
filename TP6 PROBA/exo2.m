clear variables;
close all;

N=50000;
X=1+rand(1,N);
Y=1+rand(1,N);
[h,xout]=hist(X,50);
subplot(2,2,1)
bar(xout,h/trapz(xout,h))

S=X+Y;
s1=2:0.1:3;
s2=3:0.1:4;
fs1=s1-2;
fs2=4-s2;
[h2,xout]=hist(S,50);
subplot(2,2,2)
bar(xout,h2/trapz(xout,h2))
hold on;
plot(s1,fs1,s2,fs2,'b','linewidth',2)
legend('emp','th')

P=X.*Y;
p1=1:0.1:2;
p2=2:0.1:4;
fp1=log(p1);
fp2=2*log(2)-log(p2);
[h3,xout]=hist(P,50);
subplot(2,2,3)
bar(xout,h3/trapz(xout,h3))
hold on;
plot(p1,fp1,p2,fp2,'b','linewidth',2)
legend('emp','th')

Q=X./Y;
q1=0.5:0.1:1;
q2=1:0.1:2;
fq1=2-1./(2*q1.^2);
fq2=2./(q2.^2)-1/2;
[h4,xout]=hist(Q,50);
subplot(2,2,4)
bar(xout,h4/trapz(xout,h4))
hold on;
plot(q1,fq1,q2,fq2,'b','linewidth',2)
legend('emp','th')