#!/bin/bash

gco(){

# Verifie si le repertoire
if !git rev-parse --is-inside-work-tree > /dev/null 2>&1;then
	echo  "Erreur: Ce repertoire n'est pas dans un depot git"
	return 1
fi

if [ -z "$1"]; then
	echo "Usage: gco 'votre message de commit'"
	return 1
fi

local branch
branch=$(git rev-parse --abbrev-ref HEAD)

git commit -m  "[$branch] $1"
}
