workspace extends ../workspace.dsl {

    model {       
        deploymentEnvironment "Microservice" {
            deploymentNode "Amazon Web Service" {
                tags "Amazon Web Service - Cloud"
                deploymentNode "US-East-1" {
                    deploymentNode "Amazon Web Services VPC" {
                        tags "Amazon Web Services - VPC"
                        deploymentNode "Amazon Web Services - EKS Cloud" {
                            tags "Amazon Web Services - EKS Cloud"
                            deploymentNode "priv-net-a" {
                                tags "Amazon Web Services - VPC subnet private"
                                deploymentNode "EC2-a" {
                                    tags "Amazon Web Services - EC2"
                                    searchWebApiInstance = containerInstance searchWebApi
                                    adminWebApiInstance = containerInstance adminWebApi
                                    publicWebApiInstance = containerInstance publicWebApi
                                }
                            }
                            deploymentNode "priv-net-b" {
                                tags "Amazon Web Services - VPC subnet private"
                                deploymentNode "EC2-b" {
                                    tags "Amazon Web Services - EC2"
                                    containerInstance publisherRecurrentUpdater
                                    containerInstance elasticSearchEventConsumer
                                    containerInstance bookKafkaSystem
                                }
                                deploymentNode "AWS RDS" {
                                    tags "Amazon Web Services - RDS"
                                    containerInstance relationalDatabase
                                }
                                deploymentNode "Amazon Web Services - OpenSearch Service" {
                                    tags "Amazon Web Services - OpenSearch Service"
                                    containerInstance searchDatabase
                                }
                                deploymentNode "Amazon Web Services - ElastiCache" {
                                    tags "Amazon Web Services - ElastiCache"
                                    containerInstance readerCache
                                }
                            }
                            deploymentNode "pub-net" {
                                tags "Amazon Web Services - VPC subnet public"
                                internetGateway = infrastructureNode "Internet Gateway" {
                                    tags "Amazon Web Services - VPC Internet Gateway"
                                }
                            }
                        }
                    }
                }
            }
        }

        # Relationship
        internetGateway -> adminWebApiInstance "Forward requests to [HTTPS]"
        internetGateway -> publicWebApiInstance "Forward requests to [HTTPS]"
        internetGateway -> searchWebApiInstance "Forward requests to [HTTPS]"
    }

    views {
        # deployment <software-system> <environment> <key> <description>
        deployment bookStoreSystem "Microservice" "Dep-001-MS" "Microservice Deployment for Book Store System" {
            include *
            autoLayout
        }

        theme "https://static.structurizr.com/themes/amazon-web-services-2020.04.30/theme.json"
        theme "https://static.structurizr.com/themes/amazon-web-services-2022.04.30/theme.json"
    }

}