terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.26.0"
    }
  }
}

provider "newrelic" {
  # Configuration options
  account_id = 3993326
  api_key    = "NRAK-9ESI0BV28AZI1Z6Q9FJA3OXBV2B"
  region     = "US"
}