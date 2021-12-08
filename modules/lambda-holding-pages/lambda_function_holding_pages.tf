resource "aws_lambda_function" "holding-pages" {
  function_name = "${local.csi}-${var.name}"

  depends_on = [data.archive_file.holing-pages-inline]
  description = "${var.name} Lambda function"

  filename         = data.archive_file.holing-pages-inline.output_path
  source_code_hash = data.archive_file.holing-pages-inline.output_base64sha256

  publish  = true
  provider = aws.us-east-1

  runtime     = var.runtime
  handler     = var.handler
  memory_size = var.memory_size

  role = aws_iam_role.lambda_holding_pages.arn

  tags = merge(
    local.default_tags,
    tomap({
      "Name" = "${local.csi}/${var.name}",
    })
  )
}

data "archive_file" "holing-pages-inline" {
  type        = "zip"
  output_path = "./lambda/holdingpageslambda.zip"
  source {
    content  = <<EOF
'use strict';
exports.handler = (event, context, callback) => {

    // Extract the request from the CloudFront event that is sent to Lambda@Edge
    var request = event.Records[0].cf.request;

    // Extract the URI from the request
    var olduri = request.uri;

    // this will not work as uri is not fqdn

    var domain = request.headers.host[0].value;
    console.log("Domain: " + domain);


    // Replace based on domain to correct origin destination - this code replaces as well based on uri which can be later removed and matches domain names for uat02 as well to much all possible as is not conditional depending on tf env
    if (olduri.indexOf('dsa-dft-gov-uk') > -1 || domain.indexOf('dsa.dft.gov.uk') > -1 || domain.indexOf('incapsula-uat02-public.dvsa.tars.dev-dvsacloud.uk') > -1){
        var newuri = '/dsa/index.html';
    }
    else if (olduri.indexOf('finddrivinginstructor-dvsa-gov-uk') > -1 || domain.indexOf('finddrivinginstructor.dvsa.gov.uk') > -1 || domain.indexOf('incapsula-ibs-uat02-public.dvsa.tars.dev-dvsacloud.uk') > -1){
        var newuri = '/finddrivinginstructor/index.html';
    }
    else if (olduri.indexOf('driverpracticaltest-dvsa-gov-uk') > -1 || domain.indexOf('driverpracticaltest.dvsa.gov.uk') > -1){
        var newuri = '/driverpracticaltest/index.html';
    }
    else {
        var newuri = olduri
    }


    // Match any '/' that occurs at the end of a URI. Replace it with a default index
    // var newuri = olduri.replace(/\/$/, '\/index.html');

    // Log the URI as received by CloudFront and the new URI to be used to fetch from origin
    console.log("Old URI: " + olduri);
    console.log("New URI: " + newuri);

    // Replace the received URI with the URI that includes the index page
    request.uri = newuri;

    // Return to CloudFront
    return callback(null, request);

};
EOF
    filename = "index.js"
  }
}
