close all
set(0,'defaultAxesYGrid','on');
set(0,'defaultAxesXGrid','on');

figure('Name','single-phase RL-circuit voltage and current demonstration')

%**********************************************************************
% subplot(x,y,n) creates a figure with x rows of figures and y columns and
% n is the subplot number n=1..x*y where n=1 is the top left corner and
% n=x*y is the bottom right corner of the figure 

subplot(3,2,1)
plot(time,Omega_r_ref,'b',time,Omega_r,'r')
xlabel('Time [s]')
ylabel('Reference motor speed [RPM], Motor speed [RPM}')
title('Omega r ref blue, Omega r red')

subplot(3,2,2)
plot(time,Te_ref,'b',time,Te_lim,'r')
xlabel('Time [s]')
ylabel('Reference torque [Nm], Torque [Nm]')
title('Te r ref blue, Te red')

subplot(3,2,3)
plot(time,iref,'b',time,iref_lim,'r')
xlabel('Time [s]')
ylabel('Current reference before [A], Current reference after [A]')
title('iref blue, iref lim red')

subplot(3,2,4)
plot(time,iref,'b',time,ia,'r')
xlabel('Time [s]')
ylabel('Current reference [A], Actual current [A]')
title('iref blue, ia red')

subplot(3,2,5)
plot(time,uref,'b',time,back_emf,'r')
xlabel('Time [s]')
ylabel('Reference voltage [V], Back EMF [V]')
title('uref blue, back emf red')

subplot(3,2,6)
plot(time,p_in,'b',time,p_out,'r')
xlabel('Time [s]')
ylabel('Power in [kW], Power out [kW]')
title('p in blue, p out red')
% and so on, type -help plot- in the command window to know more about the plot comamnd in Matlab 
