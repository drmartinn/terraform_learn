# terraform_learn
To use terraform apply with variables:
> terraform plan -var-file all_vars.tfvars
> terraform apply -var-file all_vars.tfvars
To generate graph to svg
> terraform graph | dot -Tsvg > graph.svg