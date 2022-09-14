resource "google_compute_router" "router" {
  name    = "${var.network_name}-router"
  region  = var.region
  network = var.network_name
  project = var.project_id
  bgp {
    asn = 65000
  }
  depends_on = [google_compute_network.network]
}

resource "google_compute_address" "address" {
  name   = "${var.network_name}-nat-external-ip"
  project = var.project_id
  region = var.region
  depends_on = [google_compute_router.router]
}

resource "google_compute_router_nat" "nat" {
  name                               = "${var.network_name}-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  project                            = google_compute_router.router.project
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = google_compute_address.address.*.self_link
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
  depends_on = [google_compute_address.address]
}