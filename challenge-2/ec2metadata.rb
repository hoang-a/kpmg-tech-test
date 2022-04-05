require 'aws-sdk'
require 'json'

def retrieve_metadata (path = '/latest/meta-data')
  ec2_metadata = Aws::EC2Metadata.new
  data = ec2_metadata.get(path)
  data.to_json
end
