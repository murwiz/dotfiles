ln -fsv "$HOME/dotfiles/gitconfig" ~/.gitconfig
ln -fsv "$HOME/dotfiles/screenrc" ~/.screenrc
ln -fsv "$HOME/dotfiles/emacs" ~/.emacs
ln -fsv "$HOME/dotfiles/inputrc" ~/.inputrc
(cd $HOME/bin; for x in $HOME/dotfiles/bin/*; do ln -fsv "$x" .; done)
grep -qi "dotfiles installed" ~/.bashrc
if [ $? != 0 ]
then
  cat >>~/.bashrc <<'EOF'
# dotfiles installed:
for DOTFILE in `find $HOME/dotfiles/bash/*`
do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done
EOF
fi
crontab -l | grep -qi "dotfiles installed"
if [ $? != 0 ]
then
  (crontab -l; echo "# dotfiles installed"; echo "0 0 * * * cd dotfiles; git pull") | crontab -
fi
