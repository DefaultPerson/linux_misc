# Установка
Рекомендую для начала ознакомится с [ссылка](https://docs.google.com/document/d/1IjTxl7LaPKJyRoLpGEhm4ptBhob_jRgLLQpMugS7qe8/edit), тут человек расписал фишки и оптимизацию арча, вы можете взять некоторые пункты, например про драйвера видеокарту оттуда.
### Интернет
Для начала вставим ethernet кабель/usb-модем(телефон)/или подрубим wifi:
* `iwctl`
* `device list`
* `station устройство scan`
* `station устройство get-networks`
* `station устройство connect SSID`
* `exit`
### Псевдографический установщик
Для простоты установки скачаем archfi
* `pacman -Su`
* `pacman -S wget`
* `wget matmoul.github.io/archfi`
* `sh archfi`
* производим инсталяцию, как в этом до 7 минуты[видео](https://www.youtube.com/watch?v=bUfusK9zpLg) 
* **Если вы устанавливаете arch как вторую систему при разметке первый раздел размечаете на 1G ставите type efi boot(если у вас efi)и bios boot(если у вас bios),второй на 10G ставите type swap**
* перезагружаемся и входим под рутом

# Настройка
### Добавление пользователя
* `useradd -m user`
* `passwd user`
### Настройка sudo
* `pacman -S sudo`
* `nano /etc/sudoers`
* Найдем строку `root ALL ALL=(ALL) ALL`
* Добавим свою: имя пользователя `ALL ALL=(ALL) ALL`
* Сохраняем
### Продолжаем настройку
* Выходим из рута exit
* Входим под созданным юзером
* iwd у нас нету,вставим ethernet кабель/usb-модем(телефон)
* `sudo pacman -Syi`
* `sudo pacman -S iwd`
* `systemctl —now enable systemd-networkd systemd-resolved iwd`
* `iwctl`
* `device list`
* `station устройство scan`
* `station устройство get-networks`
* `station устройство connect SSID`
### Установим драйвера видеокарты
* `sudo nano /etc/pacman.conf`
* Найдем `[multilib]`
* Раскомментируем `Include = /etc/pacman.d/mirrorlist`
* Сохраним и обновим базу `sudo pacman -Syu`
### Nvidia
* `sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader`
### AMD
* `sudo pacman -S lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader`
### Intel
1. `sudo pacman -S lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader`

**Не страшно если что-то не установится, это не критично для пользования системой**

**Установка и первоначальная настройка системы завершена! Осталось установить i3, настроить его, установить утилиты для устройств.**

***

# Установка i3
* `sudo pacman -S xorg-server xorg-xinit i3-gaps i3status rofi xterm terminator nitrogen`
* `echo 'exec i3' >> ~/.xinitrc`
### Установим локаль
* `sudo nano /etc/locele.gen  `
* меняем в файле на `ru_RU.UTF-8 UTF-8,en_US.UTF-8 UTF-8,`
* сохраняем
* генерируем локаль locale-gen
### Установим шрифты
* `sudo pacman -S ttf-font-awesome ttf-dejavu ttf-liberation`
* `fc-cache`
* `sudo nano /etc/vconsole.conf`
* `FONT=ter-v32`
* `KEYMAP=us`
* теперь можно ставить в файлы символы [отсюда](https://fontawesome.com/icons?d=gallery&p=1).
### Включаем переключение раскладки
* `sudo -i`
* `localectl set-x11-keymap us,ru pc104 "" grp:alt_shift_toggle`
# Правим конфиги
# Конфиг i3 `.config/i3/config`
[Тут]( https://notabug.org/owl410/owl_dotfiles/src/master/i3_two/.config/i3/config) конфиг на русском
# Конфиг i3status `/etc/i3status.conf`
Вот на этом [сайте](https://igancev.ru/2020-05-11-configuring-i3status-in-i3wm) в середине конфиг на русском

**шифт+модкей+r -обновит i3**

***

* Ставим в конфигах стандартный терминал terminator(или какой вы установите)
* Находим строку с `bindsym $mod+d `правим на `bindsym $mod+d exec --no-startup-id rofi -theme glue_pro_blue -font "hack 10" -show run`
* `exec --no-startup-id nitrogen`
**Устанавливайте те шрифты, которые нравятся и подходят Вам**
* font pango:Ubuntu:style=Medium 10
**Перенос бара наверх**
* В секцию bar(это в конце конфига) добавим строку position top, и перезапустим i3 (mod+Shift+r)
**Установка compton(для прозрачности окон)**
* `sudo pacman -S picom`
* В конфиг `exec --no-startup-id nitrogen --restore; sleep 1; compton -b`
* лок экрана xscreensaver `sudo pacman -S xscreensaver` меняем в конфиге вместо i3lock
### redshift
* `sudo pacman -S redshift`
* меняет свет монитора под время суток
* `exec --no-startup-id redshift -b 1.0:0.7 -t 6500:3200 -l 45:39`
* -b 1.0:0.7 уровень яркости день:ночь
* -t 6500:3200 цветовая температура день:ночь
* -l 45:39 укороченные координаты местонахождения latitude:longitude (ширина:долгота).
# Устройства
### Звук
* `sudo pacman -S pavucontrol`
### Numlock
* `sudo pacman -S numlockx`
* В конфиг `exec --no-startup-id numlockx on`
### Bluetooth
* `sudo pacman -S bluez bluez-utils pulseaudio-bluetooth blueman`
* `sudo systemctl daemon-reload`
* `sudo systemctl start bluetooth`
* `sudo systemctl status bluetooth`
* `sudo systemctl enable bluetooth`
* `sudo nano /etc/bluetooth/main.conf`
* Добавить `"Enable=Source,Sink,Media,Socket"` под `[general]` без кавычек
* Добавить blueman-applet в автозагрузку(i3/config)

 # Оптимизация(спер из видео лень искать)
**1.Ограничение записи системных логов**
* `journalctl --vacuum-size=30M`
* `journalctl --verify`
* `nano /etc/systemd/journald.conf  SystemMaxUse=30M SystemMaxFileSize=20M`
**2.кэширование**
* `sysctl -w vm.vfs_cache_pressure=1000`
* `echo "vm.vfs_cache_pressure=1000" >> /etc/sysctl.d/99-sysctl.conf`

# Установка и настройка завершена
* `reboot`
* Логинитесь
* `startx`


### Про полибар(альтернатива i3status)
* `yay -S polybar`
* https://www.youtube.com/watch?v=cLB008-FJ5o&t=35s скрипты полибар
* https://github.com/polybar/polybar-scripts
* Скрипт по скороси интернет https://github.com/ShiroUsagi-san/speedtest-polybar-module
* Скрипт курса валют в  конфиге https://github.com/ordanax/dots/blob/master/polybar/scripts/btci3s
 
[мой тг](https://t.me/clear_account)

для себя
https://superuser.com/questions/1063240/libvirt-failed-to-initialize-a-valid-firewall-backend
https://redos.red-soft.ru/base/arm/os-virtual/qemu-kvm/
