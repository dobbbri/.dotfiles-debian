# GNU Stow: maintain dotfiles

Put all dotfiles in a specific folder so it is easy to use version control tool like git.

## Steps

1. Create directory `~/dotfiles/`.
2. Copy dotfiles into directories like:

   ```
   ~/dotfiles/
     +- bash/
     |  +- .bashrc
     +- ranger/
     |  +- .config/
     |     +- ranger/
     +- tmux/
     |  +- .tmux.conf
     +- vim/
        +- .vim/
        +- .vimrc
   ```

3. Create symbolic links for directory `bash` from `dotfiles`:

   ```
   cd ~/dotfiles/
   stow bash
   ```

# .dotfiles
