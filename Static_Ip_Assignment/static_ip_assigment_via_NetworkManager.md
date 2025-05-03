# NetworkManager ile eth0 Arayüzü İçin Statik IP Adresi Atama

## 1. Mevcut Bağlantıyı Görüntüle

```cmd
nmcli connection show
```
* Bu komut çıktısındaki NAME bizim bağlantı adımızdır. Genelde "Wired connection 1" olur ama değişmiş olabilir.


## 2. Bağlantıyı Statik IP'ye Ayarlama

```cmd
nmcli connection modify "Wired connection 1" \
  ipv4.addresses 10.62.2.100/24 \
  ipv4.gateway 10.62.2.254 \
  ipv4.dns "8.8.8.8 1.1.1.1" \
  ipv4.method manual \
  connection.autoconnect yes
```

* Bir farklı yol

```cmd
nmcli connection modify "Wired connection 1" ipv4.addresses 192.168.1.100/24
nmcli connection modify "Wired connection 1" ipv4.gateway 192.168.1.1
nmcli connection modify "Wired connection 1" ipv4.dns 8.8.8.8
nmcli connection modify "Wired connection 1" ipv4.method manual

```

* **ipv4.method manual :** DHCP yerine manuel ayarlama kullanır.
* **connection.autoconnect yes :** Jetson açıldığında otomatik bağlanır.
* dns ile system-resolved'e entegre DNS sunucuları tanımlanır.


## 3. Bağlantıyı Yeniden Başlat 

```cmd
nmcli connection down "Wired connection 1" && nmcli connection up "Wired connection 1"
```

## 4. Doğrulama İşlemleri

### 4.1. IP Adresi Doğrulama

```cmd
ip a show eth0
```

### 4.2 NetworkManager Bağlantı Ayarlarını Görüntüle

```cmd
nmcli connection show "Wired connection 1"
```

### 4.3 DNS Ayarlarını Kontrol Et

```cmd
systemd-resolve --status
```

# EKSTRA : DHCP'ye Geri Dönmek

Eğer tekrar DHCP kulanmak istersek : 

```cmd
nmcli connection modify "Wired connection 1" \
  ipv4.method auto  \
  ipv4.addresses "" \
  ipv4.gateway "" \
  ipv4.dns ""

nmcli connection up "Wired connection 1"
```

* Bir diğer yol :

```cmd
nmcli connection modify "Wired connection 1" ipv4.method auto
nmcli connection down "Wired connection 1"
nmcli connection up "Wired connection 1"
```

* Eğer DHCP (Dynamic Host Configuration Protocol) kullanıyorsak, ağ cihazı otomatik bir IP adresi almak için ağ yönlendiricisinden (router, modem) bir adres talep eder.














