# blkid Komutu

* blkid komutu, Linux'ta bağlı blok aygıtlarının UUID, LABEL, FSTYPE (dosya sistemi türü) gibi metadata bilgilerini gösterir. Jetson modülleriyle çalışırken, SD kartlar, USB bellekler veya eMMC sürücüler gibi cihazların doğru şekilde tanımlanıp tanımlanmadığını kontrol etmek için çok işe yarar.

## blkid Komutu Ne İşe Yarar?

* Her bağlı blok aygıtının :
  * **UUID** (benzersiz kimlik numarası),
  * **LABEL** (etiket),
  * **FSTYPE** (örneğin: ext4, vfat, ntfs)
  * **PARTUUID** bilgilerini verir.

* Sisteme bağlı **hangi cihazın ne olduğunu anlamak ve fstab gibi dosyalarda kalıcı mount** işlemleri için kullanılır.

## Sık Kullanım Örnekleri : 

### 1. Tüm blok aygıtlarını ve dosya sistem bilgilerini listele

```cmd
blkid
```
* Jetson sistemine bağlı tüm disklerin UUID, LABEL ve dosya sistemi türü (FSTYPE) bilgilerini verir.
* USB bellek mi, SD kart mı, formatlı mı görmek için.

### 2. Belirli bir cihazın UUID'sini öğren

```cmd
blkid /dev/sda1
```
* USB belleğin ya da SD kartın belirli bir bölümünün UUID'sini gösterir.
* fstab içine kalıcı mount için bu UUID gerekir.


### 3. Sadece UUID bilgilerini listele

```cmd
blkid -s UUID
```
* Tüm bağlı cihazlar için sadece UUID'leri gösterir.
* Scriptlerde cihaz doğrulama veya loglama için sade çıktı sağlar.


### 4. Sadece dosya sistemi türlerini göster

```cmd
blkid -s TYPE
```
* Tüm cihazların dosya sistem türünü (ext4, vfat vs.) listeler.
* Format kontrolü yapılmak istenirse bu bilgi önemlidir.

### 5. Sisteme yeni takılan aygıtın mount edilip edilmediğini görmek

```cmd
blkid | grep /dev/sda
```
* Harici bir USB veya SD kartın sistemde tanınıp tanınmadığını doğrular.
* udev kuralı veya otomatik mount sistemi kontrolü için faydalı.

## Örnek blkid Çıktısı : 

```cmd
/dev/mmcblk0p1: UUID="1234-ABCD" TYPE="vfat" PARTUUID="00000001-01"
/dev/sda1: UUID="b6a4e5ec-1234-4f7e-8b27-f2c7f9c456ff" TYPE="ext4"
```
* Jetson'un SD kartı (mmcblk0p1) FAT32 formatında ve bir UUID'ye sahip.
* Takılı USB bellek (sda1) EXT4 formatında.
























