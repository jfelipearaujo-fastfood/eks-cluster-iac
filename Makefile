init:
	@echo "Initializing..."
	@cd terraform \
		&& terraform init -reconfigure

check:
	@echo "Checking..."
	make fmt && make validate && make plan

fmt:
	@echo "Formatting..."
	@cd terraform \
		&& terraform fmt -check

validate:
	@echo "Validating..."
	@cd terraform \
		&& terraform validate

plan:
	@echo "Planning..."
	@cd terraform \
		&& terraform plan -var-file="local.tfvars" -out=plan \
		&& terraform show -json plan > plan.tfgraph

apply:
	@echo "Applying..."
	@cd terraform \
		&& terraform apply plan

destroy:
	@echo "Destroying..."
	@cd terraform \
		&& terraform destroy -auto-approve

attach-eks:
	@echo "Attaching to EKS..."
	@aws eks update-kubeconfig --region us-east-1 --name fastfood

gen-tf-docs:
	@echo "Generating Terraform Docs..."
	@terraform-docs markdown table terraform

gen-cloud-diagrams:
	@echo "Generating Cloud Diagrams..."
	@cd docs && python3 cloud_aws_fast_food.py