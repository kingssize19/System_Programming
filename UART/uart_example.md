# Jetson Xavier NX UART Örneği

#### 1. USB ttl'i pcye tak

#### 2. dmesg | grep tty

* Genelde ttyUSB0 yada ttyUSB1 olur.

#### 3. screen, minicom veya picocom ile bağlan

```cmd
screen /dev/ttyUSB0    115200
```
* Bu terminal Jetsondan gelen cerileri gösterecek ve buradan yazdıklarımız. Jetson'a UART üzerinden gönderilecek.

#### 4. Jetson'a ssh ile bağlan

```cmd
ssh jetson@10.62.2.86
```

#### 5. UART portunu dinle

```cmd
sudo apt install screen
screen /dev/ttyTHS1 115200
```

#### 6. Artık jetson ile PC arasında seri haberleşme açık




# UART Haberleşme Analiz

```cmd
dmesg | grep tty
```

* Bu komut, Jetson cihazında UART haberleşme için hangi seri portların tanındığını, hangilerinin kullanıldığını ve hangilerinin sistem tarafından rezerve edildiğini anlamamıza yardımcı olur.
* Bu komut, kernel mesajlarını (dmesg) filtreleyerek içinde "tty" geneçleri listeler. "tty" cihazlar genellikle terminal arayüzleri ve seri portlar ile ilgilidir.


* ttyTCU0                      # aktif -> Seri console olarak kullanılıyor, UART için uygun değil.
* ttyTHS0, ttyTHS1, ...        # Uygun UART portları, chaz haberleşmesi için kullanılabilir.
* systemd getty çalışıyor      # ttyTCU0'yu sistem konsolu olarak kullanıyor.

-----------------------------------------------------------------------------------------------------------

```cmd
lsof /dev/ttyTHS0 
```
* BU komut, Jetson sisteminde /dev/ttyTHS0 seri portunu hangi işlemlerin kullandığını gösterir.
* UART portuna başka bir program bağlanmışmı kontrol eder.
* Eğer bir işlem bu portu kullanıyorsa, aynı anda başka bir programın bu porta bağlanmasına izin verilmez (port meşgul olur).


------------------------------------------------------------------------------------------------------------

```cmd
picocom -D /dev/ttyTHS0  -b 115200
```
* Jetson üzerinde :
  * minicom adlı terminal programını başlatır.
  * UART haberleşmesi için cihaz dosyası olarak /dev/ttyTHS0 kullanılır.
  * Baud hzıı 115200 olarak ayarlanır.
  * Jetsondaki /dev/ttyTHS0 UART portu üzerinden 115200 baud hızında seri haberleşme başlatır.
* Jetsondaki /dev/ttyTHS0 UART portu üzerinden 115200 baud hızında seri haberleşme başlatır.

------------------------------------------------------------------------------------------------------------

* Aynı işlemler karşı tarafta (USB0) ile yapılır ve UART üzerinden haberleşme gerçekleştirilir.

```cmd
picocom için kısayol tuşları

ctrl + C + A and ctrl+C  echo yes
ctrl + A + X exit
```



























