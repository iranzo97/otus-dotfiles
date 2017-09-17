#Otus install scrpit v0
#09/2017
echo "v0. 09/2017"
echo "Automated install script for fresh installed Debian Stretch systems. This will download and install all components  and their dependencies and copy the configuration files to the correct path. The following will be done:"
echo ""
echo "*Download and install i3-gaps from GitHub"
echo "*Download and install polybar from GitHub"
echo "*Download and install i3lock-fancy from GitHub"
echo "*Download and install wal in ~/Applications/wal from GitHub"
echo "*Download and install Siji font from GitHub"
echo "*Install Rofi from the repositories"
echo "*Install zsh from the repositories"
echo "*Download and install Oh-my-zsh from GitHub"
echo "*Copy all the configuration files, themes and start scripts to their respective locations"
echo "  *This includes zshrc zprofile Xresources and xsession"
echo ""
echo "You will have to review the configuration scripts after installation"
echo "This will install a cmus theme although cmus will not be installed"
echo "This script assumes you have xorg installed"
echo "[WARNING] Currently UNTESTED. Install at your own risk"
echo ""
echo "You will be asked for your root password"
echo ""
read -p "Do you wish to continue (Y/n)?" CONT
if [ "$CONT" = "y" ]; then
  echo "Updating sources"
  sudo apt update
  #Copy configuration files
  echo "Copying configuation files and themes"
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
  #Download GitHub repositories
  cd ~
  mkdir Repos
  cd Repos
  echo ""
  echo "Downloading components..."
  git clone https://www.github.com/Airblader/i3 i3-gaps
  git clone --recursive https://github.com/jaagr/polybar
  git clone https://github.com/stark/siji
  git clone https://github.com/meskarune/i3lock-fancy
  #Download wal
  mkdir -p ~/Applications/wal
  cd ~/Applications/wal
  wget https://raw.githubusercontent.com/dylanaraps/wal/master/wal
  #Install dependencies, zsh, and rofi
  echo "Installing components from the repositories"
  sudo apt install libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev rofi imagemagick original-awk util-linux i3lock scrot dh-autoreconf zsh feh
  #Install Oh-my-zsh
  echo "Installing Oh-my-zsh"
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
  #Install i3lock-fancy
  echo "Installing i3lock-fancy"
  cp ~/Repos/i3lock-fancy/lock /usr/local/bin
  cp ~/Repos/i3lock-fancy/icons /usr/local/bin
  #Install Siji
  echo "Installing Siji"
  ~/Repos/siji/install.#!/bin/sh
  #Install i3-gaps
  echo "Installing i3-gaps"
  cd ~/Repos/i3-gaps
  autoreconf --force --install
  rm -rf build/
  mkdir -p build
  cd build
  ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
  make
  sudo make install
  #Install polybar
  echo "Installing polybar"
  cd ~/Repos
  mkdir polybar/build
  cd polybar/build
  cmake ..
  sudo make install
  #Configure fontgonfig
  echo ""
  echo ""
  echo "[ATTENTION]: We have to activate bitmapped fonts for the polybar font to show up. You should leave everything default, but when asked 'Enable bitmapped fonts by default?' you must select 'Yes'"
  echo "If anything goes wrong you can rerun the configuration with 'sudo dpkg-reconfigure fontconfig-config'"
  echo ""
  read -p "When you are done reading press enter to continue"
  sudo dpkg-reconfigure fontconfig-config
  #End message
  echo ""
  echo ""
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
