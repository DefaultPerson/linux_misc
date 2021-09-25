#!bin/bash

echo '==============================================='
echo '===================INSTALL====================='
echo '==============================================='

# Добавляем мультилиб в список репозиториев pacman
sudo sed -i 's/#\[multilib\]/\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist/' /etc/pacman.conf


# Устанавливаем пакеты и обновляем установленные
sudo pacman -Syyu --noconfirm python python-pip blueman compton discord efl qpdfview flameshot gcolor2 hplip htop mousepad nm-connection-editor nitrogen telegram-desktop terminology viewnior vlc xarchiver xfce4-power-manager qt5ct pcmanfm gparted acpi acl bluez bluez-libs bluez-utils fakeroot obs-studio mc tor veracrypt fish ranger steam qbittorrent terminology telegram-desktop nitrogen mc xorg-server xorg-xinit i3-gaps i3status rofi ttf-font-awesome ttf-dejavu micro chromium virtualbox numlockx pavucontrol bluez bluez-utils pulseaudio-bluetooth virtualbox compton hplip ghostscript pyqt5 xsane redshift libpwquality pacman-contrib jq udisks2 xorg-xinput

# Устанавливаем yay и загружаем пакеты с него
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
sudo echo 'exec i3' >> ~/.xinitrc
yay -S --noconfirm ckb-next tor-browser polybar foo2zjs xscreensaver-arch-logo

# Настраиваем micro
cd
sudo rm .config/micro/settings.json
sudo touch .config/micro/settings.json
sudo echo '{
	"autosave":true,
	"scrollspeed":2,
	"softwrap":true,
}' >> .config/micro/settings.json

# Устанавливаем fish как дефолт шелл
sudo chsh -s /usr/bin/fish

# Генерируем локаль
sudo sed -i 's/#ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen
sudo locale-gen
sudo fc-cache

# Устанавливаем шрифты
sudo rm /etc/vconsole.conf
touch /etc/vconsole.conf
echo '
FONT=ter-v32
KEYMAP=us
' >> /etc/vconsole.conf

# Включаем переключение раскладки
sudo localectl set-x11-keymap us,ru pc104 "" grp:alt_shift_toggle

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


echo '==============================================='
echo '====input "startx" and run install_script_2===='
echo '==============================================='
