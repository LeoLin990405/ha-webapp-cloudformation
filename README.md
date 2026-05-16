# Deploy a High-Availability Web App Using CloudFormation

This repository contains the completed Udacity Cloud DevOps project for deploying a highly available web application with AWS CloudFormation.

## Architecture

The solution creates:

- One VPC across two availability zones.
- Two public subnets for the internet-facing Application Load Balancer and NAT Gateways.
- Two private subnets for EC2 web servers.
- Two NAT Gateways so private instances can install packages while remaining unreachable from the public internet.
- An Application Load Balancer with a public HTTP listener.
- An Auto Scaling group with four EC2 instances.
- A launch configuration using a 2 vCPU / 4 GiB instance type and a 10 GB root volume.
- Security groups that allow public HTTP only to the load balancer and allow web traffic to EC2 only from the load balancer.
- An IAM instance profile with S3 read permissions, matching the project requirement that the servers have S3 access.

See `diagrams/architecture.mmd` for the architecture diagram source.

## Files

```text
templates/network.yml              VPC, subnets, route tables, internet gateway, NAT gateways
templates/servers.yml              IAM, launch configuration, ASG, ALB, listener, target group
parameters/network-parameters.json Network stack parameters
parameters/servers-parameters.json Server stack parameters
scripts/create.sh                  Generic stack creation helper
scripts/update.sh                  Generic stack update helper
scripts/delete.sh                  Generic stack deletion helper
scripts/deploy-all.sh              Deploys both stacks in order
scripts/destroy-all.sh             Deletes both stacks in dependency order
app/index.html                     Sample app served by NGINX user data
submission/                        Deployment evidence and screenshots
```

## Deploy

```bash
export AWS_REGION=us-west-2
./scripts/deploy-all.sh
```

Or deploy stack-by-stack:

```bash
./scripts/create.sh udagram-network templates/network.yml parameters/network-parameters.json
./scripts/create.sh udagram-servers templates/servers.yml parameters/servers-parameters.json
```

## Update

```bash
./scripts/update.sh udagram-network templates/network.yml parameters/network-parameters.json
./scripts/update.sh udagram-servers templates/servers.yml parameters/servers-parameters.json
```

## Delete

```bash
./scripts/destroy-all.sh
```

## Validation

Before deployment, both templates were validated with:

```bash
aws cloudformation validate-template --template-body file://templates/network.yml --region us-west-2
aws cloudformation validate-template --template-body file://templates/servers.yml --region us-west-2
```

## Deployment Result

The stacks were deployed successfully in `us-west-2`.

- Network stack: `udagram-network`
- Server stack: `udagram-servers`
- Load balancer URL: <http://udagra-Appli-SJLJeYkoiYvq-788156309.us-west-2.elb.amazonaws.com>

The target group reported four healthy EC2 targets after deployment. Evidence and screenshots are stored under `submission/`.
