# Linux Dosya İzinlerini ve Sahipliğini Yöneten Temel Komutlar

Linux'ta dosya ve dizinler üzerinde erişim kontrolleri; izinler ve sahiplik yoluyla yapılır. Sistem programlamada, dosya güvenliği, servis yapılandırmaları ve otomasyon betikleri yazarken bu konturlar çok önemlidir.

### 1. chmod - Dosya İzinlerini Değiştirme

* **chmod** komutu (change mode), bir dosya veya dizinin okuma (r), yazma (w) ve çalıştırma (x) izinlerini değiştirmek için kullanılır.

#### 1.1 Sembolik Notasyon :

```cmd
chmod [kullanıcı_tipleri][+|-|=][izinler] dosya_adı
```
* u: kullanıcı (owner)
* g: grup
* o: diğer
* a: tümü (u+g+o)

```cmd
chmod u+x script.sh       # Sahibe çalıştırma izni ver
chmod go-w dosya.txt      # Grup ve diğerlerinden yazma izni kaldır
chmod a+r belge.pdf       # Herkese okuma izni ver
```

#### 1.2 Sayısal Notasyon

```cmd
chmod [mode] dosya_adı
```
* r = 4, w = 2, x = 1
* Toplanarak her grup için ayrı sayı yazılır: ugo

```cmd
chmod 755 program.sh      # u: rwx (7), g: rx (5), o: rx (5)
chmod 644 belge.txt       # u: rw-, g: r--, o: r--
chmod 700 gizli_dosya     # sadece kullanıcıya tüm izinler
```

### 2. chown - Dosya Sahibini ve Grubunu Değiştirme

* **chown** komutu (change owner), bir dosyanın sahibini veya grubunu değiştirmek için kullanılır. Genellikle sudo yetkisi gerekir.

```cmd
chown [yeni_sahip][:yeni_grup] dosya_adı
```

```cmd
sudo chown ali belge.txt         # Sahibi 'ali' yapar, grup değişmez
sudo chown ali:gelistiriciler proje/  # Sahibi 'ali', grubu 'gelistiriciler' yapar
sudo chown :gelistiriciler *.c   # Sadece grup değiştirilir
```

# 3. chgrp - Sadece Grup Sahibini Değiştirme 

* **chgrp** komutu, sadece grubunu değiştirmek için chown'un basit versiyonudur.

```cmd
chgrp grup_adi dosya_adı
```

```cmd
sudo chgrp gelistiriciler kod.c
```

## Sık Kullanılan Kombinasyonlar

**Tüm dizin ve alt içeriklere uygulama (rekürsif) :**
```cmd
chmod -R 755 /var/www/html         # Tüm dosyalara izin ver

chown -R www-data:www-data /var/www/html
# Bu komut, /var/www/html dizinindeki tüm dosya ve alt dizinlerin:
- Sahibini www-data olarak değiştirir,
- Grubunu da www-data olarak ayarlar,
- Ve bunu rekürsif olarak yapar (-R ⇒ Recursive), yani tüm alt klasör ve dosyalar için.
```

| Durum | Komut | Açıklama |
|--|--|--|
| Servis dosyasını çalıştırma izni ver | chmod 755 myservice.sh | Servis scripti sistem tarafından çalıştırılabilir olur. |
| Log dosyasını sadece sistem kullanıcısına açmak | chmod 600 /var/log/app.log | Gizlilik sağlar |
| Web klasörünü web sunucusuna atamak | chown -R www-data:www-data /var/www | Web sunucusunun sahipliğini verir |
| Tüm kullanıcıya okuma izni vermek | chmod a+r README.md | Paylaşıma uygun hale getirir |
| Projeyi geliştirici grubuna atamak | chgrp -R devs project_folder/ | Takım erişimini kolaylaştırır. |

## Özet Tablo 

| Komut | Amaç | Yetki Gerekir | Notlar | 
|--|--|--|--|
| chmod | Dosya izinlerini değiştirme | Hayır (kendi dosyanda) | Sayısal yada sembolik notasyonlar | 
| chown | Sahip ve/veya grup değiştirme | Evet (sudo gerekir) | Çok güçlü, dikkatli kullanılmalı |
| chgrp | Grup değiştirme | Genelde gerekmez | chown yerine sade sürüm |












