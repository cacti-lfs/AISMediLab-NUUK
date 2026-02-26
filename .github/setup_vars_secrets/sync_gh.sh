#!/bin/bash

# Configuration des chemins
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_NAME=$1

# Vérification de l'argument environnement
if [ -z "$ENV_NAME" ]; then
  echo "Erreur : Tu dois spécifier un environnement."
  echo "Exemple : $0 poc"
  echo "Environnements disponibles sur ton repo : poc, nuuk"
  exit 1
fi

echo " Cible : Environnement GitHub '$ENV_NAME'"
echo "------------------------------------------"

# --- 1. Import des variables ---
if [ -f "$SCRIPT_DIR/vars.env" ]; then
  echo " Envoi des variables vers l'environnement $ENV_NAME..."
  while IFS='=' read -r key value || [ -n "$key" ]; do
    [[ $key =~ ^#.* ]] || [[ -z $key ]] && continue
    
    clean_key=$(echo "$key" | xargs)
    
    gh variable set "$clean_key" --body "$value" --env "$ENV_NAME"
    echo " Variable $clean_key ajoutée."
  done < "$SCRIPT_DIR/vars.env"
else
  echo "  Fichier vars.env non trouvé dans $SCRIPT_DIR"
fi

echo "------------------------------------------"

# --- 2. Import des secrets ---
if [ -f "$SCRIPT_DIR/secrets.env" ]; then
  echo " Envoi des secrets vers l'environnement $ENV_NAME..."
  while IFS='=' read -r key value || [ -n "$key" ]; do
    [[ $key =~ ^#.* ]] || [[ -z $key ]] && continue
    
    clean_key=$(echo "$key" | xargs)
    
    gh secret set "$clean_key" --body "$value" --env "$ENV_NAME"
    echo " Secret $clean_key ajouté."
  done < "$SCRIPT_DIR/secrets.env"
else
  echo "  Fichier secrets.env non trouvé dans $SCRIPT_DIR"
fi

echo "------------------------------------------"
echo "Terminé ! L'environnement '$ENV_NAME' est à jour."