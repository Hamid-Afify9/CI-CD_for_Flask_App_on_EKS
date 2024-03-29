# terraform {
#   required_version = ">= 0.13"
#   required_providers {
#     kubectl = {
#       source  = "gavinbunney/kubectl"
#       version = ">= 1.10.0"
#     }
#   }
# }


# provider "kubectl" {
#   host                   = data.aws_eks_cluster.default.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.default.certificate_authority[0].data)
#   load_config_file       = false

#   exec {
#     api_version = "client.authentication.k8s.io/v1beta1"
#     args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.default.id]
#     command     = "aws"
#   }
# }

# resource "kubectl_manifest" "frontend_deployment" {
#   yaml_body = <<-EOF
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: cluster-autoscaler
#   namespace: kube-system
# spec:
#   replicas: 1  # Number of pod replicas
#   selector:
#     matchLabels:
#       app: my-frontend  # Label selector for pods
#   template:
#     metadata:
#       labels:
#         app: my-frontend  # Labels for the pod template
#     spec:
#       containers:
#       - name: my-frontend  # Name of the container in the pod
#         image: nginx
#         ports:
#         - containerPort: 80
#           name: http
#           protocol: TCP
#         resources:
#           requests:
#             memory: "64Mi"
#             cpu: "250m"
#           limits:
#             memory: "128Mi"
#             cpu: "500m"

#   EOF
# }


