output "sbus_id" {
  value       = module.sbus.sbus_id
  description = "service bus id"
}

output "sbus_name" {
  value       = module.sbus.sbus_name
  description = "service bus name"
}

output "sbus_endpoint" {
  value       = module.sbus.sbus_endpoint
  description = "service bus endpoint"
}

output "sbus_sku" {
  value       = module.sbus.sbus_sku
  description = "service bus sku"
}

output "sbus_queues" {
  value       = [for i in module.queues : i.queue_name]
  description = "service bus queues"
}

output "sbus_queues_keys" {
  value       = "Sensitive - get in portal Azure"
  description = "service bus queues key"
}

output "sbus_topics" {
  value       = [for i in module.topics : i.topic_name]
  description = "service bus topics"
}


