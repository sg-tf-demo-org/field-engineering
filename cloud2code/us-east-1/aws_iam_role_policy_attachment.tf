resource "aws_iam_role_policy_attachment" "ai_sre_demo_ebs_csi_driver_arn_aws_iam__aws_policy_service_role_amazonebscsidriverpolicy" {
  role = "ai-sre-demo-ebs-csi-driver"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "ai_sre_demo_eks_cluster_arn_aws_iam__aws_policy_amazoneksclusterpolicy" {
  role = "ai-sre-demo-eks-cluster"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "ai_sre_demo_eks_nodes_arn_aws_iam__aws_policy_amazonec2containerregistryreadonly" {
  role = "ai-sre-demo-eks-nodes"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "ai_sre_demo_eks_nodes_arn_aws_iam__aws_policy_amazoneks_cni_policy" {
  role = "ai-sre-demo-eks-nodes"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "ai_sre_demo_eks_nodes_arn_aws_iam__aws_policy_amazoneksworkernodepolicy" {
  role = "ai-sre-demo-eks-nodes"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "ai_sre_demo_eks_nodes_arn_aws_iam__aws_policy_cloudwatchagentserverpolicy" {
  role = "ai-sre-demo-eks-nodes"
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "ai_sre_demo_github_actions_deploy_arn_aws_iam__697091778198_policy_ai_sre_demo_deploy_policy" {
  role = "ai-sre-demo-github-actions-deploy"
  policy_arn = "arn:aws:iam::697091778198:policy/ai-sre-demo-deploy-policy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "ai_sre_demo_release_orchestrator_arn_aws_iam__697091778198_policy_ai_sre_demo_release_orchestrator" {
  role = "ai-sre-demo-release-orchestrator"
  policy_arn = "arn:aws:iam::697091778198:policy/ai-sre-demo-release-orchestrator"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "ai_sre_demo_release_orchestrator_arn_aws_iam__aws_policy_amazonssmmanagedinstancecore" {
  role = "ai-sre-demo-release-orchestrator"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "aiden2_role_arn_aws_iam__aws_policy_amazoncloudwatchrumreadonlyaccess" {
  role = "aiden2-role"
  policy_arn = "arn:aws:iam::aws:policy/AmazonCloudWatchRUMReadOnlyAccess"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "aiden2_role_arn_aws_iam__aws_policy_readonlyaccess" {
  role = "aiden2-role"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "aiden_infra_aws_assume_role_arn_aws_iam__aws_policy_administratoraccess" {
  role = "aiden-infra-aws-assume-role"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "amazoneksautoclusterrole_arn_aws_iam__aws_policy_amazoneksblockstoragepolicy" {
  role = "AmazonEKSAutoClusterRole"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSBlockStoragePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "amazoneksautoclusterrole_arn_aws_iam__aws_policy_amazoneksclusterpolicy" {
  role = "AmazonEKSAutoClusterRole"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "amazoneksautoclusterrole_arn_aws_iam__aws_policy_amazonekscomputepolicy" {
  role = "AmazonEKSAutoClusterRole"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSComputePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "amazoneksautoclusterrole_arn_aws_iam__aws_policy_amazoneksloadbalancingpolicy" {
  role = "AmazonEKSAutoClusterRole"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSLoadBalancingPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "amazoneksautoclusterrole_arn_aws_iam__aws_policy_amazoneksnetworkingpolicy" {
  role = "AmazonEKSAutoClusterRole"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSNetworkingPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "amazoneksautonoderole_arn_aws_iam__aws_policy_amazonec2containerregistrypullonly" {
  role = "AmazonEKSAutoNodeRole"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "amazoneksautonoderole_arn_aws_iam__aws_policy_amazoneksworkernodeminimalpolicy" {
  role = "AmazonEKSAutoNodeRole"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodeMinimalPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "amazoneksautonoderole_arn_aws_iam__aws_policy_amazonelasticcontainerregistrypublicreadonly" {
  role = "AmazonEKSAutoNodeRole"
  policy_arn = "arn:aws:iam::aws:policy/AmazonElasticContainerRegistryPublicReadOnly"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "apprunnerecraccessrole_data_recipes_arn_aws_iam__aws_policy_service_role_awsapprunnerservicepolicyforecraccess" {
  role = "AppRunnerECRAccessRole-data-recipes"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsreservedsso_administratoraccess_bebcf97aa8880249_arn_aws_iam__aws_policy_administratoraccess" {
  role = "AWSReservedSSO_AdministratorAccess_bebcf97aa8880249"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsreservedsso_administratoraccess_bebcf97aa8880249_arn_aws_iam__aws_policy_awsbillingconductorfullaccess" {
  role = "AWSReservedSSO_AdministratorAccess_bebcf97aa8880249"
  policy_arn = "arn:aws:iam::aws:policy/AWSBillingConductorFullAccess"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsreservedsso_administratoraccess_bebcf97aa8880249_arn_aws_iam__aws_policy_costoptimizationhubadminaccess" {
  role = "AWSReservedSSO_AdministratorAccess_bebcf97aa8880249"
  policy_arn = "arn:aws:iam::aws:policy/CostOptimizationHubAdminAccess"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsreservedsso_administratoraccess_bebcf97aa8880249_arn_aws_iam__aws_policy_costoptimizationhubreadonlyaccess" {
  role = "AWSReservedSSO_AdministratorAccess_bebcf97aa8880249"
  policy_arn = "arn:aws:iam::aws:policy/CostOptimizationHubReadOnlyAccess"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsreservedsso_administratoraccess_bebcf97aa8880249_arn_aws_iam__aws_policy_job_function_billing" {
  role = "AWSReservedSSO_AdministratorAccess_bebcf97aa8880249"
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsreservedsso_administratoraccess_bebcf97aa8880249_arn_aws_iam__aws_policy_service_role_awscostandusagereportautomationpolicy" {
  role = "AWSReservedSSO_AdministratorAccess_bebcf97aa8880249"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCostAndUsageReportAutomationPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsserviceroleforaidevops_arn_aws_iam__aws_policy_aws_service_role_awsserviceroleforaidevopspolicy" {
  role = "AWSServiceRoleForAIDevOps"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSServiceRoleForAIDevOpsPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsserviceroleforamazoneks_arn_aws_iam__aws_policy_aws_service_role_amazoneksservicerolepolicy" {
  role = "AWSServiceRoleForAmazonEKS"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonEKSServiceRolePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsserviceroleforamazoneksnodegroup_arn_aws_iam__aws_policy_aws_service_role_awsserviceroleforamazoneksnodegroup" {
  role = "AWSServiceRoleForAmazonEKSNodegroup"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSServiceRoleForAmazonEKSNodegroup"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsserviceroleforapprunner_arn_aws_iam__aws_policy_aws_service_role_apprunnerservicerolepolicy" {
  role = "AWSServiceRoleForAppRunner"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AppRunnerServiceRolePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsserviceroleforapprunnernetworking_arn_aws_iam__aws_policy_aws_service_role_apprunnernetworkingservicerolepolicy" {
  role = "AWSServiceRoleForAppRunnerNetworking"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AppRunnerNetworkingServiceRolePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsserviceroleforautoscaling_arn_aws_iam__aws_policy_aws_service_role_autoscalingservicerolepolicy" {
  role = "AWSServiceRoleForAutoScaling"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AutoScalingServiceRolePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsserviceroleforawslicensemanagerrole_arn_aws_iam__aws_policy_aws_service_role_awslicensemanagerservicerolepolicy" {
  role = "AWSServiceRoleForAWSLicenseManagerRole"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSLicenseManagerServiceRolePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsserviceroleforclientvpn_arn_aws_iam__aws_policy_aws_service_role_clientvpnservicerolepolicy" {
  role = "AWSServiceRoleForClientVPN"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/ClientVPNServiceRolePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsserviceroleforcloudformationstacksetsorgmember_arn_aws_iam__aws_policy_aws_service_role_cloudformationstacksetsorgmemberservicerolepolicy" {
  role = "AWSServiceRoleForCloudFormationStackSetsOrgMember"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/CloudFormationStackSetsOrgMemberServiceRolePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsserviceroleforecs_arn_aws_iam__aws_policy_aws_service_role_amazonecsservicerolepolicy" {
  role = "AWSServiceRoleForECS"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonECSServiceRolePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsserviceroleforelasticloadbalancing_arn_aws_iam__aws_policy_aws_service_role_awselasticloadbalancingservicerolepolicy" {
  role = "AWSServiceRoleForElasticLoadBalancing"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSElasticLoadBalancingServiceRolePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsserviceroleformarketplacelicensemanagement_arn_aws_iam__aws_policy_aws_service_role_awsmarketplacelicensemanagementservicerolepolicy" {
  role = "AWSServiceRoleForMarketplaceLicenseManagement"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSMarketplaceLicenseManagementServiceRolePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsservicerolefororganizations_arn_aws_iam__aws_policy_aws_service_role_awsorganizationsservicetrustpolicy" {
  role = "AWSServiceRoleForOrganizations"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSOrganizationsServiceTrustPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsserviceroleforresourceexplorer_arn_aws_iam__aws_policy_aws_service_role_awsresourceexplorerservicerolepolicy" {
  role = "AWSServiceRoleForResourceExplorer"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSResourceExplorerServiceRolePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsserviceroleforsso_arn_aws_iam__aws_policy_aws_service_role_awsssoservicerolepolicy" {
  role = "AWSServiceRoleForSSO"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSSOServiceRolePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsserviceroleforsupport_arn_aws_iam__aws_policy_aws_service_role_awssupportservicerolepolicy" {
  role = "AWSServiceRoleForSupport"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "awsservicerolefortrustedadvisor_arn_aws_iam__aws_policy_aws_service_role_awstrustedadvisorservicerolepolicy" {
  role = "AWSServiceRoleForTrustedAdvisor"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "cicd_overwatch_jenkins_ssm_arn_aws_iam__aws_policy_amazonssmmanagedinstancecore" {
  role = "cicd-overwatch-jenkins-ssm"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "devopsagentrole_agentspace_2w7uapbh_arn_aws_iam__697091778198_policy_service_role_aidevopsallowawssupportactionspolicy_f3a9z521" {
  role = "DevOpsAgentRole-AgentSpace-2w7uapbh"
  policy_arn = "arn:aws:iam::697091778198:policy/service-role/AIDevOpsAllowAwsSupportActionsPolicy-f3a9z521"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "devopsagentrole_agentspace_2w7uapbh_arn_aws_iam__aws_policy_aidevopsagentaccesspolicy" {
  role = "DevOpsAgentRole-AgentSpace-2w7uapbh"
  policy_arn = "arn:aws:iam::aws:policy/AIDevOpsAgentAccessPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "devopsagentrole_agentspace_eud89akz_arn_aws_iam__697091778198_policy_service_role_aidevopsallowawssupportactionspolicy_uhhwuxk3" {
  role = "DevOpsAgentRole-AgentSpace-eud89akz"
  policy_arn = "arn:aws:iam::697091778198:policy/service-role/AIDevOpsAllowAwsSupportActionsPolicy-uhhwuxk3"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "devopsagentrole_agentspace_eud89akz_arn_aws_iam__697091778198_policy_service_role_aidevopsallowsecretsmanageractionspolicy_06973bfcaa13" {
  role = "DevOpsAgentRole-AgentSpace-eud89akz"
  policy_arn = "arn:aws:iam::697091778198:policy/service-role/AIDevOpsAllowSecretsManagerActionsPolicy-06973bfcaa13"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "devopsagentrole_agentspace_eud89akz_arn_aws_iam__aws_policy_aidevopsagentaccesspolicy" {
  role = "DevOpsAgentRole-AgentSpace-eud89akz"
  policy_arn = "arn:aws:iam::aws:policy/AIDevOpsAgentAccessPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "devopsagentrole_agentspace_gr4t2wl7_arn_aws_iam__697091778198_policy_service_role_aidevopsallowawssupportactionspolicy_ev5gkf1t" {
  role = "DevOpsAgentRole-AgentSpace-gr4t2wl7"
  policy_arn = "arn:aws:iam::697091778198:policy/service-role/AIDevOpsAllowAwsSupportActionsPolicy-ev5gkf1t"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "devopsagentrole_agentspace_gr4t2wl7_arn_aws_iam__aws_policy_aidevopsagentaccesspolicy" {
  role = "DevOpsAgentRole-AgentSpace-gr4t2wl7"
  policy_arn = "arn:aws:iam::aws:policy/AIDevOpsAgentAccessPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "devopsagentrole_webappadmin_2hb4cyst_arn_aws_iam__aws_policy_aidevopsoperatorappaccesspolicy" {
  role = "DevOpsAgentRole-WebappAdmin-2hb4cyst"
  policy_arn = "arn:aws:iam::aws:policy/AIDevOpsOperatorAppAccessPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "devopsagentrole_webappadmin_l7itpvyk_arn_aws_iam__aws_policy_aidevopsoperatorappaccesspolicy" {
  role = "DevOpsAgentRole-WebappAdmin-l7itpvyk"
  policy_arn = "arn:aws:iam::aws:policy/AIDevOpsOperatorAppAccessPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "devopsagentrole_webappadmin_r2om0d3u_arn_aws_iam__697091778198_policy_service_role_aidevopsiamoperatorprodidcactionspolicy_me206xs1" {
  role = "DevOpsAgentRole-WebappAdmin-r2om0d3u"
  policy_arn = "arn:aws:iam::697091778198:policy/service-role/AIDevOpsIAMOperatorProdIDCActionsPolicy-me206xs1"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "devopsagentrole_webappadmin_r2om0d3u_arn_aws_iam__aws_policy_aidevopsoperatorappaccesspolicy" {
  role = "DevOpsAgentRole-WebappAdmin-r2om0d3u"
  policy_arn = "arn:aws:iam::aws:policy/AIDevOpsOperatorAppAccessPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "devopsagentrole_webappidc_z6n4zzsh_arn_aws_iam__697091778198_policy_service_role_aidevopsidcoperatoractionspolicy_e9574eef50c0_a9chqv88" {
  role = "DevOpsAgentRole-WebappIDC-z6n4zzsh"
  policy_arn = "arn:aws:iam::697091778198:policy/service-role/AIDevOpsIDCOperatorActionsPolicy-e9574eef50c0-a9chqv88"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "devopsagentrole_webappidc_z6n4zzsh_arn_aws_iam__aws_policy_aidevopsoperatorappaccesspolicy" {
  role = "DevOpsAgentRole-WebappIDC-z6n4zzsh"
  policy_arn = "arn:aws:iam::aws:policy/AIDevOpsOperatorAppAccessPolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "ecsinfrastructureroleforexpressservices_arn_aws_iam__aws_policy_service_role_amazonecsinfrastructureroleforexpressgatewayservices" {
  role = "ecsInfrastructureRoleForExpressServices"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSInfrastructureRoleforExpressGatewayServices"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "ecstaskexecutionrole_arn_aws_iam__697091778198_policy_ecstaskexecutionrolepolicy" {
  role = "ecsTaskExecutionRole"
  policy_arn = "arn:aws:iam::697091778198:policy/ecsTaskExecutionRolePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "ecstaskexecutionrole_arn_aws_iam__aws_policy_service_role_amazonecstaskexecutionrolepolicy" {
  role = "ecsTaskExecutionRole"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "externaldnsrole_arn_aws_iam__697091778198_policy_allowexternaldnsupdates" {
  role = "ExternalDNSRole"
  policy_arn = "arn:aws:iam::697091778198:policy/AllowExternalDNSUpdates"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "fde_demo_sachin_arn_aws_iam__aws_policy_administratoraccess" {
  role = "FDE-Demo-sachin"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "organizationaccountaccessrole_arn_aws_iam__aws_policy_administratoraccess" {
  role = "OrganizationAccountAccessRole"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "stackgen_aiden2_role_arn_aws_iam__aws_policy_readonlyaccess" {
  role = "stackgen-aiden2-role"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "stackgen_aiden_readonly_arn_aws_iam__aws_policy_readonlyaccess" {
  role = "stackgen-aiden-readonly"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "stackgen_aws_integration_arn_aws_iam__aws_policy_readonlyaccess" {
  role = "stackgen-aws-integration"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "stacksets_exec_f0c8fb48f39560f7383d5fc6d3582666_arn_aws_iam__aws_policy_administratoraccess" {
  role = "stacksets-exec-f0c8fb48f39560f7383d5fc6d3582666"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "terraform_testing_ssm_role_arn_aws_iam__aws_policy_administratoraccess" {
  role = "terraform-testing-ssm-role"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_role_policy_attachment" "terraform_testing_ssm_role_arn_aws_iam__aws_policy_amazonssmmanagedinstancecore" {
  role = "terraform-testing-ssm-role"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  lifecycle {
    ignore_changes = all
  }
}
