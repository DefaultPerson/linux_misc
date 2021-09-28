# Ставим защиту на логи ядра
sudo sh -c"touch /etc/sysctl.d/51-dmesg-restrict.conf"
sudo sh -c "echo 'kernel.dmesg_restrict = 1' >> /etc/sysctl.d/51-dmesg-restrict.conf"

# Ставим защиту от перебора пароля
sudo sh -c "echo '
password required pam_pwquality.so retry=2 minlen=10 difok=6 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1 [badwords=myservice mydomain] enforce_for_root
password required pam_unix.so use_authtok sha512 shadow' >> /etc/pam.d/passwd"
sudo sh -c "echo 'auth optional pam_faildelay.so delay=4000000' >> /etc/pam.d/system-login"

# Настраиваем micro
cd
sudo cp Linux_misc/settings.json .config/micro

# Устанавливаем шрифты
sudo sh -c "sudo rm /etc/vconsole.conf"
sudo sh -c "touch /etc/vconsole.conf"
sudo sh -c "echo '
FONT=ter-v32
KEYMAP=us
' >> /etc/vconsole.conf"

# Включаем переключение раскладки
sudo localectl set-x11-keymap us,ru pc104 "" grp:alt_shift_toggle

# Установка конфига i3
cd $HOME
sudo cp $HOME/Linux_misc/arch_linux_setup/config $HOME/.config/i3

# Установка скриптов для полибара
cd $HOME
cp -r Linux_misc/polybar .config
pip install speedtest-cli

chmod +x .config/polybar/launch.sh
chmod +x .config/polybar/polybar-scripts/aur-pacman-check-updates.sh
chmod +x .config/polybar/polybar-scripts/polybar-speedtest.py

# Установка rofi
cp -r Linux_misc/rofi .config

# Установка picom
yay -S picom-jonaburg-git
cp Linux_misc/picom.conf .config
