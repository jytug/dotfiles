all_dotfiles=$(ls .*)

for dotfile in $all_dotfiles; do
    cp -r $PWD/$dotfile ~/$dotfile
done

git config --global core.excludesfile ~/.gitignore_global
