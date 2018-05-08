#!/usr/bin/env python
import boto
import requests
from aws_requests_auth.aws_auth import AWSRequestsAuth

boto.config.set('profile', 'mot-fbe')
access_key = boto.config.get_value('Credentials', 'aws_access_key_id')
secret_key = boto.config.get_value('Credentials', 'aws_secret_access_key')
endpoint = "search-dvsamotdev-cwl-3jxl6wjcv3xtpvvn237wpp7qyi.eu-west-1.es.amazonaws.com"
region = "eu-west-1"

print access_key
print boto.config.get

#mebs = boto.config.get("Credentials", "aws_secret_access_key")
#print mebs
#
## let's talk to our AWS Elasticsearch cluster
#auth = AWSRequestsAuth(aws_access_key=access_key,
#                       aws_secret_access_key=secret_key,
#                       aws_host=endpoint,
#                       aws_region=region,
#                       aws_service='es')
#
#response = requests.get("https://" + endpoint,
#                        auth=auth)
#print response.content
