resource "aws_eks_cluster" "cluster" {
  name     = "${var.env}-eks"
  role_arn = aws_iam_role.cluster-role.arn

  vpc_config {
    subnet_ids = var.subnet_id
  }

  encryption_config {
    provider {
      key_arn = var.kms_key_id
    }
    resources = ["secrets"]
  }

}

resource "aws_launch_template" "main" {
  name = "eks-${var.env}"

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = 100
      encrypted             = true
      kms_key_id            = var.kms_key_id
      delete_on_termination = true
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      "Name" = "${aws_eks_cluster.cluster.name}-workernode"
    }
  }
}

resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "${var.env}-eks-ng-1"
  node_role_arn   = aws_iam_role.node-role.arn
  subnet_ids      = var.subnet_id
  capacity_type   = "SPOT"
  instance_types  = ["t3.large"]

  launch_template {
    name    = "eks-${var.env}"
    version = "$Latest"
  }

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
}
# aws-auth is for authentication to provide from eks cluster to nodes(in jenkins)
# eks cluster will create in workstation, in continuous delivery(jenkins) expense-backend code will execute in node agent
# so to provide authentication from eks to node agent to generate pods
resource "null_resource" "aws-auth" {
  depends_on = [aws_eks_node_group.main]
  provisioner "local-exec" {
    command = <<EOF
aws eks update-kubeconfig --name "${var.env}-eks"
aws-auth upsert --maproles --rolearn arn:aws:iam::633788536644:role/ci-server-role --username system:node:{{EC2PrivateDNSName}} --groups system:masters
EOF
  }
}

resource "aws_eks_addon" "eks-pod-identity-agent" {
  depends_on = [aws_eks_node_group.main]

  cluster_name                = aws_eks_cluster.cluster.name
  addon_name                  = "eks-pod-identity-agent"
  addon_version               = "v1.3.2-eksbuild.2"
  resolve_conflicts_on_update = "OVERWRITE"
  resolve_conflicts_on_create = "OVERWRITE"
}