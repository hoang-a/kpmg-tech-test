# KPMG Challenge 2

We need to write code that will query the meta data of an instance within aws and provide a json formatted output. The choice of language and implementation is up to you.

Bonus Points
The code allows for a particular data key to be retrieved individually

## My solution

For this exercise I have chosen to write a function in Ruby. AWS provide SDKs for multiple programming languages, Ruby included, so in this function I have pulled in the aws-sdk, which can be used to query instance meta data.

The set of default options for the Aws::EC2Metadata class means that configuration for the endpoint did not need to be set here.

The function takes a path argument, allowing particular data keys to be retrieved individually by passing the path to the metadata.
Upon retrieval the function will return the output as json.
