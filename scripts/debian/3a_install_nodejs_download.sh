#!/bin/bash
# to make execurable
# chmod +x install_nodejs.sh 


echo "- Dowload NodeJs installer -----------------------------------------------"
mkdir -p ~/.nvm/ || echo "Warning: Failed to create .nvm directory."

# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

echo "You need to restart the terminal"
exit
