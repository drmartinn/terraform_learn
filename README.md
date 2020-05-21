# terraform_learn
If you clone that repo, first execute this:
terraform init

To use terraform apply with variables:
terraform plan -var-file all_vars.tfvars
terraform apply -var-file all_vars.tfvars
terraform destroy -var-file all_vars.tfvars
To generate graph to svg
terraform graph | dot -Tsvg > graph.svg