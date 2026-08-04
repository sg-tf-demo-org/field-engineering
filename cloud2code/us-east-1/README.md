# cloud2code import — account 697091778198 / us-east-1

Terraform configuration generated from StackGen **cloud2code** state for AWS account `697091778198` in `us-east-1`.

## How this was produced

1. `cloud2code import aws --region us-east-1 --name field-engineering-us-east-1 --auto-import=false`
2. HCL resource stubs generated to match cloud2code state addresses (356 managed resources after excluding `aws_nat_gateway` due to an AWS provider refresh validation bug on public NATs).
3. `terraform plan` against the cloud2code state → **No changes**.

## Scope notes

- cloud2code only imports [supported resource types](https://docs.stackgen.com/docs/cli-guide/cloud2code/). EKS Auto Mode EC2 nodes, many EBS volumes, listeners/target groups, etc. may be absent if unsupported.
- Resources use `lifecycle { ignore_changes = all }` so the code tracks inventory/identity without fighting provider read-only / eventual-consistency noise.
- **Never `terraform apply` this stack** unless you intentionally intend to manage these live account resources.

## Backend

Remote state is configured in `backend.tf` (S3). Initialize with:

```bash
terraform init
terraform plan
```
