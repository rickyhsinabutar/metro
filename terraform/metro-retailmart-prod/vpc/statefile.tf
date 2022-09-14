terraform {
  backend "gcs" {
    bucket  = "metro-infra-state"
    prefix  = "metro-retailmart-prod/vpc"
  }
}