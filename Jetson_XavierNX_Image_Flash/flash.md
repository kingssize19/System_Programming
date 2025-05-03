# 1) Jetson_Linux_R....tbz2 dosyasını indirmek

### Bu dosya nedir?

Bu, NVIDIA Jetson Linux BSP (Boart Support Package) olarak bilinir. İçeriğinde : 
* Bootloader (U-Boot)
* Kernel (Çekirdek)
* Device Tree (cihaz ağacı)
* Flash aracı (flash.sh)
* Jetson'a özgü aygıt yapılandırmaları bulunur.

### Neden gerekli?

Jetson cihazının donanımına uygun şekilde açılması (boot etmesi) ve düzgün çalışması için temel bileşenler gereklidir. Flash işlemini yapan asıl araçlar buradadır.

# 2) Tegra_Linux_Sample_Root-FileSystem.tbz2 dosyasını indirmek

### Bu dosya nedir?

Bu dosya, Ubuntu tabanlı bir root filesystem (dosya sistemi) içerir. Yani : 

* Linux kullanıcı alanı (user space) : bash, apt, libc, systemd, ssh, vs.
* Jetson için uygun yazılımlar
* Başlangıçta sistemin açıldığında çalıştıracağı yazılımlar

### Neden gerekli?

Jetson açıldığında işletim sisteminin çalışabilmesi için bu rootfs' e ihtiyacı vardır. Donanım sürücüleri rootfs içerisinde daha sonra entegre edilir (apply_binaries.sh ile).

# 3) Gerekli klasörleri oluştur ve arşivleri çıkar

### 3.1) mkdir -p /jetson_flash

* **Amaç :** Tüm işlemleri ve dosyaları tutacak ana klasör oluşturuyor.

### 3.2) cd /.../.../.../jetson_flash

* **Amaç :** Flash işlemlerinin yapılacağı dizine gidiliyor.

### 3.3) tar -xvf ~/Downloads/Jetson_Linux_R35.tbz2

* **Amaç :** BSP (bootloader, kernel vb.) dosyalarını açmak. Bu işlemden sonra Linux_for_Tegra adlı klasör oluşuyor.

### 3.4) cd Linux_for_Tegra

* **Amaç :** Asıl Flash işelmi bu dizinde yapılır.

### 3.5) cp ~/Downloads/Tegra_Linux_Sample_RootFileSystem.tbz2  ./rootfs/

* **Amaç :** Root FileSystem dosyasını rootfs adlı alt klasöre kopyalamak. rootfs dizini Jetson cihazına yüklenmek üzere hazırlanacak kullanıcı alanını temsil eder.

### 3.6) cd rootfs/

* **Amaç :** rootfs dizinine girilir.

### 3.7) sudo tar -xvf Tegra_Linux_Sample_FileSystem.tbz2

* **Amaç :** Ubuntu tabanlı root filesystem'in açılması.

### 3.8) cd ..

* **Amaç :** rootfs klasöründen bir üst dizine geri dönülür.


# 4) ./apply_binaries.sh

### Bu komut ne yapar?

**Bu script :**
* NVIDIA'nın sağladığı donanım sürücülerini (GPU, VPU, Camera, vb.)
* Firmware dosyalarını
* Jetson cihazına özel ayarları
**rootfs klasörüne entegre eder. Bu işlemi yapmadan rootfs cihazda düzgün çalışmaz çünkü Jetson'un donanımını tanıyamaz.**

# 5) Jetson'u recovery modda bağlama

Jetson'u host bilgisayardan flash edebilmek için USB recovery mode'a alınması gerekir.

**Adımlar :**
1. REC pinini GND'ye bağla (bu pin genellikle "Force Recovery" pini)
2. Güç kablosunu tak - cihaz açılırken bu pin GND'ye bağlı olduğundan recovery moduna geçer.
3. REC bağlantısını çıkar.
4. Aygıtı doğrulamak için :
   * ```cmd
     lsusb | grep -i nvidia
     ```
     Çıktıda **NVIDIA Corp.** gibi bir ifade görülmeli.

# 6) Flash işlemini başlat

```cmd
`./flash jetson-xavier-nx-devkit-emmc mmcblk0p1
```

### ./flash.sh

* Bu script, Jetson cihazına imajı yazan ana araçtır.
* U-Boot, kernel, rootfs ve yapılandırma dosyaları bu komutla Jetson cihazına yazılır.

### jetson-xavier-nx-devkit-emmc

* Bu parametre, hangi Jetson modeline flash işlemi yapılacağını belirtir.
* jetson-xavier-nx-devkit-emmc
  * Jetson Xavier NX Development Kit
  * eMMC hafıza kullanan versiyonu

### mmcblk0p1

* Bu, root filesystem'in yazılacağı cihazın ve bölümün adıdır.
* **mmcblk0p1 :** eMMC'nin birinci bölümü anlamına gelir.
* Eğer cihaz SD kartla çalışıyor olsaydı, sdcard gibi farklı bir parametre olurdu.

# Genel Mantık

Bu süreçteki temel adımlar : 
1. NVIDIA'nın sağladığı işletim sistemi bileşenlerini (kernel, bootloader vs.) ve rootfs'i indirmek
2. Bunları doğru klasörlere açmak
3. Root filesystem'e NVIDIA donanım sürücülerini entegre etmek
4. Jetson'u recovery moduna alarak, cihazı host bilgisayardan erişilebilir hale getirmek
5. Uygun komutla tüm bu bileşenleri Jetson'un eMMC'sine yazmak

# Başka Jetson cihazlarına flash atarken ne değişir?

Evet, flash.sh komutundaki parametreler cihaza göre değişir.

### Örnekler :

| Cihaz | Komut parametresi | Acıklama |
|--|--|--|
| Jetson Nano (SD Card) | jetson-nano-qspi-sd-mmcblk0p1 | QSPI boot + SD kart rootfs | 
| Jetson TX2 | jetson-tx2 mmcblk0p1 | eMMC üzerinde yazım | 
| Jetson Xavier AGX | jetson-agx-xavier-devkit-mmcblk0p1 | Geliştirme kiti için eMMC |

Bu parametreler **Linux_for_Tegra/boards/** klasöründe veya flash.sh scripti içinde tanımlıdır.






















