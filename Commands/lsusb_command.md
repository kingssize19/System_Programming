# lsusb Komutu

* lsusb ve lsusb -t komutları, Jetson gibi Linux tabanlı gömülü sistemlerde USB cihazlarının tanınması, bağlantı durumu ve hiyerarşisi hakkında bilgi verir. Özellikle kameralar, sensörler, USB Wi-Fi dongle'ları, flash bellekler gibi çevre birimlerinin sistemle doğru iletişim kurup kurmadığını kontrol etmek için çok önemlidir.

## lsusb Nedir?

* **lsusb** komutu, sisteme bağlı tüm USB aygıtları hakkında bilgi verir : üretici, ürün ID'si, bağlantı portu vb.
* Jetson modüllerinde, kameranların veya USB üzerinden bağlanan diğer donanımların doğru çalışıp çalışmadığını kontrol etmekte kullanılır.

```cmd
lsusb
```

## lsusb -t Nedir?

* **lsusb -t** komutu, USB cihazlarını **ağaç yapısında (tree formatında)** ve bağlantı hızlarıyla birlikte gösterir.

```cmd
lsusb -t
```

## Sık Kullanım Örnekleri

### 1. Sisteme bağlı tüm USB cihazlarını listele

```cmd
lsusb
```
* Hangi USB aygıtları bağlı? Jetson'a taktığın kamera, sensör, klavye, Wi-Fi adaptörü vs. görünüyormu?
* Donanım tanıma ve sürücü kontrolü

### 2. USB bağlantı ağacını ve hızları göster (USB2/USB3 ayrımı)

```cmd
lsusb -t
```
* Hangi cihaz hangi port üzerinden bağlanmış ve hangi hızda çalışıyor?
* USB3 kameraların doğru hıza bağlanıp bağlanmadığını anlamak için kritik.

### 3. Belirli bir cihazın ayrıntılı bilgilerini almak 

```cmd
lsusb -v -d 046d:0825
```
* Belirli bir cihazın tüm detaylarını verir. (046d:0825 = örnek Logitech webcam)
* Cihaz bilgisi, sürücü uyumu, üretici ve ürün ID gibi detaylar.

### 4. Cihaz bağlı mı kontrol et (Örneğin USB kamera)

```cmd
lsusb | grep -i camera
```
* USB kamera sistem tarafından tanınıyor mu?
* Kamera bağlantısını kontrol etmek ve sistemde görüldüğünü doğrulamak.

### 5. Yalnızca cihaz ID'lerini listele (scriptlerde kullanışlı)

```cmd
lsusb | awk '{print $6}'
```
* Sadece Vendor:Product ID'leri listeler.
* Otomatik tanıma, cihaz filtreleme veya eşleşme işlemlerinde kullanılabilir.

## Ekstra Bilgiler

* Jetson'da bazı USB aygıtları özel sürücüler gerektirir (örneğin bazı stereo kameralar).
* **dmesg | grep usb** komutuda **lsusb** ile birlikte kullanılabilir, cihaz takıldığında loglara ne yazıldığını gösterir.
* udevadm ile birlikte USB cihaz tetikleyici kurallar da yazılabilir (ileri seviye).







































