ln -fsv "$HOME/dotfiles/gitconfig" ~/.gitconfig
ln -fsv "$HOME/dotfiles/emacs" ~/.emacs
grep -qi "dotfiles installed" ~/.bashrc
if [ $? != 0 ]
then
  cat >>~/.bashrc <<EOF
# dotfiles installed:
for DOTFILE in `find \$HOME/dotfiles/bash`
do
  [ -f “\$DOTFILE” ] && source “\$DOTFILE”
done
EOF
fi
