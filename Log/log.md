# Log (Kayıt) Nedir? 

Log, bir sistemde, uygulamada veya serviste meydana gelen olayların zaman damgası ile birlikte kaydedildiği metin dosyalarıdır.

Bu kayıtlar sayesinde sistem yöneticileri veya geliştiriciler : 

* Sorunları tespit edebilir.
* Güvenlik ihlallerini fark edebilir.
* Performans analizlerini yapabilir.
* Sistem davranışlarını izleyebilir.

---------------------------------------------------------------------------------------------------------------------------------------------------------------

## Log Dosyaları Nerede Bulunur?

* Linux sistemlerde log'lar genellikle şu dizinlerde bulunur : 

```cmd 
/var/log
```
* Bu dizin altındaki önemli log dosyalarından bazıları : 


| Dosya Adı | Açıklama |
|--|--|
| /var/log/syslog | Sistem genel olayları (Debian/Ubuntu) |
| /var/log/messages | Sistem genel olayları (RedHat/CentOS) |
| /var/log/dmesg | Kernel boot mesajları |
| /var/log/auth.log | Yetkilendirme, login, sudo kayıtları |
| /var/log/kern.log | Kernel mesajları | 
| /var/log/Xorg.0.log | Grafik arayüzleri logları |
| /var/log/apt/history.log | APT ile yapılan paket kurulumları | 
| /var/log/journal | systemd'nin binary log arşivi |

---------------------------------------------------------------------------------------------------------------------------------------------------------------

## Loglar Ne İşe Yarar?

Sistem programlamada ve yönetiminde log dosyaları şu işlevlerde kullanılır : 
* **Hata tespiti :** Program neden çöktü?
* **Güvenlik incelemesi :** Kim sisteme girmeye çalıştı?
* **Test ve izleme :** Uygulama nasıl çalıştı?
* **Performans analizi :** Ne zaman yavaşladı?

---------------------------------------------------------------------------------------------------------------------------------------------------------------

## Log Nasıl İncelenir?

### a) Temel Komutlar : 

* **cat** - Log dosyasının tamamını göster : 

```cmd
cat /var/log/syslog
```

--------------------------------------------------------------------------

* **less** - Sayfa sayfa gezinme : 

```cmd
less /var/log/syslog
```

------------------------------------------------------------------------

* **tail** - Son birkaç satırı göster : 

```cmd
tail /var/log/syslog
tail -n 100 /var/log/syslog    # son 100 satır
```

----------------------------------------------------------------------

* **tail -f** - Canlı izleme : 

```cmd 
tail -f /var/log/syslog

# Gerçek zamanlı olarak log dosyasına eklenen satırlar anlık gösterilir.

```

-----------------------------------------------------------------------

* **grep** - Belirli anahtar kelimeyi filtreleme : 

```cmd
grep "error" /var/log/syslog
```

---------------------------------------------------------------------

* **journalctl** - systemd loglarını okuma :

```cmd
journalctl			# tüm systemd loglarını
journalctl -u ssh.service	# sadece ssh servisi
journalctl -b 			# en son boot logları
journalctl -f			# canlı takip
```

---------------------------------------------------------------------------------------------------------------------------------------------------------------

## Uygulamalı Örnekler


### Örnek 1 : SSH ile kim giriş yapmış?

```cmd
cat /var/log/auth.log | grep "Accepted"
```

### Örnek 2 : Sistem açılışta kernel ne yazmış?

```cmd
dmesg | less
```

### Örnek 3 : Son 100 satırda hata mesajı var mı?

```cmd
tail -n 100 /var/log/syslog | grep -i error
```

### Örnek 4 : Bir servisin logunu canlı izlemek

```cmd
journalctl -u bluetooth.service -f
 
journalctl -u ssh -f
```

---------------------------------------------------------------------------------------------------------------------------------------------------------------

## Log Temizleme (Dikkatli Olalım)

Bazı sistemlerde /var/log zamanla çok yer kaplayabilir.

Logları silmek (root yetkisiyle) : 

```cmd
sudo truncate -s 0 /var/log/syslog
journalctl --vacuum-time=3d  # Sadece 3 günden eski journal loglarını sil
```

---------------------------------------------------------------------------------------------------------------------------------------------------------------

## Log Yönetiminde Kullanılan Araçlar

| Araç | Açıklama | 
|--|--|
| logrotate | Otomatik log döndürme ve arşivleme |
| journalctl | systemd loglarını okuma |
| rsyslog | Syslog servisidir | 
| dmesg | Kernel ring buffer'ı |

---------------------------------------------------------------------------------------------------------------------------------------------------------------

## Özet

* **Log :** Sİstem olaylarının kaydıdır.
* **Yer :** /var/log dizininde bulunur.
* **İzleme :** tail, grep, less, journalctl gibi komutlarla yapılır.
* **Amaç :** Sorun giderme, güvenlik analizi, sistem izleme
