

provider "kubernetes"{
    //load_config_file       = false
    host = data.aws_eks_cluster.default.endpoint
    token = data.aws_eks_cluster_auth.default.token
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.default.certificate_authority[0].data)

    exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.default.name]
    command     = "aws"
  }
}



data "aws_eks_cluster" "default"{
    name = module.eks.cluster_name
    depends_on = [
    module.eks
  ]
    }

data "aws_eks_cluster_auth" "default"{
    name = module.eks.cluster_name
    depends_on = [
    module.eks
  ]
    }  

  

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = "eks-cluster1"
  cluster_version = "1.29"

  cluster_endpoint_public_access  = true
  

  cluster_addons = {
    # coredns = {
    #   most_recent = true
    # }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }
  enable_irsa = true
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets          
 //control_plane_subnet_ids = ["subnet-xyzde987", "subnet-slkjf456", "subnet-qeiru789"]

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["t2.micro", "t2.small"]
    disk_size = 25
  }

  eks_managed_node_groups = {
    general = {
      min_size     = 1
      max_size     = 1
      desired_size = 1

      instance_types = ["t2.micro"]
      capacity_type  = "ON_DEMAND"

      labels = {
        "lifecycle" = "Ongoing"
      }      
      taints = [{
          key      = "market"
          value    = "spot" 
          effect   = "NO_SCHEDULE"
          
          }]
  
  create_aws_auth_configmap = true 
  manage_aws_auth_configmap = true
  aws_auth_roles = [
    {
      rolearn  = ["arn:aws:iam::633840464354:user/medo", module.eks_admins_iam_role.iam_role_arn]
      username = ["medo", module.eks_admins_iam_role.iam_role_name]
      groups   = ["system:masters"]
    }
  ]
    }
  

  }
  
tags = {
        Environment = "staging"
      }

}    

# module "eks_auth" {
#   source = "aidanmelen/eks-auth/aws"
#   eks      = module.eks

#   #  map_roles = [
#   #   {
#   #     rolearn  = ["arn:aws:iam::633840464354:user/medo"]
#   #     username = ["medo"]
#   #     groups   = ["system:masters"]
#   #   }
#   # ]
  
#   # map_users = [
#   #   {
#   #     userarn  = "arn:aws:iam::66666666666:user/user1"
#   #     username = "user1"
#   #     groups   = ["system:masters"]
#   #   }]
  
  
# }