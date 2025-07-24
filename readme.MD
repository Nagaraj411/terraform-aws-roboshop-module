# ☁️ terraform-aws-roboshop-module

A **Terraform module** to automate the **golden AMI creation** and **autoscaling deployment** of Roboshop microservices in AWS. This module builds a custom AMI for each component, sets up a Launch Template, and connects an Auto Scaling Group to an ALB target group — all triggered from Terraform.

---

## 🚀 What It Does

This module automates:
🔹 🖥️ Launches a temporary EC2 instance  
🔹 🔐 Uploads and runs a bootstrap shell script  
🔹 ⏹️ Stops the instance and creates a custom AMI  
🔹 🧽 Terminates the temporary EC2 instance  
🔹 📦 Creates a Launch Template using the AMI  
🔹 🚀 Launches an Auto Scaling Group from the template  
🔹 🔗 Registers instances with an ALB Target Group  
🔹 ⚙️ Configures listener rules for HTTP routing  
🔹 📈 Applies CPU-based Auto Scaling policies 

---

## 📦 AWS Resources Used

| 🧱 **Resource Type**           | 🔍 **Purpose**                                         |
|-------------------------------|----------------------------------------------------------|
| 🖥️ `aws_instance`            | Launches a temporary EC2 for app setup and AMI build     |
| 📁 `terraform_data`          | Uploads bootstrap script, executes remote/local tasks    |
| ⏹️ `aws_ec2_instance_state`  | Stops the EC2 instance before AMI creation               |
| 📸 `aws_ami_from_instance`   | Creates a custom AMI from the configured instance        |
| 🧬 `aws_launch_template`     | Defines EC2 configuration using the created AMI          |
| 📈 `aws_autoscaling_group`   | Launches and scales EC2 instances across subnets         |
| ⚙️ `aws_autoscaling_policy`  | Auto scales based on CPU utilization metrics             |
| 🎯 `aws_lb_target_group`     | Registers the instances for ALB-based routing            |
| 🌍 `aws_lb_listener_rule`    | Routes HTTP traffic to services based on host headers    |

---

✅ This setup ensures:

✨ **Immutable Deployments**  
📏 **Horizontal Scalability**  
🌐 **Load-Balanced Infrastructure**  
🧩 All powered via **Terraform Infrastructure as Code**

---

## ⚙️ Input Variables

| 🧩 Variable        | 📖 Description                          | 🧪 Example                  |
|-------------------|------------------------------------------|----------------------------|
| `project`         | Name of the project                      | `"roboshop"`               |
| `environment`     | Deployment environment                   | `"dev"`                    |
| `component`       | Microservice/component name              | `"user"`                   |
| `rule_priority`   | ALB listener rule priority               | `10`                       |

📌 **Local variables** like `ami_id`, `vpc_id`, `sg_id`, `subnet_id`, etc., must be pre-defined or passed as locals from the root module.