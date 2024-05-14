from diagrams import Cluster, Diagram
from diagrams.aws.compute import EKS, Lambda
from diagrams.aws.security import SecretsManager
from diagrams.aws.management import SystemsManagerParameterStore as ParameterStore
from diagrams.aws.database import RDSPostgresqlInstance as RDS
from diagrams.aws.network import ElbNetworkLoadBalancer as NLB, APIGateway
from diagrams.aws.security import WAF
from diagrams.aws.general import Users
from diagrams.k8s.compute import Pod
from diagrams.onprem.database import Mongodb

diagram_attr = {
    "fontsize": "25",
    "bgcolor": "white",
    "pad": "0.5",
    "splines": "spline",
}

node_attr = {
    "fontsize": "20",
    "size": "6",
    "bgcolor": "white",
    "margin": "1",
    "height": "3",
    "pad": "5"
}

cluster_attr = {
    "fontsize": "20",
    "size": "5",
    "margin": "18",
    "pad": "2"
}

item_attr = {
    "fontsize": "20",
    "height": "2.2"
}

with Diagram("Cloud AWS Fast Food", show=False, graph_attr=diagram_attr):    
    users = Users("Users")

    with Cluster("AWS"):
        with Cluster("VPC"):
            api_gateway = APIGateway("API Gateway")
            users >> api_gateway

            with Cluster("Private Subnet"):
                lambda_register = Lambda("Register")
                api_gateway >> lambda_register

                lambda_login = Lambda("Login")
                api_gateway >> lambda_login

                lambda_authorizer = Lambda("Authorizer")
                api_gateway >> lambda_authorizer

                nlb = NLB("NLB")
                api_gateway >> nlb

                service = EKS("EKS")

                with Cluster("Cluster"):
                    nlb >> service

                    ms_product_catalog_pod = Pod("MS Product\nCatalog")
                    ms_product_catalog_pod >> SecretsManager("Secrets")
                    ms_product_catalog_pod >> Mongodb("Product\nCatalog")
                    service >> ms_product_catalog_pod

                    ms_order_pod = Pod("MS Order\nManagement")
                    ms_order_pod >> SecretsManager("Secrets")
                    ms_order_pod >> RDS("Orders DB")
                    service >> ms_order_pod

                    ms_payment_pod = Pod("MS Payment\nManagement")
                    ms_payment_pod >> SecretsManager("Secrets")
                    ms_payment_pod >> RDS("Payments DB")
                    service >> ms_payment_pod

                    ms_production_pod = Pod("MS Production\nManagement")
                    ms_production_pod >> SecretsManager("Secrets")
                    ms_production_pod >> RDS("Production DB")
                    service >> ms_production_pod

