module vpc {
    source = "../../modules/vpc"
    project_id = "metro-retailmart-prod"
    network_name = "metro-retailmart-prod"
    region = "asia-southeast2"

    network_name-private-subnet = "metro-retailmart-prod-pvt"
    private-subnet-cidr = "10.20.0.0/16"        
    
    cluster_name = "metro-retailmart-prod"       #for gke cluster name 
    secondary_ip_pod_range = "10.21.0.0/16"     #ip pods range
    secondary_ip_service_range = "10.22.0.0/20" #ip kube svc range
    private_ip_allocation = "10.23.0.0"         #for private connection withouth prefix length default /16
}