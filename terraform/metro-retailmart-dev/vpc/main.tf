module vpc {
    source = "../../modules/vpc"
    project_id = "metro-retailmart-dev"
    network_name = "metro-retailmart-dev"
    region = "asia-southeast2"

    network_name-private-subnet = "metro-retailmart-dev-pvt"
    private-subnet-cidr = "10.10.0.0/16"        
    
    cluster_name = "metro-retailmart-dev"       #for gke cluster name 
    secondary_ip_pod_range = "10.11.0.0/16"     #ip pods range
    secondary_ip_service_range = "10.12.0.0/20" #ip kube svc range
    private_ip_allocation = "10.13.0.0"         #for private connection withouth prefix length default /16
}