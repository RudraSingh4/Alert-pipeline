
resource "newrelic_alert_policy" "alert" {
  name = "Rudra-policy"
}

# Add a condition
resource "newrelic_nrql_alert_condition" "FirstTest" {

  policy_id                    = newrelic_alert_policy.alert.id
  type                         = "static"
  name                         = "first_Conditation"
  description                  = "Alert when transactions are taking too long"
  runbook_url                  = "https://www.example.com"
  enabled                      = true
  violation_time_limit_seconds =  "3600"

  nrql {
    query = "SELECT (filter(count(newrelic.timeslice.value), WHERE metricTimesliceName = 'EndUser/errors') / filter(count(newrelic.timeslice.value), WHERE metricTimesliceName = 'Browser')) as 'JavaScript error rate' FROM Metric WHERE (entityGuid = 'Mzk5MzMyNnxCUk9XU0VSfEFQUExJQ0FUSU9OfDE1ODg4NzQxMDE') "
  }

  critical {
    operator              = "above"
    threshold             = 5.5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}
