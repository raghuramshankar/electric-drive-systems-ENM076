%**********************************************************************
%  PMSMMainprog.m 
% This program simulates an PMSM, the program is to be used as a 
% template for further development of other computer tasks
%**********************************************************************
%
clc             % clear command window
clear all       % clear workspace memory
close all       % closing all plot windows

% Parameter definition of the RL circuit
%**********************************************************************

R = 1.33;              % Resistance [ohm] 
% L_sd = 1.1e-3;       % Inductance [H]
Laa0 = 40e-3;
Lab0 = 20e-3;
Laa2 = -17e-3;
psi_m = 0.822;
J = 0.0125;
n_s = 1500;
f = 50;
P_rated = 4000;
V_rated = 400;
I_rated = 6.5;
B = 0.08;

L_sd = Laa0 + Lab0 + 1.5 * Laa2;
L_sq = Laa0 + Lab0 - 1.5 * Laa2;
np = 60 * f/n_s;

alpha_c = 1000; % Bandwidth 


R_hat=1.33;          % Resistance [ohm] 
L_sd_hat=0.0345;       % Inductance [H]
L_sq_hat=0.0855;
J_hat = 0.0125;
B_hat = 0.08 ; 

kpcd = alpha_c * L_sd_hat;            %do not give a numerical value to kp, ki and Ra. The code
Racd = alpha_c*L_sd_hat - R_hat;            %must calculate the gains from the defined alpha, R_hat and L_hat
kicd = alpha_c * (Racd + R_hat); 
Hcd = 1/kpcd;

kpcq = alpha_c * L_sq_hat;            %do not give a numerical value to kp, ki and Ra. The code
Racq= alpha_c*L_sq_hat - R_hat;            %must calculate the gains from the defined alpha, R_hat and L_hat
kicq = alpha_c * (Racq + R_hat); 
Hcq = 1/kpcq;

%speed controller 

    
alpha_s = 100;       % Bandwidth
kps = alpha_s  *J_hat;            %do not give a numerical value to kp, ki and Ra. The code
Ba = alpha_s*J_hat - B_hat;            %must calculate the gains from the defined alpha, R_hat and L_hat
kis = alpha_s * ( Ba + B_hat); 


% kpcd = 34.5;
% kicd = 34500;
% 
% kpcq = 85.5;
% kicq = 85500;
% 
% Hcd = 0.029;
% Hcq = 0.12;
% 
% Racd = 33.17;
% Racq = 84.17;

VconvLim = 440 * sqrt(2/3); % Voltage limiter value for the converter
iconvlim = 6.5 * sqrt(2);
% Setting the parameters of the step functions
%**********************************************************************
Teref1_time = 0.1;
Teref1 = 16.6;

Teref2_time = 2.7;
Teref2 = 4;

Tstep_time = 1.1;
Tstep = 4;

Beta_1_time = 0;
Beta_1 = 113.8*pi/180 ;

Beta_2_time = 2.3;
Beta_2 = 130*pi/180;

wrref = 1500*2*pi/60;
wrref_time = 0.1;

% Initial conditions
%**********************************************************************
ws = 2*pi*50;   % Grid frequency [rad/s]
i_sd0= 0*-1.95;    % Initial condition for the current in alpha
i_sq0 = 0*4.55;    % Initial condition for the current in betha
usd0 = 0*-125;
usq0 = 0*243;
theta_r0 = 0;
w_r0 = 0*2*pi*50/np;

% Call solver using panel settings, i.e Variable-step
%**********************************************************************
Tstart = 0;       % Starting time for the simulation [s]
Tstop = 5;      % End time for the simulation [s]
sim('PMSMpanel_3_1502',[Tstart,Tstop])

%  post processing part
%**********************************************************************
PostProssPMSM

