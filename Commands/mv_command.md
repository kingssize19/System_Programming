# mv Command

* mv Komutu, Linux/Unix sistemlerinde dosya veya klasör taşımak ya da yeniden adlandırmak için kullanılır. "move" kelimesinin kısaltmasıdır.


## mv Komutu Temel Kullanımı :

### Dosya Taşımak : 

```cmd
mv kaynak hedef
```

**Örnek :**

```cmd
mv belge.txt Belgeler/
```
* Bu komut, belge.txt dosyasını Belgeler/ dizinine taşır.

### Dosya Adı Değiştirme :

```cmd
mv eski_ad.txt yeni_ad.txt
```
**Örnek :**
```cmd
mv notlar.txt  yedek_notlar.txt
```
* Bu komut, notlar.txt dosyasının adını yedek_notlar.txt olarak değiştirir.

## Sık Kullanılan mv Parametreleri : 

### 1. -i Interactive (Etkileşimli)

* Hedefte aynı iismli bir dosya varsa, üzerine yazmadan önce kullanıcıdan onay ister.

```cmd
mv -i veri.txt Belgeler/veri.txt
```

* Eğer Belgeler/ dizininde zaten veri.txt dosyası varsa ;
  * y (yes) dersek, eski dosya silinir ve kaynak dosya onun yerine taşınır.
  * h (hayır) dersek, işlem yapılmaz, dosyalar yerinde kalır.

### -f Force (Zorla üzerine yaz)

* Hedefte aynı isimli bir dosya varsa bile, sormadan üzerine yazar.

```cmd
mv -f yeni_rapor.txt Belgeler/rapor.txt
```
* Eğer Belgeler/rapor.txt zaten varsa :
  * Bu dosyanın içeriği silinir.
  * yeni_rapor.txt dosyası, rapor.txt adıyla taşınır.
  * Hedef dosya artık kaynak dosyanın içeriğine sahiptir
  * yeni_rapor.txt artık yoktur, çünkü taşındı.

### -n No Overwrite (Üzerine Yazma)

* Eğer hedef dosya varsa, taşıma işlemini yapmaz, dosyaları olduğu gibi bırakır.

```cmd
mv -n resim.jpg Galeri/resim.jpg
```
* Eğer Galeri/resim.jpg zaten varsa, mv komutu hiçbirşey yapmaz.
* Hiçbir çıktı yoktur.
* Hedef dosya da, kaynak dosya da olduğu yerde kalır.
* Kazayla üzerine yazma riski ortadan kalkar.

### -u Update (Yalnızca Yeni Dosyayı Taşı)

* Kaynak dosya, hedef dosyadan daha yeniyse taşıma yapılır. Aksi taktirde işlem yapılmaz.

```cmd
mv -u guncel_rapor.txt Belgeler/rapor.txt
```
* Eğer guncel_rapor.txt, Belgeler/rapor.txt dosyasından daha yeni bir tarih taşıyorsa, dosya taşınır. Aksi taktirde taşıma yapılmaz.
* Eğer dosya yeniyse, hedef dosya değişir.
* Değilse, dosyalar yerinde kalır.
* Özellikle yedekleme işlemlerinde kullanışlıdır.

### -v Verbose (Detaylı Çıktı Ver)

* Taşıma veya yeniden adlandırma işlemlerinin ne yapıldığını ekrana yazdırır.

```cmd
mv -v deneme.txt belgelerim/yedek.txt
```
* Dosya taşındığında terminalde şu mesaj görünür :

```cmd
renamed 'deneme.txt' -> 'belgelerim/yedek.txt'
```
* Hangi dosyanın nereye taşındığını açıkça görürsün.
* Çok sayıda dosya taşırken takip kolaylığı sağlar.

## Özet Tablo


| Parametre | Açıklama                 | Üzerine Yazar mı? | Uyarı Verir mi? | Ne zaman Kullanılır?                      |
| --------- | ------------------------ | ----------------- | --------------- | ----------------------------------------- |
| `-i`      | Etkileşimli taşıma       | Evet              | Evet            | Kazayla üzerine yazmak istemiyorsan       |
| `-f`      | Zorla taşıma             | Evet              | Hayır           | Sessizce işlem yapmak istiyorsan          |
| `-n`      | Üzerine yazma, varsa geç | Hayır             | Hayır           | Dosya zaten varsa taşınmasın diyorsan     |
| `-u`      | Güncelse taşı            | Evet              | Hayır           | Sadece güncel dosyalar taşınsın diyorsan  |
| `-v`      | Detaylı çıktı            | -                 | -               | Hangi işlem yapıldığını görmek istiyorsan |


































































