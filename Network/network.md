# Network (Ağ) Yönetimi

## IP nasıl değiştirilir, statik IP nasıl ayarlanır?

* IP değiştirme, cihazın ağa bağlanmasını sağlar. DHCP ile otomatik alınabilir ya da elle (statik) atanabilir.
* Statik IP, cihazın adresini sabit tutarak uzaktan bağlantıların kopmamasını sağlar.

```cmd
sudo ip addr add 192.168.1.100/24 dev eth0
```
* Statik IP tanımlar.

```cmd
nmcli con mod "Wired connection 1" ipv4.method manual ipv4.addresses 192.168.1.100/24
```
* Network Manager ile IP atar.

## Gateway, DNS, Netmask, Interface, MAC nedir?

* **Gateway :** İnternete çıkış noktası (genellikle modem IP'si, örn: 192.168.1.1)

* **DNS (Domain Name System) :** Alan adlarını IP’ye çevirir (örn: www.google.com → 142.250.74.36)

* **Netmask :** Alt ağ (subnet) tanımlar, örn: 255.255.255.0 = 256 adreslik ağ.

* **Interface :** Ağ donanımı/bağlantısı (eth0, wlan0)

* **MAC Address :** Ağ kartına özgü fiziksel adres (örnek: 00:1A:2B:3C:4D:5E)


```cmd
ip a       # Interface ve MAC adreslerini gösterir
```

## Ağ Komutları ve Araçlar

### ifconfig – IP atama, IP temizleme, interface açma/kapama

* Artık ip komutu daha günceldir ama ifconfig hâlâ kullanılır.

```cmd
sudo ifconfig eth0 192.168.1.55 netmask 255.255.255.0
sudo ifconfig eth0 down   # Arayüzü kapat
sudo ifconfig eth0 up     # Arayüzü aç
```

## netstat – Açık portları ve dinleme durumlarını gösterir

* Hangi servisler hangi portlardan dinliyor öğrenmek için kullanılır.

```cmd
sudo netstat -tuln
```
* t=tcp, u=udp, l=listen, n=sayısal IP göster.

```cmd
sudo netstat -anp | grep 22
```
* 22 numaralı (SSH) portu dinleyen süreci bulur.

## tcpdump, wireshark gibi ağ trafiği analiz araçları

* tcpdump terminalden canlı paketleri izler.
* wireshark grafik arayüzle detaylı analiz yapar.

```cmd
sudo tcpdump -i eth0
```
eth0 arayüzünden geçen tüm paketleri gösterir.

## arp-scan – Ağdaki cihazları MAC adresiyle bulma

* Ağda kim var, hangi IP hangi MAC adresine ait görmeye yarar.

```cmd
sudo arp-scan --interface=eth0 --localnet
```
```cmd
ip neigh # Alternatif
```

# route – Ağa çıkış yollarını ve yönlendirmeleri gösterir

* Hangi IP blokları hangi gateway üzerinden yönlendiriliyor?

```cmd
route -n
```
* Sayısal IP ile yönlendirme tablosunu gösterir.

```cmd
ip route add default via 192.168.1.1
```
* Yeni default gateway tanımlar.

## nmcli (Network Manager CLI)

* Bağlantı yönetimi yapar.
* Jetson Xavier’de hotspot açmak, bağlanmak veya bağlantı ayarları için çok kullanılır.

```cmd
nmcli con show
nmcli device wifi connect "SSID" password "12345678"
nmcli device wifi hotspot ifname wlan0 ssid MyHotspot password 12345678
```

## Servis Dosyası Nasıl Yazılır? (Daemon)

* Jetson gibi sistemlerde sürekli çalışacak servisleri (örneğin bir sensör scripti) başlatmak için systemd kullanılır.

### Örnek servis dosyası (/etc/systemd/system/myscript.service)

```cmd
[Unit]
Description=My Sensor Service

[Service]
ExecStart=/usr/bin/python3 /home/jetson/sensor.py
Restart=always

[Install]
WantedBy=multi-user.target
```

```cmd
sudo systemctl daemon-reload
sudo systemctl enable myscript
sudo systemctl start myscript
```


## Özetle :

* Bu notlar, Jetson Xavier veya başka bir Linux sisteminde:

  * Ağ yapılandırması (IP, DNS, Gateway)
  * Servis yazımı
  * Dinleme portlarını görüntüleme
  * Hotspot oluşturma
  * Ağ trafiğini analiz etme
  * MAC/IP tespiti
    gibi temel sistem yönetim konularını kapsamaktadır.

Jetson ile sahada ağ problemi çözmek veya cihaz bağlantılarını yönetmek isteyen biri için bu bilgiler hayati önemdedir.
