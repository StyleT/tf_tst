resource "null_resource" "cluster" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {}

}

resource "null_resource" "cluster_new" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {}

}