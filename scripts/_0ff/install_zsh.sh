sudo apt update --y
# install Zsh and all of its dependencies
sudo apt install zsh --y
# To use Zsh as your default shell, you need to change the SHELL variable in the `/etc/passwd` file.
sudo chsh -s $(which zsh) $(whoami)
#To apply changes to your ~/.zshrc
source ~/.zshrc
# install Oh My Zsh,
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
# rm -rf $HOME/.p10k.zsh
# ln -s $HOME/dotfiles/p10k.zsh $HOME/.p10k.zsh
# p10k configure

git clone https://github.com/fxbrit/nord-extended $ZSH/themes/nord-extended
# and then in your .zshrc include the line ZSH_THEME="nord-extended/nord"

rm -rf $HOME/.zshrc
ln -s $HOME/dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/aliases $HOME/.aliases
