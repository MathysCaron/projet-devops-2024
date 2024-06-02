#!/bin/bash

# This script creates a directory structure and files for a fictional character hierarchy.
# The directories and files are created based on the arrays `directories` and `files`.
# The root directory can be specified as an argument when running the script.
# If no argument is provided, the current directory is used as the root.

# Check if a root directory is specified as an argument
# If not, use the current directory as the root
root_dir="${1:-.}"

# Define the directory structure
# Each element in the `directories` array represents a directory path
directories=(
    "$root_dir/écuries/pilotes/célèbres"
    "$root_dir/écuries/pilotes/légendaires"
)

# Define the files to be created
# Each element in the `files` array represents a file path
files=(
    "$root_dir/écuries/pilotes/célèbres/hamilton"
    "$root_dir/écuries/pilotes/célèbres/verstappen"
    "$root_dir/écuries/pilotes/légendaires/schumacher"
    "$root_dir/écuries/pilotes/légendaires/senna"
)

# Create directories
# For each directory in the `directories` array, create the directory with permissions set to 775
for dir in "${directories[@]}"; do
    mkdir -m 775 -p "$dir"
done

# Create files
# For each file in the `files` array, create the file with permissions set to 664
# If the `file` variable is empty, print an error message and skip the file creation
for file in "${files[@]}"; do
    if [[ -n "$file" ]]; then
        echo "Création du fichier : $file"
        touch "$file"
        chmod 664 "$file"
    else
        echo "Erreur : la variable 'file' est vide"
    fi
done

# Display the permissions of the created directories and files using the `ls` command
ls -lR --color=auto "$root_dir/écuries"
