%**********************************************************************
%  RLMainprog.m 
% This program simulates an RL-circuit, the program is to be used as a 
% template for further development of the PMDC, PMSM and IM model
%**********************************************************************
%
clc             % clear command window
clear all       % clear workspace memory
close all       % closing all plot windows

% Parameter definition of the RL circuit, true values without any error
%**********************************************************************
R=1.68;          % Resistance [ohm] 
L=0.028;       % Inductance [H]
J = 0.01;          % Inertia [J] - kgm^2
b = 0.2;            % b parameter
Psy = 1.242;  % Magnetic Flux [Psy]
rpm_to_rad_s = 2*pi/60;

% Parameter definition for the controller, estimated values
%**********************************************************************
R_hat=R;          % Resistance [ohm] 
L_hat=L;       % Inductance [H]
alpha_c = 1000;    % Bandwidth    
kp_c = alpha_c * L_hat;            %do not give a numerical value to kp, ki and Ra. The code
Ra= alpha_c*L_hat - R_hat;            %must calculate the gains from the defined alpha, R_hat and L_hat
% Ra = 0;
ki_c = alpha_c * (Ra + R_hat); 
H_c = 1/kp_c;

J_hat = J;     %Inertia
b_hat = 0.2 ;     
alpha_s = 100;       % Bandwidth of Speed Controller
kp_s = alpha_s  * J_hat;            %do not give a numerical value to kp, ki and Ra. The code
ba = alpha_s*J_hat - b_hat;            %must calculate the gains from the defined alpha, R_hat and L_hat
% ba = 0;
ki_s = alpha_s * (ba + b_hat); 
H_s = 0;

% Voltage limiter value for the converter
%****************************** ****************************************
VconvLim = inf; 
IconvLim = 23.7;

% Setting the parameters of the step functions
%**********************************************************************
ustep_time = 0.001;
ustep = 50;  %DC source [V]
nstep_time = 0.001;
nstep = 1000;
tstep_time_1 = 0.2;
tstep_time_2 = 0.3;
tstep=10;   

% Initial conditions, if your RL circuit model requires initial conditions,
% define them here%**********************************************************************
ia0=0;

% Call solver using panel settings, i.e Variable-step
%**********************************************************************
Tstart=0;       % Starting time for the simulation [s]
Tstop=0.4;      % End time for the simulation [s]
sim('PMDC_Panel_2018b',[Tstart,Tstop])

p_in = (ua.*ia)/(1e+3);
p_out = (Te .* Omega_r * (2 * pi/60))/(1e+3);  

%  post processing part
%**********************************************************************
PostProssPMDC

