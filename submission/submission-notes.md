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
