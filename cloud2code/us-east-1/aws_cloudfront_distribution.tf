resource "aws_cloudfront_distribution" "cicd_overwatch_jenkins_public" {
  enabled = true
  comment = "Public Jenkins demo access protected by AWS WAF"
  origin {
    domain_name = "cicd-overwatch-jenkins-public-1227838585.us-west-2.elb.amazonaws.com"
    origin_id   = "jenkins-public-alb"
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }
  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "jenkins-public-alb"
    viewer_protocol_policy = "redirect-to-https"
    cache_policy_id = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
  lifecycle {
    ignore_changes = all
  }
}
