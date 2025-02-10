variable "instances" {
  type = map(object({
    instance_type = optional(string, "t2.micro")
    tags          = optional(map(string), {})
  }))
  default = {
    instance1dev = {
      tags          = { "Env" : "dev" }
      instance_type = "t3.micro"
    }
    instance2qa = {
      tags = { "Env" : "qa" }
    }
    instance3prod = {
      tags = { "Env" : "prod" }
    }
  }
}
