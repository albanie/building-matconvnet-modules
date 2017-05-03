function test_mcn_module_demo
% -----------------------------
% run tests for mcn_module_demo
% -----------------------------

% add tests to path
addpath(fullfile(fileparts(mfilename('fullpath')), 'matlab/xtest')) ;
addpath(fullfile(vl_rootnn, 'matlab/xtest/suite')) ;

% test network layer
run_mcn_module_tests('command', 'nn') ;
