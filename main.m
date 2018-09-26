%% Nonconvex distributed optimization
%  By Yan, 09/24/18

close all;
clear;
clc;

% Add subfolders
addpath(genpath(pwd));

% Problem specification
seed = 107;
rng(seed);
pb_type = 1;    % Nonconvex QP with affine equality constraints
                % Nonconvex QP with quadratic equality constraints
graph_type = 1; % 1 - random graph; 2 - chain graph
pb_spec;

% Run algorithm
alg_spec;
alg_run;

%

