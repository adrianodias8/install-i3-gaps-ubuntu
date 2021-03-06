#!/bin/bash

###### Place the default wallpaper in $HOME directory
cp wallpaper.jpg ~/.wallpaper.jpg

###### Install Dependencies (i3-gaps + polybar)
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev cmake cmake-data libcairo2-dev libxcb-ewmh-dev libxcb-image0-dev pkg-config python-xcbgen libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev cmake xcb-proto


######more stuff
sudo apt install -y i3status i3lock i3blocks suckless-tools feh rofi clipit compton arc-theme arandr conky-all

###### Get i3-gaps
cd /tmp
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull 

###### Compile & Install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install 

###### Get dunst
cd /tmp
git clone https://github.com/dunst-project/dunst.git
cd dunst
make
sudo make install

cd /tmp

######Install polybar
git clone https://github.com/jaagr/polybar.git

cd polybar && yes | ./build.sh

###### Make .fonts directory if not already available
mkdir ~/.fonts

cd /tmp
###### Get and install San Francisco Font
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git
cp -v YosemiteSanFranciscoFont/*.ttf ~/.fonts
rm -rf YosemiteSanFranciscoFont

cd /tmp
###### Get and install Font Awesome Web Font
git clone https://github.com/FortAwesome/Font-Awesome.git
cp -v Font-Awesome/webfonts/*.ttf ~/.fonts
rm -rf Font-Awesome

###### Copy config files
#i3
sudo chmod +x ~/install-i3-gaps-ubuntu/i3-config/i3exit
mkdir ~/.config/i3/
cp -fv ~/install-i3-gaps-ubuntu/i3-config/* ~/.config/i3/
#polybar
sudo chmod +x ~/install-i3-gaps-ubuntu/polybar-config/launch.sh
mkdir ~/.config/polybar/
cp -fv ~/install-i3-gaps-ubuntu/polybar-config/* ~/.config/polybar/
#rofi
mkdir ~/.config/rofi/
cp -fv ~/install-i3-gaps-ubuntu/rofi/* ~/.config/rofi/
#conky
mkdir ~/.config/conky/
cp -fv ~/install-i3-gaps-ubuntu/conky/.conkyrc ~/.config/conky

