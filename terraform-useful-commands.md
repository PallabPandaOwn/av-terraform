# Terraform Useful Commands

Here are some handy Terraform commands for daily use:

## Core Workflow Commands

**Initialize and Setup:**
```bash
terraform init                    # Initialize working directory
terraform init -upgrade          # Upgrade providers to latest versions
terraform init -reconfigure      # Reconfigure backend settings
```

**Planning and Validation:**
```bash
terraform plan                   # Show execution plan
terraform plan -out=plan.out     # Save plan to file
terraform plan -var-file=dev.tfvars  # Use specific variable file
terraform validate              # Validate configuration syntax
terraform fmt                   # Format code (auto-fix indentation)
terraform fmt -check            # Check if files are formatted
```

**Apply and Destroy:**
```bash
terraform apply                  # Apply changes
terraform apply plan.out        # Apply saved plan
terraform apply -auto-approve   # Apply without confirmation
terraform destroy               # Destroy all resources
terraform destroy -target=resource.name  # Destroy specific resource
```

## State Management

```bash
terraform state list            # List all resources in state
terraform state show resource.name  # Show specific resource details
terraform state pull            # Download state file
terraform state push            # Upload state file
terraform state rm resource.name    # Remove resource from state
terraform state mv old_name new_name # Rename resource in state
```

## Workspace Management

```bash
terraform workspace list        # List all workspaces
terraform workspace new dev     # Create new workspace
terraform workspace select dev  # Switch to workspace
terraform workspace delete dev  # Delete workspace
terraform workspace show       # Show current workspace
```

## Output and Variables

```bash
terraform output               # Show all outputs
terraform output bucket_name   # Show specific output
terraform console             # Interactive console for testing
terraform refresh             # Update state with real infrastructure
```

## Import and Troubleshooting

```bash
terraform import resource.name id  # Import existing resource
terraform taint resource.name     # Mark resource for recreation
terraform untaint resource.name   # Remove taint from resource
terraform graph                   # Generate dependency graph
terraform providers              # Show required providers
```

## Useful Options and Flags

```bash
# Target specific resources
terraform plan -target=aws_instance.web
terraform apply -target=module.vpc

# Use different variable files
terraform plan -var-file=staging.tfvars
terraform apply -var-file=prod.tfvars

# Set variables from command line
terraform plan -var="instance_type=t3.micro"
terraform apply -var="environment=production"

# Parallel execution
terraform apply -parallelism=10

# Detailed logging
TF_LOG=DEBUG terraform plan
TF_LOG=INFO terraform apply
```

## Daily Workflow Example

```bash
# 1. Pull latest changes and initialize
terraform init -upgrade

# 2. Format and validate
terraform fmt
terraform validate

# 3. Plan changes
terraform plan -out=plan.out

# 4. Review and apply
terraform apply plan.out

# 5. Check outputs
terraform output
```

## Tips

- Always run `terraform plan` before `terraform apply` to review changes
- Use workspaces to manage different environments effectively
- Keep your state files secure and use remote backends for team collaboration
- Use `terraform fmt` regularly to maintain consistent code formatting
- Enable detailed logging with `TF_LOG` environment variable for troubleshooting