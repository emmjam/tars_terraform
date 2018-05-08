curl -s -XGET 'https://search-dvsamotdev-cwl-3jxl6wjcv3xtpvvn237wpp7qyi.eu-west-1.es.amazonaws.com/kibana-int/_search?pretty' -d '{
  size: 9999,
  query: { filtered: { filter: { type: { value: "dashboard" } } } } }
}' | jq .hits.hits
