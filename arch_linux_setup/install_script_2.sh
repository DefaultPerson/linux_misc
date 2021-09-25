# Ставим защиту на логи ядра
su
touch /etc/sysctl.d/51-dmesg-restrict.conf
echo 'kernel.dmesg_restrict = 1' >> /etc/sysctl.d/51-dmesg-restrict.conf

# Ставим защиту от перебора пароля
echo '
password required pam_pwquality.so retry=2 minlen=10 difok=6 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1 [badwords=myservice mydomain] enforce_for_root
password required pam_unix.so use_authtok sha512 shadow' >> /etc/pam.d/passwd
echo 'auth optional pam_faildelay.so delay=4000000' >> /etc/pam.d/system-login


# Установка конфига i3
cd 
sudo cp Linux_misc/arch_linux_setup/config .config/i3

# Установка скриптов для полибара
cd .config
mkdir polybar
cd 
cp Linux_misc/config .config/polybar
pip install speedtest-cli
cd
git clone https://github.com/polybar/polybar-scripts
cd /home/def/.config/polybar
mkdir polybar-scripts
cd
cp polybar-scripts/info-hackspeed/info-hackspeed /home/def/.config/polybar/polybar-scripts
cp polybar-scripts/system-usb-udev/system-usb-udev /home/def/.config/polybar/polybar-scripts
cp polybar-scripts/system-bluetooth-bluetoothctl/system-bluetooth-bluetoothctl /home/def/.config/polybar/polybar-scripts
cp polybar-scripts/polybar-speedtest/polybar-speedtest /home/def/.config/polybar/polybar-scripts
cp polybar-scripts/updates-pacman-aurhelper/updates-pacman-aurhelper /home/def/.config/polybar/polybar-scripts
chmod +x polybar-speedtest
#  xinput list --short KEYBOARD_ID: имя вашей клавиатуры. См. Раздел «Настройка» выше. Дефолт:AT Translated Set 2 keyboard
