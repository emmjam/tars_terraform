resource "aws_s3_bucket" "artefacts" {
    bucket     = "${local.csi_global}-artefacts"
    acl        = "private"

    versioning {
        enabled = true
    }

    tags = merge(
        local.default_tags,
        {
            "Name" = "${local.csi_global}-artefacts"
        },
    )

    lifecycle_rule {
        id      = "wars_file_90_days_rentention"
        prefix  = "release-candidates/applications/"
        enabled = true
        
        expiration {
    	    days = 90
        } 
    }
}
