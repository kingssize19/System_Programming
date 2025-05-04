# stat Komutu

* stat komutu, Linux'ta bir dosya veya dizin hakkında detaylı bilgi verir. Özellikle gömülü sistemler (örneğin Jetson modülleri) üzerinde çalışırken bir dosyanın boyutunu, izlerini, sahipliğini, erişim/modifikasyon zamanlarını görmek için kullanılır.

## stat Komutu Ne İşe Yarar?
* Dosya/dizin hakkında detaylı bilgi verir :
  * Dosya tipi (normal, symlink, dizin vs)
  * Boyut (byte cinsinden)
  * Erişim/oluşturulma/değiştirilme zamanları
  * İzinler (rwx ve sayısal)
  * Sahip kullanıcı/grup
  * İ-node ve cihaz bilgileri

## Sık Kullanım Örnekleri :

### 1. Bir dosyanın detaylı bilgilerini öğrenmek

```cmd
stat camera_log.txt
```
* Jetson'da çalışan bir kamera uygulamasının log dosyasının son ne zaman güncellendiğini, boyutunu ve shaipliğini öğrenmek için kullanılır.


### 2. Python veya C uygulamasının boyutunu kontrol etmek 

```cmd
stat app.py
stat build/my_binary
```
* Derlediğimiz programın boyutunu (örneğin my_binary) görmek, gömülü sistemde dosya boyutu sınırını aşıp aşmadığını kontrol etmek için kullanılır.

### 3. USB üzerinden bağlanan diskin mount edildiği klasörü kotnrol etmek

```cmd
stat /media/usb
```
* Jetson'a bağladığın USB belleğin klasörü çalışır mı, klasör mevcut mu, en son ne zaman erişildi gibi bilgileri verir.

### 4. Sistem bileşenlerinin log dosyalarını izlemek

```cmd
stat /var/log/syslog
stat /var/log/nv_camera.log
```
* Jetson'da donanıma ait (kamera, GPU, vs.) logların değişip değişmediğini kontrol etmek için kullanılır.

### 5. Bir cihaz dosyasının inode ve izinlerini görmek

```cmd
stat /dev/video0
```
* Jetson'da bağlı bir kameranın video0 cihaz dosyasının gerçekten var olup olmadığını, cihaz tipi mi olduğunu ve kim tarafından erişilebildiğini anlamak için kullanılır.


## Örnek stat Çıktısı : 

```cmd
File: my_binary
Size: 65432      Blocks: 136     IO Block: 4096   regular file
Device: 802h/2050d   Inode: 393948   Links: 1
Access: 2025-05-03 21:22:19.000000000 +0300
Modify: 2025-05-03 21:21:45.000000000 +0300
Change: 2025-05-03 21:21:45.000000000 +0300
Birth: -
```

## stat -c (formatlı çıktı) Kullanım Örnekleri :

### 1. Dosya boyutunu (byte cinsinden) al

```cmd
stat -c "%s" camera_log.txt
```
* camera_log.txt dosyasının kaç byte olduğunu döndürür (sadece sayısal değer).

### 2. Dosyanın sahip kullanıcı ve grup bilgisi

```cmd
stat -c "Owner: %U  Group: %G" camera_log.txt
```
* Dosyayı kimin (kullanıcı ve grup) oluşturduğunu gösterir. Jetson sisteminde erişim hatası alıyorsan bununla denetleyebilirsin.


### 3. En son ne zaman değiştirildiğini göster

```cmd
stat -c "Last modified: %y" camera_log.txt
```
* Dosyanın en son değiştirildiği zamanı (timestamp) verir. Logların aktif yazılıp yazılmadığını görmek için kullanılır.

### 4. Dosya tipi ve izinleri (kısa biçimde)

```cmd
stat -c "Type: %F  Permissions: %A" /dev/video0
```
* /dev/video0 gibi cihaz dosyasının türünü ve izinlerini gösterir.
* Örn : character special file, crw-rw----

### 5. Hepsi tek satırda (boyut, inode, kullanıcı, tarih)

```cmd
stat -c "File: %n | Size: %s | Inode: %i | Owner: %U | Modified: %y" app.py
```
Özelleştirilmiş tek satırlık bilgi döndürür. Sistem programlama betiklerinde ideal.


## Sık Kullanılan stat -c Format Kodları

| Kod  | Açıklama                      |
| ---- | ----------------------------- |
| `%n` | Dosya adı                     |
| `%s` | Dosya boyutu (bayt)           |
| `%F` | Dosya tipi                    |
| `%A` | İzinler (`rwx` formatında)    |
| `%a` | İzinler (sayısal, örn: `755`) |
| `%U` | Sahip kullanıcı               |
| `%G` | Sahip grup                    |
| `%y` | Son değiştirilme zamanı       |
| `%i` | i-node numarası               |






























































