# DevOpsKit
DevOpsKit

## IaC
## Terraform
Take a peek of the variables.tf file, we should think of variables as the blueprint for what we’d like to accomplish. They define the information that can change over time, and they drive the goals of infrastructure as code. For example, we want the cluster to be scalable within specific limits, so we set variables min_node_count and max_node_count. Others tend to take a different approach and refactor parts of resource definitions to use variables. They hard-code values initially and then replace them with variables later.
