---

# Terraform AWS Infrastructure Deployment

## Overview

This Terraform project is designed to deploy an AWS infrastructure consisting of a Virtual Private Cloud (VPC), public and private subnets, an Application Load Balancer (ALB), security groups, and an EC2 instance.

## Prerequisites

Before using this Terraform configuration, ensure you have the following prerequisites set up:

1. **AWS Account**: You must have an AWS account with appropriate permissions to create and manage resources.

2. **Terraform Installed**: Install Terraform on your local machine. You can download it from [Terraform's official website](https://www.terraform.io/downloads.html).

3. **AWS CLI Installed**: Install the AWS Command Line Interface (CLI) and configure it with your AWS credentials.

## Configuration

### Variables

The `variables.tf` file contains variable definitions used in the Terraform configuration. Modify these variables according to your requirements before running Terraform.

- `vpc_cidr`: The CIDR block for the VPC.
- `public_subnet`: A map of public subnets with availability zone as key and CIDR block as value.
- `private_subnet`: A map of private subnets with availability zone as key and CIDR block as value.
- `cidr_block`: CIDR block to allow traffic via internet.
- `alb_variables`: Configuration for the Application Load Balancer (ALB).

### Provider Configuration

The `provider.tf` file specifies the provider configuration, including the AWS region and authentication details. Ensure your AWS access key and secret key are correctly configured during aws configure step.

### Main Configuration

The `main.tf` file contains the main Terraform configuration for application server security groups, and EC2 instance details.

### Locals

The `locals.tf` file defines local values used within the Terraform configuration. Modify these values as needed.

### ALB Configuration

The ALB configuration is specified in `alb.tf`. It includes resource definitions for the ALB, ALB listener, and ALB target group and ALB security group.


### VPC Configuration

The VPC configuration, including public and private subnets, internet gateway, route table, and route table associations, is defined in `vpc.tf`.

## Usage

1. **Initialize Terraform**: Run `terraform init` in the project directory to initialize Terraform and download the required providers.

2. **Plan Deployment**: Run `terraform plan -var-file=dev.tfvars` to create an execution plan and see what Terraform will do.

3. **Apply Changes**: Run `terraform apply -var-file=dev.tfvars` to apply the changes and create the infrastructure on AWS.

4. **Destroy Infrastructure**: If needed, you can destroy the infrastructure by running `terraform destroy -var-file=dev.tfvars`.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

---