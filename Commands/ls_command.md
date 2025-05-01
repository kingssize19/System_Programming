## ls Command

**ls** komutu, Unix/Linux sistemlerinde en yaygın kullanılan komutlardan biridir. "List" kelimesinin kısaltmasıdır ve temel amaci **bir dizindeki (klasördeki) dosya ve dizinleri listelemektir.**


```cmd
ls
```
* Bu komut, bulunduğun dizindeki dosya ve klasörleri listeler.


## Sık Kullanılan ls Parametreleri ve Açıklamaları

#### 1) -l (Uzun Liste Formatı)

```cmd
ls -l
```
* Dosyaların izinlerini sahiplerini, boyutlarını ve son değiştirilme tarihini gösterir.
```cmd
  -rw-r--r--  1 user user  4096 May  1 12:00 dosya.txt
  drwxr-xr-x  2 user user  4096 May  1 11:30 klasor
```

#### 2) -a (Gizli Dosyaları da Göster)

```cmd
ls -a
```
* . ile başlayan dosyalar gizli sayılır (örn: .bashrc).
* Bu seçenek, gizli dosyalarıda dahil eder.


#### 3) -la veya -al (Uzun format + Gizli dosyalar)

```cmd
ls -la
```
* Hem detaylı bilgi verir hem de gizli dosyaları gösterir.

#### 4) -h (İnsan Okunabilir Dosya Boyutu)

```cmd
ls -lh
```
* -l ile birlikte kullanılır.
* Dosya boyutlarını KB, MB gibi okunabilir birimlerle gösterir.

```cmd
-rw-r--r--  1 user user  1.5K May  1 12:00 dosya.txt
```

#### 5) -R Rekursif (Alt Dizinlerle Birlikte Listeleme)

```cmd
ls -R
```
* Tüm alt dizinleride listeleyerek içeriklerini gösterir.


#### 6) -S (Dosya Boyutuna Göre Sırala -Büyükten Küçüğe-)

```cmd
ls -lS
```
* Dosyaları boyutlarına göre sıralar.


#### 7) -t (Zamana Göre Sırala -Yeniden Eskiye-)

```cmd
ls -lt
```
* Dosyaları son değiştirilme zamanına göre sıralar.

#### 8) --color (Renkli Çıktı)

```cmd
ls --color
```

* Dosya türlerine göre renkli çıktı verir (çoğu modern terminalde varsayılan olarak aktiftir.)


#### Örnek : Sadece .txt uzantılı dosyaları uzun formatta listele

```cmd
ls -l *.txt
```
* Sadece txt uzantılı dosyalar listelenir.













