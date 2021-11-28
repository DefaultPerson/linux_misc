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
### Прочее
```
https://github.com/adi1090x/rofi
https://superuser.com/questions/1063240/libvirt-failed-to-initialize-a-valid-firewall-backend
https://redos.red-soft.ru/base/arm/os-virtual/qemu-kvm/
https://www.phoronix.com/scan.php?page=news_item&px=VirtIO-GPU-Vulkan-Mesa-RFC
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

[ссылка](https://docs.google.com/document/d/1IjTxl7LaPKJyRoLpGEhm4ptBhob_jRgLLQpMugS7qe8/edit)

[Программа](https://www.ventoy.net/en/download.html) для записи мультизагрузочной флешки


https://github.com/NateBrune/silk-guardian

https://github.com/hephaest0s/usbkill


# TODO
```
скрипт для батареи
заставить работать нормально fn
```
