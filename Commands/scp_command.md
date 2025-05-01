# scp Komutu - Güvenli Dosya Kopyalama

scp (secure cpy), iki bilgisayar arasında ağ üzerinden dosya veya dizinleri güvenli şekilde kopyalamak için kullanılan bir komuttur. ssh protokolünü kullanarak şifreli bağlantı ile veri aktarımı sağlar.

## Temel Söz Dizimi

```cmd
scp [SEÇENEKLER] kaynak hedef
```
* kaynak ve hedef parametreleri yerel ya da uzak (\[kullanıcı\]@host:/yol) olabilir.

## Sık Kullanılan parametreler

| Parametre | Açıklama | 
|--|--|
| -r | Dizinleri recursive olarak kopyalar |
| -P \[port\] | Farklı bir SSH portu belirtir (varsayılan : 22) | 
| -v | Ayrıntılı çıktı gösterir (debug için yararlı) |
| -C | Sıkıştırma kullanarak veri aktarır (daha hızlı olabilir) |
| -p | Dosya izinlerini, zaman damgasını ve modunu korur |
| -q | Sessiz mod: ilerleme çubuğu ve hata mesajları gösterilmez |

## Kullanım Örnekleri

```cmd
scp dosya.txt kullanıcı@192.168.1.10:/home/kullanıcı/
```
* Yerel dosya.txt dosyasını uzak sunucudaki /home/kullanıcı/ dizinine gönderir.

-----------------------------------------------------------------------------------

```cmd
scp kullanıcı@192.168.1.10:/home/kullanıcı/log.txt .
```
* Uzak sunucudaki log.txt dosyasını bulunduğun dizine indirir.

-----------------------------------------------------------------------------------

```cmd
scp -r ./proje kullanıcı@192.168.1.10:/var/www/
```
* Yerel proje/ dizinini uzak sunucudaki /var/www/ yoluna kopyalar

-----------------------------------------------------------------------------------

```cmd
scp -P 2222 dosya.txt kullanıcı@sunucu_ip:/home/kullanıcı/
```
* SSH bağlantısı 2222 numaralı port üzerinden yapılır. 

-----------------------------------------------------------------------------------

```cmd
scp -C dosya.txt kullanıcı@192.168.1.10:/tmp/
```
* Aktarım sırasında veriyi sıkıştırır, özellikle büyük dosyalarda faydalı olabilir.

-----------------------------------------------------------------------------------

```cmd
scp kullanıcı1@host1:/path/dosya.txt  kullanıcı2@host2:/hedef/
```
* host1 üzerindeki dosyayı doğrudan host2 üzerine kopyalar. (Her iki host'ta SSH erişimi gerekir.)

-----------------------------------------------------------------------------------

## Sistem Programlama ve Yönetiminde Kullanım Senaryoları

* **Yedekleme İşlemleri :** Sunucudan günlük log dosyalarının çekilmesi
* **Uygulama Dağıtımı :** Yerel geliştirilen uygulamanın uzak sunucuya gönderilmesi
* **Konfigürasyon Yönetimi :** Konfigürasyon dosyalarının uzak sistemlere güvenli aktarımı
* **Hızlı Dosya Transferi :** FTP veya rsync yerine hızlı ve basit bir yöntem

## SSH Anahtarı ile Kimlik Doğrulama

```cmd
scp -i ~/.ssh/id_rsa dosya.txt kullanıcı@sunucu:/hedef/
```
* Özel SSH anahtarı ile bağlantı sağlar.

-----------------------------------------------------------------------------------

# SSH Anahtarı ile Bağlantı (-i parametresi)

* Bu yöntemde kimlik doğrulama şifre yerine bir SSH anahtar çifti (private ve public key) ile yapılır.

### Özellikleri :
* Otomatik, şifresiz girişe izin verir (interaktif şifre girme gerekmez)
* Daha güvenlidir (brute-force ile şifre kırmak mümkün değil)
* Betikler, cron işleri ve otomasyonlar için idealdir
* Sunucuda kullanıcıya ait .ssh/authorized_keys dosyasında ilgili public key'in bulunması gerekir.

```cmd
scp -i ~/.ssh/id_rsa dosya.txt user@server:/path/
```
* Burada ~/.ssh/id_rsa private key'dir, buna karşılık gelen public key (id_rsa.pub) daha önceden sunucuya yüklenmiş olmalıdır.

# Şifre ile Bağlantı (anahtar olmayan klasik yöntem)

* Eğer scp komutunda -i ile özel bir anahtar belirtilmezse ve SSH ajanında da tanımlı anahtar yoksa, sunucu kullanıcıdan şifre girmesini ister :

#### Özellikleri : 
* Her bağlantıda manuel olarak şifre girmeniz gerekir
* Otomasyon için uygun değildir
* Güvenlik açısında, güçlü bir şifre gerektirir ama anahtar kadar güvenli değildir
* Brute-force saldırılara daha açıktır

```cmd
scp dosya.txt user@server:/path/
```
* Bağlantı sırasında sizden user@server kullanıcısının şifresini girmeniz istenir.

------------------------------------------------------------------------------------------

# SSH Anahtarı ile Şifresiz Giriş - Basit Senaryo

### Amaç

* Bizim sistemimizden uzak sunucuya bağlanırken her seferinde şifre yazmak yerine, SSH anahtarı kullanarak şifresiz ve güvenli bağlantı kurmak.

### Rol Dağılımı 

* Yerel Bilgisayar : Anahtar üretilecek yer
* Uzak Sunucu (örneğin bir VPS ya da uzak Linux makinesi) : Anahtarın gönderileceği yer.

### 1. Bizim Sistemimizde SSH Anahtar Üret 

**Aşağıdaki komutla bir SSH anahtar çifti (private ve public key) oluşturuyoruz :** 

```cmd
ssh-keygen -t rsa -b 4096
```
* ENTER tuşlarına basarak tüm soruları varsayılan şekilde geçebiliriz.
* **-t rsa :** RSA algoritması (yaygın ve güvenli)
* **-b 4096 :** 4096 bit uzunlukta (güçlü)
* **-C :** Anahtara açıklama etiketi ekler (zorunlu değil)

**Oluşan Dosyalar :**
* **~/.ssh/id_rsa :** Özel anahtar (saklı tutulur)
* **~/.ssh/id_rsa.pub :** Genel anahtar (sunucuya gönderilir)

### 2. Public Key'i Uzak Sunucuya Gönder

**Şimdi id_rsa.pub dosyamızın içeriğini uzak sunucuya aktaralım :**

```c
ssh-copy-id kullanıcı@uzak_sunucu_ip
```
* **Örneğin :** ssh-copy-id root@192.168.1.100
**Bu komut otomatik olarak public key'i uzak sunucudaki ~/.ssh/authorized_keys dosyasına ekler.**

### Uzak Sunucuda Ne Oldu ?

**Uzak sunucuda şu dosya oluşur veya güncellenir :**
* ~/.ssh/authorized_keys

**Bu dosyada artık bizim sistemimizin public anahtarı kayıtlıdır.**
* Artık sunucu, bizim sistemimizden gelen bağlantı isteklerini şifre sormadan kabul eder çünkü private key bizde, public key onda vardır.

### 4. Test Et

**Yerel sistemimizde terminalden bağlan :**
```cmd
ssh kullanıcı@sunucu_ip
```
* Artık şifre sorulmaz, doğrudan bağlantı kurulur.




