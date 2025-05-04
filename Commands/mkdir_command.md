# mkdir Command

* mkdir (make directory), bir klasör (dizin) oluşturmak için kullanılan bir somuttur. Sistem programlamada ve terminal kullanımında sıkça kullanılır.

```cmd
mkdir klasor_adi
```
* Bu komut, bulunduğunuz dizin içerisinde klasor_adi adında yeni bir klasör oluşturur.

## Sık Kullanılan Parametreler :

### 1. -p (parents)

* Ara dizinleriyle birlikte klasör oluşturur. Eğer üst klasör yoksa otomatik oluşturur.

```cmd
mkdir -p proje/src/utils
```

* Bu örnekte, proje, src ve utils klasörleri yoksa hepsini sırayla oluşturur.

### 2. -v (verbose)

* Her oluşturulan klasör için bilgi mesajı gösterir.

```cmd
mkdir -v yeni_klasor
```

### 3. --mode=777 veya -m

* Oluşturulan Klasöre özel izinler verir (örn: rwxrwxrwx).

```cmd
mkdir --mode=755 kodlar
```
* Bu örnekte, kodlar klasörünü rwxr-xr-x izinleriyle oluşturur.

```cmd
mkdir -m 700 gizli
```
* Bu örnek sadece kullanıcıya tüm izinleri verir. (rwx------).

### 4. --help

* mkdir komutu ile ilgili yardım dökümünü gösterir.

```cmd
mkdir --help
```

### 5. --version

* mkdir komutunun yüklü sürümünü gösterir.

```cmd
mkdir --version
```

### 6. Joker karakterlerle birlikte ({} kullanımı)

* Birden fazla klasörü tek komutla oluşturmak için kullanılır.

```cmd
mkdir proje/{src,bin,doc,test}
```
* Bu proje dizini içinde src, bin, doc ve test klasörlerini oluşturur.









































