resource "aws_route53_record" "_hostedzone_z02227871u9dywib2hbu_myww9jtvbf_us_east_1_awsapprunner_com__a" {
  zone_id = "/hostedzone/Z02227871U9DYWIB2HBU"
  name = "myww9jtvbf.us-east-1.awsapprunner.com"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "vpce-02af67f00e8ba70d4-wkjj1zkn.requests.apprunner.us-east-1.vpce.amazonaws.com"
    zone_id = "Z7HUB22UULQXV"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z02227871u9dywib2hbu_myww9jtvbf_us_east_1_awsapprunner_com__ns" {
  zone_id = "/hostedzone/Z02227871U9DYWIB2HBU"
  name = "myww9jtvbf.us-east-1.awsapprunner.com"
  type = "NS"
  ttl = 172800
  records = ["ns-0.awsdns-00.com.", "ns-1024.awsdns-00.org.", "ns-1536.awsdns-00.co.uk.", "ns-512.awsdns-00.net."]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z02227871u9dywib2hbu_myww9jtvbf_us_east_1_awsapprunner_com__soa" {
  zone_id = "/hostedzone/Z02227871U9DYWIB2HBU"
  name = "myww9jtvbf.us-east-1.awsapprunner.com"
  type = "SOA"
  ttl = 900
  records = ["ns-1536.awsdns-00.co.uk. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_aiden_demo_agent_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-aiden-demo-agent.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/aiden-demo/aiden-demo-agent"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_aiden_demo_gateway_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-aiden-demo-gateway.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/aiden-demo/aiden-demo-gateway"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_argocd_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-argocd.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/argocd/argocd"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_data_recipes_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-data-recipes.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/data-recipes/data-recipes"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_datadog_otel_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-datadog-otel.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/datadog/cm-acme-http-solver-tqdzf"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_gov_policies_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-gov-policies.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/ui-gov/gov-policies-oauth2"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_kube_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-kube.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/kubernetes-dashboard/kubernetes-dashboard"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_litellm_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-litellm.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/ollama/litellm"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_mcp_aws_cfn_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-mcp-aws-cfn.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/mcp-aws/mcp-aws-cfn"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_mcp_github_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-mcp-github.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/mcp-github/mcp-github"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_mcp_gitlab_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-mcp-gitlab.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/mcp-gitlab/mcp-gitlab"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_mcp_grafana_acme_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-mcp-grafana-acme.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/mcp-grafana-acme/mcp-grafana-acme"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_mcp_grafana_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-mcp-grafana.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/mcp-grafana/mcp-grafana"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_mcp_hashicorp_terraform_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-mcp-hashicorp-terraform.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/mcp-hashicorp-terraform/mcp-hashicorp-terraform"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_mcp_kubernetes_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-mcp-kubernetes.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/mcp-kubernetes/mcp-kubernetes"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_mcp_proxy_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-mcp-proxy.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/mcp-proxy/mcp-proxy"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_mcp_qdrant_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-mcp-qdrant.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/vector-db/mcp-qdrant"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_mcp_service_recipes_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-mcp.service-recipes.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/service-recipes/service-recipes-mcp"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_mem0_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-mem0.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/vector-db/mem0"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_n8n_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-n8n.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/n8n/n8n"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_ollama_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-ollama.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/ollama/ollama"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_otel_demo_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-otel-demo.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/otel-demo/otel-demo-oauth2-test"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_qdrant_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-qdrant.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/vector-db/qdrant-dashboard"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_service_recipes_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-service-recipes.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/service-recipes/service-recipes"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aaaa_think_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aaaa-think.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/ollama/open-webui"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aiden_demo_agent_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aiden-demo-agent.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aiden_demo_agent_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aiden-demo-agent.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aiden_demo_gateway_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aiden-demo-gateway.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_aiden_demo_gateway_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "aiden-demo-gateway.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_argocd_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "argocd.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_argocd_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "argocd.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_aiden_demo_agent_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-aiden-demo-agent.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/aiden-demo/aiden-demo-agent"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_aiden_demo_gateway_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-aiden-demo-gateway.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/aiden-demo/aiden-demo-gateway"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_argocd_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-argocd.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/argocd/argocd"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_data_recipes_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-data-recipes.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/data-recipes/data-recipes"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_datadog_otel_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-datadog-otel.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/datadog/cm-acme-http-solver-tqdzf"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_gov_policies_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-gov-policies.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/ui-gov/gov-policies-oauth2"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_kube_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-kube.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/kubernetes-dashboard/kubernetes-dashboard"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_litellm_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-litellm.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/ollama/litellm"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_mcp_aws_cfn_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-mcp-aws-cfn.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/mcp-aws/mcp-aws-cfn"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_mcp_data_recipes_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-mcp.data-recipes.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/data-recipes/data-recipes-mcp"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_mcp_github_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-mcp-github.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/mcp-github/mcp-github"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_mcp_gitlab_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-mcp-gitlab.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/mcp-gitlab/mcp-gitlab"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_mcp_grafana_acme_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-mcp-grafana-acme.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/mcp-grafana-acme/mcp-grafana-acme"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_mcp_grafana_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-mcp-grafana.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/mcp-grafana/mcp-grafana"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_mcp_hashicorp_terraform_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-mcp-hashicorp-terraform.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/mcp-hashicorp-terraform/mcp-hashicorp-terraform"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_mcp_kubernetes_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-mcp-kubernetes.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/mcp-kubernetes/mcp-kubernetes"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_mcp_proxy_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-mcp-proxy.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/mcp-proxy/mcp-proxy"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_mcp_qdrant_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-mcp-qdrant.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/vector-db/mcp-qdrant"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_mcp_service_recipes_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-mcp.service-recipes.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/service-recipes/service-recipes-mcp"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_mem0_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-mem0.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/vector-db/mem0"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_n8n_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-n8n.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/n8n/n8n"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_ollama_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-ollama.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/ollama/ollama"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_otel_demo_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-otel-demo.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/otel-demo/otel-demo-oauth2-test"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_qdrant_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-qdrant.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/vector-db/qdrant-dashboard"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_service_recipes_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-service-recipes.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/service-recipes/service-recipes"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_cname_think_stackgen_run__txt" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "cname-think.stackgen.run"
  type = "TXT"
  ttl = 300
  records = ["heritage=external-dns,external-dns/owner=field-engineering,external-dns/resource=httproute/ollama/open-webui"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_data_recipes_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "data-recipes.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_data_recipes_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "data-recipes.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_datadog_otel_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "datadog-otel.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_datadog_otel_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "datadog-otel.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_gov_policies_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "gov-policies.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_kube_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "kube.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_kube_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "kube.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_litellm_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "litellm.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_litellm_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "litellm.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_aws_cfn_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-aws-cfn.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_aws_cfn_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-aws-cfn.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_data_recipes_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp.data-recipes.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_github_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-github.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_github_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-github.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_gitlab_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-gitlab.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_gitlab_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-gitlab.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_grafana_acme_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-grafana-acme.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_grafana_acme_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-grafana-acme.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_grafana_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-grafana.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_grafana_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-grafana.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_hashicorp_terraform_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-hashicorp-terraform.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_hashicorp_terraform_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-hashicorp-terraform.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_kubernetes_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-kubernetes.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_kubernetes_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-kubernetes.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_proxy_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-proxy.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_proxy_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-proxy.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_qdrant_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-qdrant.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mcp_qdrant_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mcp-qdrant.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mem0_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mem0.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_mem0_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "mem0.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_n8n_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "n8n.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_n8n_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "n8n.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_ollama_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "ollama.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_ollama_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "ollama.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_otel_demo_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "otel-demo.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_otel_demo_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "otel-demo.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_qdrant_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "qdrant.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_qdrant_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "qdrant.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_service_recipes_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "service-recipes.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_service_recipes_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "service-recipes.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_stackgen_run__ns" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "stackgen.run"
  type = "NS"
  ttl = 172800
  records = ["ns-1080.awsdns-07.org.", "ns-1703.awsdns-20.co.uk.", "ns-18.awsdns-02.com.", "ns-652.awsdns-17.net."]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_stackgen_run__soa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "stackgen.run"
  type = "SOA"
  ttl = 900
  records = ["ns-652.awsdns-17.net. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_think_stackgen_run__a" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "think.stackgen.run"
  type = "A"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z04651531uls293y1eqt_think_stackgen_run__aaaa" {
  zone_id = "/hostedzone/Z04651531ULS293Y1EQT"
  name = "think.stackgen.run"
  type = "AAAA"
  alias {
    evaluate_target_health = true
    name = "k8s-envoygat-envoyenv-d1051f83bc-49ba7d951ac2554f.elb.us-east-1.amazonaws.com"
    zone_id = "Z26RNL4JYFTOTI"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z0843903kq9xqkdpbrc1__052_apps_aiden_aiden_sno_test__a" {
  zone_id = "/hostedzone/Z0843903KQ9XQKDPBRC1"
  name = "\\052.apps.aiden.aiden-sno.test"
  type = "A"
  alias {
    evaluate_target_health = false
    name = "internal-a075533f0f03e4bc7a59b9e4e5dfebae-712141059.us-west-2.elb.amazonaws.com"
    zone_id = "Z1H1FL5HABSF5"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z0843903kq9xqkdpbrc1_aiden_aiden_sno_test__ns" {
  zone_id = "/hostedzone/Z0843903KQ9XQKDPBRC1"
  name = "aiden.aiden-sno.test"
  type = "NS"
  ttl = 172800
  records = ["ns-0.awsdns-00.com.", "ns-1024.awsdns-00.org.", "ns-1536.awsdns-00.co.uk.", "ns-512.awsdns-00.net."]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z0843903kq9xqkdpbrc1_aiden_aiden_sno_test__soa" {
  zone_id = "/hostedzone/Z0843903KQ9XQKDPBRC1"
  name = "aiden.aiden-sno.test"
  type = "SOA"
  ttl = 900
  records = ["60 awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z0843903kq9xqkdpbrc1_api_aiden_aiden_sno_test__a" {
  zone_id = "/hostedzone/Z0843903KQ9XQKDPBRC1"
  name = "api.aiden.aiden-sno.test"
  type = "A"
  alias {
    evaluate_target_health = false
    name = "aiden-xc7sh-int-1f6147d35e278a97.elb.us-west-2.amazonaws.com"
    zone_id = "Z18D5FSROUN65G"
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_route53_record" "_hostedzone_z0843903kq9xqkdpbrc1_api_int_aiden_aiden_sno_test__a" {
  zone_id = "/hostedzone/Z0843903KQ9XQKDPBRC1"
  name = "api-int.aiden.aiden-sno.test"
  type = "A"
  alias {
    evaluate_target_health = false
    name = "aiden-xc7sh-int-1f6147d35e278a97.elb.us-west-2.amazonaws.com"
    zone_id = "Z18D5FSROUN65G"
  }
  lifecycle {
    ignore_changes = all
  }
}
