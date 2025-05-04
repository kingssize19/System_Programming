# lsblk Komutu

* lsblk (list block devices) komutu, sisteme bağlı blok aygıtlarını (diskler, SSD'ler, SD kartlar, USB bellekler, eMMC gibi) gösterir. Jetson gibi gömülü sistemlerde, özellikle harici depolama takıldığında **cihazın doğru tanınıp tanınmadığını** veya **mount** durumunu kontrol etmek için çok kullanılır.

## lsblk Komutu Ne İşe Yarar?

* Bağlı tüm blok aygıtlarını (disk, partition, sdcard, USB, eMMC) listeler
* Her aygıtın :
  * Adı (örnek: sda, mmcblk0)
  * Boyutu
  * Türü (disk, partition)
  * Mount edildiği yol (örn. /media/usb)
  * Dosya sistemi (opsiyonel olarak)


## Sık Kullanılan Örnekler : 

### 1. Tüm blok cihazları özet listele

```cmd
lsblk
```
* Jetson cihazında bağlı olan tüm depolama aygıtlarını ve varsa bölümlerini gösterir. Örneğin bir SD kart veya USB bellek takıldığında burada sda1 gibi görünmelidir.

### 2. Dosya sistemleri ve mount noktalarıyla birlikte göster

```cmd
lsblk -f
```
* Aygıtların dosya sistem türünü (ext4, vfat, ntfs) ve mount edildiği konumu gösterir. Jetson'da bağlanan bir belleğin hangi formatta olduğunu ve otomatik mount olup olmadığını anlamak için kullanılır.


### 3. UUID bilgileriyle birlikte göster

```cmd
lsblk -o NAME,SIZE,UUID,MOUNTPOINT
```
* Her bir bölümün UUID'sini gösterir. Jetson gibi sistemlerde fstab ile kalıcı mount yapmak istiyorsan bu UUID gerekir.

### 4. Yalnızca diskleri göster (partisyonlar hariç)

```cmd
lsblk -d
```
* Sadece fiziksel diskleri listeler, alt bölümleri göstermez.
* Örneğin : mmcblk0, sda gibi.

### 5. Jetson eMMC veya SD kart modülünü doğrulamak

```cmd
lsblk -p
```
* Tam dosya yollarıyla (/dev/mmcblk0, /dev/sda1) listeler.
* Jetson Nano gibi cihazlarda eMMC'nin hangi aygıta karşılık geldiğini görmek için kullanılır.

## Örnek lsblk -f Çıktısı

```cmd
NAME         FSTYPE LABEL  UUID                                 MOUNTPOINT
mmcblk0                                                            
├─mmcblk0p1  ext4         3e0e98cd-fbd3-4f4b-a7a5-3a7f174e5a35   /
mmcblk0boot0                                                       
mmcblk0boot1                                                       
sda           vfat   USB16G  D8B3-7C1A                            /media/usb

```
* Jetson işletim sistemi /dev/mmcblk0p1 üzerine kurulu (root /)
* Harici takılan USB bellek /media/usb klasörüne bağlanmış


# Bash Script ile Takılı Depolama Aygıtlarını Listele

```bash
#!/bin/bash

echo "Takılı blok aygıtları:"
echo "-----------------------------"
lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINT | grep -v "loop"

echo ""
echo "Mount edilmiş aygıtları göster:"
echo "-----------------------------"
lsblk -f | grep -v "swap" | grep -v "loop" | grep "/"

echo ""
echo "Aygıtlar ve UUID bilgileri:"
echo "-----------------------------"
lsblk -o NAME,UUID,MOUNTPOINT | grep -v "loop"
```

* **lsblk -o** ile sadece istediğimiz sütunları alıyoruz (gürültüyü azaltmak için)
* **grep -v "loop"** satırları filtreleyerek Snap veya Flatpak gibi sistem içi döngü cihazlarını çıkarır.
* / içeren satırlar sadece gerçekten mount edilmiş aygıtları verir.
* Bu script sayesinde Jetson cihazınıza bir USB takıldığında otomatik olarak terminalden görebilirsiniz.

## Script Nasıl Çalıştırılır?

```cmd
nano ~/disc_control.sh
chmod +x disk_kontrol.sh
./disc_control.sh
```











