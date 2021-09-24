# Установка
Некоторая информация взята отсюда [ссылка](https://docs.google.com/document/d/1IjTxl7LaPKJyRoLpGEhm4ptBhob_jRgLLQpMugS7qe8/edit),
в файле можно найти полезные советы по оптимизации(не рекомендую ставить драйверы как в этом документе, есть вероятность что вы не загрузитесь)

[Программа](https://www.ventoy.net/en/download.html) для записи мультизагрузочной флешки
Установка
```sh
iwctl
device list
station устройство scan
station устройство get-networks
station устройство connect SSID
exit
```
```sh
pacman -Suy
archinstall
```
В конце установки установить:
```sh
nano git sudo nmcli
```
После перезагрузки:
```bash
# После перезагрузки, заходим на root
useradd -m user
passwd user
nano /etc/sudoers
%sudo   ALL=(ALL:ALL) ALL – все пользователи в группе sudo имеют права на запуск любой команды
sudo groupadd group1
 sudo usermod -g users user



#Выходим из рута exit, входим под созданным юзером.
systemctl start NetworkManager
systemctl enable --now NetworkManager
nmcli device
nmcli device wifi connect SSID password PASS
```
Потом запустить скрипт установки




### TO DO
```
Исследовать
шифрования https://pastebin.com/ViUkk4c5 https://github.com/hephaest0s/usbkill
подобрать рофи тему
git clone --depth=1 https://github.com/adi1090x/rofi.git
 
Change to cloned directory and make setup.sh executable -
$ cd rofi
$ chmod +x setup.sh
 
Run setup.sh and select your screen resolution -
$ ./setup.sh


```


### После установки:
```
Поставить обои
Настроить подсветку клавы
настроить экран блокировки XTVAnalog
пароль на граб
sudo grub-mkpasswd-pbkdf
Теперь откройте файл /etc/grub.d/40_custom
set superusers="root"
password_pbkdf2 root grub.pbkdf2.sha512.10000.479775BC85F7B0D174D5…
sudo chmod 711 /etc/grub.d/40_custom
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
### Для себя
```
https://github.com/adi1090x/rofi
https://superuser.com/questions/1063240/libvirt-failed-to-initialize-a-valid-firewall-backend https://redos.red-soft.ru/base/arm/os-virtual/qemu-kvm/ https://www.phoronix.com/scan.php?page=news_item&px=VirtIO-GPU-Vulkan-Mesa-RFC https://wiki.archlinux.org/title/Chroot_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9) https://lumpics.ru/service-net-view-dont-run-in-windows-10/ мой тг
Внимание! Если у вас почему-то пакман не находит серверов, проверьте /etc/pacman.d/mirrorlist , чтобы там были раскомментированны сервера и /etc/pacman.conf , чтобы если у вас раскомментирован заголовок [], после него строчка с листом зеркал тоже была раскомментированна
Для флешек
Чтобы монтировать флешку сначала узнайте ее имя
ls /dev/sd*
 
Затем смонтируйте ее
mount /dev/имя флешки папка куда смонтировать
Когда будете вынимать, размонтируйте флешку
umount /dev/имя флешки
 
Если занята
umount -f -l
Если не иксы не запускают i3, прописываем еще раз
echo 'exec i3' >> ~/.xinitrc
```
