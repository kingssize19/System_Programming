# tree Komutu

* tree komutu, bir dizin içeriğini ağaç yapısı şeklinde hiyerarşik olarak gösteren bir terminal komutudur. Alt klasörleri ve dosyaları dallanarak listeler.
* Özellikle dizin yapısını görselleştirmek için kullanılır.

## tree Komutunun Sık Kullanılan Örnekleri

### 1. tree

* Bulunduğun klasördeki tüm dizin ve dosyaları ağaç şeklinde gösterir.
```cmd
.
├── main.c
├── include
│   └── config.h
└── src
    ├── driver.c
    └── utils.c

```

### 2. tree -L 2

* Sadece 2 seviye derinliğine kadar olan klasörleri ve dosyaları gösterir.

```cmd
tree -L 2
```
* Derin yapılı projelerde yalnızca ilk birkaç katmanı görmek istediğinde kullanılır. 

### 3. tree -d 

* Sadece dizinleri (klasörleri) gösterir, dosyaları atlar.

```cmd
tree -d
```
* Sadece klasör yapısına bakmak istiyorsan idealdir.

### 4. tree /etc

* Verilen dizinin içeriğini ağaç şeklinde gösterir.

```cmd
tree /etc
```
* Başka bir dizinin (örneğin sistem yapılandırma klasörü) yapısını incelemek için kullanılır.

### 5. tree -a 

* Gizli dosyalar (. ile başlayan) dahil tüm içerikleri listeler.

```cmd
tree -a
```

* Projelerde gizli dosyalarıda görmek istiyorsan (örneğin .gitignore, .vscode).

## Kısa Özet 

| Komut       | Anlamı                                       |
| ----------- | -------------------------------------------- |
| `tree`      | Tüm klasör ve dosyaları hiyerarşik gösterir  |
| `tree -L N` | N seviyeye kadar gösterir                    |
| `tree -d`   | Sadece klasörleri gösterir                   |
| `tree /yol` | Belirli bir klasörün yapısını gösterir       |
| `tree -a`   | Gizli dosyalar dahil tüm içerikleri gösterir |


# Örnek Klasör Yapısı (~/proje dizini) : 

```cmd
proje/
├── main.c
├── Makefile
├── .gitignore
├── include/
│   └── config.h
├── src/
│   ├── main.c
│   └── helper.c
├── build/
└── .vscode/
    └── settings.json
```

## tree Komutu Örnekleri ve Çıktıları


### 1. tree

```cmd
tree
```

```cmd
.
├── .gitignore
├── Makefile
├── build
├── include
│   └── config.h
├── main.c
├── src
│   ├── helper.c
│   └── main.c
└── .vscode
    └── settings.json
```
* Tüm klasör ve dosyaları listeler.

### 2. tree -L 1

```cmd
tree -L 1
```

```cmd
.
├── .gitignore
├── Makefile
├── build
├── include
├── main.c
├── src
└── .vscode
```
* Sadece ilk seviye dosya ve klasörleri gösterir.

### 3. tree -d 

```cmd
tree -d
```
```cmd
.
├── build
├── include
├── src
└── .vscode
```
* Sadece klasörleri gösterir.

### 4. tree -a

```cmd
tree -a
```
```cmd
.
├── .gitignore
├── .vscode
│   └── settings.json
├── Makefile
├── build
├── include
│   └── config.h
├── main.c
└── src
    ├── helper.c
    └── main.c
```
* Gizli dosyaları (örneğin .gitignore, .vscode) da listeler.

### 5. tree src

```cmd
tree src
```
```cmd
src
├── helper.c
└── main.c
```
* Sadece /src klasörünün yapısını gösterir.

























