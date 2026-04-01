#!/bin/sh

# to make execurable
# chmod +x install_lazygit.sh  

echo "- dowload lazygit from releases ------------------------------------------"
# download here: https://github.com/jesseduffield/lazygit/releases
wget https://github.com/jesseduffield/lazygit/releases/download/v0.44.0/lazygit_0.44.0_Linux_x86_64.tar.gz

echo "- Extract -------------------------------------------------"
tar -xvzf ~/lazygit_0.44.0_Linux_x86_64.tar.gz

echo "- copy to /usr/bin/ ------------------------------------------------------"
sudo cp ~/lazygit /usr/bin/
