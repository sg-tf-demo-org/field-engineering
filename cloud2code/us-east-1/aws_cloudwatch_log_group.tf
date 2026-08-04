resource "aws_cloudwatch_log_group" "_aws_apprunner_data_recipes_1c9fedb0bfb8491e9ea14ad7e26a9241_service" {
  name = "/aws/apprunner/data-recipes/1c9fedb0bfb8491e9ea14ad7e26a9241/service"
  retention_in_days = 0
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_cloudwatch_log_group" "_aws_apprunner_data_recipes_92232d3657304aa397f0e09f8cea6fd5_application" {
  name = "/aws/apprunner/data-recipes/92232d3657304aa397f0e09f8cea6fd5/application"
  retention_in_days = 0
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_cloudwatch_log_group" "_aws_apprunner_data_recipes_92232d3657304aa397f0e09f8cea6fd5_service" {
  name = "/aws/apprunner/data-recipes/92232d3657304aa397f0e09f8cea6fd5/service"
  retention_in_days = 0
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_cloudwatch_log_group" "_aws_apprunner_data_recipes_auth_2935b1484d9345468908c0daaaf37768_application" {
  name = "/aws/apprunner/data-recipes-auth/2935b1484d9345468908c0daaaf37768/application"
  retention_in_days = 0
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_cloudwatch_log_group" "_aws_apprunner_data_recipes_auth_2935b1484d9345468908c0daaaf37768_service" {
  name = "/aws/apprunner/data-recipes-auth/2935b1484d9345468908c0daaaf37768/service"
  retention_in_days = 0
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_cloudwatch_log_group" "_aws_apprunner_data_recipes_auth_e63aba3232eb4171ad1847f61401d735_service" {
  name = "/aws/apprunner/data-recipes-auth/e63aba3232eb4171ad1847f61401d735/service"
  retention_in_days = 0
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_cloudwatch_log_group" "_aws_apprunner_data_recipes_auth_e6f98c07544a4d9598e4e342ac1aad7e_service" {
  name = "/aws/apprunner/data-recipes-auth/e6f98c07544a4d9598e4e342ac1aad7e/service"
  retention_in_days = 0
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_cloudwatch_log_group" "_aws_eks_field_engineering_cluster" {
  name = "/aws/eks/field-engineering/cluster"
  retention_in_days = 0
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_cloudwatch_log_group" "_aws_lambda_fe_drift_formatter" {
  name = "/aws/lambda/fe-drift-formatter"
  retention_in_days = 30
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_cloudwatch_log_group" "_aws_vpc_field_engineering" {
  name = "/aws/vpc/field-engineering"
  retention_in_days = 30
  lifecycle {
    ignore_changes = all
  }
}
