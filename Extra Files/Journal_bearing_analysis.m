clc;
clear;
close all

%% JOURNAL BEARING ANALYSIS VS SPEED

% -------------------------
% INPUTS
% -------------------------
W = 2000;            % radial load [N]
D = 0.043;             % journal diameter [m]
L = 0.02782;             % bearing length [m]
c = 7.6e-6;            % radial clearance [m]
rpm = linspace(1000,9000,100);   % speed range [rpm]
mu = 0.015 - 0.006*(rpm/9000); % dynamic viscosity

% -------------------------
% CALCULATIONS
% -------------------------
n = rpm/60;           % rev/s
r = D/2;              % journal radius [m]

p = W/(L*D);          % pressure [Pa], constant if W is constant
V = pi*D.*n;          % surface speed [m/s]
PV = p.*V;            % PV [Pa*m/s]
S = (mu.*n./p).*(r/c)^2;

% -------------------------
% PLOTS
% -------------------------
figure;
plot(rpm, V, 'LineWidth', 1.5);
xlabel('Speed (rpm)');
ylabel('Surface Speed (m/s)');
title('Journal Surface Speed vs Engine Speed');
grid on;

figure;
plot(rpm, PV, 'LineWidth', 1.5);
xlabel('Speed (rpm)');
ylabel('PV Value (Pa·m/s)');
title('PV vs Engine Speed');
grid on;

figure;
plot(rpm, S, 'LineWidth', 1.5);
xlabel('Speed (rpm)');
ylabel('Sommerfeld Number');
title('Sommerfeld Number vs Engine Speed');
grid on;

% -------------------------
% DISPLAY SINGLE POINT AT MAX RPM
% -------------------------
fprintf('At %.0f rpm:\n', rpm(end));
fprintf('Projected Pressure = %.3f MPa\n', p/1e6);
fprintf('Surface Speed      = %.3f m/s\n', V(end));
fprintf('PV                 = %.3e Pa*m/s\n', PV(end));
fprintf('Sommerfeld Number  = %.4f\n', S(end));