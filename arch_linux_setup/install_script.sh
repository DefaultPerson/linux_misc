#!bin/bash

echo '==============================================='
echo '===================INSTALL====================='
echo '==============================================='

# Добавляем мультилиб в список репозиториев pacman
sudo sed -i 's/#\[multilib\]/\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist/' /etc/pacman.conf

# Устанавливаем пакеты и обновляем установленные
sudo pacman -Syyu --noconfirm python python-pip blueman discord efl qpdfview flameshot gcolor2 hplip htop mousepad nm-connection-editor nitrogen telegram-desktop alacritty viewnior vlc xarchiver xfce4-power-manager qt5ct pcmanfm gparted acpi acl bluez bluez-libs bluez-utils fakeroot obs-studio mc tor veracrypt fish ranger steam qbittorrent terminology telegram-desktop nitrogen mc xorg-server xorg-xinit i3-gaps i3status rofi ttf-font-awesome ttf-dejavu micro chromium virtualbox numlockx pavucontrol bluez bluez-utils pulseaudio-bluetooth virtualbox compton hplip ghostscript pyqt5 xsane redshift libpwquality pacman-contrib jq udisks2 xorg-xinput barrier chromium

# Устанавливаем yay и загружаем пакеты с него
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo 'exec i3' >> ~/.xinitrc
yay -S --noconfirm ckb-next tor-browser polybar foo2zjs xscreensaver-arch-logo

# Генерируем локаль
sudo sed -i 's/#ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen
sudo locale-gen
sudo fc-cache

# Ставим демона bluetooth
sudo systemctl daemon-reload
sudo systemctl start bluetooth
sudo systemctl enable bluetooth
sudo sed -i 's/\[general\]/\[general\]\nEnable=Source,Sink,Media,Socket/' /etc/bluetooth/main.conf

# Ставим демона для клавиатуры корсаир
sudo systemctl start ckb-next-daemon
sudo systemctl enable --now ckb-next-daemon

# Настраиваем принтер
sudo hp-setup -u
echo 'exec i3' >> ~/.xinitrc

echo '==============================================='
echo '====input "startx" and run install_script_2===='
echo '==============================================='
