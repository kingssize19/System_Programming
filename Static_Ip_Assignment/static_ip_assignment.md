# Static IP Verme

### Amaç :

* Jetson cihazının eth0 Ethernet arayüzüne, her yeniden başlatmada sabit olarak 10.62.2.xx IP adresini vermek.

### Önemli Bilgiler :

* **auto eth0 :** Sistemin açılışında eth0 arayüzünü otomatik başlatır.
* **iface eth0 inet static :** eth0 arayüzü için IPv4 (inet) türünde static yapı kullanır.
* **address :** Cihaza atanacak sabit IP adresidir. (10.62.2.100)
* **netmask :** Alt ağ maskesidir (255.255.255.0) bir IP bloğunda 256 adres olur.
* **gateway :** Internete çıkış noktası (modem ya da router IP'si)
* **dns-nameservers :** IP'den alan adına çözüm yapan sunucular (DNS); Google ve Cloudflare kullanılır.

-------------------------------------------------------------------------------------------------

## 1. Var Olan IP Ayarlarını Öğren 

```cmd
ip a     #Arayüzünün adı eth0 olduğu için doğrulayın ve IP adresini öğrenin. (inet)
```

### 1.1. ip addr veya ip a

* Ağ arayüzlerinin IP adreslerini gösterir.
* IP adresi (IPv4 ve IPv6), MAC adresi, Arayüz durumu (UP/DOWN) gibi bilgiler elde edilir.

### 1.2. ifconfig

* Eski ama yaygın bir ağ arayüzü görüntüleme aracıdır.
* IP adresi (inet addr), MAC adresi (ether), Veri gönderme/alma istatistikleri gibi bilgiler elde edilir.
* Eğer ifconfig komutu yoksa şu şekilde yüklenir :
  * ```cmd
    sudo apt install net-tools
    ```

### 1.3. ip route

* Varsayılan ağ geçidi (default gateway) ve yönlendirme tablolarını gösterir.
* Default gateway, ağ maskesi, Hangi arayüzden çıkış yapılacağı gibi bilgiler elde edilir.

### 1.4. nmcli (NetworkManager varsa)

* Ağ yöneticisinden bağlantı bilgilerini listeler.
* IP adresi, DNS adresi, Bağlantı durumu gibi bilgiler elde edilir.
* Örnek kullanımı :
  * ```cmd
    nmcli device show
    ```

### 1.5. hostname -I

* Cihazın IP adresini kısa şekilde gösterir.
* Cihazın IP adresi bilgisine ulaşılır.


## 2. Ağ Yapılandırma Dosyasını Aç

```cmd
sudo nano /etc/network/interfaces 
```

## 3. Dosyaya Aşağıdaki Ayarları Yaz

```cmd
auto eth0 #1
iface eth0 inet static #2
  address 10.62.2.100 #3
  netmask 255.255.255.0 #4
  gateway 10.62.2.1 #5
  dns-nameservers 8.8.8.8 1.1.1.1 #6
```
* Kaydet ve çık.

* **1 :** Jetson cihazı açıldığında eth0 otomatik olarak aktifleşsin
* **2 :** eth0 için IPv4 protokolünü ve statik IP modunu kullanın
* **3 :** Jetson cihazına atanacak sabit IP (istenilen boş bir IP adresi)
* **4 :** Bu alt ağda maksimum 254 cihaz olabilir (yaygın subnet mask)
* **5 :** Ağa dışarıdan erişmek için geçiş noktası (modem IP'si)
* **6 :** Alan adlarını çözmek için kullanılan DNS sunucuları

## 4. Ağ Arayüzünü Yeniden Başlat 

```cmd
sudo ifdown eth0 && sudo ifup eth0
```

* Eğer ifdown hata verirse (örneğin zaten kapalıysa), doğrudan **sudo ifup eth0** çalıştırın.

## 5. Kalıcı Olduğunu Test Et

```cmd
sudo reboot    # Jetsonu yeniden başlat
ifconfig       # IP adresini kontrol et
```






















