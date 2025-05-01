# df Komutu - Disk Kullanım Bilgisi

df (disk filesystem), Linux/Unix sistemlerde dosya sistemlerinin disk alanı kullanım durumunu özet olarak gösteren komuttur. Sistem programlamada, disk doluluğunu kontrol etmek, yetersiz alan tespiti ve loglama işlemlerinde sıkça kullanılır.

## Temel Söz Dizimi

```cmd
df [SEÇENEKLER] [DOSYA veya DİZİN]
```
* Eğer bir dosya ya da dizin belirtilmezse, bağlı tüm dosya sistemlerinin kullanım durumu listelenir.


| Parametre | Açıklama | 
|--|--|
| -h | "Human-readable" biçim : KB/MB/GB olarak gösterir |
| -H | -h gibidir ancak 1000 tabanlıdır (MB = 1000 KB) | 
| -k | Alanı kilobyte (KB) cinsinden gösterir (varsayılan) | 
| -m | Alanı megabyte (MB) cinsinden gösterir | 
| -T | Dosya sistemi türünü de gösterir | 
| -t \[tip\] | Sadece belirtilen tipteki dosya sistemlerini göster |
| -x \[tip\] | Belirtilen tipteki dosya sistemlerini hsriç tut | 
| --total | Tüm dosya sistemleri için toplamı hesaplar | 
| --output | Belirli alanları özel olarak gösterir (örn : source, size) | 


## Kullanım Örnekleri

```cmd
df -h
```
* Tüm diskleri, bağlı dosya sistemlerini okunabilir olarak listeler.

------------------------------------------------------------------------------------

```cmd
df -h /var
```
* /var dizininin bulunduğu diskin kulanım bilgisini verir.

------------------------------------------------------------------------------------

```cmd
df -Th
```
* Disk kullanım bilgisini dosya sistemi türüyle birlikte (ext4, tmpfs, vfat, vs.) gösterir.

------------------------------------------------------------------------------------

```cmd
df -t ext4 -h
```
* Sadece ext4 türündeki diskleri gösterir.

------------------------------------------------------------------------------------

```cmd
df -x tmpfs -h
```
* tmpfs türündeki geçici dosya sistemlerini göstermez.

------------------------------------------------------------------------------------

```cmd
df -h --total
```
* Sonuçların en altına toplam disk kapasitesi, kullanım ve boş alan bilgisini ekler.

------------------------------------------------------------------------------------

```cmd
df --output=source,fstype,size,used,avail,target -h
```
* Çıktıyı özelleştirerek sadece istediğiniz alanları gösterebilirsiniz.

------------------------------------------------------------------------------------

```cmd
df -m
```
* Disk alanlarını MB olarak gösterir.

------------------------------------------------------------------------------------

## pipe ( | ) ile df Kullanımı

```cmd
df -h | awk '$5+0 > 90 {print}'
```
* Kullanım yüzdesi %90'dan fazla olan disk bölümlerini listeler.

------------------------------------------------------------------------------------

```cmd
df -hT | grep -E "^/dev/"
```
* tmpfs veya overlay gibi sanal dosya sistemlerini filtreleyerek yalnızca fiziksel diskleri gösterir.

------------------------------------------------------------------------------------

## Neden Kullanılır ?

* Sistem izleme (monitoring) betiklerinde disk doluluğu takibi
* Disk doluluk sınırlarına ulaşıldığında uyarı vermek
* Log dosyalarının çok yer kaplayıp kaplamadığını kontrol etmek
* Belirli dosya sistemlerinin kapasite analizi























