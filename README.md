# How to use this template

Using Terragrunt to provision infrastructure on Digital Ocean.

Using VS Code Remote Containers.

## Step 1: Setup VS Code

- Install VS Code Remote Container Extensions
-

## Step 2: Prepare Digital Ocean Personal Access Token credentials

- Access Dashboard > Menu: API > Tokens/Keys
- Click: Generate New Token
- Create File: `.env` based on `.env.example`
- Update value of `DIGITALOCEAN_ACCESS_TOKEN`

## Step 3: Develop

1. Update Terraform Code in `modules`
2. Copy/Paste from `infrastructure-live/common_vars.yaml.example` to create `infrastructure-live/common_vars.yaml`
3. Execute Terragrunt commands

```
cd infrastructure-live/demo
terragrunt run-all plan
terragrunt run-all apply
```

# Reference

- Digital Ocean **[Terraform Provider](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs)**

# How to Use GitHub Actions Workflows

- Run `./scripts/setup.sh` to install GitHub CLI and authorize. We use GitHub CLI to manage GitHub Action Secrets
- Run `./scripts/set_secrets.sh` to register GitHub Actions Secrets by reading `.env`, `infrastructure-live/common_vars.yaml`

| Workflow     | Description                                                 |
| ------------ | ----------------------------------------------------------- |
| plan.yaml    | Run Terragrunt validate & plan to confirm Terraform Modules |
| apply.yaml   | Apply Infrastructure changes without approval               |
| destroy.yaml | Destroy Infrastructure without approval                     |
