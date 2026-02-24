# Nuuk Medilab Project
![Terraform](https://img.shields.io/badge/terraform-%23623CE4.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![Proxmox](https://img.shields.io/badge/Proxmox-E57000?style=for-the-badge&logo=proxmox&logoColor=white)

## Architecture & Topologie

Ce projets comportent deux environnements distincts :
 - *poc* (Proof Of Concept): Environnement autohébergé simulant l'environnement de prod aussi appelé *nuuk* qui lui n'est accessible que durant le temps de formation. Cette environnement contient cette structure :
    - **Hyperviseurs :** 2 Hyperviseurs en mode HCI.
    - **Réseau SDN :** Avec utilisation de VXLAN pour l'overlay L2 entre les noeuds simulant le réseau de *nuuk*.
    - **Segmentation :** Plusieurs VLANs que nous retrouvons également dans l'environnement *nuuk*.
    - **Flux :** *Un schéma de flux sera disponible d'ici peu*

 - *nuuk :* Environnement de formation simulant un réseau d'un laboratoire d'analyse médicale. Cette environnement contient cette structure :
    - **Schéma :**
    *Un schéma logique sera bientôt disponible*
    - **Segmentation réseau :**
    *Un tableau de la segmentation réseau sera bientôt disponible*

## Stack Technique
Dans le but de développer nos compétences techniques en termes de chaîne CI/CD, d'environnement reproductible ainsi que de sécurité et haute disponibilité, les outils suivants ont été utilisés :
 - **IaC :** 
    |Composant | Outil/Service |
    | :-- | :-- |
    | Provider IaC | BGP Proxmox |
    | Backend (tfstate) | Terraform (HCP Terraform) |

 - **Configuration :** Ansible
    | Inventaire dynamique | community.proxmox |
    | :-- | :-- |

 - **CI/CD :** GitHub Actions
    | GitHub Actions | self-hosted runner + tag en fonction de l'environnement |
    | :-- | :-- |

 - **OS :**
    - QEMU Guest Agent sur les templates

    |      Linux     |  Debian 13 |
    | -------------- | ---------- |
    | Windows Server |    2022    |
    | -------------- | ---------- |
    | Windows Client | Windows 10 |



## Fonctionnement

Variables d'environnement à avoir :
| Nom | Valeur |
| :--- | :--- |
| SSH_PUBLIC_KEYS | Clef(s) SSH publique |
| TF_DATASTORE_ID | Disque de stockage de VMs |
| TF_GATEWAY_VLAN100 | IP Passerelle Vlan100 |
| TF_GATEWAY_VLAN120 | IP Passrelle Vlan120 |
| TF_GATEWAY_VLAN130 | IP Passerelle Vlan130 |
| TF_GATEWAY_VLAN140 | IP Passerelle Vlan140 |
| TF_GATEWAY_VLAN150 | IP Passerelle Vlan150 |
| TF_GATEWAY_VLAN40 | IP Passerelle Vlan40 |
| TF_GATEWAY_VLAN50 | IP Passerelle Vlan50 |
| TF_GATEWAY_VLAN70 | IP Passerelle Vlan70 |
| TF_GATEWAY_VLAN80 | IP Passerelle Vlan80 |
| TF_GATEWAY_VLAN90 | IP Passerelle Vlan90 |
| TF_IP_BASTION_01 | IP Passerelle Bastion 1 |
| TF_IP_BASTION_02 | IP Passerelle Bastion 2 |
| TF_IP_BASTION_VIP | IP Passerelle VIP Bastion |
| TF_NAME_NODE_1 | Node 1 Cluster PVE |
| TF_NAME_NODE_2 | Node 2 Cluster PVE |
| TF_NETWORK_V1 | Carte Réseau 1 |