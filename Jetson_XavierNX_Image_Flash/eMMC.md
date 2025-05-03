# eMMC Nedir? Neden Buraya Yazılır?

### eMMC (embedded MultiMediaCard) :

* Jetson Xavier NX gibi gömülü sistemlerde anakarta entegre, kalıcı bir flash bellek türüdür.
* Bir sabit disk ya da SSD gibi davranır.

### Neden buraya yazılır?

* Jetson'un işletim sistemi burada çalışır.
* Cihaz her açıldığında buradan boot olur.
* SD kartla çalışan bazı modellerin aksine Xavier NX'in devkit versiyonunda eMMC ana kalıcı depolamadır.

### Flash.sh Komutu Parametreleri : 

```cmd
./flash.sh <BOARD> <TARGET_DEVICE> 
```
* **jetson-xavier-nx-devkit-emmc :** Hangi cihaz tipi ve hangi bellek kullanacağını belirtir.
* **mmcblk0p1 :** Hedef cihazın içindeki bölüm (partition) - burada eMMC'nin ilk bölümü.

#### Diğer Örnekler : 

* **SD kart için :** jetson-xavier-nx-devkit mmcblk1p1
* **AGX Orin için :** jetson-agx-orin-devkit nvme0n1p1

# Özetle 

| Aşama | Amaç |
|--|--|
| Jetson_Linux BSP | Cihaza özel çekirdek ve sürücüler | 
| Rootfs | Ubuntu kullanıcı alanı | 
| apply_binaries.sh | NVIDIA sürücülerini rootfs'e gömer | 
| Flash.sh | Tüm sistemi eMMC'ye yazar | 
| eMMC | Kalıcı sistem belleği, buradan boot eder |


-------------------------------------------------------------------------------------------------

# 1. eMMC (embedded MultiMediaCard)

### Nedir?

* Anakart üzerine entegre edilen NAND tabanlı bir bellek çipidir.
* "e" harfi embedded (gömülü) anlamındadır.
* Ucuz, düşük güç tüketimli ve küçük alan kaplayan bir çözümdür.

### Kullanıldığı Yerler : 

* Jetson gibi gömülü sistemler
* Akıllı telefonlar (orta-alt segment)
* Tabletler, IoT cihazları


# 2. SD Kart

### Nedir? 

* Harici olarak çıkarılabilir NAND tabanlı hafıza kartıdır.
* SDHC, SDXC gibi türleri vardır.
* Ucuz ve kolay temin edilebilir.

### Kullanıldığı Yerler : 

* Kameralar, Raspberry Pi, düşük maliyetli gömülü sistemler

# 3. SSD (SATA Tabanlı)

### Nedir? 

* NAND flash tabanlı bir depolama birimidir.
* SATA arabirimi ile bağlanır (tipik 2.5" sürücüler)
* Genellikle PC'lerde kullanılır.

### Kullanıldığı Yerler :

* Masaüstü ve dizüstü bilgisayarlar

# 4. NVMe (Non-Volatile Memory Express)

### Nedir? 

* PCIe üzerinden bağlanan en hızlı flash depolama biçimidir.
* M.2 slotuyla anakarta takılır.

### Kullanıldığı Yerler : 

* Yüksek performanslı bilgisayarlar, sunucular, bazı Jetson modelleri (örneğin AGX Orin)

# 5. UFS (Universal Flash Storage)

### Nedir?

* eMMC'nin gelişmiş halidir.
* Paralel yerine seri veriyolu kullanır (daha hızlı, daha verimli)
* Gelişmiş komut sıralama ve çoklu işlemi destekler.

### Kullanıldığı Yerler : 

* Yeni nesil akıllı telefonlar, bazı gelişmiş gömülü sistemler.









