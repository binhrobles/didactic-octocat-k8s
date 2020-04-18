# didactic-computing-machine-k8s
Intentionally complicated React, Node, multi-container Docker project with Travis->GKE

## Learnings
### Travis
- not arbitrary to conditionally run steps/jobs based on which files were changed. would probably need to push that out into a bash script and use git info and bash conditionals
  - monorepo madness

### Amazon EKS
- less given to us out of the box
- runs on fargate now
  - thus, mounting a volume for the postgres instance is a no-go
  - would probably want to just be using RDS and ElastiCache anyway

### Manual Steps
#### GKE
- cert-manager process
- nginx-ingress process
- creating gcp project + GKE cluster
  - importing these values into travis.yml
- creating/encrypting GCP IAM identity
  - passing that to travis
- creating postgres secret

#### Amazon EKS
- Cluster creation (eksctl)
- cert-manager process
- nginx-ingress process
- creating postgres secret

- TODO: how to hook these through terraform?
  - would infra code need to live in separate repo in order to create outputs to be made available for the eventual k8s deployment? or simply a multistep travis deploy, passing artifacts from step to step
