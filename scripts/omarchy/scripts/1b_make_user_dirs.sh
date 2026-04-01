#!/bin/bash

echo "Updating user directories..."
mkdir -p ~/Sites/ || echo "Warning: Failed to create Sites directory."
mkdir -p ~/Dev/ || echo "Warning: Failed to create Dev directory."
mkdir -p ~/Projetos/ || echo "Warning: Failed to create Dev directory."

echo "User directories updated."
