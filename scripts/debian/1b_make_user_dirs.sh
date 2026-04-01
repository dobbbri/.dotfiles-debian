#!/bin/bash

echo "Updating user directories..."
xdg-user-dirs-update || echo "Warning: Failed to update user directories."
mkdir -p ~/Screenshots/ || echo "Warning: Failed to create Screenshots directory."
mkdir -p ~/Sites/ || echo "Warning: Failed to create Sites directory."
mkdir -p ~/Dev/ || echo "Warning: Failed to create Dev directory."
mkdir -p ~/.nvm/ || echo "Warning: Failed to create .nvm directory."

echo "User directories updated."
