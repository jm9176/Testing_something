import boto3
import os

def main():
    bucket_name = 'my-test-bucket'
    file_path = 'test/testfiles/sample_file.nc'
    file_name = 'sample_file.nc'

    # Initialize the S3 client
    s3 = boto3.client(
        's3',
        aws_access_key_id=os.getenv('AWS_ACCESS_KEY_ID'),
        aws_secret_access_key=os.getenv('AWS_SECRET_ACCESS_KEY'),
        region_name=os.getenv('AWS_DEFAULT_REGION')
    )

    # Create a bucket
    s3.create_bucket(Bucket=bucket_name)

    # List buckets to verify creation
    response = s3.list_buckets()
    print('Buckets:', [bucket['Name'] for bucket in response['Buckets']])

    # Upload a file to the bucket
    s3.upload_file(file_path, bucket_name, file_name)

    # List objects in the bucket
    response = s3.list_objects_v2(Bucket=bucket_name)
    print('Objects in bucket:', [obj['Key'] for obj in response.get('Contents', [])])

if __name__ == '__main__':
    main()
