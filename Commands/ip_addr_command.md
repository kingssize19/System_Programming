# ip addr Komutu

* **ip add** (veya **ip address**) komutu, Linux sistemlerde ağ arayüzlerinin IP yapılandırmalarını görüntülemek ve yönetmek için kullanılır. Jetson modüllerinde Wi-Fi, Ethernet veya USB üzerinden iletişim kurarken bu komut ile IP adreslerini kontrol etmek, statik IP atamak veya ağ sorunlarını analiz etmek mümkündür.

## ip add Komutu Nedir?

* ip address (ip a veya ip add)
* Ağ arayüzlerinin (eth0, wlan0 vb.) IP adreslerini ve ağ durumlarını gösterir. **ifconfig** komutunun modern ve daha güçlü alternatifidir.

## Sık Kullanım Örnekleri

### 1. Tüm ağ arayüzlerinin IP adreslerini listele

```cmd
ip a
```
* Jetson'un hangi arayüzlerinin (eth0, wlan0, Io vs.) aktif olduğunu ve IP adreslerini gösterir.
* Jetson cihaza SSH ile bağlanırken veya ROS iletişimi için IP kontrolünde çok önemlidir.

### 2. Sadece belirli bir arayüzün (örneğin wlan0) bilgilerini göster

```cmd
ip a show wlan0
```

* Yalnızca Wi-Fi arayüzü hakkında bilgi verir.
* Jetson'ın Wi-Fi üzerinden ağa bağlanıp bağlanmadığını kontrol ederken kullanılır.

### 3. Statik IP adresi atama (geçici)

```cmd
sudo ip addr add 192.168.1.100/24 dev eth0
```
* Ethernet arayüzüne statik IP atar (kapatıldığında kaybolur).
* Jetson'ı başka bir cihaza doğrudan bağlarken (örneğin ROS master-slave konfigürasyonunda).

### 4. IP adresini kaldırma

```cmd
sudo ip addr del 192.168.1.100/24 dev eth0
```
* Daha önce atanmış bir IP adresini siler.
* IP çakışmalarını önlemek veya yeniden yapılandırma için kullanılır.

### 5. Jetson cihazın bağlı olduğu arayüzü öğrenmek (örnek: Ethernet mi Wi-Fi mı?)

```cmd
ip a | grep inet
```
* Hangi IP hangi arayüzde? Jetson hangi ağdan bağlanıyor?
* IP üzerinden iletişim kurarken doğru ağ arayüzünü tespit etmekte kullanılır.

## Ek Bilgi

* **ip a** çıktısında **inet** -> IPv4 adresini, **inet6** -> IPv6 adresini gösterir.
* Jetson'da Wi-Fi üzerinden bağlantı sorunları yaşanıyorsa önce **ip a** ile bağlantı kontrolü yapılmalıdır.
* Komut geçici yapılandırma yapar. Kalıcı IP için **/etc/netplan/**, **NetworkManager** veya **systemd-networkd** yapılandırmaları gerekir.








































