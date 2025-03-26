classdef tSampleByteRange < matlab.unittest.TestCase

    properties(Constant)
        FilePath = 'http://localhost:4566/sample_file.nc#mode=bytes'
    end

    methods(Test)
        function verifyFileInfo(testcase)
            % Verify NetCDF file info using ncinfo function
            actInfo = ncinfo(testcase.FilePath);
        end

        function verifyFileDisplay(testcase)
            % Verify that a correct output is generated when using ncdisp with NetCDF file.
            actDisp = evalc(['ncdisp(''' testcase.FilePath ''')']);
        end
    end
end