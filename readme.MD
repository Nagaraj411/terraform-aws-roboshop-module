# ☁️ terraform-aws-roboshop-module

A **Terraform module** to automate the **golden AMI creation** and **autoscaling deployment** of Roboshop microservices in AWS. This module builds a custom AMI for each component, sets up a Launch Template, and connects an Auto Scaling Group to an ALB target group — all triggered from Terraform.

---

## 🚀 What It Does

This module automates:

🔹 Launching a temporary EC2 instance  
🔹 Bootstrapping with a shell script  
🔹 Stopping and creating a custom AMI  
🔹 Terminating the temp instance  
🔹 Creating a Launch Template with AMI  
🔹 Launching an Auto Scaling Group  
🔹 Registering with ALB Target Group  
🔹 Setting up CPU-based Auto Scaling  
🔹 Defining Listener Rules for routing

---

## 📦 AWS Resources Used

| 🧱 Resource Type              | 🔍 Purpose                                               |
|-----------------------------|---------------------------------------------------------|
| `aws_instance`              | Launch temporary instance for bootstrap                |
| `terraform_data`            | Upload and execute shell script, manage cleanup        |
| `aws_ami_from_instance`     | Create custom AMI from preconfigured EC2               |
| `aws_launch_template`       | Define EC2 launch config using custom AMI              |
| `aws_autoscaling_group`     | Spin up scalable EC2 instances                         |
| `aws_autoscaling_policy`    | Auto scale based on CPU usage                          |
| `aws_lb_target_group`       | Register instances for load balancing                  |
| `aws_lb_listener_rule`      | Host-based routing to services                         |
| `aws_ec2_instance_state`    | Stop instance before AMI creation                      |

---

## ⚙️ Input Variables

| 🧩 Variable        | 📖 Description                          | 🧪 Example                  |
|-------------------|------------------------------------------|----------------------------|
| `project`         | Name of the project                      | `"roboshop"`               |
| `environment`     | Deployment environment                   | `"dev"`                    |
| `component`       | Microservice/component name              | `"user"`                   |
| `rule_priority`   | ALB listener rule priority               | `10`                       |

📌 **Local variables** like `ami_id`, `vpc_id`, `sg_id`, `subnet_id`, etc., must be pre-defined or passed as locals from the root module.