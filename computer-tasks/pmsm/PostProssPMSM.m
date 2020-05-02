clc;
close all
set(0,'defaultAxesYGrid','on');
set(0,'defaultAxesXGrid','on');

% P = 3/2*real(uss.*conj(iss)); % Amplitude invariant transformation
% Q = 3/2*imag(uss.*conj(iss)); % Amplitude invariant transformation
%thetaplot = (unwrap(thetas - pi/2 - Theta_r))*180/pi;
T_e = T_em + T_er;
s = length(Omega_r);
ws = ones(s,1).*ws;

p_in = ones(s,1).*usa(end)*isa(end);
p_out = ones(s,1).*T_e(end)*Omega_r(end);

% figure('Name','RL-circuit voltages and currents in 3-phase, alpha-beta and dq')
%  Voltages and currents in 3-phase, alpha-beta and dq
%**********************************************************************
% subplot(x,y,n) creates a figure with x rows of figures and y columns and
% n is the subplot number n=1..x*y where n=1 is the top left corner and
% n=x*y is the bottom right corner of the figure 

figure(1);
subplot(3,2,1)
plot(time,Omega_r*np,'k--',time,ws,'g')
xlabel('Time [s]')
ylabel('Rotor speed [rad/s]')
title('w_r black, w_s green')
legend('Electrical rotor speed','Stator voltage frequency')

subplot(3,2,2)
plot(time,i_sd,'k--',time,isdref,'r')
xlabel('Time [s]')
ylabel('d-current black')
title('i_s_d black')
legend('d-axis current')

subplot(3,2,3)
plot(time,T_e,'k--',time,T_em,'g',time,T_er,'b')
xlabel('Time [s]')
ylabel('Electrodynamic Torque [Nm]')
title('T_e black, T_e_r green, T_e_m blue')
legend('Electrodynamic torque','Magnetizing torque','Reluctance torque')

subplot(3,2,4)
plot(time,i_sq,'k--',time,isqref,'r')
xlabel('Time [s]')
ylabel('q-current black')
title('i_s_q black')
legend('q-axis current')

subplot(3,2,5)
plot(time,(unwrap(thetas - pi/2 - theta)),'k--')
xlabel('Time [s]')
ylabel('Angle [rad]')
title('\theta_s - \pi/2 - \phi/2')
legend('Angle')

subplot(3,2,6)
plot(time,u_sd,'k--',time,u_sq,'g')
xlabel('Time [s]')
ylabel('Stator Voltage [V]')
title('u_s_d black, u_s_q green')
legend('d-axis voltage', 'q-axis voltage')

% figure(2);
% plot(time,usa,'r',time,usb,'g',time,usc,'b')
% xlabel('Time [s]')
% ylabel('Stator Voltages [V]')
% title('u_s_a red, u_s_c green, u_s_c blue')
% legend('a phase', 'b phase', 'c phase')
% 
% figure(3);
% plot(time,isa,'r',time,isb,'g',time,isc,'b')
% xlabel('Time [s]')
% ylabel('Stator Currents [A]')
% title('i_s_a red, i_s_c green, i_s_c blue')
% legend('a phase', 'b phase', 'c phase')
% 
% figure(3);
% subplot(3,2,1)
% plot(time,wrref,'b',time,Omega_r,'r')
% xlabel('Time [s]')
% ylabel('Reference motor speed [RPM], Motor speed [RPM}')
% title('Omega r ref blue, Omega r red')
% 
% subplot(3,2,2)
% plot(time,Teref,'b',time,Telim,'r')
% xlabel('Time [s]')
% ylabel('Reference torque [Nm], Torque [Nm]')
% title('Te r ref blue, Te red')
% 
% subplot(3,2,3)
% plot(time,ibefore,'b',time,iafter,'r')
% xlabel('Time [s]')
% ylabel('Current reference before [A], Current reference after [A]')
% title('iref blue, iref lim red')
% 
% subplot(3,2,4)
% plot(time,isdqref,'b',time,isa,'r')
% xlabel('Time [s]')
% ylabel('Current reference [A], Actual current [A]')
% title('iref blue, ia red')
% 
% subplot(3,2,5)
% plot(time,usdq,'b',time,T_e.*Omega_r,'r')
% xlabel('Time [s]')
% ylabel('Reference voltage [V], Back EMF [V]')
% title('uref blue, back emf red')
% 
% subplot(3,2,6)
% plot(time,p_in,'b',time,p_out,'r')
% xlabel('Time [s]')
% ylabel('Power in [W], Power out [W]')
% title('p in blue, p out red')