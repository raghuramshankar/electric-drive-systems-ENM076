clc;
close all
set(0,'defaultAxesYGrid','on');
set(0,'defaultAxesXGrid','on');

% Stator power 

psa = usa.*isa;
psb = usb.*isb;
psc = usc.*isc;
qsa = (usa-usb).*isc/sqrt(3);
qsb = (usb-usc).*isa/sqrt(3);
qsc = (usc-usa).*isb/sqrt(3);
ptotal = psa + psb + psc;
qtotal = qsa + qsb + qsc;

% Shaft power

pshaft = Te.*Wr*np;

figure('Name','IM Dynamic Model')
%  Voltages and currents in 3-phase, alpha-beta and dq
% **********************************************************************
% subplot(x,y,n) 
% creates a figure with x rows of figures and y columns and
% n is the subplot number n=1..x*y where n=1 is the top left corner and
% n=x*y is the bottom right corner of the figure 

figure(1);
subplot(3,3,1)
plot(time,PsiR,'r',time,PsiRref,'g')
xlabel('Time [s]')
ylabel('Flux [Wb]')
title('Rotor flux magnitude red, Rotor flux reference green')
legend('Psir magnitude actual', 'Psir mag ref')

subplot(3,3,2)
plot(time,Te,'r',time,Teref,'g',time,TL,'b')
xlabel('Time [s]')
ylabel('Torque [Nm]')
title('Te actual red, Te ref green, T Load blue')
legend('Te actual', 'Te ref','T Load')

subplot(3,3,3)
plot(time,isd,'r',time,real(isdqref),'g--')
xlabel('Time [s]')
ylabel('Current [A]')
title('d Current red, d current ref green dashed')
legend('isd actual','isd ref')

subplot(3,3,4)
plot(time,isq,'r',time,imag(isdqref),'g--')
xlabel('Time [s]')
ylabel('Current [A]')
title('q Current red, q current ref green dashed')
legend('isq actual','isq ref')

subplot(3,3,5)
plot(time,Wr.*60/2/pi,'r')
xlabel('Time [s]')
ylabel('Speed [rpm]')
title('Rotor speed red')
legend('Wr (mech)')

subplot(3,3,6)
plot(time,Wr,'r',time,w1,'g--')
xlabel('Time [s]')
ylabel('Speed [rad/s]')
title('Rotor speed red, Stator frequency dashed')
legend('wr electric', 'w1 stator frequency')

subplot(3,3,7)
plot(time,real(usdq),'r',time,real(usdq_unlim),'r--',time,imag(usdq),'g',time,imag(usdq_unlim),'g--')
xlabel('Time [s]')
ylabel('voltage [V]')
title('usd red, usd unlim red dashed, usq green, usq unlim green dashed')
legend('usd lim', 'usd unlim', 'usq lim', 'usq unlim')

subplot(3,3,8)
plot(time,real(Vkp),'r',time,real(Vki),'g',time,imag(Vkp),'r--',time,imag(Vki),'g--')
xlabel('Time [s]')
ylabel('voltage [V]')
title('real Vkp, imag Vkp, real Vki, imag Vki')
legend('Vkpd', 'Vkid', 'Vkpq', 'Vkiq')

subplot(3,3,9)
plot(time,abs(usdq),'r',time,abs(usdq_unlim),'g--')
xlabel('Time [s]')
ylabel('voltage [V]')
title('usdq unlimited red, usdq green dashed')
legend('usdq mag lim', 'usdq mag unlim')