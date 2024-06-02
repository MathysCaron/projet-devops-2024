#!/bin/bash

# 1. Déplacer schumacher vers tux dans le répertoire légendaires
mv écuries/pilotes/f1/schumacher écuries/pilotes/f1/tux

# 2. Renommer le répertoire écuries en f1
mv écuries écuries/pilotes/f1

# 3. Écrire dans le fichier hamilton
echo "Lewis Hamilton est un pilote de Formule 1 britannique, sept fois champion du monde." > écuries/pilotes/f1/célèbres/hamilton

# 4. Ajouter au fichier hamilton
echo "Il a remporté de nombreux Grand Prix et est considéré comme l'un des plus grands pilotes de l'histoire de la F1." >> écuries/pilotes/f1/célèbres/hamilton

# 5. Écrire dans le fichier schumacher
echo "Michael Schumacher était un pilote de Formule 1 allemand, sept fois champion du monde." > écuries/pilotes/f1/légendaires/tux

# 6. Écraser le contenu du fichier schumacher
echo "Après sa retraite, il a continué à être une figure influente dans le monde de la F1." > écuries/pilotes/f1/légendaires/tux

# 7. Copier le contenu des fichiers hamilton et schumacher dans mix_ham_schum
cat écuries/pilotes/f1/célèbres/hamilton écuries/pilotes/f1/légendaires/tux > écuries/pilotes/f1/mix_ham_schum

# 9. Créer un utilisateur nommé "fan_f1"
sudo useradd -m fan_f1 || true

# 10. Copier le répertoire personnages dans /home/fan_f1
sudo cp -r écuries /home/fan_f1

# 11. Changer le propriétaire et le groupe du répertoire
sudo chown -R fan_f1:fan_f1 /home/fan_f1/écuries

# 12. Créer un lien symbolique "perso_fanf1" pointant vers /home/fan_f1/personnages
sudo ln -sf /home/fan_f1/écuries /home/fan_f1/perso_fanf1

# 13. Créer un lien symbolique "perso_yourname" pointant vers /home/yourname/characters
# Remplacer "yourname" par votre nom d'utilisateur réel
votre_nom=$(whoami)  # Récupère le nom d'utilisateur actuel
sudo cp -r écuries /home/$votre_nom/
sudo ln -sf /home/$votre_nom/écuries /home/$votre_nom/perso_$votre_nom

# 14. Sauvegarder la structure arborescente complète de /home/fan_f1/personnages dans 14.txt
sudo apt install -y tree
sudo tree /home/fan_f1/écuries > 14.txt

# 15. Supprimer les occurrences du mot "directories" de 14.txt et enregistrer dans 15.txt
grep -v "directories" 14.txt > 15.txt

# 16. Enregistrer les 250 dernières lignes de l'historique dans monhistorique, en supprimant les lignes avec la commande "cd"
chemin_fichier_historique=$HISTFILE
if [[ -f $chemin_fichier_historique ]]; then
    grep -v "cd" $chemin_fichier_historique | tail -n 250 > monhistorique
else
    echo "Erreur : le fichier .bash_history n'existe pas"
fi
