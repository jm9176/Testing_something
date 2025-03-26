#!/bin/bash

# Create s3 bucket named "sample-bucket"
awslocal s3 mb s3://sample-bucket

# Add files to the s3 bucket and make them publicly readable
awslocal s3 cp /mnt/data/sample_file.nc s3://sample-bucket/sample_file.nc --acl public-read