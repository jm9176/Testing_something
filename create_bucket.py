import boto3
from moto import mock_aws

@mock_aws
def main():
    bucket_name = 'my-test-bucket'
    file_path = 'test/testfiles/sample_file.nc'
    file_name = 'sample_file.nc'

    # Call the function to test
    s3 = boto3.client('s3', region_name='us-east-1')
    s3.create_bucket(Bucket=bucket_name)
    with open(file_path,"rb") as file_data:
        s3.upload_fileobj(file_data,bucket_name,file_name)
    
    # Verify the bucket was created
    response = s3.list_buckets()
    print('Buckets:', [bucket['Name'] for bucket in response['Buckets']])
    
    buckets = [bucket['Name'] for bucket in response['Buckets']]
    assert bucket_name in buckets

    # Verify the file was uploaded
    response = s3.list_objects_v2(Bucket=bucket_name)
    print('Objects in bucket:', [obj['Key'] for obj in response.get('Contents', [])])

if __name__ == '__main__':
    main()
