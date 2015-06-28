%% test:
% Runs each test in the current folder and includes files from the src
% folder before running them
function [result] = test()
    clear functions;

    whatToTest = 'src';

    import matlab.unittest.TestSuite

    suite = TestSuite.fromFolder('.');

    % Add the files under test to our path
    addpath(sprintf('../%s', whatToTest));

    result = run(suite);

    % Remove files under test from our path
    rmpath(sprintf('../%s', whatToTest));
end