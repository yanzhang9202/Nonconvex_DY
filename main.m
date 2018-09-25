%% Nonconvex distributed optimization
%  By Yan, 09/24/18

close all;
clear;
clc;

% Add subfolders
addpath(genpath(pwd));

% Problem specification
seed = 101;
rng(seed);
pb_type = 1;    % Nonconvex QP with affine equality constraints
                % Nonconvex QP with quadratic equality constraints
pb_spec;
