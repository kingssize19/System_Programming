# find Komutu - Dosya ve Dizin Arama Aracı

find, Linux'ta dosya ve dizinleri belirli kriterlere göre bulmak için kullanılan çok güçlü bir komuttur. Sistem programlama ve yönetimi sırasında log dosyalarını, yapılandırma dosyalarını, geçici dosyaları ve eski dosyaları bulmak gibi birçok kritik işlevde kullanılır.

## Temel Söz Dizimi

```cmd
find [ara_dizin] [kriterler] [eylemler]

find /var/log -name "*.log"
```

## Sık Kullanılan Parametreler

| Parametre | Açıklama |
|--|--|
| -name | Dosya adını eşleştirir (küçük/büyük harf duyarlı) |
| -iname | Dosya adını büyük/küçük harf duyarsız eşleştirir |
| -type | Dosya türünü belirtir (f : dosya, d : dizin, l : link) |
| -size | Dosya boyutuna göre filtreleme yapar |
| -mtime | Son değiştirme zamanına göre arar |
| -atime | Son erişim zamanına göre arar |
| -user | Sahibi verilen kullanıcı olan dosyaları arar |
| -group | Belirtilen gruba ait dosyalar |
| -perm | Belirtilen izinlere sahip dosyalar | 
| -exec | Eşleşen dosyalar için komut çalıştırır |
| -delete | Eşleşen dosyaları siler (çok dikkatli kullanılmalı) |
| -maxdepth | En fazla inilecek dizin derinliği | 
| -mindepth | En az inilecek dizin derinliği | 


## Sistem Programlamaya Yönelik Kullanım Örnekleri


```cmd
find /etc -name "*.conf"
```
* Tüm yapılandırma (.conf) dosyalarını listeler.

----------------------------------------------------------------------------------

```cmd
find . -iname "*.log"
```
* Büyük küçük harfe duyarsız şekilde .log dosyalarını bulur ve listeler.

----------------------------------------------------------------------------------

```cmd
find /var -type d -name "cache"
```
* Adı "cache" olan tüm dizinleri listeler.

----------------------------------------------------------------------------------

```cmd
find /etc -mtime -7
```
* Son 7 gün içinde değişmiş dosyalar.

----------------------------------------------------------------------------------

```cmd
find /home -user ali
```
* Sahibi "ali" dosyaları listeler.

----------------------------------------------------------------------------------

```cmd
find /tmp -type f -size +100M -delete
```
* /tmp dizininde 100MB'tan büyük dosyaları sil. Tehlikelidir, dikkat!

----------------------------------------------------------------------------------

```cmd
find . -type f -perm 600
```
* Sadece sahibi tarafından okunup yazılabilen dosyalar.

----------------------------------------------------------------------------------

```cmd
find . -name "*.c" -exec gcc {} -o {}.out \;
```
* Tüm .c dosyalarını derler.

----------------------------------------------------------------------------------

```cmd
find /etc -maxdepth 1 -name "*.conf"
```
* Sadece /etc dizininin birinci seviyesindeki .conf dosyalarını listeler.

----------------------------------------------------------------------------------

```cmd
find /var/log \( -name "*.log" -o -name "*.err"\) -mtime -3
```
* Son 3 günde değişmiş .log veya .err dosyaları.

----------------------------------------------------------------------------------

```cmd
find /var/log -type f -name ".log" -mtime +30 -exec rm -i {} \;
```
* 30 günden eski log dosyalarını etkileşimli olarak sil (kullanıcı onayı ister.)





