package terraform

import future.keywords

deny contains msg if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "aws_instance"
    resource.values.instance_type != "t2.micro"
    msg := sprintf("EC2 instance %v must use t2.micro instance type", [resource.address])
}