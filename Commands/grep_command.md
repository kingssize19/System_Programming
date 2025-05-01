# grep Komutu - Dosya İçinde Kalıp Arama Aracı

grep (Global Regular Expression Print), bir veya daha fazla dosya içinde belirli bir kelime, ifade veya desen (regex) aramak için kullanılan güçlü bir metin arama aracıdır.

## Temel Söz Dizimi

```cmd
grep [seçenekler] "aranacak_kelime" [dosya_adı]
```

## Sık Kullanılan Parametreler

| Parametre | Açıklama |
|--|--|
| -i | Büyük/küçük harf duyarsız arama | 
| -r veya -R | Dizin içinde rekürsif arama |
| -n | Eşleşen satırların satır numarasını gösterir |
| -l | Sadece eşleşen dosya adlarını göster |
| -v | Eşleşmeyen satırları göster | 
| -c | Eşleşen satırların sayısını göster | 
| -e | Birden fazla desen belirtmek için kullanılır | 
| --color | Eşleşen kelimeleri renklendirir | 
| -A \[n\] | Eşleşen satırdan sonra n satırı daha göster | 
| -B \[n\] | Eşleşen satırdan önce n satırı daha göster | 
| -C \[n\] | Eşleşen satırın hem öncesinden hem sonrasından n satır göster |


## Kullanım Örnekleri

```cmd
grep "root" /etc/passwd
```
* /etc/passwd dosyasında root geçen satırları listeler.

----------------------------------------------------------------------------------------

```cmd
grep -i "error" /var/log/syslog
```
* error kelimesi için büyük/küçük harf duyarsız şekilde arama yapar.

----------------------------------------------------------------------------------------

```cmd
grep -n "eth0" /etc/network/interfaces
```
* Eşleşen satırların satır numarasıyla birlikte gösterimi.

----------------------------------------------------------------------------------------

```cmd
grep -r "TODO" ~/projects
```
* ~/projects altındaki tüm dosyalarda TODO geçen satırları listeler.

----------------------------------------------------------------------------------------

```cmd
grep -l "main" *.c
```
* İçinde main geçen .c dosyalarının isimlerini listeler.

----------------------------------------------------------------------------------------

```cmd
grep -v "^#" /etc/fstab
```
* # ile başlayan satırları (yorumları) hariç tutarak listeler.

----------------------------------------------------------------------------------------

```cmd
grep -c "sshd" /var/log/auth.log
```
* sshd kelimesi kaç kez geçmiş, onu gösterir.

----------------------------------------------------------------------------------------

```cmd
grep --color "systemd" /var/log/syslog
```
* systemd kelimesini renkli olarak vurgular.

----------------------------------------------------------------------------------------

```cmd
grep -e "error" -e "failed" /var/log/syslog
```
* error veya failed kelimelerini içeren satırları bulur.

----------------------------------------------------------------------------------------

```cmd
grep -C 2 "panic" /var/log/kern.log
```
* panic kelimesi geçen satır ile birlikte öncesinden ve sonrasından 2 satır daha gösterir.

----------------------------------------------------------------------------------------

```cmd
find . -name "*.log" -exec grep "timeout" {} \;
```
* .log uzantılı dosyalarda timeout geçen satırları listeler.

----------------------------------------------------------------------------------------

## grep + pipe ( | ) kullanımı

grep, diğer komutlarla birlikte | (pipe) operatörüyle çok güçlü hale gelir.

```cmd
ps aux | grep nginx
```
* Çalışan işlemler arasında nginx kelimesi geçenleri listeler.

----------------------------------------------------------------------------------------

```cmd
df -h | grep "/dev/sd"
```
* Yalnızca fiziksel disk bölümlerini gösterir.

----------------------------------------------------------------------------------------

```cmd
grep -i "authentication failure" /var/log/auth.log | grep "192.168"
```
































