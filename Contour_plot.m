clc;clear all;close all;
x1=input('Enter the start location of the diverging region');
x=x1:50:1600;
x=x/1000;
U1=12;
m=-0.0521;
C=U1/(x(1)^m);
y1=input('Enter the y-height at x=100mm');
y1=y1/1000;
for i=1:length(x)
    U(i)=C*(x(i)^m);
    y(i)=U1*y1/U(i);
end



slope=input('Enter the angle of the converging slope');
slope=180-slope;
x2=100:-50:-500;
x2=x2/1000;
y2(:)=y1+((tand(slope)*x2(:))-(tand(slope)*(x1/1000)));

fpx=0:50:1600;
fpy(:)=fpx(:)*0;

top1=500*ones(length(x),1);
top2=500*ones(length(x2),1);

%% 

figure(1)
hold on;
plot(x2*1000,y2*1000,'-or');
plot(x*1000,y*1000,'-ob');
plot(fpx,fpy,'-k','linewidth',2)
plot(x*1000,top1,'-m','linewidth',2)
plot(x2*1000,top2,'-m','linewidth',2)
ylim([-100 550]);
legend('converging portion','diverging portion','flat plate','top plate');
xlabel('x(mm)');
ylabel('y(mm)');
set(gca,'FontSize',16);box on;