# Kalıcı mount (fstab)


### 1. UUID'yi bul

```cmd
lsblk -f veya blkid
```
* Yukarıdaki komutlar ile Disk'in UUID'sine erişilir.

### fstab dosyasını düzenle

```cmd
nano  /etc/fstab
```

```cmd
UUID        Mount_Point    type     options                                        dump    pass
UUID=15D1   /mnt/usb       vfat     defaults,nofail,x-systemd.device-timeout=10     0       2
```
* Dosyayı düzenle ve kaydet çık.

```cmd
mount -a
```
* Bu komut ile test et.

```cmd
df -h | grep /mnt/usb
```
* mount edildiyse fstab doğru yazılmış demektir.


```cmd
reboot
```
* Sistemi yeniden başlat.

```cmd
df -h | grep /mnt/usb
```
* Kontrol et.

### mount Hatalı Olursa Kontrol Etmek İçin

```cmd
dmesg | grep -i mount

# veya

journalctl -b | grep -i "mnt"
```

## Özet : fstab satırı varken ne olur?

* Eğer fstab dosyasına cihazı tanımladıysak
* Bu durumda;
  * Her reboot'ta systemd fstab'ı okur.
  * UUID=15D1-D2EC olan aygıt (mesela USB bellek) bağlıysa, otomatik olarak /mnt/usb altına mount edilir.
  * Eğer o aygıt bağlı değilse bile, nofail sayesinde sistem boot sırasında hata vermez, sadece mount işlemini atlar.
  * Aygıt tkaıldığında eğer UUID eşleşiyorsa mount işlemi sistem tarafından (özellikle udisks veya systemd) otomatik yapılabilir ama bu garanti değildir.
 












































