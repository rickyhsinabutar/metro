module vpc {
    source = "../../modules/vpc"
    project_id = "metro-retailmart-erp-prod"
    network_name = "metro-retailmart-erp-prod"
    region = "asia-southeast2"

    network_name-private-subnet = "metro-retailmart-erp-prod-pvt"
    private-subnet-cidr = "10.40.0.0/16"        
    
    cluster_name = "metro-retailmart-erp-prod"       #for gke cluster name 
    secondary_ip_pod_range = "10.41.0.0/16"     #ip pods range
    secondary_ip_service_range = "10.42.0.0/20" #ip kube svc range
    private_ip_allocation = "10.43.0.0"         #for private connection withouth prefix length default /16
}