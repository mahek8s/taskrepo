### AWS S3 Bucket Copy Lambda Function

This README provides a guide on how to use an AWS Lambda function to copy files from one Amazon S3 bucket to another. This Lambda function automates the process of backingup of files, offering a convenient way to manage data replication or backup tasks within AWS.

#### Usage Instructions

Follow these steps to set up and use the Lambda function:

1. **Create the Source and Destination S3 Buckets:**
    - Open the Amazon S3 console.
    - Create the source and destination buckets by providing names and selecting the appropriate AWS Region.

2. **Create the Lambda Function:**
    - Navigate to the Lambda console.
    - Create a new Lambda function from scratch.
    - Configure the function with a name and Python 3.11 runtime.
    - Use the provided Python code snippet for the Lambda function.
    - Deploy the Lambda function.

3. **Add an S3 Trigger:**
    - Associate an S3 trigger with the Lambda function.
    - Specify the source bucket and trigger configuration (e.g., All object create events).
    - add Environment variable of target bucket name with key as destination_bucket and value as bucket name.so that it can be picked from env variables in code. 

4. **Provide IAM Permissions:**
    - Ensure that the Lambda function's execution role has the necessary permissions to copy files between S3 buckets.
    - A sample IAM policy is provided in iamrole.json.

