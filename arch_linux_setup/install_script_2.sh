# Ставим защиту на логи ядра
su
touch /etc/sysctl.d/51-dmesg-restrict.conf
echo 'kernel.dmesg_restrict = 1' >> /etc/sysctl.d/51-dmesg-restrict.conf

# Ставим защиту от перебора пароля
echo '
password required pam_pwquality.so retry=2 minlen=10 difok=6 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1 [badwords=myservice mydomain] enforce_for_root
password required pam_unix.so use_authtok sha512 shadow' >> /etc/pam.d/passwd
echo 'auth optional pam_faildelay.so delay=4000000' >> /etc/pam.d/system-login

# Настраиваем micro
cd
sudo rm .config/micro/settings.json
sudo touch .config/micro/settings.json
sudo echo '{
	"autosave":true,
	"scrollspeed":2,
	"softwrap":true,
}' >> .config/micro/settings.json

# Устанавливаем шрифты
sudo rm /etc/vconsole.conf
sudo touch /etc/vconsole.conf
sudo echo '
FONT=ter-v32
KEYMAP=us
' >> /etc/vconsole.conf

# Включаем переключение раскладки
sudo localectl set-x11-keymap us,ru pc104 "" grp:alt_shift_toggle
# Установка конфига i3
cd 
sudo cp /home/def/Linux_misc/arch_linux_setup/config /home/def/.config/i3

# Установка скриптов для полибара
cd .config
mkdir polybar
cd 
cp /home/def/Linux_misc/config /home/def/.config/polybar
pip install speedtest-cli
cd
git clone https://github.com/polybar/polybar-scripts
cd /home/def/.config/polybar
mkdir polybar-scripts
cd
cp /home/def/polybar-scripts/info-hackspeed/info-hackspeed /home/def/.config/polybar/polybar-scripts
cp /home/def/polybar-scripts/system-usb-udev/system-usb-udev /home/def/.config/polybar/polybar-scripts
cp /home/def/polybar-scripts/system-bluetooth-bluetoothctl/system-bluetooth-bluetoothctl /home/def/.config/polybar/polybar-scripts
cp /home/def/polybar-scripts/polybar-speedtest/polybar-speedtest /home/def/.config/polybar/polybar-scripts
cp /home/def/polybar-scripts/updates-pacman-aurhelper/updates-pacman-aurhelper /home/def/.config/polybar/polybar-scripts
chmod +x polybar-speedtest
#  xinput list --short KEYBOARD_ID: имя вашей клавиатуры. См. Раздел «Настройка» выше. Дефолт:AT Translated Set 2 keyboard
