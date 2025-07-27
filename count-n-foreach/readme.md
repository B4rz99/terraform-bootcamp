# Count and ForEach Module

This Terraform module demonstrates the usage of `count` and `for_each` meta-arguments to create multiple resources efficiently.

## Overview

This module showcases two different approaches to creating multiple resources in Terraform:
- **Count**: Creates resources with numeric indices
- **ForEach**: Creates resources with meaningful string keys

## Resources Created

### EC2 Instances (using `count`)
- **Resource Type**: `aws_instance`
- **Count**: 2 instances
- **Instance Type**: t2.micro
- **AMI**: ami-0f34c5ae932e6f0e4
- **Naming**: ec2-0, ec2-1

### IAM Users (using `for_each`)
- **Resource Type**: `aws_iam_user`
- **Users Created**:
  - `orlando` (admin role)
  - `maria` (read-only role)

## Usage

```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the configuration
terraform apply

# Destroy resources
terraform destroy
```

## Configuration

### Variables

The module uses a `users` variable with the following default values:

```hcl
variable "users" {
  default = {
    orlando = "admin"
    maria   = "ro"
  }
}
```

### Outputs

This module doesn't currently define outputs, but you can add them to reference the created resources.

## Key Differences: Count vs ForEach

| Aspect | Count | ForEach |
|--------|-------|---------|
| **Index Type** | Numeric (0, 1, 2...) | String keys |
| **Resource Naming** | `resource[0]`, `resource[1]` | `resource["key"]` |
| **Use Case** | Identical resources | Resources with different configurations |
| **State Management** | Sensitive to order changes | Stable with key-based references |

## Best Practices Demonstrated

1. **Consistent Tagging**: All resources include appropriate tags
2. **Meaningful Naming**: Resources are named descriptively
3. **Variable Usage**: Configuration is externalized through variables
4. **Documentation**: Code is well-commented

## File Structure
