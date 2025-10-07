classdef tSampleTest < matlab.unittest.TestCase
    % Sample test

    methods(TestClassSetup)
        function addSrcCodePath(testcase)
            % Add source code path before running the tests
            import matlab.unittest.fixtures.PathFixture
            testcase.applyFixture(PathFixture(fullfile('..','..'),'IncludeSubfolders',true))
        end
    end

    methods(Test)
        function checkSrcCoverage(testcase)
            out = myFcn();
            testcase.verifyTrue(out,'Failed to verify value');
        end
    end
end