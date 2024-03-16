from diagrams import Cluster, Diagram
from diagrams.aws.compute import EKS
from diagrams.aws.storage import S3
from diagrams.aws.security import SecretsManager
from diagrams.aws.management import SystemsManagerParameterStore as ParameterStore
from diagrams.aws.database import RDSPostgresqlInstance as RDS
from diagrams.aws.network import ElbNetworkLoadBalancer as NLB, APIGateway
from diagrams.aws.security import WAF
from diagrams.aws.general import Users
from diagrams.k8s.compute import Pod

diagram_attr = {
    "fontsize": "25",
    "bgcolor": "white",
    "pad": "0.5",
    "splines": "spline",
}

node_attr = {
    "fontsize": "20",
    "size": "5",
    "bgcolor": "white",
    "margin": "0.5",
    "height": "2.1",
    "pad": "1"
}

cluster_attr = {
    "fontsize": "20",
    "size": "5",
    "margin": "8",
    "pad": "2"
}

item_attr = {
    "fontsize": "20",
    "height": "2.2"
}

with Diagram("Cloud AWS Fast Food", show=False, graph_attr=diagram_attr):    
    users = Users("Users", **item_attr)

    with Cluster("AWS", graph_attr=cluster_attr):
        with Cluster("VPC", graph_attr=cluster_attr):
            api_gateway = APIGateway("Gateway", **item_attr)
            users >> api_gateway

            with Cluster("Private Subnet", graph_attr=cluster_attr):
                nlb = NLB("NLB", **item_attr)
                api_gateway >> nlb

                s3 = S3("S3", **item_attr)
                secrets_manager = SecretsManager("Secrets", **item_attr)
                rds = RDS("RDS", **item_attr)

                service = EKS("EKS", **item_attr)

                with Cluster("Cluster", graph_attr=cluster_attr):
                    nlb >> service

                    pod = Pod(**item_attr)
                    pod >> s3
                    pod >> secrets_manager
                    pod >> rds
                    service >> pod