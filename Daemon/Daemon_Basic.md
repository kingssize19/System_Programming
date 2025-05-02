# Servis Dosyası (systemd service) Nedir?

* Servis dosyası (veya unit dosyası), Linux sistemlerinde systemd tarafından yönetilen işlemleri tanımlar.
* Genellikle arka planda (daemon) çalışan uygulamalar için yazılır.
* Systemd sayesinde servisler : 
 * Otomatik olarak sistem açılışında çalıştırılabilir. 
 * İzlenebilir, yeniden başlatılabilir, günlükleri takip edebilir.

---------------------------------------------------------------------------------------------------------------------------

## Neden Servis Dosyası Yazılır ? 

| Amaç | Açıklama | 
|--|--|
| Süreklilik | Uygulamanız sistem açıldığında otomatik başlasın |
| Takip ve Kontrol | systemctl komutlarıyla durumu gözlemlenebilir ve kontrol edilebilir. | 
| Hata yönetimi | Servis hata verirse Restart=always ile yeniden başlatılır |
| Temiz yapı | Scriptlerimizi systemd ile entegre edip daha düzenli yönetirsiniz. |

---------------------------------------------------------------------------------------------------------------------------

## Servis Dosyasının Yolu

Servis dosyaları genellikle burada olur : 

* **Kullanıcı tanımlı :** /etc/systemd/system/
* **Dağıtım varsayılanları :** /lib/systemd/system/ veya /usr/lib/systemd/system/

---------------------------------------------------------------------------------------------------------------------------

## Servis Dosyasının Yapısı (Template) 

```cmd 
\[Unit\]
Description=Açıklayıcı isim
After=network.target

\[Service\]
ExecStart=/path/to/script.sh
Restart=always
User=jetson

\[Install\]
WantedBy=multi-user.target
``` 

| Alan | Görevi | 
|--|--|
| \[Unit\] | Servisin genel tanımı, ne zaman başlatılacağı vs. |
| \[Service\] | Nasıl başlatılacağı, hangi kullanıcıyla çalışacağı |
| \[Install\] | Hangi hedefte otomatik başlatılacağı (örneğin çoklu kullanıcı) |

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

## Servis Oluşturma

### 1. Script dosyasını oluştur

```cmd
nano /home/jetson/my_script.sh
```

```bash
#!/bin/bash
while true; do
	echo "$(date) Servis çalışıyor." >> /home/jetson/mylog.txt
	sleep 5
done
```

```cmd
chmod +x /home/jetson/my_script.sh
```



### 2. Servis dosyasını oluştur

```cmd 
sudo nano /etc/systemd/system/myservice.service
```

```cmd
\[Unit\]
Description=Jetson örnek servis
After=network.target

\[Service\]
ExecStart=/home/jetson/my_script.sh
Restart=always
User=jetson

\[Install\]
WantedBy=multi-user.target
```

### 3. Servis tanır (daemon reload)

```cmd
sudo systemctl daemon-reload
``` 

### 4. Servisi Başlat

```cmd
sudo systemctl start myservice.service
```

### 5. Servisi sistem açılışına ekle

```cmd
sudo systemctl enable myservice.service
```

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

## Servis Takibi İçin Kullanılan Komutlar

| Komut | Açıklama |
|--|--| 
| systemctl status myservice | Servisin durumu | 
| systemctl start/stop/restart myservice | Başlatma, durdurma, yeniden başlatma |
| systemctl enable/disable myservice | Açılışta çalıştır / Devre dışı bırak |
| journalctl -u myservice -f | Canlı log takibi |
| systemctl daemon-reload | Servis dosyasında değişiklik sonrası şarttır |

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

## Servisi Temizleme ve Kaldırma

```cmd
sudo systemctl stop myservice
sudo systemctl disable myservice
sudo rm /etc/systemd/system/myservice.service
sudo systemctl daemon-reload
```

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

## Dikkat Edilmesi Gerekenler

* **ExecStart** içinde verdiğiniz script mutlaka çalışabilir (chmod +x) olamlı.
* **User=** kısmı varsa bu kullanıcının script'e erişim izni olmalı.
* Servis sürekli çalışacaksa Restart=always mutlaka eklenmeli.
* Script içinde sleep olmazsa işlem aniden kapanır.

























































