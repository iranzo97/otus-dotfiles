echo "This script will install the configuration files"
read -p "Do you wish to continue (y/n)?" CONT
if [ "$CONT" = "y" ]; then
  cp -r i3scripts ~/.i3scripts
  mkdir -p ~/.config/i3
  cp i3/config ~/.config/i3/
  mkdir -p ~/.config/polybar
  cp polybar/config ~/.config/polybar/
  mkdir -p ~/.oh-my-zsh/themes
  cp oh-my-zsh/pilonsi.zsh-theme ~/.oh-my-zsh/themes/
  mkdir ~/.config/cmus
  cp cmus/pilonsi.theme ~/.config/cmus/
  cp zsh/zshrc ~/.zshrc
  cp zsh/zprofile ~/.zprofile
  cp xresources/.Xresources ~/
  cp xsession/.xsession ~/
  echo "DONE!"
  echo "But it's not ready yet. You must now customize the configuration files to work with your setup"
  echo "Some things that require attention are:"
  echo ""
  echo "*Change the home directory in the scripts:"
  echo "  *in .i3scripts"
  echo "  *in the i3 config file"
  echo "  *in .zshrc and .zprofile"
  echo "  *in .xsession"
  echo "*Change the polybar widgets to fit your setup. Ie:"
  echo "  *Changing the mountpoints to be displayed to yours"
  echo "  *Changing the internet interfaces to be monitored to yours"
  echo "  *Disabling the battery and/or wifi widget if your are in a desktop"
  echo "  *If the sound/battery widgets don't work check polybar's wiki"
  echo "  *Etc..."
  echo "*[Important!] The i3 bindings are from a spanish layout. If you have any other layout you must make a clean config file to match your layout and then copy the modifications found in [TBD]"
  echo "*Those are the essentials. If there is more to be done, you'll find out through daily use."
  echo ""
  echo "For more information check github.com/Pilonsi/otus-dotfiles"
  echo "Enjoy :)"
else
  echo "Aborted installation. Nothing has been changed";
fi
