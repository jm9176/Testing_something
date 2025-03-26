import boto3
import os

def main():
    s3 = boto3.client(
        's3',
        endpoint_url=os.getenv('S3_ENDPOINT'),
        aws_access_key_id=os.getenv('AWS_ACCESS_KEY_ID'),
        aws_secret_access_key=os.getenv('AWS_SECRET_ACCESS_KEY'),
        region_name=os.getenv('AWS_DEFAULT_REGION')
    )

    # List current directory
    contents = os.listdir('.')
    for item in contents:
	print(item)

    # Create a bucket
    bucket_name = 'my-test-bucket'
    s3.create_bucket(Bucket=bucket_name)

    # List buckets to verify creation
    response = s3.list_buckets()
    print('Buckets:', [bucket['Name'] for bucket in response['Buckets']])

    # Upload a file to the bucket
    s3.upload_file('test/testfiles/sample_file.nc', bucket_name, 'sample_file.nc')

    # List objects in the bucket
    response = s3.list_objects_v2(Bucket=bucket_name)
    print('Objects in bucket:', [obj['Key'] for obj in response.get('Contents', [])])

if __name__ == '__main__':
    main()