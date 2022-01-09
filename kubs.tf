# Deploy the actual Kubernetes cluster
resource "digitalocean_kubernetes_cluster" "kubernetes_cluster" {
  name    = "terraform-do-cluster"
  region  = "blr1"
  version = "1.19.15-do.0"

  tags = ["my-tag"]

  # This default node pool is mandatory
  node_pool {
    name       = "default-pool"
    size       = "s-1vcpu-2gb" # minimum size, list available options with `doctl compute size list`
    auto_scale = false
    node_count = 2
    tags       = ["node-pool-tag"]
    labels = {
      "dev.to/patglitch" = "up"
    }
  }

}
