# journalctl Komutu

* journalctl komutu, Linux sistemlerinde çalışan servislerin ve çekirdek mesajlarının kayıt altına alındığı **systemd journal** günlüklerini görüntülemeye yarar. Jetson modüllerinde, donanım sürücüsü hataları, boot sorunları, USB/SD kart takibi, sensör başlatma süreçleri gibi kritik olayları analiz etmekte çok işe yarar.

## journalctl Nedir, Ne İşe Yarar?

* Sistem servislerinin loglarını (kayıtlarını) gösterir.
* Boot sürecindeki mesajları, hata ve uyarıları görmeyi sağlar.
* **systemd** ile çalışan sistemlerde, **dmesg** yerine veya onunla birlikte kullanılır.
* Donanım bağlantı sorunları, başlatılamayan servisler, beklenmeyen yeniden başlatmalar için kullanılır.


## Sık Kullanım Örnekleri : 

### 1. En son sistem başlatmasındaki olayları göster

```cmd
journalctl -b
```
* Jetson modülünün son açılış sürecinde ne çalıştı, ne hata verdi görebiliriz.
* Sensör başlatma sorunları, driver yükleme hataları için kritik.


### 2. Belirli bir servisin loglarını görüntüle (örneğin: SSH)

```cmd
journalctl -u ssh
```
* ssh servisi çalışıyor mu, ne zaman başlamış, hata olmuş mu?
* Uzaktan bağlantı sorunlarını teşhis etmek için.


### 3. Hata veya uyarı seviyesindeki mesajları filtrele

```cmd
journalctl -p err
```
* Sadece hata seviyesi (error) logları listelenir.
* Sistemde hangi servisler hata veriyor hızlıca anlaşılır.
* **-p warning :** uyarılar
* **-p crit :** kritik hatalar

### Tak ve çalıştır (USB/SD) olaylarını filtrele

```cmd
journalctl | grep -i "usb"
```
* Jetson'a takılan USB cihazların algılanıp algılanmadığını gösterir.
* USB kamera, sensör, flash disk takıldığında sistem ne diyor?

### 5. Logları canlı olarak izle 

```cmd
journalctl -f
```
* Gerçek zamanlı log akışını gösterir (tail gibi).
* Bir sensör scripti veya hizmet başlatıldığında oluşan logları anlık takip edebiliriz.


## Ekstra Parametreler

| Parametre              | Açıklama                                    |
| ---------------------- | ------------------------------------------- |
| `-r`                   | Son kayıtlar en üstte olacak şekilde sırala |
| `--since "10 min ago"` | Son 10 dakikalık kayıtları göster           |
| `-u <servis>`          | Belirli bir servisin loglarını getir        |
| `-k`                   | Sadece çekirdek (kernel) loglarını gösterir |








































































