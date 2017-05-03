function run_mcn_module_tests(varargin)
% ---------------------------
% run tests for mcn_module_demo
% (based on vl_testnn)
% ---------------------------

% NOTE: if you prefer, you can use the primary matconvnet
% test driver. The benefit of providing this function is
% that it makes it easy to run only the tests associated
% with your module

opts.cpu = true ;
opts.gpu = false ;
opts.single = true ;
opts.double = false ;
opts.command = 'nn' ;
opts = vl_argparse(opts, varargin) ;

import matlab.unittest.constraints.* ;
import matlab.unittest.selectors.* ;
import matlab.unittest.plugins.TAPPlugin;
import matlab.unittest.plugins.ToFile;

% pick tests
sel = HasName(StartsWithSubstring(opts.command)) ;
if ~opts.gpu
  sel = sel & ~HasName(ContainsSubstring('device=gpu')) ;
end
if ~opts.cpu
  sel = sel & ~HasName(ContainsSubstring('device=cpu')) ;
end
if ~opts.double
  sel = sel & ~HasName(ContainsSubstring('dataType=double')) ;
end
if ~opts.single
  sel = sel & ~HasName(ContainsSubstring('dataType=single')) ;
end

% add test class to path
suiteDir = fullfile(vl_rootnn, 'contrib', 'mcn_module_demo/matlab/xtest/suite') ;
addpath(suiteDir) ;
suite = matlab.unittest.TestSuite.fromFolder(suiteDir, sel) ;
runner = matlab.unittest.TestRunner.withTextOutput('Verbosity',3) ;
result = runner.run(suite) ;
display(result)
