clc;
close all

% Saving and loading ideal parameters
%**********************************************************************
time_id = time;
isd_id = isd;
isq_id = isq;
upc_id = Vkp;
uic_id = Vki;
save res_ideal_par.mat time_id isd_id isq_id upc_id uic_id
% load res_ideal_par.mat
% 
% figure(1);
% subplot(3,3,1)  
% plot(time,PsiR,'r',time,PsiRref,'g',time,Psi_R_observer,'b')
% xlabel('Time [s]')
% ylabel('Flux [Wb]')
% title('Rotor flux magnitude red, Rotor flux reference green, Rotor flux estimated blue')
% legend('Psir magnitude actual', 'Psir mag ref', 'Psir observer')
% 
% subplot(3,3,2)
% plot(time,Te,'r',time,Teref,'g',time,TL,'b')
% xlabel('Time [s]')
% ylabel('Torque [Nm]')
% title('Te actual red, Te ref green, T Load blue')
% legend('Te actual', 'Te ref','T Load')
% 
% subplot(3,3,3)
% plot(time,isd,'r',time,real(isdqref),'g--')
% xlabel('Time [s]')
% ylabel('Current [A]')
% title('d Current red, d current ref green dashed')
% legend('isd actual','isd ref')
% 
% subplot(3,3,4)
% plot(time,isq,'r',time,imag(isdqref),'g--')
% xlabel('Time [s]')
% ylabel('Current [A]')
% title('q Current red, q current ref green dashed')
% legend('isq actual','isq ref')
% 
% subplot(3,3,5)
% plot(time,Wr.*60/2/pi,'r')
% xlabel('Time [s]')
% ylabel('Speed [rpm]')
% title('Rotor speed red')
% legend('Wr (mech)')
% 
% subplot(3,3,6)
% plot(time,Wr,'r',time,w1,'g--')
% xlabel('Time [s]')
% ylabel('Speed [rad/s]')
% title('Rotor speed red, Stator frequency dashed')
% legend('wr electric', 'w1 stator frequency')
% 
% subplot(3,3,7)
% plot(time,real(usdq),'r',time,real(usdq_unlim),'r--',time,imag(usdq),'g',time,imag(usdq_unlim),'g--')
% xlabel('Time [s]')
% ylabel('voltage [V]')
% title('usd red, usd unlim red dashed, usq green, usq unlim green dashed')
% legend('usd lim', 'usd unlim', 'usq lim', 'usq unlim')
% 
% subplot(3,3,8)
% plot(time,real(Vkp),'r',time,real(Vki),'g',time,imag(Vkp),'r--',time,imag(Vki),'g--')
% xlabel('Time [s]')
% ylabel('voltage [V]')
% title('real Vkp, imag Vkp, real Vki, imag Vki')
% legend('Vkpd', 'Vkid', 'Vkpq', 'Vkiq')
% 
% subplot(3,3,9)
% plot(time,abs(usdq),'r',time,abs(usdq_unlim),'g--')
% xlabel('Time [s]')
% ylabel('voltage [V]')
% title('usdq unlimited red, usdq green dashed')
% legend('usdq mag lim', 'usdq mag unlim')
% 
% figure(2);
% subplot(2,3,1)
% plot(time,PsiRref,'r',time,Psi_R_observer,'g',time,PsiR,'b')
% xlabel('Time [s]')
% ylabel('Rotor Flux Magnitude [Wb]')
% title('Reference red, Estimated green, True blue')
% legend('Reference', 'Estimated', 'True')
% 
% subplot(2,3,2)
% plot(time,Teref,'r',time,Te,'g',time,TL,'b')
% xlabel('Time [s]')
% ylabel('Torque [Nm]')
% title('Reference red, True green, Load blue')
% legend('Reference', 'True', 'Load')
% 
% subplot(2,3,3)
% plot(time,real(isdqref),'r',time,real(isdq_estimated),'g',time,isd,'b')
% xlabel('Time [s]')
% ylabel('d-Current [A]')
% title('Reference red, Estimated green, True blue')
% legend('Reference', 'Estimated', 'True')
% 
% subplot(2,3,4)
% plot(time,imag(isdqref),'r',time,imag(isdq_estimated),'g',time,isq,'b')
% xlabel('Time [s]')
% ylabel('q-Current [A]')
% title('Reference red, Estimated green, True blue')
% legend('Reference', 'Estimated', 'True')
% 
% subplot(2,3,5)
% plot(time,Wr*np,'r',time,w1_hat,'g',time,w1,'b')
% xlabel('Time [s]')
% ylabel('Rotor Speed [rad/s]')
% title('Rotor Speed')
% legend('Reference', 'Estimated', 'True')
% 
% subplot(2,3,6)
% plot(time,(180/pi)*(unwrap(Psir_angle)-unwrap(Theta_r_observer)),'r')
% xlabel('Time [s]')
% ylabel('Rotor Flux Angle [rad]')
% title('Rotor Flux Angle Error red')
% legend('Rotor Flux Angle Error')

figure(3);
subplot(2,2,1)
plot(time,Wr*(60/(2*pi)),'b',time,wrref*(60/(2*pi)),'r')
xlabel('Time [s]')
ylabel('Speed [rad/s]')
title('Wr blue, wrref red')

subplot(2,2,2)
plot(time,Te,'r',time,TL,'g',time,Telim,'m')
xlabel('Time [s]')
ylabel('Torque [Nm]')
legend('True', 'Load', 'Limited')
title('Te red, TL green, Telim magenta')

subplot(2,2,3)
plot(time,real(isdqref),'r',time,real(isdq_estimated),'g',time,isd,'b')
xlabel('Time [s]')
ylabel('d-Current [A]')
title('Reference red, Estimated green, True blue')
legend('Reference', 'Estimated', 'True')

subplot(2,2,4)
plot(time,imag(isdqref),'r',time,imag(isdq_estimated),'g',time,isq,'b')
xlabel('Time [s]')
ylabel('q-Current [A]')
title('Reference red, Estimated green, True blue')
legend('Reference', 'Estimated', 'True')
