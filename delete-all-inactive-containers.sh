#!/bin/bash

# Récupérer la liste des conteneurs inactifs
inactive_containers=$(docker ps -q --filter "status=exited")

# Vérifier si des conteneurs inactifs ont été trouvés
if [ -z "$inactive_containers" ]; then
    echo "Aucun conteneur inactif trouvé."
else
    # Afficher la liste des conteneurs inactifs
    echo "Conteneurs inactifs trouvés :"
    echo "$inactive_containers"

    # Demander confirmation pour supprimer les conteneurs
    read -p "Voulez-vous supprimer ces conteneurs inactifs ? (y/n): " choice

    if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
        # Supprimer les conteneurs inactifs
        docker rm $inactive_containers
        echo "Les conteneurs inactifs ont été supprimés."
    else
        echo "Opération annulée. Aucun conteneur n'a été supprimé."
    fi
fi
