resource "aws_iam_instance_profile" "k8s_master_profile" {
  name = "k8s-master-profile"
  role = aws_iam_role.k8s_master_role.name
}

resource "aws_iam_instance_profile" "playground_k8s_master_profile" {
  name = "playground_k8s-master-profile"
  role = aws_iam_role.playground_k8s_master_role.name
}

resource "aws_iam_instance_profile" "k8s_node_profile" {
  name = "k8s-node-profile"
  role = aws_iam_role.k8s_node_role.name
}


resource "aws_iam_instance_profile" "playground_k8s_worker_profile" {
  name = "playground-k8s-worker-profile"
  role = aws_iam_role.playground_k8s_worker_role.name
}
