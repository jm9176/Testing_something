classdef tSampleByteRange < matlab.unittest.TestCase
    % Sample test
    
    %properties(Constant)
    %	FilePath = 'http://localhost:4566/my-test-bucket/sample_file.nc#mode=bytes'
    %end
    methods(TestClassSetup)
        function addSrcCodePath(testcase)
            % Add source code path before running the tests
            import matlab.unittest.fixtures.PathFixture
            testcase.applyFixture(PathFixture(fullfile('..'),'IncludeSubfolders',true))
        end
    end

    methods(Test)
        function checkSrcCoverage(testcase)
            out = myFcn();
            testcase.verifyTrue(out,'Failed to verify value');
        end

        function verifyLocalFileInfo(testcase)
            fileInp = fullfile('testfiles','sample_file.nc');
            outInfo = ncinfo(fileInp);
        end

        %function verifyRemoteFileInfo(testcase)
        %    actInfo = ncinfo(testcase.FilePath);
        %end
    end
end