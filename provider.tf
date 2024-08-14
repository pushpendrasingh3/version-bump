terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }

}
provider "google" {
  credentials = file("credentails.json")
  project     = "nifty-altar-374412"
  region      = "asia-south2"
  zone        = "asia-south2-b"

}
