%**********************************************************************
% PMSMMainprog.m 
% This program simulates an PMSM, the program is to be used as a 
% template for further development of other computer tasks
%**********************************************************************
%
clc             % clear command window
clear all       % clear workspace memory
close all       % closing all plot windows

% Parameter definition of the RL circuit
%**********************************************************************

R_s = 1.33;              % Resistance [ohm] 
R_r = 1.24;        % Inductance [H]
Ls_lambda = 8.1e-3;
Lr_lambda = 8.1e-3;
L_m = 135e-3;
J_im_lm = 0.051; %kgm2
np = 2;
J = 0.01275;
n_s = 1500;
f = 50;
P_rated = 4000;
V_rated = 400;
I_rated = 6.5;
B = 0.08;
%*************************************************************************
%Mahine Parameters
alpha_c = 1000; % Bandwidth 
L_m_hat = L_m;
L_s = Ls_lambda + L_m;
L_r = Lr_lambda + L_m;
L_sigma  = L_s - ((L_m)*(L_m)/L_r);    
Ra = L_sigma* alpha_c - R_s - R_r; 
Kpc = alpha_c * L_sigma;             
Kic = alpha_c*(Ra + R_r + R_s); 
Hc = 1/Kpc;
L_M = L_m^2 / L_r;
R_R = (L_m/L_r)^2 * R_r;

%*************************************************************************
% Limiter Parameters

VconvLim =  440 * sqrt(2/3); % Voltage limiter value for the converter
iconvlim =   inf;  %6.5 * sqrt(2);

% Setting the parameters of the step functions
%**********************************************************************
Psi_ref_time = 1e-3;
Psi_ref =  0.8867;

Teref1_time = 1;
Teref1 = 12;

Teref2_time = 2;
Teref2 = 8;

Teref3_time = 2.1;
Teref3 = 8;

Tstep_time = 0;
Tstep = 0;

wrref = 1500 *2 *pi/60;
wrref_time = 0.1;

% Initial conditions
%**********************************************************************
ws = 2*pi*50;   % Grid frequency [rad/s]
% i_sd0= 0*-1.95;    % Initial condition for the current in alpha
% i_sq0 = 0*4.55;    % Initial condition for the current in beta
usd0 = sqrt(2)*230;
usq0 = 0;
theta_r_0 = 0;
i_r_alpha_0 = 0;
i_r_beta_0 = 0; 
i_s_alpha_0 = 0;
i_s_beta_0 = 0;
omega_r_0 = 0;

% Call solver using panel settings, i.e Variable-step
%**********************************************************************
Tstart = 0;       % Starting time for the simulation [s]
Tstop = 3;      % End time for the simulation [s]
sim('IM_panel_3',[Tstart,Tstop])

%  post processing part
%**********************************************************************
PostPross_IM_e

