all_dotfiles=".vimrc .tmux.conf .gitignore_global"

for dotfile in $all_dotfiles; do
    ln -f -s $PWD/$dotfile ~/$dotfile
done

git config --global core.excludesfile ~/.gitignore_global
