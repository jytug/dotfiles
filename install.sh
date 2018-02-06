all_dotfiles=".vimrc .tmux.conf .gitignore_global"

for dotfile in $all_dotfiles; do
    ln -s $PWD/$dotfile ~/$dotfile
done
