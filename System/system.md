## htop, top - Sistem Yükü İncelemek

* **top :**  Sistem kaynak kullanımını (CPU, bellek, prosesler) gerçek zamanlı gösterir.
* **htop :** top'un daha kullanıcı dostu, renkli ve etkileşimli versiyonudur. Jetson gibi çok çekirdekli sistemlerde tercih edilir.

```cmd
top
```
* Anlık işlemci ve bellek yükünü gösterir.

```cmd
htop
```
* Çekirdek başına CPU kullanımı, işlem listesi, sonlandırma imkanı sağlar.

```cmd
htop -d 10
```
* Yenileme hızını 1 saniyeden 10’a çıkarır.

## lsusb – USB Cihazlarını Görmek (bus ve device id ile)

* **lsusb :** Jetson’a bağlı USB aygıtlarını listeler. Kamera, Wi-Fi dongle, LIDAR gibi çevre birimlerini doğrulamak için kullanılır.

```cmd
lsusb
```
* Tüm USB cihazları listeler.

```cmd
lsusb -t
```
* Ağaç görünümünde hangi USB portuna ne takılı gösterir.

```cmd
lsusb | grep Realtek
```
* Belirli bir cihaz (örneğin Wi-Fi) bağlı mı, arama yapar.


## systemctl – Servisleri Görmek, Yönetmek

* **systemctl :** Servisleri başlatmak, durdurmak ve durumlarını kontrol etmek için kullanılır. Jetson’da nvargus-daemon, gdm, ssh gibi servisler izlenebilir.


```cmd
systemctl list-units --type=service --state=running
```
* Çalışan servisleri listeler.


```cmd
sudo systemctl restart nvargus-daemon
```
* Kamera servisini yeniden başlatır.

```cmd
sudo systemctl disable bluetooth.service
```
* Bluetooth servisini devre dışı bırakır.

## ps – İşlem Listesi, Proses Takibi

* **ps :** Mevcut çalışan işlemleri listeler. ps aux en sık kullanılan biçimdir.

```cmd
ps aux
```
* Tüm kullanıcıların işlemlerini gösterir.

```cmd
ps -ef | grep python
```
* Çalışan Python betiklerini arar.

```cmd
ps -C nvargus-daemon
```
* Belirli bir servis PID’sini bulur.

## pkill, kill – Proses Sonlandırmak

* **kill :** PID kullanarak işlem sonlandırır.
* **pkill :** Süreç adını kullanarak doğrudan sonlandırır.


```cmd
kill -9 2345
```
* PID’si 2345 olan işlemi zorla kapatır.

```cmd
pkill python3
```
* Tüm python3 işlemlerini sonlandırır.


```cmd
pkill -f roslaunch
```
* Komut satırında “roslaunch” geçen işlemleri kapatır.

## dmesg – Kernel Log’larını Görmek

* **dmesg :** Kernel (çekirdek) tarafından üretilen mesajları gösterir. USB takma, GPIO hatası, I2C bağlanma gibi olaylar burada görünür.

```cmd
dmesg | tail
```
* Son kernel mesajlarını gösterir.

```cmd
dmesg | grep usb
```
* USB takıldığında gelen kernel mesajını gösterir.

```cmd
dmesg | grep gpio
```
* GPIO bağlantı veya hata durumlarını kontrol eder.


## Jetson’da GPIO Nasıl Kontrol Edilir?

* Jetson'da GPIO'lar /sys/class/gpio/ yoluyla veya Jetson.GPIO Python modülü ile kontrol edilir.

```cmd
sudo echo 216 > /sys/class/gpio/export
```
* GPIO 216'yı aktif hale getir.

```cmd
sudo echo out > /sys/class/gpio/gpio216/direction
```
* GPIO çıkış olarak ayarlanır.

```cmd
sudo echo 1 > /sys/class/gpio/gpio216/value
```
* GPIO pinine 1 (HIGH) verilir.

## Jetson’da Sıcaklık ve Voltaj Nasıl Görülür?

* Jetson sisteminde sıcaklık sensörleri /sys altında veya tegrastats komutuyla izlenir.

```cmd
sudo tegrastats
```
* CPU, GPU sıcaklığı ve voltajları gösterir.


```cmd
cat /sys/class/thermal/thermal_zone0/temp
```
* CPU sıcaklığını doğrudan dosyadan oku.

```cmd
watch -n 1 tegrastats
```
* Her saniye güncellenen sıcaklık/performans verisi.

## Loglar Nerede, Nasıl İncelenir?

* Jetson’da sistem günlükleri journalctl ve /var/log/ dizininde saklanır.

```cmd
journalctl -xe
```
* Son hata ve servis loglarını ayrıntılı gösterir.

```cmd
journalctl -u nvargus-daemon
```
* Kamera servisine ait logları gösterir.


```cmd
cat /var/log/syslog
```
* Geleneksel log dosyasını manuel okur.




















