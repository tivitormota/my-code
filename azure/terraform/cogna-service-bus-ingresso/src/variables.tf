variable "sub_id" {
  type        = map(any)
  description = "(Required) Subscription id to deployment"
  default = {
    HML = "ca143150-8071-4529-97f6-7a3cf512e61b"
    PRD = "c2679671-4c32-4129-8310-1a49f35393a1"
  }
}

variable "rg_name" {
  type        = string
  description = "(Required) Resource group name"
  default     = "rg-ingresso-shared"
}

variable "queue_name" {
  type        = map(any)
  description = "(Required) Sevice bus queue name"
  default = {
    HML = [
      "capture-cycle-term-updated",
    ]
    PRD = [

    ]
  }
}

variable "topic_name" {
  type        = map(any)
  description = "(Required) Sevice bus topic name"
  default = {
    HML = [

    ]
    PRD = [

    ]
  }
}

variable "rbac_sbus_name" {
  type = object({
    appSbusRule    = string
    ingressoQueues = string
  })
  description = "Rbac Service Bus Name"
  default = {
    appSbusRule    = "false"
    ingressoQueues = "true"
  }
}
