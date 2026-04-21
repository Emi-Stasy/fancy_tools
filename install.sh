#!/bin/bash
set -e

REPO_URL='https://github.com/Emi-Stasy/fancy_tools.git'
SRC_DIR=~/Documents/Emilie_UDM/fancy_tools

# Fonction utilitaire : ajoute une ligne si absente
add_if_missing() {
	grep -qF "$1" ~/.bashrc || echo "$1" >> ~/.bashrc
}

# Sauvegarder .bashrc avec horodatage
cp ~/.bashrc ~/.bashrc.bak.$(date + %Y%m%d_%H%M%S)
echo "Sauvegarde de ./bashrc effectue."

# Sourcer .aliases dans ~/.bashrc
add_if_missing "source ~/Documents/Emilie_UDM/fancy_tools/.aliases"

# Sourcer fancy_functions.sh dans ~/.bashrc
add_if_missing "source ~/Documents/Emilie_UDM/fancy_tools/fancy_functions.sh"

# Ajouter ~/bin au PATH dans ~/.bashrc
add_if_missing 'export PATH="~HOME/bin:$PATH"'

# Cloner le depot dans ~src (si absent)
if [! -d "$SRC_DIR"]; then
	mkdir -p ~/Documents/Emilie_UDM
	git clone "REPO_URL" "SRC_DIR"
	echo "Depot clone dans $SRC_DIR"
else 
	echo "Depot deja present dans $SRC_DIR"
fi

echo "Installation Terminee!"
