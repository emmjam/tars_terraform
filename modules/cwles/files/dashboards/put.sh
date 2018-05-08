dash="CloudTrail"

curl -vv -XPUT "https://search-dvsamotdev-cwl-3jxl6wjcv3xtpvvn237wpp7qyi.eu-west-1.es.amazonaws.com/kibana-int/dashboard/${dash}" -T "${dash}.json"
