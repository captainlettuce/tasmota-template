#!/bin/bash

# Ensure that the repository URL and target directory are passed as arguments
REPO_URL="https://github.com/arendst/Tasmota.git"
TARGET_DIR="Tasmota"
DEPLOY_DIR="${DEPLOY_DIR:-tasmota-custom}"

# Check if the deploy directory exists, if not create it
if [ ! -d "$DEPLOY_DIR" ]; then
    echo "Creating deploy directory..."
    mkdir "$DEPLOY_DIR"
fi

# Clone the repository into the deploy directory
echo "Cloning the template repository..."
git clone --depth 1 https://github.com/captainlettuce/tasmota-template.git "$DEPLOY_DIR"

# Change into the deploy directory
cd "$DEPLOY_DIR"

# Remove the .git directory to uninitialize the repository
echo "Removing the .git directory..."
rm -rf .git

# Remove the setup script itself
echo "Removing the setup script..."
rm -- "$0"
rm -f README.md

# Initialize a new git repository
echo "Initializing a new git repository..."
git init

# Add the Tasmota repository as a submodule
echo "Adding Tasmota repository as a submodule..."
git submodule add "$REPO_URL" "$TARGET_DIR"

# Initialize the submodule
git submodule update --init --recursive

# Stage all files for commit
echo "Staging all files for commit..."
git add .

# Commit the initial state
echo "Committing the changes..."
git commit -m "Initial commit with Tasmota submodule"

echo "Setup completed successfully!"

