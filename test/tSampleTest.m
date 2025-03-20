classdef tSampleTest < matlab.unittest.TestCase
    % Sample test to verify HDF5 dataset data write/read.

    methods(Test)
        function sampleTestPoint(testcase)
            import matlab.unittest.fixtures.WorkingFolderFixture;
            testcase.applyFixture(WorkingFolderFixture);

            % Dummy data
            dsetSize = [5 10];
            expData = ones(dsetSize);
            h5create('myfile.h5','/dset1',dsetSize);
            h5write('myfile.h5','/dset1',expData);
            actData = h5read('myfile.h5','/dset1');
            testcase.verifyEqual(actData,expData,'Failed to verify data');
        end
    end
end