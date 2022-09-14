module vpc {
    source = "../../modules/vpc"
    project_id = "metro-retailmart-mobile"
    network_name = "metro-retailmart-mobile"
    region = "asia-southeast2"

    network_name-private-subnet = "metro-retailmart-mobile-pvt"
    private-subnet-cidr = "10.30.0.0/16"        
    
    cluster_name = "metro-retailmart-mobile"       #for gke cluster name 
    secondary_ip_pod_range = "10.31.0.0/16"     #ip pods range
    secondary_ip_service_range = "10.32.0.0/20" #ip kube svc range
    private_ip_allocation = "10.33.0.0"         #for private connection withouth prefix length default /16
}