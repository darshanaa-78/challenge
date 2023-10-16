import boto3
def get_instance_metadata():
    # Get the instance ID
    instance_id = boto3.client('ec2').instance_id
    # Get the instance metadata
    metadata = boto3.client('ec2').describe_instances(InstanceIds=[instance_id])
    # Return the metadata in JSON format
    return json.dumps(metadata)
if __name__ == "__main__":
    print(get_instance_metadata())
