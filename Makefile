init-api-gateway:
	@echo "Initializing..."
	@cd terraform/api-gateway \
		&& terraform init -reconfigure

init-eks-cluster:
	@echo "Initializing..."
	@cd terraform/eks-cluster \
		&& terraform init -reconfigure

check-api-gateway:
	@echo "Checking..."
	make fmt-api-gateway && make validate-api-gateway && make plan-api-gateway

check-eks-cluster:
	@echo "Checking..."
	make fmt-eks-cluster && make validate-eks-cluster && make plan-eks-cluster

fmt-api-gateway:
	@echo "Formatting..."
	@cd terraform/api-gateway \
		&& terraform fmt -check

fmt-eks-cluster:
	@echo "Formatting..."
	@cd terraform/eks-cluster \
		&& terraform fmt -check

validate-api-gateway:
	@echo "Validating..."
	@cd terraform/api-gateway \
		&& terraform validate

validate-eks-cluster:
	@echo "Validating..."
	@cd terraform/eks-cluster \
		&& terraform validate

plan-api-gateway:
	@echo "Planning..."
	@cd terraform/api-gateway \
		&& terraform plan -out=plan \
		&& terraform show -json plan > plan.tfgraph

plan-eks-cluster:
	@echo "Planning..."
	@cd terraform/eks-cluster \
		&& terraform plan -out=plan \
		&& terraform show -json plan > plan.tfgraph

apply-api-gateway:
	@echo "Applying..."
	@cd terraform/api-gateway \
		&& terraform apply plan

apply-eks-cluster:
	@echo "Applying..."
	@cd terraform/eks-cluster \
		&& terraform apply plan

destroy-api-gateway:
	@echo "Destroying..."
	@cd terraform/api-gateway \
		&& terraform destroy -auto-approve

destroy-eks-cluster:
	@echo "Destroying..."
	@cd terraform/eks-cluster \
		&& terraform destroy -auto-approve

attach-eks:
	@echo "Attaching to EKS..."
	@aws eks update-kubeconfig --region us-east-1 --name fastfood

apply-kube:
	@echo "Applying Kube..."
	@kubectl apply -f k8s/echo-server.yaml

destroy-kube:
	@echo "Destroying Kube..."
	@kubectl delete -f k8s/echo-server.yaml

get-lb-arn:
	@lb_arn=$$(aws elbv2 describe-load-balancers --region us-east-1 --query 'LoadBalancers[*].LoadBalancerArn' --output text) \
		&& export LB_ARN=$$lb_arn

gen-tf-docs:
	@echo "Generating Terraform Docs..."
	@terraform-docs markdown table terraform

former-init:
	@echo "Initializing Terraform..."
	@cd terraformer \
		&& terraform init
		
former:	
	@echo "Running Terraformer..."
	@cd terraformer \
		&& terraformer import aws --regions=us-east-1 --resources=alb --connect=true