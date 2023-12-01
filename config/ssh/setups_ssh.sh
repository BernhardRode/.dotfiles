#!/bin/bash

# Function to generate GPG key
generate_gpg_key() {
    echo "Generating GPG key"
    NAME_REAL=$(git config user.name)
    NAME_EMAIL=$(git config user.email)
    gpg --batch --homedir ~/.gnupg --generate-key <<EOF
        Key-Type: RSA
        Key-Length: 4096
        Subkey-Type: RSA
        Subkey-Length: 4096
        Name-Real: ${NAME_REAL}
        Name-Email: ${NAME_EMAIL}
        Expire-Date: 0
        %commit
EOF
    echo "GPG key generated successfully."
}

# Function to export GPG public key
export_gpg_public_key() {
    echo "Exporting GPG public key"
    gpg_key_id=$(gpg --list-keys --keyid-format LONG | awk '/pub/ {print $2}' | cut -d'/' -f2)
    gpg --armor --export $gpg_key_id > ~/.ssh/gpg_public_key.asc
    echo "GPG key ID: $gpg_key_id"
}

# Function to check if GPG key exists
check_gpg_key() {
    if [ -z "$(git config --global user.signingkey)" ]; then
        generate_gpg_key
        export_gpg_public_key
    else
        echo "GPG key already exists, skipping generation."
    fi
}

# Function to check if SSH key exists
check_ssh_key() {
    if [ -f ~/.ssh/id_ed25519 ]; then
        echo "SSH key already exists, skipping generation."
    else
        echo "Generating SSH key"
        echo -e "\n" | ssh-keygen -t ed25519 -C "${USER}@${NAME}" -N ""
    fi
}

# Function to add SSH key to SSH agent
add_ssh_key_to_agent() {
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
}

# Function to configure Git for signed commits
configure_git() {
    gpg_key_id=$(git config --global user.signingkey)

    if [ -z "$gpg_key_id" ]; then
        echo "GPG key ID not found in Git configuration."
        echo "Please run 'gpg --list-keys' to find your GPG key ID and then configure Git manually with:"
        echo "git config --global user.signingkey your_gpg_key_id"
    else
        echo "Configuring Git for signed commits using GPG key ID: $gpg_key_id"
        git config --global commit.gpgsign true
    fi
}

# Main script
NAME=$(hostname)
check_gpg_key
check_ssh_key
add_ssh_key_to_agent
configure_git

echo "Keys setup completed!"
