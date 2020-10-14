all_dotfiles=".vimrc .tmux.conf .gitignore_global"

echo "Installing plug.vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


for dotfile in $all_dotfiles; do
    ln -f -s $PWD/$dotfile ~/$dotfile
done

git config --global core.excludesfile ~/.gitignore_global
