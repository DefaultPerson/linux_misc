# Установка
Очень много информации своровано отсюда [ссылка](https://docs.google.com/document/d/1IjTxl7LaPKJyRoLpGEhm4ptBhob_jRgLLQpMugS7qe8/edit),
в файле можно найти полезные советы по оптимизации

[Программа](https://www.ventoy.net/en/download.html) для записи мультизагрузочной флешки

## Основные команды которые вам понадобятся
    sudo pacman -S	    # Установить программу из основного архива.
    sudo pacman -Syu    # Выполнить полное обновление  системы и репозиториев
    sudo pacman -R	    # Удалить пакет.
    sudo pacman -Rsn    # Удалить пакет и его зависимости.
    git clone           # Клонирует внешний git репозиторий, например AUR пакет
    makepkg -si         # Осуществляет сборку пакета и его установку из PKGBUILD
    cd                  # Перейти в папку>> пример cd tools.
    ls                  # Показать файлы и папку внутри другой папки.
    yay -S              # Установить программу из aur.


#### Интернет
Для начала вставим ethernet кабель/usb-модем(телефон)/или подрубим wifi:

    iwctl
    device list
    station устройство scan
    station устройство get-networks
    station устройство connect SSID
    exit

#### Псевдографический установщик
Для простоты установки скачаем archfi

    pacman -Su
    pacman -S wget
    wget matmoul.github.io/archfi
    sh archfi

Ищем видео об установке и устанавливаем(внимание на разметку и загрузчик если система устанавливается в dual boot)

***



# Настройка
После перезагрузки
#### Добавление пользователя
    useradd -m user
    passwd user
#### Настройка sudo
    pacman -S sudo
    nano /etc/sudoers
Найдем строку root

    root ALL=(ALL) ALL
Добавим свою: имя пользователя

    user ALL=(ALL) ALL
Сохраняем


#### Интернет
Выходим из рута exit, входим под созданным юзером.

iwd у нас нету,вставим ethernet кабель/usb-модем(телефон)

    sudo pacman -Syi
    sudo pacman -S iwd
    systemctl —now enable systemd-networkd systemd-resolved iwd  (перед now два -)
    iwctl
    device list
    station устройство scan
    station устройство get-networks
    station устройство connect SSID

#### Установим драйвера видеокарты
    sudo nano /etc/pacman.conf
Найдем 

    [multilib]

Раскомментируем
  
      [multilib]  
      Include = /etc/pacman.d/mirrorlist
  
Сохраним и обновим базу 

    sudo pacman -Syu
Nvidia

    sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader 
    lib32-vulkan-icd-loader lib32-opencl-nvidia opencl-nvidia libxnvctrl 
    sudo mkinitcpio -P 
NVIDIA DKMS Performance

    git clone https://aur.archlinux.org/nvidia-dkms-performance.git
    cd nvidia-dkms-performance
    makepkg -sric 

Согласитесь на разрешение конфликтов.

AMD

    sudo pacman -S lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader

Intel

    sudo pacman -S lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

Данные команды выполнят установку так называемых автоматизированных DKMS драйверов, но внимание - автор использует проприетарный драйвер NVIDIA - если вы заметили ошибку или желаете более проверенный источник: GitHub.
Внимание! У авторов отсутствует оборудование AMD, некоторые параметры для этого производителя могут устареть и являться неверными.

Nvidia

    sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
AMD

    sudo pacman -S lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
Intel

    sudo pacman -S lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

#### Установка программ(то что вам не нужно уберите из списка)

    sudo pacman -Syu nano git firefox vlc steam grub-customizer
    file-roller qbittorrent lrzip squashfs-tools terminology discord telegram-desktop nautilus neofetch flameshot 
    

#### Установка yay
    
    sudo pacman -S fakeroot
    git clone https://aur.archlinux.org/yay.git
    cd yay
    $ makepkg -si

#### Установка программ из aur

    yay -S google-chrome pycharm-professional

#### Установка i3
    sudo pacman -S xorg-server xorg-xinit i3-gaps i3status rofi nitrogen
    echo 'exec i3' >> ~/.xinitrc
#### Установим локаль
    sudo nano /etc/locale.gen

Раскомментируем

    ru_RU.UTF-8 UTF-8,en_US.UTF-8 UTF-8,

Сохраняем, генерируем локаль 

    locale-gen
#### Установим шрифты
    sudo pacman -S ttf-font-awesome ttf-dejavu
    fc-cache
    sudo nano /etc/vconsole.conf
    FONT=ter-v32
    KEYMAP=us
теперь можно ставить в файлы символы [отсюда](https://fontawesome.com/icons?d=gallery&p=1).
#### Включаем переключение раскладки
    sudo localectl set-x11-keymap us,ru pc104 "" grp:alt_shift_toggle`
#### Заходим в i3
    startx
Если не иксы не запускают i3, прописываем еще раз

    echo 'exec i3' >> ~/.xinitrc
***


# Правим конфиги
#### Конфиг i3 
Обычно находится тут:

    .config/i3/config
Правим его любым редактором, тем же nano, готовый конфиг лежит тут же



#### Конфиг i3status 
Обычно находится тут:

    /etc/i3status.conf
Правим его любым редактором, тем же nano, готовый конфиг лежит тут же

**шифт+модкей+r -обновит i3 после правки конфигов**


Во всех конфигах предлагаю покопаться самим+поискать способы кастомизации в интернетах или взять мой конфиг.


**Установка и настройка завершена**

    reboot
Логинитесь

    startx
***

# Всякое

## Устройства
#### Звук
    sudo pacman -S pavucontrol
#### Numlock

    sudo pacman -S numlockx
В конфиг i3(i3/config)

    exec --no-startup-id numlockx on
#### Bluetooth
    sudo pacman -S bluez bluez-utils pulseaudio-bluetooth blueman
    sudo systemctl daemon-reload
    sudo systemctl start bluetooth
    sudo systemctl enable bluetooth
    sudo nano /etc/bluetooth/main.conf

Добавить

    Enable=Source,Sink,Media,Socket
под [general]

Добавить blueman-applet в автозагрузку(i3/config)

#### Установка compton(для прозрачности окон)

    sudo pacman -S compton
Ставите в автозагрузку(i3/config)

#### лок экрана xscreensaver
    sudo pacman -S xscreensaver 
меняем в конфиге вместо i3lock

#### redshift
меняет свет монитора под время суток

    sudo pacman -S redshift
В конфиг (i3/config):

    exec --no-startup-id redshift -b 1.0:0.7 -t 6500:3200 -l 45:39

* -b 1.0:0.7 уровень яркости день:ночь
* -t 6500:3200 цветовая температура день:ночь
* -l 45:39 укороченные координаты местонахождения latitude:longitude (ширина:долгота).
#### Для флешек
Чтобы монтировать флешку сначала узнайте ее имя

    ls /dev/sd*
Затем смонтируйте ее

    mount /dev/имя флешки папка куда смонтировать

Когда будете вынимать, размонтируйте флешку

    umount /dev/имя флешки

Если занята

    umount -f -l

#### Про полибар(альтернатива i3status)

    yay -S polybar
* https://www.youtube.com/watch?v=cLB008-FJ5o&t=35s скрипты полибар
* https://github.com/polybar/polybar-scripts
* Скрипт по скороси интернет https://github.com/ShiroUsagi-san/speedtest-polybar-module
* Скрипт курса валют в  конфиге https://github.com/ordanax/dots/blob/master/polybar/scripts/btci3s

#### для себя
https://superuser.com/questions/1063240/libvirt-failed-to-initialize-a-valid-firewall-backend
https://redos.red-soft.ru/base/arm/os-virtual/qemu-kvm/
https://www.phoronix.com/scan.php?page=news_item&px=VirtIO-GPU-Vulkan-Mesa-RFC
[мой тг](https://t.me/clear_account)
