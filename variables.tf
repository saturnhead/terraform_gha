variable "instances" {
  type = map(object({
    instance_type = optional(string, "t2.micro")
    tags          = optional(map(string), {})
  }))
  default = {
    instance1dev = {
      tags          = { "Env" : "dev" }
      instance_type = "t2.micro"
    }
    instance2qa = {
      tags = { "Env" : "qa" }
    }
    instance3prod = {
      tags          = { "Env" : "prod" }
      instance_type = "t2.micro"
    }
  }
}
