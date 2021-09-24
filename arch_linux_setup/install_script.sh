#!bin/bash
sudo sed -e 's/#[multilib]/[multilib]\nInclude = /etc/pacman.d/mirrorlist' /etc/pacman.conf

sudo pacman -Syyu --noconfirm blueman compton discord efl epfview flameshot gcolor2 hplip htop mouserpad nm-connection-editor 
nitrogen telegram-desktop terminology viewnior vlc xarchiver xfce4-power-manager qt5ct pcmanfm gparted acpi acl bluez bluez-libs 
bluez-utils fakeroot obs i3-scripts i3status-manjaro mc tor veracrypt fish ranger steam qbittorrent terminology telegram-desktop 
nitrogen mc xorg-server xorg-xinit i3-gaps i3status rofi ttf-font-awesome ttf-dejavu micro chromium virtualbox

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo 'exec i3' >> ~/.xinitrc
yay -S ckb-next tor-browser polybar

sudo rm .config/micro/settings.json
touch .config/micro/settings.json
echo '{
	"autosave":true,
	"scrollspeed":2,
	"softwrap":true,
}' >> .config/micro/settings.json

sudo chsh -s /usr/bin/fish




sudo sed -e 's/#ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8' /etc/locale.gen
locale-gen
fc-cache

sudo rm /etc/vconsole.conf
touch /etc/vconsole.conf
echo '
FONT=ter-v32
KEYMAP=us
' >> /etc/vconsole.conf

sudo localectl set-x11-keymap us,ru pc104 "" grp:alt_shift_toggle`
sudo pacman -S numlockx pavucontrol bluez bluez-utils pulseaudio-bluetooth blueman
sudo systemctl daemon-reload
sudo systemctl start bluetooth
sudo systemctl enable bluetooth





sudo systemctl start ckb-next-daemon
sudo systemctl enable --now ckb-next-daemon

sudo pacman -S virtualbox
sudo pacman -S compton


sudo pacman -S hplip ghostscript pyqt5 xsane
yay -S foo2zjs
sudo hp-setup -u
sudo pacman -S xscreensaver 
sudo pacman -S redshift

sudo pacman -S xscreensaver-arch-logo

sudo nano /etc/bluetooth/main.conf
Enable=Source,Sink,Media,Socket
 
под [general]

