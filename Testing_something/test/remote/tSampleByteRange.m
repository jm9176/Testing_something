classdef tSampleByteRange < matlab.unittest.TestCase
    % Sample test

    properties(Constant)
        FilePath = 'http://localhost:4566/my-test-bucket/sample_file.nc#mode=bytes'
    end

    methods(Test)
        function verifyLocalFileInfo(testcase)
            fileInp = fullfile('testfiles','sample_file.nc');
            outInfo = ncinfo(fileInp);
        end

        function verifyRemoteFileInfo(testcase)
            actInfo = ncinfo(testcase.FilePath);
        end
    end
end