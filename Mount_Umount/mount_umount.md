# Mount & Umount

## mount

* **mount :** Bir dosya sistemini bir dizine bağlar.

```cmd
mount [aygıt_adı]  [mount_noktası]
```

```cmd
mount /dev/sda1  /mnt/usb
```
* /dev/sda1 içeriği /mnt/usb dizinine bağlanır.


## umount

* Dosya sisteminin bağlantısını keser.

```cmd
umount [mount_noktası veya aygıt_adı]
```

```cmd
umount /mnt/usb
```
* Eğer aygıt meşgul hatası alırsak

```cmd
lsof | grep /mnt/usb
```
* Kimin kullandığını görüp kapatabiliriz.

## Takılı Diskleri Görme

```cmd
lsblk
```
* Bağlı tüm blok aygıtlarını (diskleri, bölümleri) gösterir.

```cmd
  df -h
```
* Hangi disklerin nereye mount edildiğini ve ne kadar yer kapladığını gösterir.

```cmd
mount | grep ^/dev
```
* Sistemde hangi dosya sistemlerinin nereye mount edildiğini listeler.


## Disk Nasıl mount Edilir? (Kalıcı Olmadan)

* Bağlantı dizini oluştur.

```cmd
mkdir /mnt/usb
``` 

* mount et.

```cmd
mount /dev/sda1  /mnt/usb
```

* Kontrol et.

```cmd
df -h
ls /mnt/usb
```


## /etc/fstab - Kalıcı mount Yapısı

* /etc/fstab dosyası sistem her açıldığında hangi dosya sistemlerinin otomatik mount edileceğini belirler.

* **Not :** Yanlış bir satır sistemin açılmamasına neden olabilir. Bu yüzden dikkatli olmalı, nofail parametresi kullanılmalıdır.

### fstab Satırı Yapısı

```cmd
<aygıt_adı veya UUID>  <mount_noktası>  <dosya_sistem_tipi> <opsiyonlar> <dump> <fsck>
```

* **fstab Satır Yapısına Bir Örnek :**

```cmd
UUID=1234-ABCD  /mnt/usb  vfat  defaults,nofail 0 2
```

* **UUID=1234-ABCD :** Diskin benzersiz kimliği (güvenli tanımlayıcı)
* **/mnt/usb :** Mount edileceği yer
* **vfat :** Dosya sistemi tipi (FAT 32)
* **default, nofail :** Otomatik mount et, hata verirse sistemi durdurma
* **0 :** Yedekleme yapılmayacak
* **2 :** fsck ile kontrol noktası

### UUID nasıl öğrenilir?

```cmd
blkid
```
* UUID="1234-ABCD" TYPE="vfat"


### Test Etme

* Yeni satırı ekledikten sonra test etmek için sistemi yeniden başlatmak yerine :

```cmd
mount -a
```

* Bu komut fstab'i okur ve mevcut mount işlemini uygular. Hata varsa gösterir.

#### fstab için umount etmek

```cmd
umount /mnt/usb
```





















