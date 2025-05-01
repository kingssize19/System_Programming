# rsync Komutu Nedir ? 

rsync, dosya ve dizinleri yerel ya da uzak sistemler arasında verimli, hızlı ve güvenli şekilde senkronize etmek (eşitlemek) için kullanılan güçlü bir komuttur. 

## Avantajları

* Değişen/veri farklarını kopyalar (tam dosyayı değil)
* Hızlıdı ve ağ kullanımını azaltır
* Kaldığı yerden devam edebilir (--partial, --append gibi)
* İlerleme durumu gösterebilir (--progress)
* SSH üzerinden güvenli kopyalama yapabilir
* Dosya izinlerini, sembolik linkleri, zaman damgalarını koruyabilir

## Temel Söz Dizimi

```cmd
rsync [seçenekler] kaynak hedef
```

## Kullanım Örnekleri

### Yerel Kopyalama Örneği

```cmd
rsync -avh /home/user/proje/ /mnt/yedek/proje/
```
* **-a :** Arşiv modu (izinler, linkler, zaman vb. korunur)
* **-v :** Ayrıntılı çıktı (verbose)
* **-h :** İnsan okunabilir boyutlar (MB, GB gibi)
* **/ ile bitmesi :** Sadece içeriği kopyalar


### Uzak Sunucuya Kopyalama (SSH Üzerinden)

```cmd
rsync -avz proje/ kullanıcı@192.168.1.100:/home/kullanici/yedek/
```
* **-z :** Veriyi sıkıştırarak gönderir (daha hızlı ağ transferi)
* SSH otomatik olarak kullanılır (@ sembolünden dolayı)


### Kaldığı Yerden Devam Etme

```cmd
rsync -av --partial --progress proje.iso kullanıcı@192.168.1.100:/mnt/yedek/
```
* **--partial :** Yarım kalan dosyaları bırakmaz, yeniden devam eder
* **--progress :** Dosya aktarım durumu ve yüzdesini gösterir


### Tüm Dizinleri Recursive Kopyalama + Silineni Silme

```cmd
rsync -av --delete /kaynak/ kullanıcı@sunucu:/hedef/
```
* **--delete :** Hedefte olup kaynakta olmayan dosyaları siler (tam senkronizasyon sağlar)


### SSH Anahtarı ile Kopyalama

```cmd
rsync -av -e "ssh -i ~/.ssh/id_rsa" proje/ kullanıcı@sunucu:/hedef/
```
* **-e "ssh -i ..." :** SSH bağlantısında özel anahtar dosyasını belirtir. 

## Sık Kullanılan Parametreler Tablosu

| Parametre | Açıklama |
|--|--|
| -a | Arşiv modu (izin, link, zaman, vb. korur) |
| -v | Ayrıntılı çıktı | 
| -z | Sıkıştırma | 
| --progress | İlerleme çubuğu | 
| --partial | Yarım kalanları bırakmaz, devam eder | 
| --delete | Hedefte fazlalık varsa siler | 
| --exclude=dosya | Belirli dosyaları hariç tutar |


## Örnek Senaryo

* **Senaryo :** Bizim sistemimizdeki /var/logs klasörünü, uzak sunucudaki /backup/logs/ dizinine kopyalayım. Ayrıca işlem durumunu görmek ve ada tasarruf sağlamak istiyoruz.

```cmd
rsyn -avz --progress /var/logs/ root@192.168.1.50:/backup/logs/
```

## Notlar 

* rsync ile büyük dosyaları veya yedekleri çok hızlı taşıyabiliriz.
* scp'ye göre daha verimlidir, çünkü değişiklikleri algılayarak aktarır.
* Bir cron job ile otomatik yedekleme senaryolarında sık kullanılır.

--------------------------------------------------------------------------------------------

## 1. --progress : İlerleme Göstermek

**Amaç :**
* Büyük dosya kopyalanırken kullanıcıya görsel bilgi sağlar.
* Kopyalama işleminin yüzde kaç tamamlandığını, kaç MB aktarıldığını, hızını ve tahmini kalan süreyi gösterir.
* Uzun süren işlemlerde sistemin donmadığını gösterir.

```cmd
rsync -av --progress ISO/dosya.iso  root@192.168.1.10:/mnt/iso/
```

**Çıktı :**

```cmd
dosya.iso
     3,457,280,000  33%   11.25MB/s   3:15:45 ETA
```
* Büyük boyutlu ISO ya da backup dosyaları kopyalanırken oldukça kullanışlıdır.


## 2. --partial : Kaldığı Yerden Devam Etme

**Amaç :**
* Kopyalama yarıda kesildiğinde, işlemi baştan başlatmak yerine kaldığı yerden devam ettirir.
* Yavaş bağlantılar, VPN, uzak sunucular veya elektrik/internet kesintisi gibi durumlarda veri kaybını önler.
* Zaman ve bant genişliğinden tasarruf sağlar

```cmd
rsync -av --partial --progress video.mp4  root@192.168.1.100:/mnt/backup/
```
* Bu örnekte bir video dosyasını kopyalarken işlem kesilirse tekrar komutu verdiğinde rsync otomatik olarak kaldığı yerden devam eder.


### 3. --append veya --append-verify : Ekleyerek Devam Etmek

* **--append :** Hedefteki dosyanın üzerine yazmak yerine eksik kısmı sonuna ekler.
* **--append-verify :** Aynı işlevi görür ama veri doğrulamasıda yapar.

```cmd
rsync -av --append-verify --progress büyük_dosya.bin  root@sunucu:/mnt/hedef/
```
* Özellikle büyük log dosyaları veya sürekli büyüyen veri dosyalarında işe yarar.


## Kullanım Senaryosu

* **Senaryo :** 4 GB'lık bir yedek dosyasını SSH üzerinden uzak sunucuya aktaralım. Yarıda internet gitti. Yeniden başlatmak yerine aynı komutu çalıştıralım :

```cmd
rsync -avz --partial --progress yedek.tar.gz  user@192.168.1.100:/mnt/backup/
```
* **--progress :** Aktarım durumunu görürsün
* **--partial :** Yarım kalan dosyayı silmez, üzerine kaldığı yerden devam eder.


## Özet

| Özellik | Ne İşe Yarar? | Ne Zaman Kullanılır? |
|--|--|--|
| --progress | İlerleme, hız, kalan süreyi gösterir | Büyük dosya aktarımında |
| --partial | Kesilen aktarımı kaldığı yerden sürdürür | Yavaş/kırılgan ağlarda | 
| --append | Eksik kısmı sonuna ekler | Sürekli büyüyen dosyalar |
| --append-verify | Ekledikten sonra doğrulama yapar | Hassas veri taşımasında | 























