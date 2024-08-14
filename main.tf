
resource "google_container_cluster" "primary" {
  name                     = "my-gke-cluster"
  location                 = "asia-south2"
  remove_default_node_pool = true
  initial_node_count       = 1
  node_locations = [
    "asia-south2-b"
  ]
  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }

  }
  release_channel {
    channel = "REGULAR"
  }
}

resource "google_container_node_pool" "primary_preemtible_node" {
  name       = "my-node-pool"
  location   = "asia-south2"
  cluster    = google_container_cluster.primary.name
  node_count = 1
  management {
    auto_repair  = true
    auto_upgrade = true
  }
  node_config {
    preemptible  = true
    machine_type = "e2-standard-2"
    labels = {
      "k8s.io" = "gke-k8s-c1"
    }
  }
}