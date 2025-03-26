#!/bin/bash

awslocal s3 mb s3://my-test-bucket
awslocal s3 cp /data/sample_file.nc s3://my-test-bucket/sample_file.nc --acl public-read