# 1. Restart Policies (Yeniden Başlatma Politikaları)

* Servis çökerse systemd nasıl davranmalı?
* Servis dosyasına \[Service\] altında eklenir : 
* **Parametreler :**

| Ayar | Açıklama | 
|--|--|
| Restart=always | Ne olursa olsun servis her zaman yeniden başlatılır |
| Restart=on-failure | Sadece exit kodu 0 olmayan (başarısız) durumlarda yeniden başlatılır |
| RestartSec=5 | Yeniden başlatmadan önce kaç saniye beklesin |

```cmd
[Service]
ExecStart=/usr/bin/mydaemon
Restart=on-failure
RestartSec=3
```

-------------------------------------------------------------------------------------------------------------

# 2. Timeouts (Zaman Aşımı Ayarları)

Servis beklenenden uzun çalışırsa systemd ne yapmalı?

| Ayar | Açıklama | 
|--|--|
| TimeoutStartSec=10 | Başlatma işlemi bu süreyi aşarsa keser |
| TimeoutStopSec=10 | Durdurma işlemi bu süreyi aşarsa keser |

```cmd
[Service]
ExecStart=/usr/bin/myslowapp
TİmeoutStartSec=15
TimeoutStopSec=5
```

-------------------------------------------------------------------------------------------------------------

# 3. Timers (Zamanlayıcı ile Servis Başlatma)

* cron gibi, ama systemd-native!

* Timer dosyası .timer uzantılıdır ve belirli aralıklarla .service tetikler.

### Örnek : 15 dakikada bir çalışan servis

* /etc/systemd/system/myjob.service

```cmd
[Unit]
Description=Log kaydı

[Service]
ExecStart=/home/jetson/logscript.sh
```

* /etc/systemd/system/myjob.timer

```cmd
[Unit]
Description=Her 15 dakikada bir log

[Timer]
OnBootSec=10min
OnUnitActiveSec=15min
Persistent=true

[Install]
WantedBy=timers.target
```

```cmd
sudo systemctl daemon-reload
sudo systemctl enable --now myjob.timer
```

### Kullanışlı journalctl Komutu : 

```cmd
journalctl -u myjob.service --since "30 minutes ago"
```

-------------------------------------------------------------------------------------------------------------

# 4. Socket Activated Services (Socket ile Başlatılan Servisler)

* Servis sadece bir bağlantı isteği geldiğinde başlasın socket aktivasyonu kullanılır. 

### Örnek :

* /etc/systemd/system/mydaemon.socket

```cmd
[Unit]
Description=Socket aktifleştirmeli servis

[Socket]
ListenStream=12345

[Install]
WantedBy=sockets.target

```

* /etc/systemd/system/mydaemon.service 

```cmd
[Unit]
Description=Socket’ten tetiklenen servis

[Service]
ExecStart=/usr/bin/mydaemon
StandardInput=socket
```

```cmd
sudo systemctl daemon-reload
sudo systemctl enable --now mydeamon.socket
```

* Socket geldiğinde systemd servisi başlatır. 
* Kaynak tasarrufu sağlar.

-------------------------------------------------------------------------------------------------------------

# 5. Log Dönüşümü (Log Rotation)

* Systemd logları journald üzerinden izlenir ama sistem büyüdükçe arşivlemek gerekir.

#### Günlükleri sıkıştırma ve silme : 

```cmd
journalctl --vacuum-time=7d	# 7 günden eski logları sil
journalctl --vacuum-size=500M	# Maksimum 500 MB log tut
```

### Konfigürasyon Dosyası : 

* /etc/systemd/journald.conf


```cmd
SystemMaxUse=500M
SystemKeepFree=100M
SystemMaxFileSize=50M
SystemMaxFiles=10
```

```cmd
sudo systemctl restart systemd-journald
```

-------------------------------------------------------------------------------------------------------------

# 6. Servis Güvenliği (Security Hardening)

* Systemd ile çalıştırılan servisler izole edilebilir.

```cmd 
[Service]
ExecStart=/usr/bin/mydaemon
ProtectSystem=full
ProtectHome=yes
NoNewPrivileges=true
PrivateTmp=true
```

| Parametre | Açıklama | 
|--|--|
| ProtectSystem=full | /usr, /boot gibi yerel sadece okunabilir olur. |
| ProtectHome=yes | /home dizini servise kapatılır. |
| NoNewPrivileges=ture | root izinli bile olsa yeni izin yükselmesi engellenir. |
| PrivateTmp=true | Servise özel bir /tmp alanı verilir. |  

-------------------------------------------------------------------------------------------------------------

# 7. Status, Log ve Diagnostik 

### Servis günlüğünü göster : 

```cmd 
journalctl -u myservice.service -f 
```

### Belirtilen tarih aralığında log : 

```cmd
journalctl -u myservice --since "i hour ago"
journalctl -u myservice --since today --until "10 minutes ago"
```

### Servisin çalışma süresi : 

```cmd
systemctl show myservice -p ActiveEnterTimestamp
```

-------------------------------------------------------------------------------------------------------------

# Özet

* Systemd'nin gelişmiş özellikleri sayesinde : 
 * Servisler zamanlanabilir (.timer)
 * Gerekirse sadece bağlantıyla tetiklenir (.socket)
 * Hatalar durumunda otomatik restart olur
 * GÜvenli ve izole şekilde çalıştırılabilir 
 * Loglar sistematik şekilde izlenir ve döndürülür








































































































































