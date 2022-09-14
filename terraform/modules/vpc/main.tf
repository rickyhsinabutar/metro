/******************************************
	VPC configuration
 *****************************************/
resource "google_compute_network" "network" {
  name                            = var.network_name
  auto_create_subnetworks         = var.auto_create_subnetworks
  routing_mode                    = var.routing_mode
  project                         = var.project_id
  description                     = var.description
  delete_default_routes_on_create = var.delete_default_internet_gateway_routes
  mtu                             = var.mtu
}

/******************************************
	Private Subnet
 *****************************************/

resource "google_compute_subnetwork" "private-subnet" {
     name          = var.network_name-private-subnet
     ip_cidr_range = var.private-subnet-cidr
     network       = var.network_name
     project       = var.project_id
     depends_on    = [google_compute_network.network]
     region        = var.region
     private_ip_google_access = "true"

		 secondary_ip_range {
		    range_name    = format("%s-pod-range", var.cluster_name)
		    ip_cidr_range = var.secondary_ip_pod_range
		  }

		  secondary_ip_range {
		    range_name    = format("%s-svc-range", var.cluster_name)
		    ip_cidr_range = var.secondary_ip_service_range
		  }
    }

resource "google_compute_global_address" "private_ip_alloc" {
  project       = var.project_id
  name          = "${var.network_name}-pvt-ip-alloc"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.network.id
  address       = var.private_ip_allocation
}

resource "google_service_networking_connection" "private_service_connection" {
  network                 = google_compute_network.network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc.name]
}
