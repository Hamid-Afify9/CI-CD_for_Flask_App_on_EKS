output"aws-eks-auth"{
    value =  data.aws_eks_cluster_auth.default
    sensitive = true
}

output"aws-eks"{
    value =  data.aws_eks_cluster.default
    }

# output "deployment-body" {
#     value = "kubectl_manifest.frontend_deployment.yaml_body"
# }

# output "deployment-id" {
#     value = "kubectl_manifest.frontend_deployment.id"
# }
   