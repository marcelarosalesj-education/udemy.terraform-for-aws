# Terraform notes

## Do aws configure
```
aws configure
```

## Terraform lifecycle

```
terraform init # Initialize project
terraform plan # Check difference
terraform apply # Create resources
terraform destroy # Destroy resources

# It won't ask for confirmation to create resources
terraform apply -auto-approve
```

## Lessons
- `dep` lesson about dependencies
- `count-demo` and `count-advc` are lessons about how to create multiple ec2 instances, for example
- `vars` lesson about how to setup differently test and prod environments using same terraform files
  ```
  terraform plan -var-file=test.tfvars
  terraform plan -var-file=prod.tfvars

  # And to apply use
  terraform apply -var-file=prod.tfvars
  ```
- `import` about importing a resource that's already on AWS and you want terraform to control it
  ```
  # For example vpc-020dc6ade3c71871e is the id of a VPC already created
  terraform import aws_vpc.myvpc2 vpc-020dc6ade3c71871e 
  # When you do terraform destroy 
  # it will destroy the two VPCs
  ```

## Resources
- [Terraform Registry Modules AWS VPC documentation](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)
- [Terraform for AWS - Beginner to Expert](https://intel.udemy.com/course/terraform-fast-track/learn/lecture/21027442#overview)
- [Terraform Registry AWS Provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
