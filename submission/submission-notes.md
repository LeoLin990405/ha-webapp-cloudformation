# Submission Notes

## Project

Deploy a high-availability web app using CloudFormation.

## Stack Names

- Network stack: `udagram-network`
- Server stack: `udagram-servers`

## URLs

- Load balancer URL: http://udagra-Appli-SJLJeYkoiYvq-788156309.us-west-2.elb.amazonaws.com

## Evidence

- `submission/screenshots/load-balancer-website.png` shows the deployed application through the ALB.
- `submission/evidence/alb-http-headers.txt` shows HTTP 200 from the ALB.
- `submission/evidence/network-stack.json` records the deployed network stack.
- `submission/evidence/servers-stack.json` records the deployed server stack and ALB URL output.
- `submission/evidence/autoscaling-group.json` records ASG desired/min/max capacity and launched instances.
- `submission/evidence/target-health.json` records four healthy targets in the target group.

## Reviewer Notes

- The server template now creates a private S3 bucket and grants EC2 least-privilege read access to that bucket through the instance profile.
- The EC2 UserData attempts to copy `index.html` from the private S3 bucket, then falls back to the bundled HTML so a clean deployment remains self-contained.
- The architecture diagram includes the S3 bucket, IAM role, ALB, Auto Scaling group, EC2 instances, public/private subnets, NAT gateways, and Internet Gateway.
