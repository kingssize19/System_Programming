## ss -lntp 

* Sistemde dinleyen (listening) TCP portlarını, bağlantı durumunu ve ilgili süreçleri (PID/program) gösterir.

```cmd
ss -lntp
```
* Jetson'da hangi portlarda hangi servislerin çalıştığını görmek için.

```cmd
ss -lntp | grep 22
```
* SSH sunucusunun port 22'de dinleyip dinlemediğini kontrol etmek için.

## ip route show

* Mevcut yönlendirme (routing) tablosunu listeler. Hangi ağlara hangi arayüz üzerinden erişildiğini gösterir.

```cmd
ip route show
```
* Jetson'un internete hangi arayüzden çıktığını görmek için.

```cmd
ip route show default
```
* Sadece varsayılan ağ geçidini görmek için.


## sudo ip route add

* Yeni bir yönlendirme kuralı ekler. Genellikle statik rota tanımlamak için kullanılır.

```cmd
sudo ip route add 192.168.2.0/24 via 192.168.1.1
```
* 192.168.2.0 ağına ulaşmak için 192.168.1.1 ağ geçidini kullan.

```cmd
sudo ip route add default via 192.168.1.1
```
* Varsayılan ağ geçidini manuel olarak ayarla.

## traceroute 8.8.8.8

*  8.8.8.8 (Google DNS) gibi bir IP adresine giden yol üzerindeki ağ noktalarını gösterir.

```cmd
traceroute 8.8.8.8
```
* Jetson’un internete hangi ara sunuculardan geçtiğini gösterir.

```cmd
traceroute github.com
```
* Bir web sitesine bağlantı problemini analiz etmek için.

## nmcli dev wifi hotspot

* Jetson’un Wi-Fi adaptörü ile bir Wi-Fi erişim noktası (hotspot) oluşturur.

```cmd
nmcli dev wifi hotspot ifname wlan0 ssid JetsonAP password 12345678
```
* Jetson’u taşınabilir erişim noktası haline getirir.

```cmd
nmcli con show
```
* Oluşturulan hotspot bağlantısını listeler.

## vmstat

* Bellek, CPU, I/O ve işlem durumu gibi sistem kaynaklarını gösterir.

```cmd
vmstat 1 5
```
* Jetson’un 1 saniye aralıklarla sistem kaynak kullanımını 5 kez göster.

```cmd
vmstat -s
```
* Bellek ve swap özetlerini topluca gösterir.


## systemctl list-units --type=service --state=running

* Şu anda çalışan tüm servisleri listeler.

```cmd
systemctl list-units --type=service --state=running
```
* Jetson üzerinde aktif çalışan servisleri gösterir.

```cmd
systemctl list-units --type=service | grep ssh
```
* SSH gibi belirli servislerin çalışıp çalışmadığını kontrol eder.

## systemctl daemon-reload

* Yeni bir servis dosyası oluşturduktan sonra systemd'yi yeniden yükler. Değişiklikleri algılamasını sağlar

```cmd
sudo systemctl daemon-reload
```
* Yeni veya düzenlenmiş servis dosyasını tanıtmak için.

```cmd
sudo systemctl enable my_service.service
```
* Yükledikten sonra servisi açmak için.

## journalctl --boot -1

* Önceki sistem açılışına ait günlükleri (log) gösterir.

```cmd
journalctl --boot -1
```
* Jetson’un bir önceki açılışta ne hata verdiğini analiz etmek için.

```cmd
journalctl --boot -1 -u ssh
```
* Önceki açılıştaki SSH servisi loglarını gösterir.

## pgrep -af

* Çalışan süreçleri PID ve komut satırıyla birlikte listeler.

```cmd
pgrep -af python
```
* Jetson’da hangi Python scriptleri çalışıyor?

```cmd
pgrep -af ros
```
* ROS düğümleri ya da launch dosyaları çalışıyor mu?













