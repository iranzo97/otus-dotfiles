echo "Copying configuration files..."
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
cp xresources/.Xresources ~/
cp xsession/.xsession ~/
echo "Done! We recommend to double check the script launchers such as .xsession or the i3 config file before starting i3. Enjoy :)"
