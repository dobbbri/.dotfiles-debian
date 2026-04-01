# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/sd/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


alias pn="corepack pnpm"
alias pnx="corepack pnpx"
alias npm="corepack npm"
alias npx="corepack npx"
alias pnr="corepack pnpm run"
alias pns="corepack pnpm start"

# update node packages
alias update-pkg="pnr ncu --interactive --format group"

# dotfiles
alias ff='cd ~/.dotfiles/'
alias vv='cd ~/.dotfiles/vimbtw/.config/nvim/'

# run http-server
alias run-server="pnx http-server "

alias power-off="sudo systemctl poweroff"
alias reboot="sudo systemctl reboot"

alias x="exit"
alias l='exa -ll --color=always --group-directories-first'
alias lt='eza --tree --level=2 --long --icons --git --color=always --group-directories-first'
alias grep='grep --color=auto'
alias myip="ip -f inet address | grep inet | grep -v 'lo$' | cut -d ' ' -f 6,13 && curl ifconfig.me && echo ' external ip'"
alias free='free -h'
alias reload='source ~/.bashrc'

# nvim
alias v='nvim'
alias lg='lazygit'

# home
alias hh='cd ~'

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'

# pacman
alias spu='sudo pacman -Syu' # syncronize and upgrade package
alias spi='sudo pacman -S'   # install package
alias spr='sudo pacman -Rns' # remove package, configs, and dependencies
alias spc='sudo pacman -Sc'  # clear unused packages
alias ps='pacman -Ss'        # search package
alias pl='pacman -Qe'       # list packages nstalled: 
alias po='pacman -Qdt'     # list orphaned packages 

# Git
alias gsync="git pull && git push && git status --short"
alias gps="git push && git status --short"
alias gnah="git reset --hard && git clean -df"

alias gaa="git add ."
alias gs="git status --short"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"
alias gc="git commit -m"
alias gp="git push"
alias gP="git pull"
alias gac="git add . && git commit -m"
alias gpp="git pull && git push"
alias ggg="gac 'update...' && gps"

gg() {
  git add .
  git commit -m "$1"
  git push
  git status --short
}

mkcd() {
  mkdir -p "$1" && cd "$1"
}

neovim-update() {
  echo "- Update Neovim nighly ---------------------------------------------"
  sudo rm /usr/local/bin/nvim
  wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage
  # wget https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.appimage
  chmod u+x nvim-linux-x86_64.appimage
  sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
}

neovim-clear() {
  echo "- clean Neovim plugins, caches ... ---------------------------------------------"
  rm -rf ~/.cache/nvim
  rm -rf ~/.local/share/nvim
  rm -rf ~/.local/state/nvim
  rm ~/.config/nvim/nvim-pack-lock.json
}

neovim-install() {
  neovim-clear
  echo "- Install Neovim nighly ---------------------------------------------"
  neovim-update
}

extract() {
	for archive in "$@"; do
		if [ -f "$archive" ]; then
			case $archive in
			*.tar.bz2) tar xvjf $archive ;;
			*.tar.gz) tar xvzf $archive ;;
			*.bz2) bunzip2 $archive ;;
			*.rar) rar x $archive ;;
			*.gz) gunzip $archive ;;
			*.tar) tar xvf $archive ;;
			*.tbz2) tar xvjf $archive ;;
			*.tgz) tar xvzf $archive ;;
			*.zip) unzip $archive ;;
			*.Z) uncompress $archive ;;
			*.7z) 7z x $archive ;;
			*) echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}
