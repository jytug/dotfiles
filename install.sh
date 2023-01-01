all_dotfiles=".vimrc .tmux.conf .gitignore_global"

for dotfile in $all_dotfiles; do
    cp $PWD/$dotfile ~/$dotfile
done

echo "Installing VimPlug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "...done"

echo "Installing tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "...done"

echo "Setting up global gitignore..."
git config --global core.excludesfile ~/.gitignore_global
echo "...done"
