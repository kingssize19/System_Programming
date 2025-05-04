# tegrastats Komutu

* tegrastats komutu, NVIDIA Jetson platformlarında CPU, GPU, bellek, güç tüketimi ve sıcaklık gibi sistem kaynaklarını gerçek zamanlı izlemek için kullanılır. Sistem programlamada donanım performansını ve darboğazları analiz etmek için önemlidir.


## tegrastats Nedir, Ne İşe Yarar?

* Jetson modüllerinde sistem kaynaklarının kullanım durumunu gösterir:
  * CPU & GPU kullanımı
  * Bellek kullanımı
  * Güç tüketimi (Watt)
  * Termal sensör bilgileri
  * EMC, APE, GR3D gibi Jetson'a özel bileşenler
* Performans izleme, test, hata ayıklama ve sistem optimizasyonu için kullanılır.
* Genellikle /usr/bin/tegrastats yolunda bulunur ve root erişimi gerekmez.

## Sık Kullanım Örnekleri : 

### 1. tegrastats komutunu başlat (varsayılan mod)

```cmd
tegrastats
```
* Varsayılan olarak sistemin CPU, GPU, RAM, sıcaklık ve güç bilgilerini sürekli olarak güncelleyerek verir.
* Bir algoritma çalışırken kaynak tüketimini gerçek zamanlı izleyebiliriz.

### 2. Belirli aralıklarla çıktı almak (örneğin 5 saniyede bir)

```cmd
tegrastats --interval 5000
```
* 5 saniyede bir çıktı verir. Sürekli hızlı akış yerine daha okunabilir hale getirir.
* Düşük frekanslı izleme ihtiyacı olan senaryolarda idealdir.

### 3. Sonuçları bir dosyaya kaydetmek 

```cmd
tegrastats > stats.log
```
* Çıktıyı bir log dosyasına yönlendirir.
* Uzun süreli testlerde kaynak kullanımı loglanabilir ve sonra analiz edilebilir.

### Bir algoritma çalışırken tegrastats çıktısını gözlemlemek (eşzamanlı)

```cmd
tegrastats & ./my_algorithm
```
* Arka planda tegrastats çalışırken sen kendi programını başlatırsın.
* Algoritmanın CPU/GPU kullanımı, sıcaklık gibi etkilerini gerçek zamanlı görme.

### 5. tegrastats çıktısını filtrelemek (örneğin sadece GPU kullanan satırlar)

```cmd
tegrastats |grep GR3D
```
* Yalnızca GPU (%GR3D) kullanımına odaklanmak için filtre uygular.
* Görüntü işleme veya derin öğrenme işlemleri sırasında GPU performansını izlemek.

## Örnek tegrastats Çıktısı

```cmd
RAM 3525/7852MB (lfb 137x4MB) CPU [6%@1420, off, off, off] EMC_FREQ 3%@1600 GR3D_FREQ 0%@318 APE 25 MTS fg 0% bg 0% AO@39.5C CPU@43.5C thermal@42.5C PMIC@100C GPU@42.5C BCPU@42.5C
```
* RAM 3525/7852MB → Kullanılan ve toplam bellek
* CPU \[6%@1420, off, ...\] → Her CPU çekirdeği için kullanım oranı
* GR3D_FREQ 0%@318 → GPU kullanımı (GR3D: 3D engine)
* thermal@42.5C → Ana termal sensör sıcaklığı
* PMIC@100C → Güç yönetim sıcaklığı (önemlidir)





























