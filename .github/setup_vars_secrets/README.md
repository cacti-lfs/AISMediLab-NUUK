# 🚀 AISMediLab-NUUK : Infrastructure Sync

[![Ansible](https://img.shields.io/badge/Ansible-2.17+-black?style=flat&logo=ansible)](https://docs.ansible.com/)
[![Terraform](https://img.shields.io/badge/Terraform-1.9+-purple?style=flat&logo=terraform)](https://www.terraform.io/)
[![GitHub CLI](https://img.shields.io/badge/gh_cli-latest-blue?style=flat&logo=github)](https://cli.github.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Ce dépôt contient l'automatisation pour le déploiement du socle infrastructure. Il inclut un outil de synchronisation pour injecter vos variables et secrets directement dans les **Environnements GitHub** (POC, NUUK, etc.).

## 📋 Pré-requis

- **GitHub CLI (`gh`)** : Indispensable pour l'interaction avec l'API GitHub.
- **Accès Repository** : Vous devez avoir les droits d'écriture sur le dépôt.

## ⚙️ Installation & Setup

1. **Installer la CLI GitHub** :
   ```bash
   sudo apt install gh
    ```
2. **Authentification** :
    ```bash
    gh auth login
    ```
3. **Rendre le script exécutable** :
    ```bash
    chmod +x .github/setup_vars_secrets/sync_gh.sh
    ```
## 🚀 Utilisation

Le script automatise l'envoi des fichiers `.env` vers un environnement GitHub spécifique. Lancez le script en spécifiant le nom de l'environnement (`poc` ou `nuuk`) en argument :

```bash
./.github/setup_vars_secrets/sync_gh.sh <nom_environnement>
```

### 🔐 Gestion des Clés SSH (Multi-lignes)

> [!IMPORTANT]
> Le script `sync_gh.sh` traite les fichiers ligne par ligne. Pour les **clés privées SSH** ou les listes complexes (comme `SSH_PUBLIC_KEYS`), il est recommandé de les injecter directement via la CLI pour préserver le formatage :
> ```bash
> # Exemple pour une clé privée
> gh secret set SSH_PRIVATE_KEY --env <env_name> < ~/.ssh/id_ed25519
> ```
> 

---

## 🛠️ Concepts Clés

* **Idempotence** : Le script utilise `gh variable set` et `gh secret set`. Si une valeur est modifiée localement dans vos fichiers `.env`, elle sera mise à jour sur GitHub sans créer de doublons.
* **Sécurité** : Les fichiers `.env` sont listés dans le `.gitignore`. Il est fortement conseillé de stocker vos valeurs réelles dans un gestionnaire de mots de passe (Bitwarden, KeePassXC).
* **Environnements** : Permet une séparation stricte des variables entre le `poc` et la `nuuk` sans modifier le code source.

## 📄 Structure des fichiers .env

Les fichiers doivent respecter le format `KEY=VALUE`. Des exemples sont disponibles :

* `vars.env.example` : Pour les variables publiques (IPs, noms de nodes, interfaces).
* `secrets.env.example` : Pour les données sensibles (Tokens API, mots de passe).