#### Task 1: Infrastructure as Code (IaC) with Terraform
- Location: `terraform` folder
  - Description:
    - Creates an AWS VPC with two public and two private subnets.
    - Implements an EC2 instance in one private subnet.
    - Configures an Application Load Balancer (ALB) in one public subnet.
  - Instructions:
    - Use Terraform for provisioning and managing the infrastructure.

#### Task 2: Kubernetes Deployment
- Location: `kubernetes` folder
  - Description:
    - Deploys a sample application (e.g., nginx) on a Kubernetes cluster.
    - Configures the application for high availability.
    - Implements rolling updates for the application.

#### Task 3: CI/CD with GitHub Actions
- Location: `.github/workflows` folder
  - Description:
    - Creates a GitHub Actions workflow to build and test the application on every push.
    - Implements a deployment workflow for automatically deploying to a staging environment.

#### Task 4: DevOps & Automation
- Location: `automation` folder
  - Description:
    - Includes a python lambda function to automate the backup of an AWS S3 bucket.
    - Implements a process to automatically scale EC2 instances based on CPU utilization is located in `terraform` folder with autoscaling.tf file.

For detailed instructions and implementation specifics, please refer to the respective folders and files within the repository.
