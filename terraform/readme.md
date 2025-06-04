#  Projet EKS_Cluster

## Prérequis

- Installer Terraform.
- Avoir accès à un compte AWS avec les permissions nécessaires.
- Disposer d'un rôle IAM EKS_Students sur la plateforme AWS fournie en cours.

## Description

Ce projet a pour objectif de déployer une infrastructure AWS complète en utilisant Terraform. L'infrastructure inclut un cluster EKS ainsi que les éléments nécessaires pour assurer son bon fonctionnement. Les bonnes pratiques de développement Terraform seront respectées, et la solution sera conçue de manière à être multi-région et sécurisée.

## Objectif

L'infrastructure doit comprendre les éléments suivants :

- VPC avec 2 ou 3 sous-réseaux publics et 2 ou 3 sous-réseaux privés en fonction de la région utilisée.
- Une instance EC2 de type t2.micro.
- Un Security Group autorisant les connexions SSH, HTTP et HTTPS depuis toutes les adresses IP.
- Un cluster EKS avec un groupe de nœuds (EC2) de type t2.micro.
- Installation obligatoire des addons : VPC-CNI, CoreDNS et kube-proxy sur le cluster EKS.
- Un rôle IAM nommé EKS_Students associé au cluster EKS.
- Un load balancer applicatif.

## Structure du projet

### Arborescence des fichiers
```
├── modules/
│   └── core-compute/
│       ├── main.tf
│       ├── data.tf
│       ├── variables.tf
│       ├── outputs.tf
├── main.tf
├── data.tf
├── providers.tf
├── variables.tf
├── outputs.tf
├── backend.tf
├── terraform.tfvars
```

### Contenu des fichiers

#### Module core-compute

- **modules*/core-compute/** : Module pour l'infrastructure de base (réseau)
Ce répertoire contient un module local appelé core-compute, utilisé pour déployer la partie réseau de l'infrastructure (VPC, sous-réseaux, security groups, etc.) qui servira de fondation au déploiement du cluster EKS..

- **main.tf** : Ce fichier définit les ressources du module core-compute..

- **data.tf** : Utilise des data sources Terraform pour obtenir dynamiquement des informations sur les ressources AWS existantes.

- **variables.tf** : Définit les variables d'entrée spécifiques au module core-compute.

- **outputs.tf** : Définit les outputs du module core-compute, qui exposent des informations sur les ressources créées (par exemple, l'ID du VPC, les sous-réseaux, ou l'instance EC2). Ces outputs peuvent ensuite être utilisés par d'autres parties de l'infrastructure, comme le déploiement du cluster EKS.

#### Repertoire principal

- **main.tf** : Ce fichier définit les ressources principales du projet.

- **data.tf** : Ce fichier regroupe les data sources globales qui récupèrent des informations dynamiques sur les ressources AWS existantes ou des éléments liés à la région utilisée.

- **providers.tf** : Ce fichier configure les providers Terraform qui seront utilisés pour interagir avec différents services cloud ou APIs. 

- **outputs.tf** : Ce fichier regroupe les outputs globaux de l'infrastructure. Les outputs exposent des informations importantes sur les ressources déployées et permettent de les utiliser dans d'autres parties du projet ou des modules.

- **variables.tf** : Définit les variables globales pour l'infrastructure. 

- **terraform.tfvars** : Ce fichier définit les valeurs des variables spécifiques pour cet environnement. Contrairement aux fichiers variables.tf qui définissent la structure des variables, terraform.tfvars contient les valeurs réelles qui seront utilisées par Terraform lors de l'exécution.

- **backend.tf** : Configure le backend pour stocker de manière sécurisée l'état du Terraform (terraform.tfstate). 

## Critère de notation

### 1. Variabilisation du code

- Le code doit être paramétrable afin de permettre une adaptation rapide à différentes configurations (région, nombre de nœuds, taille des sous-réseaux, etc.).
- Utilisation de variables dans les fichiers .tfvars pour centraliser les valeurs changeantes.

### 2. Utilisation de data source

- Utilisation des datasources Terraform pour récupérer dynamiquement des informations depuis AWS (comme les AMIs pour les instances EC2 ou les zones de disponibilité).

### 3. Utilisation d'un module local pour le réseau

Le module "core-compute" devra être créé pour déployer l'infrastructure réseau de base comprenant :
- VPC
- Subnets (3 publics et 3 privés)
- Security Groups
- Instance EC2
Ce module sera utilisé comme base pour déployer le reste de l'infrastructure, assurant la réutilisabilité et la modularité du code.

### 4. Bonnes pratiques de sécurité

- Utilisation d'un backend sécurisé (S3) pour stocker l'état du Terraform (tfstate).
- Protection des variables sensibles.
- Mise en place des rôles et politiques IAM nécessaires pour minimiser les permissions excessives et respecter le principe du moindre privilège.

### 5. Compatibilité multi-région

- Le code doit permettre le déploiement dans plusieurs régions AWS sans nécessiter de modifications majeures.
- La région AWS devra être spécifiée via des variables, facilitant ainsi l'adaptabilité du code à diverses configurations régionales.

## Utilisation du projet

### Cloner le dépot
```
git clone <url_du_dépôt>
cd <nom_du_projet>
```

### Configurer des variables dans le fichier terraform.tfvars
```
# Module core-compute
VpcName           = "vpc-name"
VpcCidr           = "X.X.X.X/X"
CidrInternet      = "X.X.X.X/X"
PublicRTName      = "route-table-public-name"
PrivateRTName     = "route-table-private-name"
NGWName           = "ngw-name"
IGWName           = "igw-name"
PublicSubnetName  = "subnet-public-name"
PrivateSubnetName = "subnet-private-name"
Ec2Name           = "ec2-name"
Ec2Name2          = "ec2-name2"
InstanceType      = "type"
SgName            = "security-group-name"
SubnetAllowed     = "X.X.X.X/X"
SshKeyName        = "key-name"
SshKeyPath        = "~/path/to/pub/key.pub"

# Main variables
EksClusterName   = "eks-cluster-name"
EksNodeGroupName = "eks-node-group-name"
DesiredSize      = X
MaxSize          = X
MinSize          = X
MaxUnavailable   = X
EksNodeRoleName  = "eks-node-role-name"
AlbName          = "alb-name"
AlbType          = "type"
AlbTgName        = "alb-tg-name"
AddonCNVersion   = "version"
```

### Initialiser Terraform
```
terraform init
```

### Planifier l'infrastructure
```
terraform plan
```

### Appliquer les changement
```
terraform apply
```

