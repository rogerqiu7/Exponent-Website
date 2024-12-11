# import the JSON utility package
import json
# import the Python math library
import math
# import uuid for generating random IDs
import uuid

# import the AWS SDK (for Python the package name is boto3)
import boto3
# import two packages to help us with dates and date formatting
from time import gmtime, strftime

# create a DynamoDB object using the AWS SDK
dynamodb = boto3.resource('dynamodb')
# use the DynamoDB object to select our table
table = dynamodb.Table('ExponentDatabase')
# store the current time in a human readable format in a variable
now = strftime("%a, %d %b %Y %H:%M:%S +0000", gmtime())

# define the handler function that the Lambda service will use as entry point
def lambda_handler(event, context):

    # generate a random ID every event
    random_id = str(uuid.uuid4())
    
    # extract the values from the Lambda service's event object
    first_name = event['firstName']
    last_name = event['lastName']
    mathResult = math.pow(int(event['base']), int(event['exponent']))

    # write result, names, and time to the DynamoDB table
    response = table.put_item(
        Item={
            'ID': random_id,  # Using random ID
            'FirstName': event['firstName'],
            'LastName': event['lastName'],
            'BaseNumber': event['base'],
            'Exponent': event['exponent'],
            'CalculatedResult': str(mathResult),
            'CalculationTime': now
        })

    # create personalized message
    message = f"Hello {first_name} {last_name}, your result is {str(mathResult)}"

    # return a properly formatted JSON object
    return {
        'statusCode': 200,
        'body': json.dumps(message)
    }