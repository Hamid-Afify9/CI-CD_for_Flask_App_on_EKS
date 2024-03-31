    output"aws-eks-auth"{
    value =  data.aws_eks_cluster_auth.default
    sensitive = true
    }

    output"aws-eks"{
    value =  data.aws_eks_cluster.default
    }

    output"username-arn"{

        value = module.cicd_iam_user.iam_user_arn
        
    }
    output"username"{

        value = module.cicd_iam_user.iam_user_name
        
    }

    
    output"access-keys"{

        value = module.cicd_iam_user.iam_access_key_id
    }
    output"secter-keys"{

        value = nonsensitive(module.cicd_iam_user.iam_access_key_secret)
    }

    output"eks-admin"{
    value= module.eks_admins_iam_role.iam_role_name
    }

# output "deployment-body" {
#     value = "kubectl_manifest.frontend_deployment.yaml_body"
# }

# output "deployment-id" {
#     value = "kubectl_manifest.frontend_deployment.id"
# }
   