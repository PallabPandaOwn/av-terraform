# av-terraform
This repo is for terraform iac learning and coding

## Table of Contents
1. [What is Terraform and How it Benefits as Infrastructure as Code](#what-is-terraform-and-how-it-benefits-as-infrastructure-as-code)
2. [Competitors of Terraform and Differences with Other IaC Tools](#competitors-of-terraform-and-differences-with-other-iac-tools)
3. [Terraform Folder Structure](#terraform-folder-structure)
4. [Different Types of Providers](#different-types-of-providers)

---

## What is Terraform and How it Benefits as Infrastructure as Code?

### What is Terraform?

Terraform is an open-source Infrastructure as Code (IaC) tool created by HashiCorp. It allows you to define and provision infrastructure resources using a declarative configuration language called HashiCorp Configuration Language (HCL) or JSON. Terraform can manage infrastructure across multiple cloud providers, on-premises environments, and third-party services.

### Key Concepts:
- **Declarative Configuration**: You describe what you want your infrastructure to look like, not how to create it
- **State Management**: Terraform maintains a state file that tracks the current state of your infrastructure
- **Plan and Apply**: Terraform shows you what changes will be made before applying them
- **Provider-Agnostic**: Works with multiple cloud providers and services

### Benefits of Terraform as Infrastructure as Code:

#### 1. **Version Control and Collaboration**
- Infrastructure configurations can be stored in version control systems (Git)
- Teams can collaborate on infrastructure changes using standard development workflows
- Track changes, rollbacks, and maintain history of infrastructure modifications

#### 2. **Consistency and Repeatability**
- Eliminate configuration drift by ensuring infrastructure is always in the desired state
- Create identical environments (dev, staging, production) with the same configuration
- Reduce human error by automating infrastructure provisioning

#### 3. **Cost Management**
- Easily spin up and tear down environments as needed
- Track resource usage and costs through code
- Implement resource tagging and governance policies

#### 4. **Scalability**
- Scale infrastructure up or down by modifying configuration files
- Manage complex, multi-tier applications with dependencies
- Handle thousands of resources across multiple regions and providers

#### 5. **Automation and CI/CD Integration**
- Integrate infrastructure provisioning into CI/CD pipelines
- Automate testing of infrastructure changes
- Implement Infrastructure as Code best practices

#### 6. **Multi-Cloud Management**
- Manage resources across multiple cloud providers from a single tool
- Avoid vendor lock-in by maintaining provider-agnostic configurations
- Implement hybrid and multi-cloud strategies effectively

---

## Competitors of Terraform and Differences with Other IaC Tools

### Major Competitors:

#### 1. **AWS CloudFormation**
- **Scope**: AWS-only
- **Language**: JSON/YAML
- **Key Differences**:
  - Native AWS integration with immediate support for new AWS services
  - No state file management required (AWS manages state)
  - Limited to AWS ecosystem only
  - More verbose syntax compared to Terraform's HCL

#### 2. **Azure Resource Manager (ARM) Templates**
- **Scope**: Azure-only
- **Language**: JSON
- **Key Differences**:
  - Native Azure integration
  - Built-in rollback capabilities
  - Limited to Azure ecosystem
  - Complex JSON syntax can be difficult to read and maintain

#### 3. **Google Cloud Deployment Manager**
- **Scope**: Google Cloud Platform only
- **Language**: YAML/Python/Jinja2
- **Key Differences**:
  - Native GCP integration
  - Supports Python and Jinja2 for templating
  - Limited to GCP ecosystem
  - Less mature ecosystem compared to Terraform

#### 4. **Pulumi**
- **Scope**: Multi-cloud
- **Language**: TypeScript, Python, Go, C#, Java
- **Key Differences**:
  - Uses general-purpose programming languages instead of DSL
  - Better suited for developers familiar with programming languages
  - Supports complex logic and conditionals natively
  - Smaller community and ecosystem compared to Terraform

#### 5. **Ansible**
- **Scope**: Multi-cloud (primarily configuration management)
- **Language**: YAML
- **Key Differences**:
  - Primarily a configuration management tool that also supports infrastructure provisioning
  - Agentless architecture
  - Procedural rather than declarative
  - Better suited for configuration management than infrastructure provisioning

#### 6. **Chef/Puppet**
- **Scope**: Primarily configuration management
- **Language**: Ruby (Chef), Puppet DSL (Puppet)
- **Key Differences**:
  - Focused on configuration management and application deployment
  - Agent-based architecture
  - Steeper learning curve
  - Not primarily designed for infrastructure provisioning

### Comparison Table

| Feature | Terraform | CloudFormation | ARM Templates | Pulumi | Ansible |
|---------|-----------|----------------|---------------|---------|----------|
| Multi-Cloud | ✅ | ❌ | ❌ | ✅ | ✅ |
| Declarative | ✅ | ✅ | ✅ | ✅ | ❌ |
| State Management | ✅ | Native | Native | ✅ | ❌ |
| Community | Large | Large | Medium | Growing | Large |
| Learning Curve | Medium | Medium | High | Low-Medium | Low |
| Dry Run | ✅ | ✅ | ✅ | ✅ | ✅ |

---

## Terraform Folder Structure

### Basic Terraform Project Structure

```
terraform-project/
├── main.tf                 # Main configuration file
├── variables.tf           # Input variable definitions
├── outputs.tf            # Output value definitions
├── terraform.tfvars      # Variable values (often gitignored)
├── versions.tf           # Provider version constraints
├── README.md             # Project documentation
└── .terraform/           # Terraform working directory (auto-generated)
```

### Advanced/Production Structure

```
terraform-project/
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── terraform.tfvars
│   │   └── backend.tf
│   ├── staging/
│   │   ├── main.tf
│   │   ├── terraform.tfvars
│   │   └── backend.tf
│   └── prod/
│       ├── main.tf
│       ├── terraform.tfvars
│       └── backend.tf
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── README.md
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── README.md
│   └── rds/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── README.md
├── global/
│   ├── s3/
│   └── iam/
├── scripts/
│   ├── deploy.sh
│   └── destroy.sh
├── .gitignore
├── README.md
└── Makefile
```

### File Descriptions:

#### **main.tf**
- Primary configuration file containing resource definitions
- Can be split into multiple `.tf` files for better organization

#### **variables.tf**
- Defines input variables for the configuration
- Specifies variable types, descriptions, and default values

#### **outputs.tf**
- Defines output values that can be queried after apply
- Useful for passing values between modules or for external use

#### **terraform.tfvars**
- Contains actual values for variables
- Often environment-specific and may contain sensitive data
- Should be gitignored if it contains secrets

#### **versions.tf**
- Specifies Terraform version and provider version constraints
- Ensures consistency across different environments and team members

#### **backend.tf**
- Configures remote state storage
- Defines where Terraform state files are stored (S3, Azure Storage, etc.)

### Best Practices for Folder Structure:

1. **Environment Separation**: Keep different environments in separate folders
2. **Module Reusability**: Create reusable modules for common infrastructure patterns
3. **Consistent Naming**: Use consistent naming conventions across all files
4. **Documentation**: Include README files for complex modules and projects
5. **Version Control**: Use `.gitignore` to exclude sensitive files and auto-generated directories

---

## Different Types of Providers

### What are Terraform Providers?

Terraform providers are plugins that enable Terraform to interact with APIs of various services and platforms. They define resource types and data sources that Terraform can manage.

### Types of Providers:

#### 1. **Official Providers** (HashiCorp-maintained)
- AWS, Azure, Google Cloud
- Kubernetes, Helm
- Vault, Consul
- Docker, VMware

#### 2. **Partner Providers** (Third-party verified)
- Datadog, New Relic
- MongoDB, Elastic
- Cloudflare, Fastly

#### 3. **Community Providers**
- Various smaller services and platforms
- Open-source projects
- Custom internal providers

---

### AWS Provider

#### **Overview**
The AWS provider allows Terraform to manage AWS resources including EC2, VPC, RDS, S3, Lambda, and many others.

#### **Configuration**

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
  profile = "default"
  
  # Optional: Use specific credentials
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
  
  # Optional: Assume role
  # assume_role {
  #   role_arn = "arn:aws:iam::123456789012:role/TerraformRole"
  # }
  
  default_tags {
    tags = {
      Environment = "production"
      ManagedBy   = "terraform"
    }
  }
}
```

#### **Authentication Methods**

1. **AWS Credentials File** (Recommended)
   ```bash
   # ~/.aws/credentials
   [default]
   aws_access_key_id = YOUR_ACCESS_KEY
   aws_secret_access_key = YOUR_SECRET_KEY
   ```

2. **Environment Variables**
   ```bash
   export AWS_ACCESS_KEY_ID="your-access-key"
   export AWS_SECRET_ACCESS_KEY="your-secret-key"
   export AWS_DEFAULT_REGION="us-west-2"
   ```

3. **IAM Roles** (For EC2 instances)
4. **AWS SSO**
5. **Cross-Account Role Assumption**

#### **Common AWS Resources**

```hcl
# VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = {
    Name = "main-vpc"
  }
}

# EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public.id
  
  vpc_security_group_ids = [aws_security_group.web.id]
  
  tags = {
    Name = "web-server"
  }
}

# S3 Bucket
resource "aws_s3_bucket" "app_bucket" {
  bucket = "my-app-bucket-${random_string.bucket_suffix.result}"
}

# RDS Database
resource "aws_db_instance" "postgres" {
  engine         = "postgres"
  engine_version = "13.7"
  instance_class = "db.t3.micro"
  
  allocated_storage = 20
  storage_encrypted = true
  
  db_name  = "myapp"
  username = "postgres"
  password = var.db_password
  
  skip_final_snapshot = true
}
```

#### **AWS Provider Features**

- **Resource Coverage**: 500+ resource types covering all major AWS services
- **Data Sources**: Query existing AWS resources
- **State Management**: Tracks resource dependencies and relationships
- **Tagging**: Built-in support for resource tagging
- **Multi-Region**: Deploy across multiple AWS regions
- **Assume Role**: Cross-account resource management

---

### Azure Provider (AzureRM)

#### **Overview**
The AzureRM provider enables Terraform to manage Microsoft Azure resources including Virtual Machines, Storage Accounts, App Services, and Azure Active Directory.

#### **Configuration**

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
  
  # Optional: Specify subscription
  # subscription_id = "00000000-0000-0000-0000-000000000000"
  
  # Optional: Specify tenant
  # tenant_id = "00000000-0000-0000-0000-000000000000"
}
```

#### **Authentication Methods**

1. **Azure CLI** (Recommended for development)
   ```bash
   az login
   az account set --subscription "your-subscription-id"
   ```

2. **Service Principal**
   ```bash
   export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
   export ARM_CLIENT_SECRET="your-client-secret"
   export ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"
   export ARM_TENANT_ID="00000000-0000-0000-0000-000000000000"
   ```

3. **Managed Identity** (For Azure VMs)
4. **Azure PowerShell**

#### **Common Azure Resources**

```hcl
# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "rg-myapp-prod"
  location = "East US"
  
  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}

# Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = "vnet-main"
  address_space       = ["10.0.0.0/16"]
  location           = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

# Subnet
resource "azurerm_subnet" "web" {
  name                 = "subnet-web"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Virtual Machine
resource "azurerm_linux_virtual_machine" "web" {
  name                = "vm-web"
  resource_group_name = azurerm_resource_group.main.name
  location           = azurerm_resource_group.main.location
  size               = "Standard_B1s"
  admin_username     = "adminuser"
  
  network_interface_ids = [
    azurerm_network_interface.web.id,
  ]
  
  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}

# Storage Account
resource "azurerm_storage_account" "main" {
  name                     = "stmyappprod${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.main.name
  location                = azurerm_resource_group.main.location
  account_tier            = "Standard"
  account_replication_type = "LRS"
  
  blob_properties {
    versioning_enabled = true
  }
}

# App Service
resource "azurerm_service_plan" "main" {
  name                = "asp-myapp-prod"
  resource_group_name = azurerm_resource_group.main.name
  location           = azurerm_resource_group.main.location
  os_type            = "Linux"
  sku_name           = "B1"
}

resource "azurerm_linux_web_app" "main" {
  name                = "app-myapp-prod-${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.main.name
  location           = azurerm_service_plan.main.location
  service_plan_id    = azurerm_service_plan.main.id
  
  site_config {
    application_stack {
      node_version = "16-lts"
    }
  }
}
```

#### **Azure Provider Features**

- **Resource Coverage**: 600+ resource types covering all major Azure services
- **Resource Groups**: Native support for Azure resource organization
- **ARM Integration**: Leverages Azure Resource Manager APIs
- **RBAC**: Built-in support for Role-Based Access Control
- **Multi-Subscription**: Manage resources across multiple Azure subscriptions
- **Features Block**: Fine-grained control over provider behavior

### Provider Configuration Best Practices

1. **Version Constraints**: Always specify provider version constraints
2. **Authentication**: Use secure authentication methods appropriate for your environment
3. **Default Tags**: Implement consistent tagging strategies
4. **Multiple Providers**: Use aliases for multiple provider configurations
5. **Sensitive Data**: Never hardcode credentials in Terraform files

---

## Conclusion

Terraform is a powerful Infrastructure as Code tool that provides significant benefits over traditional infrastructure management approaches. Its multi-cloud capabilities, declarative syntax, and extensive provider ecosystem make it an excellent choice for modern infrastructure management.

Whether you're managing simple applications or complex multi-cloud architectures, understanding Terraform's fundamentals, folder structure, and provider configurations will help you build maintainable and scalable infrastructure solutions.

---

## Additional Resources

- [Terraform Official Documentation](https://www.terraform.io/docs)
- [Terraform Registry](https://registry.terraform.io/)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)
