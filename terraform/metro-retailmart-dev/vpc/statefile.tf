terraform {
  backend "gcs" {
    bucket  = "metro-infra-state"
    prefix  = "metro-retail-dev/vpc"
  }
}