%model Lotki-Volterr
%developed by ggeri
close all;
clear all;

%constants for ode
a = 1; %coeff of prey's death 
b1 = 4; %coeff of preys' birth
b2 = 2; %coeff of predator's death
k = 0.4; %coeff of conversation prey's biomass in predator's

%initial condition of population (number)
N1 = 10; %prey's population for odefun2
N2 = 2; %predator's population for odefun1


%range of integration
for i = 1:10
a = -1;
a = a + i;
range = [0 30];
[t1, y1] = ode45(@(t1,y1) lotka_valterr(t1,y1,b1,b2,a,k), range, [N1;N2]);
St1=['C:\Users\IVAN\Desktop\магистратура, 1курс\math_modeling\','1_', num2str(i),'.jpg'];
Fig=figure('Position',[50 50 1400 800]);
subplot(1,2,1);
plot(t1,y1);
grid on;
title('Model of Lotka-Volterr');
xlabel('countdown');
ylabel('Population (units)');
subplot(1,2,2);
plot(y1(:,1),y1(:,2));
grid on;
title('Model of Lotka-Volterr. Phase-space');
xlabel('prey');
ylabel('predator');
pause(0.05);
%print(Fig,'-djpeg',St1);
end;
function lv = lotka_valterr(t, y, b1, b2, a, k)
    lv = [b1*y(1) - a*y(1)*y(2); -b2*y(2)+k*a*y(1)*y(2)];
end
