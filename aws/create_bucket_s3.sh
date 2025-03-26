#!/bin/bash

aws s3api create-bucket --bucket my-test-bucket --endpoint-url=http://localhost:4566
aws s3 cp /data/sample_file.nc s3://my-test-bucket/sample_file.nc --endpoint-url=http://localhost:4566
aws s3 ls s3://my-test-bucket --endpoint-url=http://localhost:4566