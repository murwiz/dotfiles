ln -fsv "$HOME/dotfiles/gitconfig" ~/.gitconfig
ln -fsv "$HOME/dotfiles/screenrc" ~/.screenrc
ln -fsv "$HOME/dotfiles/emacs" ~/.emacs
grep -qi "dotfiles installed" ~/.bashrc
if [ $? != 0 ]
then
  cat >>~/.bashrc <<'EOF'
# dotfiles installed:
for DOTFILE in `find $HOME/dotfiles/bash`
do
  [ -f “$DOTFILE” ] && source “$DOTFILE”
done
EOF
fi
crontab -l | grep -qi "dotfiles installed"
if [ $? != 0 ]
then
  (crontab -l; echo "# dotfiles installed"; echo "0 0 * * * cd dotfiles; git pull") | crontab -
fi
