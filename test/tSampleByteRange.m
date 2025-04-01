classdef tSampleByteRange < matlab.unittest.TestCase
    % Sample test
    
    properties(Constant)
        FilePath = 'https://my-test-bucket.s3.us-east-1.amazonaws.com/sample_file.nc#mode=bytes'
	%FilePath = 'http://localhost:4566/my-test-bucket/sample_file.nc#mode=bytes'
    end

    methods(Test)
        function verifyLocalFileInfo(testcase)
            disp(pwd)
            disp(eval('ls'))
            fileInp = fullfile('testfiles','sample_file.nc');
            outInfo = ncinfo(fileInp);
        end

        function verifyRemoteFileInfo(testcase)
            disp(testcase.FilePath)
            actInfo = ncinfo(testcase.FilePath);
        end
    end
end